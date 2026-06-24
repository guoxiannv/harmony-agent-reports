import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { TabId } from '../common/TabTypes'
import { Issue, IssueStatus } from '../models/SafetyTypes'
import { formatDateTime, statusLabel } from '../common/Formatters'

@Component
export struct HomePage {
  @ObjectLink state: SafetyAppState
  goToTab: (tab: TabId) => void = () => {}
  onReport: () => void = () => {}
  onIssueDetail: (issueId: string) => void = () => {}
  onNotifications: () => void = () => {}

  build() {
    Scroll() {
      Column({ space: 0 }) {
        this.Header()
        this.Hero()
        this.KpiGrid()
        this.QuickActions()
        this.RecentSection()
      }
      .width('100%')
      .padding({ bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .scrollBar(BarState.Off)
  }

  @Builder
  Header() {
    Row() {
      Text('平安扣')
        .id(Ids.homeHeaderTitle)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Row() {
        Text('')
          .width(0)
          .height(0)
      }
      .id(Ids.homeNotificationButton)
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.surfaceSecondary)
      .onClick(() => this.onNotifications())
    }
    .width('100%')
    .height(56)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .backgroundColor('rgba(255,255,255,0.80)')
    .backdropBlur(24)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Hero() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Text('早安，安全员')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(this.state.today.dateLabel)
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .padding({ top: 24, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 18 })

      Column()
        .width(120)
        .height(120)
        .borderRadius(60)
        .backgroundColor(Theme.brandLight)
        .opacity(0.35)
        .blur(40)
        .position({ x: '70%', y: -30 })
      Column()
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(Theme.brandBright)
        .opacity(0.35)
        .blur(40)
        .position({ x: '52%', y: 50 })
    }
    .width('100%')
    .height(90)
    .clip(true)
  }

  @Builder
  KpiGrid() {
    Row({ space: 10 }) {
      this.KpiCard(`${Math.round(this.state.today.patrolProgress * 100)}%`, '巡检进度', Ids.homeTodayPatrolProgress)
      this.KpiCard(`${this.state.today.pendingIssues}`, '待处理隐患', Ids.homePendingIssuesCount)
      this.KpiCard(`${this.state.today.resolvedThisWeek}`, '本周已整改', Ids.homeResolvedThisWeekCount)
    }
    .width('100%')
    .height(92)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  KpiCard(value: string, label: string, targetId: string) {
    Column({ space: 4 }) {
      Text(value)
        .id(targetId)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Text(label)
        .fontSize(11)
        .fontColor(Theme.textSecondary)
    }
    .layoutWeight(1)
    .height('100%')
    .borderRadius(20)
    .backgroundColor(Theme.surfacePrimary)
    .linearGradient({
      angle: 145,
      direction: GradientDirection.RightTop,
      colors: [[Theme.surfacePrimary, 0.0], [Theme.brandPale, 1.0]]
    })
    .shadow({ radius: 12, color: 'rgba(13,148,136,0.13)', offsetY: 4 })
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  QuickActions() {
    Row({ space: 10 }) {
      this.QuickButton('上报隐患', Ids.homeQuickReportButton, () => this.onReport())
      this.QuickButton('开始巡检', Ids.homeQuickPatrolButton, () => this.goToTab('tab-patrol'))
      this.QuickButton('应急联系', Ids.homeQuickContactButton, () => this.goToTab('tab-contacts'))
    }
    .width('100%')
    .height(44)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .margin({ top: 18 })
  }

  @Builder
  QuickButton(label: string, targetId: string, onTap: () => void) {
    Button() {
      Text(label)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
    }
    .id(targetId)
    .type(ButtonType.Capsule)
    .layoutWeight(1)
    .height('100%')
    .backgroundColor(Theme.brandPrimary)
    .linearGradient({
      angle: 135,
      direction: GradientDirection.RightTop,
      colors: [[Theme.brandPrimary, 0.0], [Theme.brandBright, 0.6], [Theme.brandLight, 1.0]]
    })
    .shadow({ radius: 12, color: 'rgba(13,148,136,0.13)', offsetY: 4 })
    .onClick(onTap)
  }

  @Builder
  RecentSection() {
    Text('最近动态')
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 22, bottom: 10 })

    Column({ space: 10 }) {
      ForEach(this.state.recentIssues, (issue: Issue) => {
        this.IssueRow(issue)
      }, (issue: Issue) => issue.id)
    }
    .id(Ids.homeRecentIssuesList)
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

    Text('查看全部隐患')
      .id(Ids.homeViewAllIssuesLink)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.brandPrimary)
      .width('100%')
      .textAlign(TextAlign.Center)
      .padding(16)
      .onClick(() => this.goToTab('tab-issues'))
  }

  @Builder
  IssueRow(issue: Issue) {
    Row({ space: 12 }) {
      Column({ space: 3 }) {
        Text(issue.title)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`${formatDateTime(issue.createdAt)} · ${issue.location}`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Text(statusLabel(issue.status))
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.statusColor(issue.status))
        .padding({ left: 9, right: 9, top: 4, bottom: 4 })
        .borderRadius(9999)
        .backgroundColor(this.statusBg(issue.status))
    }
    .id(`home-recent-issue-${issue.id}`)
    .width('100%')
    .padding(14)
    .borderRadius(14)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 2, color: 'rgba(15,23,42,0.04)', offsetY: 1 })
    .border({ width: { left: 4 }, color: { left: this.riskColor(issue.riskLevel) } })
    .onClick(() => this.onIssueDetail(issue.id))
  }

  private statusColor(status: IssueStatus): string {
    if (status === IssueStatus.COMPLETED || status === IssueStatus.CLOSED) {
      return Theme.safe
    } else if (status === IssueStatus.PROCESSING) {
      return Theme.warning
    } else if (status === IssueStatus.AWAITING_REVIEW) {
      return Theme.info
    }
    return Theme.danger
  }

  private statusBg(status: IssueStatus): string {
    if (status === IssueStatus.COMPLETED || status === IssueStatus.CLOSED) {
      return Theme.safeBg
    } else if (status === IssueStatus.PROCESSING) {
      return Theme.warningBg
    } else if (status === IssueStatus.AWAITING_REVIEW) {
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
}
