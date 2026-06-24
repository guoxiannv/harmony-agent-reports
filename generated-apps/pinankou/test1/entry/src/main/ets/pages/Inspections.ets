// Inspections.ets - 平安扣 inspection task list surface (inspections-page, tab-inspections).
//
// Semantic targets:
//   inspections-add-button, inspections-history-button, inspections-filter-status,
//   inspections-list, inspections-empty-state, inspections-item-{id}
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { InspectionTask, InspectionStatusFilter } from '../model/Types';

const STATUS_OPTIONS: InspectionStatusFilter[] = ['全部', '待巡检', '进行中', '已完成'];

@Component
export struct InspectionsPage {
  controller: AppController;

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        this.Header()
        this.CtaCard()
        this.FilterRow()
        if (this.controller.filteredInspections().length === 0) {
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
      Text('巡检打卡')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)
        .layoutWeight(1)
      Row() {
        Text('历史')
          .fontSize(13)
          .fontColor(Theme.teal)
        SvgIcon({ variant: 'inspection-cta', iconSize: 16, color: Theme.teal })
      }
      .id('inspections-history-button')
      .height(40)
      .padding({ left: 12, right: 12 })
      .borderRadius(20)
      .backgroundColor('rgba(204,251,241,0.6)')
      .alignItems(VerticalAlign.Center)
      .onClick(() => this.controller.navigateInspectionHistory())
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 16, bottom: 12 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  CtaCard() {
    Row() {
      Column() {
        Text('开始巡检打卡')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
        Text('按检查点逐项确认，完成一次巡检')
          .fontSize(12)
          .fontColor('rgba(255,255,255,0.85)')
          .margin({ top: 4 })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Column() {
        SvgIcon({ variant: 'start-inspection', iconSize: 18, color: '#FFFFFF' })
      }
      .width(44)
      .height(44)
      .borderRadius(22)
      .backgroundColor('rgba(255,255,255,0.25)')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .id('inspections-add-button')
    .width('100%')
    .padding(18)
    .borderRadius(Theme.radiusCard)
    .linearGradient(BrandGradient.tealDeep)
    .margin({ left: 16, right: 16, top: 4 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => this.controller.openInspectionTask(this.firstTaskId()))
  }

  @Builder
  FilterRow() {
    Scroll() {
      Row() {
        ForEach(STATUS_OPTIONS, (s: InspectionStatusFilter) => {
          Text(s)
            .fontSize(13)
            .fontColor(this.controller.inspectionStatusFilter === s ? Theme.teal : Theme.slate600)
            .padding({ left: 14, right: 14, top: 8, bottom: 8 })
            .borderRadius(20)
            .backgroundColor(this.controller.inspectionStatusFilter === s ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
            .margin({ right: 8 })
            .onClick(() => { this.controller.changeStatusFilter(s); })
        }, (s: InspectionStatusFilter) => s)
      }
      .id('inspections-filter-status')
      .padding({ left: 16, right: 16 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .margin({ top: 14 })
  }

  @Builder
  ListArea() {
    Scroll() {
      Column() {
        ForEach(this.controller.filteredInspections(), (t: InspectionTask) => {
          Row() {
            this.Ring(this.controller.inspectionProgress(t))
            Column() {
              Text(t.name)
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.slate900)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(`${this.checkedCount(t)}/${t.checkpoints.length} 检查点`)
                .fontSize(12)
                .fontColor(Theme.slate400)
                .margin({ top: 4 })
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)

            this.StatusChip(t.status)
          }
          .id('inspections-item-' + t.id)
          .width('100%')
          .padding(14)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderHairline })
          .margin({ left: 16, right: 16, bottom: 10 })
          .alignItems(VerticalAlign.Center)
          .onClick(() => this.controller.openInspectionTask(t.id))
        }, (t: InspectionTask) => t.id)
      }
      .width('100%')
      .padding({ top: 8, bottom: 80 })
      .alignItems(HorizontalAlign.Center)
    }
    .id('inspections-list')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  Ring(percent: number) {
    Stack() {
      Text(`${percent}%`)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.teal)
    }
    .width(48)
    .height(48)
    .borderRadius(24)
    .border({ width: 4, color: this.progressTrack(percent) })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
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
      SvgIcon({ variant: 'empty-inspections', iconSize: 44, color: Theme.doneGreen })
      Text('暂无巡检任务')
        .fontSize(15)
        .fontColor(Theme.slate600)
        .margin({ top: 12 })
      Text('点击上方按钮开始一次巡检')
        .fontSize(13)
        .fontColor(Theme.slate400)
        .margin({ top: 4 })
      Text('开始巡检')
        .fontSize(14)
        .fontColor('#FFFFFF')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .margin({ top: 14 })
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.tealDeep)
        .onClick(() => this.controller.toast('请在管理端创建巡检任务'))
    }
    .id('inspections-empty-state')
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Fab() {
    Column() {
      SvgIcon({ variant: 'start-inspection', iconSize: 22, color: '#FFFFFF' })
    }
    .width(58)
    .height(58)
    .borderRadius(29)
    .linearGradient(BrandGradient.tealDeep)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ right: 20, bottom: 24 })
    .shadow({ radius: 16, color: 'rgba(15,118,110,0.4)', offsetY: 6 })
    .onClick(() => this.controller.toast('请在管理端创建巡检任务'))
  }

  private firstTaskId(): string {
    const all: InspectionTask[] = this.controller.inspections;
    if (all.length === 0) {
      return '';
    }
    return all[0].id;
  }

  private checkedCount(t: InspectionTask): number {
    let n: number = 0;
    for (let i = 0; i < t.checkpoints.length; i++) {
      if (t.checkpoints[i].result !== '未检') {
        n += 1;
      }
    }
    return n;
  }

  private progressTrack(p: number): string {
    if (p >= 100) return Theme.doneGreen;
    if (p > 0) return Theme.teal;
    return Theme.slate200;
  }

  private statusColor(s: string): string {
    if (s === '已完成') return Theme.doneGreen;
    if (s === '进行中') return Theme.sky600;
    return Theme.slate400;
  }
}
