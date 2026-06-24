import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { PatrolPoint, PatrolPointStatus } from '../models/SafetyTypes'

interface PatrolPageProps {
  state: SafetyAppState
  onCheckin: (pointId: string) => void
  onReportWithPoint: (pointId: string) => void
}

@Component
export struct PatrolPage {
  @ObjectLink state: SafetyAppState
  onCheckin: (pointId: string) => void = () => {}
  onReportWithPoint: (pointId: string) => void = () => {}

  build() {
    Column({ space: 0 }) {
      Text('巡检打卡')
        .id(Ids.patrolHeaderTitle)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 16, bottom: 10 })

      Text(this.state.today.dateLabel)
        .id(Ids.patrolDateLabel)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 16 })

      this.ProgressHeader()

      List({ space: 10 }) {
        ForEach(this.state.patrolPoints, (point: PatrolPoint) => {
          ListItem() {
            this.PointRow(point)
          }
          .id(`patrol-point-${point.id}`)
        }, (point: PatrolPoint) => point.id)
      }
      .id(Ids.patrolPointList)
      .width('100%')
      .layoutWeight(1)
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  ProgressHeader() {
    Row() {
      Column({ space: 4 }) {
        Text(`${Math.round(this.patrolProgress() * 100)}%`)
          .id(Ids.patrolProgressRing)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandDeep)
        Text('今日巡检完成度')
          .fontSize(11)
          .fontColor(Theme.textSecondary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Column({ space: 4 }) {
        Text('园区常规路线')
          .id(Ids.patrolRouteName)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`${this.doneCount()}/${this.state.patrolPoints.length} 点位`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .padding(16)
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 10 })
    .borderRadius(16)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  PointRow(point: PatrolPoint) {
    Row({ space: 12 }) {
      Column({ space: 3 }) {
        Text(point.name)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(point.area)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Button('打卡')
        .id(`patrol-point-${point.id}-checkin-button`)
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
        .height(32)
        .padding({ left: 14, right: 14 })
        .borderRadius(16)
        .backgroundColor(point.status === PatrolPointStatus.PENDING ? Theme.brandPrimary : Theme.safe)
        .enabled(point.status === PatrolPointStatus.PENDING)
        .onClick(() => this.onCheckin(point.id))
    }
    .width('100%')
    .padding(14)
    .borderRadius(14)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 2, color: 'rgba(15,23,42,0.04)', offsetY: 1 })
    .border({ width: { left: 4 }, color: { left: this.pointColor(point.status) } })
  }

  private pointColor(status: PatrolPointStatus): string {
    if (status === PatrolPointStatus.DONE) {
      return Theme.safe
    } else if (status === PatrolPointStatus.ABNORMAL) {
      return Theme.danger
    }
    return Theme.brandPrimary
  }

  private doneCount(): number {
    return this.state.patrolPoints.filter((p: PatrolPoint) => p.status !== PatrolPointStatus.PENDING).length
  }

  private patrolProgress(): number {
    let total: number = this.state.patrolPoints.length || 1
    return this.doneCount() / total
  }
}
