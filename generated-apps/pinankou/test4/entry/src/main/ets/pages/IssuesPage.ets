import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { Issue, IssueStatus, RiskLevel } from '../models/SafetyTypes'
import { statusLabel, riskLabel, formatDateTime } from '../common/Formatters'

interface IssuesPageProps {
  state: SafetyAppState
  onAdd: () => void
  onDetail: (issueId: string) => void
}

@Component
export struct IssuesPage {
  @ObjectLink state: SafetyAppState
  onAdd: () => void = () => {}
  onDetail: (issueId: string) => void = () => {}

  build() {
    Column({ space: 0 }) {
      this.Header()
      this.FilterBar()

      List({ space: 10 }) {
        ForEach(this.state.issues, (issue: Issue) => {
          ListItem() {
            this.IssueRow(issue)
          }
          .id(`issues-item-${issue.id}-row`)
        }, (issue: Issue) => issue.id)
      }
      .id(Ids.issuesList)
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
  Header() {
    Row() {
      Text('隐患与事项')
        .id(Ids.issuesHeaderTitle)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Button('新增')
        .id(Ids.issuesAddButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
        .height(34)
        .padding({ left: 14, right: 14 })
        .borderRadius(17)
        .backgroundColor(Theme.brandPrimary)
        .onClick(() => this.onAdd())
    }
    .width('100%')
    .height(56)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  FilterBar() {
    Row({ space: 8 }) {
      TextInput({ text: this.state.issuesFilter.query, placeholder: '搜索隐患标题/位置' })
        .id(Ids.issuesSearchInput)
        .layoutWeight(1)
        .height(38)
        .borderRadius(12)
        .backgroundColor(Theme.surfacePrimary)
        .onChange((value: string) => {
          this.state.issuesFilter.query = value
          this.state.applyIssueFilter()
        })

      Select(this.statusOptions())
        .id(Ids.issuesFilterStatus)
        .selected(this.statusIndex())
        .value('状态')
        .height(38)
        .onSelect((index: number) => {
          this.state.issuesFilter.status = this.statusFromIndex(index)
          this.state.applyIssueFilter()
        })

      Select(this.riskOptions())
        .id(Ids.issuesFilterRisk)
        .selected(this.riskIndex())
        .value('等级')
        .height(38)
        .onSelect((index: number) => {
          this.state.issuesFilter.risk = this.riskFromIndex(index)
          this.state.applyIssueFilter()
        })
    }
    .width('100%')
    .height(48)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 10 })
  }

  @Builder
  IssueRow(issue: Issue) {
    Row({ space: 12 }) {
      Column({ space: 3 }) {
        Text(issue.title)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`${formatDateTime(issue.createdAt)} · ${issue.location} · ${riskLabel(issue.riskLevel)}`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Text(statusLabel(issue.status))
        .id(`issues-item-${issue.id}-status-label`)
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.statusColor(issue.status))
        .padding({ left: 9, right: 9, top: 4, bottom: 4 })
        .borderRadius(9999)
        .backgroundColor(this.statusBg(issue.status))
    }
    .width('100%')
    .padding(14)
    .borderRadius(14)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 2, color: 'rgba(15,23,42,0.04)', offsetY: 1 })
    .border({ width: { left: 4 }, color: { left: this.riskColor(issue.riskLevel) } })
    .onClick(() => this.onDetail(issue.id))
  }

  private statusOptions(): SelectOption[] {
    return ['全部状态', '待处理', '处理中', '待验收', '已完成', '已关闭'].map((o: string) => {
      let item: SelectOption = { value: o }
      return item
    })
  }

  private riskOptions(): SelectOption[] {
    return ['全部等级', '低', '中', '高', '重大'].map((o: string) => {
      let item: SelectOption = { value: o }
      return item
    })
  }

  private statusIndex(): number {
    let map: string[] = ['all', 'pending', 'processing', 'awaiting-review', 'completed', 'closed']
    return map.indexOf(this.state.issuesFilter.status)
  }

  private statusFromIndex(index: number): IssueStatus | 'all' {
    let map: (IssueStatus | 'all')[] = ['all', IssueStatus.PENDING, IssueStatus.PROCESSING, IssueStatus.AWAITING_REVIEW, IssueStatus.COMPLETED, IssueStatus.CLOSED]
    return map[index] ?? 'all'
  }

  private riskIndex(): number {
    let map: string[] = ['all', 'low', 'medium', 'high', 'critical']
    return map.indexOf(this.state.issuesFilter.risk)
  }

  private riskFromIndex(index: number): RiskLevel | 'all' {
    let map: (RiskLevel | 'all')[] = ['all', RiskLevel.LOW, RiskLevel.MEDIUM, RiskLevel.HIGH, RiskLevel.CRITICAL]
    return map[index] ?? 'all'
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
