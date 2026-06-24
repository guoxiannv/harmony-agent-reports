// SafetyItems.ets - 平安扣 safety items list surface (safety-items-page).
//
// Semantic targets:
//   items-back-button, items-add-button,
//   items-filter-status, items-filter-priority, items-search-input,
//   items-list, items-empty-state, items-loading-state,
//   items-item-{id}
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SafetyItem, ItemStatusFilter, PriorityFilter } from '../model/Types';
import { isOverdue } from '../service/StatsCalculator';

const STATUS_OPTIONS: ItemStatusFilter[] = ['全部', '待办', '进行中', '已完成'];
const PRIORITY_OPTIONS: PriorityFilter[] = ['全部', '高', '中', '低'];

@Component
export struct SafetyItemsPage {
  controller: AppController;

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        this.TopBar()
        this.Filters()
        this.SearchBar()
        if (this.controller.filteredItems().length === 0) {
          this.EmptyState()
        } else {
          this.ListArea()
        }
      }
      .width('100%')
      .height('100%')

      this.Fab()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TopBar() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 20, color: Theme.slate600 })
      }
      .id('items-back-button')
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.navigateBack())

      Text('安全事项')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Column() {
        SvgIcon({ variant: 'add-item', iconSize: 22, color: '#FFFFFF' })
      }
      .id('items-add-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .linearGradient(BrandGradient.tealDeep)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.openItemForm(''))
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 14, bottom: 14 })
    .backgroundColor('rgba(255,255,255,0.82)')
    .border({ width: { bottom: 1 }, color: { bottom: 'rgba(226,232,240,0.5)' } })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Filters() {
    Column() {
      Scroll() {
        Row() {
          ForEach(STATUS_OPTIONS, (s: ItemStatusFilter) => {
            Text(s)
              .fontSize(13)
              .fontColor(this.controller.itemStatusFilter === s ? Theme.teal : Theme.slate600)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .borderRadius(20)
              .backgroundColor(this.controller.itemStatusFilter === s ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
              .margin({ right: 8 })
              .onClick(() => { this.controller.changeStatusFilter(s); })
          }, (s: ItemStatusFilter) => s)
        }
        .id('items-filter-status')
        .padding({ left: 16, right: 16 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')

      Scroll() {
        Row() {
          ForEach(PRIORITY_OPTIONS, (p: PriorityFilter) => {
            Text(p)
              .fontSize(13)
              .fontColor(this.controller.itemPriorityFilter === p ? Theme.teal : Theme.slate600)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .borderRadius(20)
              .backgroundColor(this.controller.itemPriorityFilter === p ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
              .margin({ right: 8 })
              .onClick(() => { this.controller.changePriorityFilter(p); })
          }, (p: PriorityFilter) => p)
        }
        .id('items-filter-priority')
        .padding({ left: 16, right: 16 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
    .margin({ top: 12 })
  }

  @Builder
  SearchBar() {
    Row() {
      SvgIcon({ variant: 'search', iconSize: 18, color: Theme.slate400 })
      TextInput({ text: this.controller.itemSearch, placeholder: '搜索事项标题或负责人' })
        .id('items-search-input')
        .layoutWeight(1)
        .backgroundColor('rgba(0,0,0,0)')
        .placeholderColor(Theme.slate400)
        .placeholderFont({ size: 14 })
        .fontSize(14)
        .fontColor(Theme.slate900)
        .margin({ left: 8 })
        .onChange((v: string) => { this.controller.changeSearch(v); })
    }
    .width('100%')
    .padding({ left: 14, right: 14, top: 10, bottom: 10 })
    .margin({ left: 16, right: 16, top: 10 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor('rgba(255,255,255,0.7)')
    .border({ width: 1, color: Theme.slate200 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  ListArea() {
    Scroll() {
      Column() {
        ForEach(this.controller.filteredItems(), (it: SafetyItem) => {
          Row() {
            // Priority color bar + overdue red line.
            Column()
              .width(4)
              .height(56)
              .borderRadius(2)
              .backgroundColor(this.priorityColor(it.priority))
            if (isOverdue(it.dueDate, it.status)) {
              Column()
                .width(2)
                .height(56)
                .margin({ left: 4 })
                .backgroundColor(Theme.riskHigh)
            }
            Column() {
              Text(it.title)
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.slate900)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Row() {
                Text(it.category)
                  .fontSize(11)
                  .fontColor(Theme.slate600)
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .borderRadius(8)
                  .backgroundColor(Theme.chipSoftBg)
                Row() {
                  SvgIcon({ variant: 'due-date', iconSize: 12, color: this.dueColor(it) })
                  Text(it.dueDate.length > 0 ? it.dueDate : '无截止')
                    .fontSize(11)
                    .fontColor(this.dueColor(it))
                    .margin({ left: 3 })
                }
                .margin({ left: 8 })
                .alignItems(VerticalAlign.Center)
              }
              .margin({ top: 6 })
              .alignItems(VerticalAlign.Center)
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)

            this.StatusChip(it.status)
          }
          .id('items-item-' + it.id)
          .width('100%')
          .padding(14)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderHairline })
          .margin({ left: 16, right: 16, bottom: 10 })
          .alignItems(VerticalAlign.Center)
          .onClick(() => this.controller.openItemForm(it.id))
        }, (it: SafetyItem) => it.id)
      }
      .width('100%')
      .padding({ bottom: 80 })
      .alignItems(HorizontalAlign.Center)
    }
    .id('items-list')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .padding({ top: 8 })
  }

  @Builder
  StatusChip(status: string) {
    Text(status)
      .fontSize(11)
      .fontColor('#FFFFFF')
      .padding({ left: 10, right: 10, top: 4, bottom: 4 })
      .borderRadius(12)
      .backgroundColor(this.statusColor(status))
  }

  @Builder
  EmptyState() {
    Column() {
      SvgIcon({ variant: 'empty-items', iconSize: 44, color: Theme.teal })
      Text('暂无安全事项')
        .fontSize(15)
        .fontColor(Theme.slate600)
        .margin({ top: 12 })
      Text('点击右下角按钮创建第一个事项')
        .fontSize(13)
        .fontColor(Theme.slate400)
        .margin({ top: 4 })
      Text('创建安全事项')
        .fontSize(14)
        .fontColor('#FFFFFF')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .margin({ top: 14 })
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.teal)
        .onClick(() => this.controller.openItemForm(''))
    }
    .id('items-empty-state')
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Fab() {
    Column() {
      SvgIcon({ variant: 'fab-item', iconSize: 24, color: '#FFFFFF' })
    }
    .width(58)
    .height(58)
    .borderRadius(29)
    .linearGradient(BrandGradient.primary)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ right: 20, bottom: 24 })
    .shadow({ radius: 16, color: 'rgba(56,189,248,0.4)', offsetY: 6 })
    .onClick(() => this.controller.openItemForm(''))
  }

  private priorityColor(p: string): string {
    if (p === '高') return Theme.riskHigh;
    if (p === '中') return Theme.riskMid;
    return Theme.riskLow;
  }

  private statusColor(s: string): string {
    if (s === '已完成') return Theme.doneGreen;
    if (s === '进行中') return Theme.riskMid;
    return Theme.sky600;
  }

  private dueColor(it: SafetyItem): string {
    return isOverdue(it.dueDate, it.status) ? Theme.dangerRed : Theme.slate400;
  }
}
