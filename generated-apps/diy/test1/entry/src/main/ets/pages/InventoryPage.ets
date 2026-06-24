import { AppController } from '../viewmodel/AppController';
import { InventoryItem } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct InventoryPage {
  @ObjectLink ctrl: AppController;
  onAddItem: () => void = () => {};
  onInventoryLog: () => void = () => {};
  onItemDetail: (id: string) => void = () => {};

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Text('库存')
          .fontSize(Theme.pageTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Row({ space: 12 }) {
          Button('记录')
            .id('inventory-log-button')
            .fontSize(13)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .border({ width: 1.5, color: Theme.terracotta })
            .borderRadius(999)
            .padding({ left: 12, right: 12 })
            .onClick(() => this.onInventoryLog())
          Button() {
            SvgIcon({ variant: 'plus', iconSize: 20, color: Theme.cardBg })
          }
          .id('inventory-add-button')
          .width(40)
          .height(40)
          .backgroundColor(Theme.terracotta)
          .borderRadius(20)
          .shadow({ radius: 12, color: 'rgba(198,123,92,0.32)' })
          .onClick(() => this.onAddItem())
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 12 })

      // Low stock alert
      if (this.ctrl.lowStockItems().length > 0) {
        Row({ space: 12 }) {
          Column() {
            SvgIcon({ variant: 'alert', iconSize: 18, color: Theme.rust })
          }
          .width(36)
          .height(36)
          .backgroundColor('rgba(160,82,45,0.12)')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)

          Text(`低库存提醒：${this.ctrl.lowStockItems().length} 种材料需要补货`)
            .id('inventory-low-stock-alert')
            .fontSize(Theme.bodySize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
            .layoutWeight(1)
        }
        .width('100%')
        .padding(14)
        .backgroundColor('rgba(160,82,45,0.08)')
        .border({ width: { left: 4, top: 1, right: 1, bottom: 1 }, color: { left: Theme.rust, top: 'rgba(160,82,45,0.20)', right: 'rgba(160,82,45,0.20)', bottom: 'rgba(160,82,45,0.20)' } })
        .borderRadius(18)
        .margin({ bottom: 16 })
      }

      // List
      List({ space: 12 }) {
        if (this.ctrl.inventory.length === 0) {
          ListItem() {
            this.EmptyState()
          }
          .id('inventory-empty-state')
        } else {
          ForEach(this.ctrl.inventory, (item: InventoryItem) => {
            ListItem() {
              this.InventoryCard(item)
            }
            .id(`inventory-item-${item.id}`)
            .onClick(() => this.onItemDetail(item.id))
          }, (item: InventoryItem) => item.id)
        }
      }
      .id('inventory-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  InventoryCard(item: InventoryItem) {
    Row({ space: 12 }) {
      Column() {
        SvgIcon({ variant: 'package', iconSize: 22, color: Theme.clayGray })
      }
      .width(48)
      .height(48)
      .backgroundColor(Theme.ricePaper)
      .borderRadius(14)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column({ space: 4 }) {
        Text(item.name)
          .fontSize(Theme.cardTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(`${item.category} · 安全库存 ${item.safeStock}${item.unit}`)
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Column({ space: 2 }) {
        Text(`${item.currentStock}`)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(item.currentStock <= item.safeStock ? Theme.rust : Theme.caramel)
        Text(item.unit)
          .fontSize(10)
          .fontColor(Theme.textQuaternary)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 10, color: Theme.shadowNear })
  }

  @Builder
  EmptyState() {
    Column({ space: 8 }) {
      Text('库存为空')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('点击右上角添加第一种材料')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .width('100%')
    .padding({ top: 80, bottom: 80 })
    .alignItems(HorizontalAlign.Center)
  }
}
