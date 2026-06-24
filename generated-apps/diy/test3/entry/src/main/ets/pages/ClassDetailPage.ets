// ClassDetailPage.ets — 课程详情(对齐 page-class-detail-page.html)
// 赤陶渐变 hero + 库存预警条 + 信息卡 + 耗材列表(库存状态) + 底部 取消/预约

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { PageHeader } from '../components/PageHeader';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { DateUtil } from '../services/DateUtil';
import { ClassSlot, ClassMaterial, OpResult, InventoryItem } from '../model/Models';

@Component
export struct ClassDetailPage {
  @Prop classId: string = '';
  onBack: () => void = () => {};

  @State slot: ClassSlot | null = null;
  @State inventory: InventoryItem[] = [];
  @State feedback: string = '';

  aboutToAppear(): void {
    this.load();
  }

  private load(): void {
    this.slot = DataStore.getClass(this.classId);
    this.inventory = DataStore.getInventory();
  }

  private invName(id: string): string {
    for (const i of this.inventory) {
      if (i.id === id) return i.name;
    }
    return '';
  }

  private invQty(id: string): number {
    for (const i of this.inventory) {
      if (i.id === id) return i.quantity;
    }
    return 0;
  }

  private materialOk(m: ClassMaterial): boolean {
    return this.invQty(m.inventoryItemId) >= m.quantityPerSeat;
  }

  private get hasStockAlert(): boolean {
    if (!this.slot) return false;
    return this.slot.materials.some((m: ClassMaterial) => !this.materialOk(m));
  }

  private get canBook(): boolean {
    if (!this.slot) return false;
    if (this.slot.booked >= this.slot.capacity) return false;
    return !this.hasStockAlert;
  }

  private book(): void {
    const r: OpResult = DataStore.bookSlot(this.classId);
    this.feedback = r.message;
    this.load();
    setTimeout(() => { this.feedback = ''; }, 2600);
  }

  private cancel(): void {
    const r: OpResult = DataStore.cancelSlot(this.classId);
    this.feedback = r.message;
    this.load();
    setTimeout(() => { this.feedback = ''; }, 2600);
  }

  private get bookLabel(): string {
    if (!this.slot) return '已约满';
    if (this.slot.booked >= this.slot.capacity) return '已约满';
    if (this.hasStockAlert) return '库存不足';
    return '立即预约';
  }

