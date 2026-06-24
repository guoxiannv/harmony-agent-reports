import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { Issue, TimelineEvent } from '../models/SafetyTypes'
import { statusLabel, riskLabel, formatDateTime } from '../common/Formatters'

@Component
export struct IssueDetailPage {
  @ObjectLink state: SafetyAppState
  issueId: string = ''
  onBack: () => void = () => {}
  onEdit: (issueId: string) => void = () => {}

  @State private detail: Issue | null = null

  aboutToAppear(): void {
    this.detail = this.state.service.getIssue(this.issueId)
  }

  build() {
    Scroll() {
      Column({ space: 14 }) {
        this.Header(this.detail)
        if (this.detail) {
          this.DetailCard(this.detail)
          this.Timeline(this.detail)
          this.Actions(this.detail)
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 16, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .scrollBar(BarState.Off)
  }

  @Builder
  Header(issue: Issue | null) {
    Row() {
      Button('返回')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.onBack())
      Column() {
        Text(issue?.title ?? '隐患详情')
          .id(Ids.issueDetailTitle)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandDeep)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .padding({ left: 8, right: 8 })
      .alignItems(HorizontalAlign.Center)
      Button('编辑')
        .id(Ids.issueDetailEditButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.brandPrimary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.onEdit(this.issueId))
    }
    .width('100%')
    .height(56)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  DetailCard(issue: Issue) {
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Text(statusLabel(issue.status))
          .id(Ids.issueDetailStatusBadge)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.statusColor(issue.status))
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .borderRadius(9999)
          .backgroundColor(this.statusBg(issue.status))
        Text(riskLabel(issue.riskLevel))
          .id(Ids.issueDetailRiskBadge)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.riskColor(issue.riskLevel))
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .borderRadius(9999)
          .backgroundColor(this.riskBg(issue.riskLevel))
      }
      .width('100%')

      this.InfoRow('位置', issue.location, Ids.issueDetailLocation)
      this.InfoRow('负责人', issue.assignee, Ids.issueDetailAssignee)
      this.InfoRow('截止日期', formatDateTime(issue.dueDate), Ids.issueDetailDueDate)

      Text(issue.description)
        .id(Ids.issueDetailDescription)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .width('100%')

      if (issue.photos.length > 0) {
        Row({ space: 8 }) {
          ForEach(issue.photos, (uri: string, index: number) => {
            Image(uri)
              .id(`issue-detail-photo-${index}`)
              .width(80)
              .height(80)
              .borderRadius(12)
              .objectFit(ImageFit.Cover)
          }, (uri: string, index: number) => `${uri}-${index}`)
        }
        .id(Ids.issueDetailPhotoList)
        .width('100%')
      }
    }
    .width('100%')
    .padding(16)
    .borderRadius(16)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
  }

  @Builder
  InfoRow(label: string, value: string, targetId: string) {
    Row() {
      Text(`${label}：`)
        .fontSize(13)
        .fontColor(Theme.textTertiary)
      Text(value)
        .id(targetId)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
    }
    .width('100%')
  }

  @Builder
  Timeline(issue: Issue) {
    Column({ space: 8 }) {
      Text('整改进度')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .width('100%')
      Column({ space: 10 }) {
        ForEach(issue.timeline, (event: TimelineEvent, index: number) => {
          Row({ space: 10 }) {
            Column()
              .width(10)
              .height(10)
              .borderRadius(5)
              .backgroundColor(Theme.brandPrimary)
            Column({ space: 2 }) {
              Text(statusLabel(event.status))
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textPrimary)
              Text(`${event.note} · ${formatDateTime(event.timestamp)}`)
                .fontSize(11)
                .fontColor(Theme.textTertiary)
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
          }
          .id(`issue-detail-timeline-${index}`)
          .width('100%')
        }, (event: TimelineEvent, index: number) => `${event.id}-${index}`)
      }
      .id(Ids.issueDetailTimelineList)
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .borderRadius(16)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
  }

  @Builder
  Actions(issue: Issue) {
    Row({ space: 10 }) {
      if (issue.status !== 'completed' && issue.status !== 'closed') {
        Button('更新进度')
          .id(Ids.issueDetailProgressActionButton)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .layoutWeight(1)
          .height(46)
          .borderRadius(23)
          .backgroundColor(Theme.brandPrimary)
          .onClick(() => this.state.advanceIssue(this.issueId))
      }
      Button('关闭')
        .id(Ids.issueDetailCloseButton)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .layoutWeight(1)
        .height(46)
        .borderRadius(23)
        .backgroundColor(Theme.textTertiary)
        .onClick(() => {
          this.state.closeIssue(this.issueId)
          this.onBack()
        })
    }
    .width('100%')
  }

  private statusColor(status: string): string {
    if (status === 'completed' || status === 'closed') {
      return Theme.safe
    } else if (status === 'processing') {
      return Theme.warning
    } else if (status === 'awaiting-review') {
      return Theme.info
    }
    return Theme.danger
  }

  private statusBg(status: string): string {
    if (status === 'completed' || status === 'closed') {
      return Theme.safeBg
    } else if (status === 'processing') {
      return Theme.warningBg
    } else if (status === 'awaiting-review') {
      return Theme.infoBg
    }
    return Theme.dangerBg
  }

  private riskColor(level: string): string {
    if (level === 'low') {
      return Theme.safe
    } else if (level === 'medium') {
      return Theme.warning
    } else if (level === 'high') {
      return Theme.danger
    }
    return Theme.critical
  }

  private riskBg(level: string): string {
    if (level === 'low') {
      return Theme.safeBg
    } else if (level === 'medium') {
      return Theme.warningBg
    } else if (level === 'high') {
      return Theme.dangerBg
    }
    return Theme.criticalBg
  }
}
