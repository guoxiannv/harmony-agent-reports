import { AppController } from '../viewmodel/AppController';
import { InventoryLog, InventoryItem, InventoryLogType } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct InventoryLogPage {
  @ObjectLink ctrl: AppController;
  onBack: () => void = () => {};
  @State filter: InventoryLogType | 'all' = 'all';

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Button() {
          SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary })
        }
        .width(40)
        .height(40)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.onBack())

        Text('库存记录')
          .fontSize(Theme.pageTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)

        Blank().width(40)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 12 })

      // Filter chips
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        this.FilterChip('all', '全部')
        this.FilterChip('in', '入库')
        this.FilterChip('out', '出库')
        this.FilterChip('auto-deduct', '自动扣减')
      }
      .id('inventory-log-filter-type')
      .width('100%')
      .margin({ bottom: 16 })

      // List
      List({ space: 0 }) {
        if (this.logs().length === 0) {
          ListItem() {
            this.EmptyState()
          }
          .id('inventory-log-empty')
        } else {
          ForEach(this.logs(), (log: InventoryLog) => {
            ListItem() {
              this.LogRow(log)
            }
            .id(`inventory-log-${log.id}`)
          }, (log: InventoryLog) => log.id)
        }
      }
      .id('inventory-log-list')
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
  FilterChip(value: InventoryLogType | 'all', label: string) {
    Text(label)
      .fontSize(12)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.filter === value ? Theme.textOnAccent : Theme.textSecondary)
      .padding({ left: 14, right: 14, top: 6, bottom: 6 })
      .backgroundColor(this.filter === value ? Theme.terracotta : Theme.chipSoftBg)
      .borderRadius(999)
      .onClick(() => this.filter = value)
  }

  @Builder
  LogRow(log: InventoryLog) {
    Row({ space: 12 }) {
      Column({ space: 2 }) {
        Text(log.type === 'in' ? `+${log.quantity}` : `-${log.quantity}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(log.type === 'in' ? Theme.celadon : (log.type === 'auto-deduct' ? Theme.terracotta : Theme.rust))
        Text(this.typeLabel(log.type))
          .fontSize(10)
          .fontColor(Theme.textQuaternary)
      }
      .width(56)
      .alignItems(HorizontalAlign.Start)

      Column({ space: 4 }) {
        Text(this.ctrl.inventoryName(log.itemId))
          .fontSize(Theme.cardTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(log.note || '')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text(this.formatDate(log.createdAt))
        .fontSize(11)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 14, bottom: 14 })
    .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })
  }

  @Builder
  EmptyState() {
    Column({ space: 8 }) {
      Text('暂无库存记录')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('库存调整或课程扣减后将自动生成')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .width('100%')
    .padding({ top: 80, bottom: 80 })
    .alignItems(HorizontalAlign.Center)
  }

  private logs(): InventoryLog[] {
    return this.ctrl.logsByType(this.filter);
  }

  private typeLabel(type: InventoryLogType): string {
    if (type === 'in') {
      return '入库';
    } else if (type === 'out') {
      return '出库';
    }
    return '自动扣减';
  }

  private formatDate(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getMonth() + 1}/${d.getDate()}`;
  }
}