  build() {
    Column() {
      PageHeader({ title: '课程详情', onBack: () => this.onBack() })

      if (this.slot) {
        Scroll() {
          Column() {
            // hero
            Column() {
              Text(this.slot.tagLabel)
                .fontSize(12)
                .fontColor(Theme.textOnClay)
                .backgroundColor('rgba(255,255,255,0.18)')
                .padding({ left: 12, right: 12, top: 4, bottom: 4 })
                .borderRadius(Theme.radiusChip)
                .margin({ bottom: 10 })
              Text(this.slot.title)
                .fontSize(26)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnClay)
                .id('class-detail-title')
              Row() {
                Text(`${DateUtil.shortDate(this.slot.date)} ${this.slot.time}`)
                  .fontSize(14)
                  .fontColor(Theme.textOnClay)
                  .opacity(0.9)
                  .id('class-detail-date')
                Text(` · 名额 ${this.slot.booked}/${this.slot.capacity}`)
                  .fontSize(14)
                  .fontColor(Theme.textOnClay)
                  .opacity(0.9)
                  .id('class-detail-capacity')
              }
              .margin({ top: 8 })
            }
            .width('100%')
            .padding(24)
            .borderRadius(Theme.radiusHero)
            .linearGradient(BrandGradient.clay)
            .shadow({ radius: 28, color: 'rgba(166,93,72,0.28)', offsetY: 10 })
            .margin({ left: 20, right: 20 })
            .alignItems(HorizontalAlign.Start)

            // 库存预警条
            if (this.hasStockAlert) {
              Row() {
                SvgIcon({ variant: 'stock-warn-detail', iconSize: 18 })
                Text('部分耗材库存不足，当前名额不可再约')
                  .fontSize(13)
                  .fontColor(Theme.red)
                  .margin({ left: 8 })
                  .layoutWeight(1)
              }
              .width('100%')
              .padding({ left: 16, right: 16, top: 12, bottom: 12 })
              .backgroundColor(Theme.dangerBg)
              .borderRadius(14)
              .margin({ left: 20, right: 20, top: 16 })
              .id('class-detail-stock-alert')
            }

            // 信息卡
            Column() {
              this.InfoRow('课程简介', this.slot.description)
              this.InfoRow('上课时间', `${DateUtil.weekdayLabel(this.slot.date)} ${this.slot.time}`)
              this.InfoRow('名额上限', `${this.slot.capacity} 人`)
              this.InfoRow('消耗积分', this.slot.pricePoint > 0 ? `${this.slot.pricePoint} 积分` : '免费(预约后扣减名额)')
            }
            .width('100%')
            .padding({ left: 18, right: 18, top: 8, bottom: 8 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
            .margin({ left: 20, right: 20, top: 16 })

            // 耗材标题
            Text('课程耗材')
              .fontSize(Theme.fontTitle)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.clay)
              .fontFamily('MaShan')
              .width('100%')
              .padding({ left: 20, right: 20, top: 24, bottom: 12 })

            if (this.slot.materials.length === 0) {
              Column() {
                EmptyState({ icon: 'empty-materials', title: '暂无耗材数据' })
              }
              .width('100%')
              .padding({ left: 20, right: 20 })
              .backgroundColor(Theme.cardLight)
              .borderRadius(Theme.radiusCard)
              .id('class-materials-empty')
            } else {
              Column() {
                ForEach(this.slot.materials, (m: ClassMaterial) => {
                  Row() {
                    Row() {
                      SvgIcon({ variant: 'material', iconSize: 18 })
                    }
                    .width(36).height(36).borderRadius(10)
                    .backgroundColor(Theme.sand)
                    .justifyContent(FlexAlign.Center)
                    Column() {
                      Text(this.invName(m.inventoryItemId).length > 0 ? this.invName(m.inventoryItemId) : m.name)
                        .fontSize(15)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(Theme.textPrimary)
                      Text(`每课消耗 ${m.quantityPerSeat} ${this.invUnit(m.inventoryItemId)} · 当前库存 ${this.invQty(m.inventoryItemId)}`)
                        .fontSize(12)
                        .fontColor(Theme.textTertiary)
                        .margin({ top: 2 })
                    }
                    .layoutWeight(1)
                    .margin({ left: 12 })
                    .alignItems(HorizontalAlign.Start)
                    Text(this.materialOk(m) ? '库存充足' : '库存不足')
                      .fontSize(12)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(this.materialOk(m) ? Theme.green : Theme.red)
                  }
                  .width('100%')
                  .padding(14)
                  .backgroundColor(Theme.cardLight)
                  .borderRadius(16)
                  .border({ width: 1, color: Theme.borderDefault })
                  .margin({ bottom: 10 })
                  .alignItems(VerticalAlign.Center)
                  .id(`class-material-${m.id}`)
                }, (m: ClassMaterial) => m.id)
              }
              .width('100%')
              .padding({ left: 20, right: 20 })
              .id('class-detail-materials')
            }

            if (this.feedback.length > 0) {
              Text(this.feedback)
                .fontSize(13)
                .fontColor(this.feedback.indexOf('成功') >= 0 ? Theme.green : Theme.red)
                .margin({ top: 12, left: 20, right: 20 })
            }
            Blank().height(90)
          }
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)

        // 底部双按钮
        Row() {
          Button() {
            Text('取消预约')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.clay)
          }
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .height(52)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderDefault })
          .id('class-detail-cancel')
          .onClick(() => this.cancel())

          Button() {
            Text(this.bookLabel)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.canBook ? Theme.textOnClay : Theme.textTertiary)
          }
          .type(ButtonType.Capsule)
          .layoutWeight(1)
          .height(52)
          .margin({ left: 12 })
          .backgroundColor(this.canBook ? Theme.fire : Theme.cardBg)
          .border({ width: 1, color: this.canBook ? Color.Transparent : Theme.borderDefault })
          .shadow(this.canBook ? { radius: 14, color: 'rgba(229,122,57,0.32)', offsetY: 4 } : { radius: 0, color: Color.Transparent })
          .enabled(this.canBook)
          .id('class-detail-book')
          .onClick(() => this.book())
        }
        .width('100%')
        .padding({ left: 20, right: 20, top: 10, bottom: 24 })
        .backgroundColor(Theme.pageBg)
      } else {
        Column() {
          EmptyState({ icon: 'empty-classes', title: '课程不存在' })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
  }

  private invUnit(id: string): string {
    for (const i of this.inventory) {
      if (i.id === id) return i.unit;
    }
    return '';
  }

  @Builder
  InfoRow(label: string, value: string) {
    Row() {
      Text(label)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .layoutWeight(1)
      Text(value)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .maxLines(2)
        .textAlign(TextAlign.End)
        .constraintSize({ maxWidth: 220 })
    }
    .width('100%')
    .padding({ top: 12, bottom: 12 })
    .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
    .alignItems(VerticalAlign.Top)
  }
}
