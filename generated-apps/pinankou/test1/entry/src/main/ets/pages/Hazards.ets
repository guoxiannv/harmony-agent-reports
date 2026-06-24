// Hazards.ets - 平安扣 risk hazards surface (hazards-page, tab-hazards).
//
// Semantic targets:
//   hazards-add-button, hazards-filter-level, hazards-filter-status,
//   hazards-list, hazards-empty-state, hazards-loading-state,
//   hazards-item-{id}
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Hazard, HazardLevelFilter, HazardStatusFilter, HazardStatus } from '../model/Types';

const LEVEL_OPTIONS: HazardLevelFilter[] = ['全部', '高', '中', '低'];
const STATUS_OPTIONS: HazardStatusFilter[] = ['全部', '待处理', '处理中', '待验收', '已完成'];

@Component
export struct HazardsPage {
  controller: AppController;

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        this.Header()
        this.Filters()
        if (this.controller.filteredHazards().length === 0) {
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
  Header() {
    Row() {
      Text('风险隐患')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)
        .layoutWeight(1)
      Column() {
        SvgIcon({ variant: 'report-hazard', iconSize: 18, color: '#FFFFFF' })
      }
      .id('hazards-add-button')
      .height(40)
      .padding({ left: 14, right: 14 })
      .borderRadius(20)
      .linearGradient(BrandGradient.tealDeep)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.openHazardForm(''))
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 16, bottom: 12 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Filters() {
    Column() {
      Scroll() {
        Row() {
          ForEach(LEVEL_OPTIONS, (l: HazardLevelFilter) => {
            Text(l)
              .fontSize(13)
              .fontColor(this.controller.hazardLevelFilter === l ? Theme.teal : Theme.slate600)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .borderRadius(20)
              .backgroundColor(this.controller.hazardLevelFilter === l ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
              .margin({ right: 8 })
              .onClick(() => { this.controller.changeLevelFilter(l); })
          }, (l: HazardLevelFilter) => l)
        }
        .id('hazards-filter-level')
        .padding({ left: 16, right: 16 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')

      Scroll() {
        Row() {
          ForEach(STATUS_OPTIONS, (s: HazardStatusFilter) => {
            Text(s)
              .fontSize(13)
              .fontColor(this.controller.hazardStatusFilter === s ? Theme.teal : Theme.slate600)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .borderRadius(20)
              .backgroundColor(this.controller.hazardStatusFilter === s ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
              .margin({ right: 8 })
              .onClick(() => { this.controller.changeStatusFilter(s); })
          }, (s: HazardStatusFilter) => s)
        }
        .id('hazards-filter-status')
        .padding({ left: 16, right: 16 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
  }

  @Builder
  ListArea() {
    Scroll() {
      Column() {
        ForEach(this.controller.filteredHazards(), (h: Hazard) => {
          Column() {
            Row() {
              Text(h.title)
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.slate900)
                .layoutWeight(1)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              this.LevelBadge(h.level)
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)

            Row() {
              SvgIcon({ variant: 'hazard-location', iconSize: 12, color: Theme.slate400 })
              Text(h.location.length > 0 ? h.location : '未填写位置')
                .fontSize(12)
                .fontColor(Theme.slate400)
                .margin({ left: 4 })
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .layoutWeight(1)
            }
            .margin({ top: 6 })
            .alignItems(VerticalAlign.Center)

            // Progress bar.
            Row() {
              ForEach([0, 1, 2, 3], (idx: number) => {
                Column()
                  .layoutWeight(1)
                  .height(6)
                  .borderRadius(3)
                  .backgroundColor(idx <= this.controller.hazardProgressIndex(h.status) ? this.levelColor(h.level) : Theme.slate200)
                  .margin({ right: idx < 3 ? 4 : 0 })
              }, (idx: number) => '' + idx)
            }
            .width('100%')
            .margin({ top: 10 })

            Row() {
              this.StatusChip(h.status)
              Text(this.formatTime(h.updatedAt))
                .fontSize(11)
                .fontColor(Theme.slate400)
                .margin({ left: 8 })
            }
            .width('100%')
            .margin({ top: 8 })
            .alignItems(VerticalAlign.Center)
          }
          .id('hazards-item-' + h.id)
          .width('100%')
          .padding(14)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderHairline })
          .margin({ left: 16, right: 16, bottom: 10 })
          .alignItems(HorizontalAlign.Start)
          .onClick(() => this.controller.openHazardForm(h.id))
        }, (h: Hazard) => h.id)
      }
      .width('100%')
      .padding({ top: 8, bottom: 80 })
      .alignItems(HorizontalAlign.Center)
    }
    .id('hazards-list')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  LevelBadge(level: string) {
    Text(level + '风险')
      .fontSize(11)
      .fontColor('#FFFFFF')
      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
      .borderRadius(10)
      .backgroundColor(this.levelColor(level))
  }

  @Builder
  StatusChip(status: HazardStatus) {
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
      SvgIcon({ variant: 'empty-hazards', iconSize: 44, color: Theme.riskMid })
      Text('暂无风险隐患')
        .fontSize(15)
        .fontColor(Theme.slate600)
        .margin({ top: 12 })
      Text('发现隐患时及时上报整改')
        .fontSize(13)
        .fontColor(Theme.slate400)
        .margin({ top: 4 })
      Text('上报隐患')
        .fontSize(14)
        .fontColor('#FFFFFF')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .margin({ top: 14 })
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.tealDeep)
        .onClick(() => this.controller.openHazardForm(''))
    }
    .id('hazards-empty-state')
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Fab() {
    Column() {
      SvgIcon({ variant: 'fab-hazard', iconSize: 24, color: '#FFFFFF' })
    }
    .width(58)
    .height(58)
    .borderRadius(29)
    .linearGradient(BrandGradient.riskHigh)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ right: 20, bottom: 24 })
    .shadow({ radius: 16, color: 'rgba(239,68,68,0.4)', offsetY: 6 })
    .onClick(() => this.controller.openHazardForm(''))
  }

  private levelColor(l: string): string {
    if (l === '高') return Theme.riskHigh;
    if (l === '中') return Theme.riskMid;
    return Theme.riskLow;
  }

  private statusColor(s: HazardStatus): string {
    if (s === '已完成') return Theme.doneGreen;
    if (s === '待验收') return Theme.sky600;
    if (s === '处理中') return Theme.riskMid;
    return Theme.slate400;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const m: number = d.getMonth() + 1;
    const day: number = d.getDate();
    return `${m}月${day}日`;
  }
}
