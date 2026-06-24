// InventoryPage.ets — 库存管理(对齐 page-inventory-page.html)
// 库存不足预警条 + 耗材卡(数量低于阈值红色显示, 补货/关联课程按钮)

import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { PageHeader } from '../components/PageHeader';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { InventoryItem, ClassSlot } from '../model/Models';

@Component
export struct InventoryPage {
  onBack: () => void = () => {};

  @State items: InventoryItem[] = [];
  @State classes: ClassSlot[] = [];
  @State lowCount: number = 0;
  @State feedback: string = '';

  aboutToAppear(): void {
    this.load();
  }

  private load(): void {
    this.items = DataStore.getInventory();
    this.classes = DataStore.getClasses();
    this.lowCount = this.items.filter((i: InventoryItem) => i.quantity < i.lowStockThreshold).length;
  }

  private linkedClasses(item: InventoryItem): string {
    const names: string[] = [];
    for (const c of this.classes) {
      for (const m of c.materials) {
        if (m.inventoryItemId === item.id && names.indexOf(c.title) < 0) {
          names.push(c.title);
        }
      }
    }
    return names.length > 0 ? names.join('、') : '未关联课程';
  }

  private restock(item: InventoryItem): void {
    DataStore.restock(item.id, 10);
    this.feedback = `${item.name} 补货 +10${item.unit}`;
    this.load();
    setTimeout(() => { this.feedback = ''; }, 2200);
  }

  private showLink(item: InventoryItem): void {
    this.feedback = `${item.name} 关联：${this.linkedClasses(item)}`;
    setTimeout(() => { this.feedback = ''; }, 3000);
  }

  build() {
    Column() {
      PageHeader({ title: '库存管理', onBack: () => this.onBack() })

      Scroll() {
        Column() {
          // 库存不足预警
          if (this.lowCount > 0) {
            Row() {
              SvgIcon({ variant: 'low-stock-alert', iconSize: 20 })
              Text(`有 ${this.lowCount} 项耗材库存不足，已影响课程预约`)
                .fontSize(13)
                .fontColor(Theme.red)
                .margin({ left: 10 })
                .layoutWeight(1)
            }
            .width('100%')
            .padding({ left: 16, right: 16, top: 14, bottom: 14 })
            .backgroundColor(Theme.dangerBg)
            .borderRadius(16)
            .margin({ left: 20, right: 20 })
            .alignItems(VerticalAlign.Center)
            .id('inventory-low-stock-alert')
          }

          Text('耗材库存')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 20, bottom: 12 })

          if (this.items.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-inventory', title: '还没有库存数据', hint: '添加第一件耗材吧' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('inventory-empty-state')
          } else {
            ForEach(this.items, (item: InventoryItem) => {
              this.ItemCard(item)
            }, (item: InventoryItem) => item.id)
          }

          if (this.feedback.length > 0) {
            Text(this.feedback)
              .fontSize(13)
              .fontColor(Theme.green)
              .margin({ top: 12, left: 20, right: 20 })
          }
          Blank().height(12)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  ItemCard(item: InventoryItem) {
    Column() {
      Row() {
        Row() {
          SvgIcon({ variant: 'inv-item', iconSize: 22 })
        }
        .width(44).height(44).borderRadius(12)
        .backgroundColor(Theme.sand)
        .justifyContent(FlexAlign.Center)
        Column() {
          Text(item.name)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Text(`阈值 ${item.lowStockThreshold}${item.unit} · 关联：${this.linkedClasses(item)}`)
            .fontSize(12)
            .fontColor(Theme.textTertiary)
            .margin({ top: 2 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .margin({ left: 12 })
        .alignItems(HorizontalAlign.Start)
        Text(`${item.quantity}`)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(item.quantity < item.lowStockThreshold ? Theme.red : Theme.clay)
          .id(`inventory-item-${item.id}-quantity`)
        Text(item.unit)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
          .margin({ left: 2 })
      }
      .alignItems(VerticalAlign.Center)

      Row() {
        Button() {
          Text('补货 +10')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnClay)
        }
        .type(ButtonType.Capsule)
        .layoutWeight(1)
        .height(40)
        .backgroundColor(Theme.green)
        .id(`inventory-item-${item.id}-restock`)
        .onClick(() => this.restock(item))

        Button() {
          Text('关联课程')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
        }
        .type(ButtonType.Capsule)
        .layoutWeight(1)
        .height(40)
        .margin({ left: 8 })
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderDefault })
        .id(`inventory-item-${item.id}-link-class`)
        .onClick(() => this.showLink(item))
      }
      .margin({ top: 12 })
      .padding({ top: 12 })
      .border({ width: { top: 1 }, color: { top: Theme.borderDefault } })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardLight)
    .borderRadius(20)
    .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
    .margin({ left: 20, right: 20, bottom: 12 })
    .alignItems(HorizontalAlign.Start)
    .id(`inventory-item-${item.id}`)
  }
}
