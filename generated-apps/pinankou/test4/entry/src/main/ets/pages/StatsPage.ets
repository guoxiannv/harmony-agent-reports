import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { StatsPeriod, TrendPoint } from '../models/SafetyTypes'

interface StatsPageProps {
  state: SafetyAppState
  onExport: () => void
}

@Component
export struct StatsPage {
  @ObjectLink state: SafetyAppState
  onExport: () => void = () => {}

  build() {
    Scroll() {
      Column({ space: 12 }) {
        this.Header()
        this.PeriodPicker()
        this.KpiGrid()
        this.TrendChart()
        this.RiskChart()
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .scrollBar(BarState.Off)
  }

  @Builder
  Header() {
    Row() {
      Text('统计看板')
        .id(Ids.statsHeaderTitle)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Button('导出')
        .id(Ids.statsExportButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
        .height(34)
        .padding({ left: 14, right: 14 })
        .borderRadius(17)
        .backgroundColor(Theme.brandPrimary)
        .onClick(() => this.onExport())
    }
    .width('100%')
    .height(56)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  PeriodPicker() {
    Row({ space: 8 }) {
      this.PeriodChip('今日', StatsPeriod.DAY)
      this.PeriodChip('本周', StatsPeriod.WEEK)
      this.PeriodChip('本月', StatsPeriod.MONTH)
    }
    .id(Ids.statsPeriodPicker)
    .width('100%')
  }

  @Builder
  PeriodChip(label: string, period: StatsPeriod) {
    Button(label)
      .fontSize(13)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.state.statsPeriod === period ? '#FFFFFF' : Theme.textSecondary)
      .height(34)
      .padding({ left: 18, right: 18 })
      .borderRadius(17)
      .backgroundColor(this.state.statsPeriod === period ? Theme.brandPrimary : Theme.surfacePrimary)
      .onClick(() => this.state.setStatsPeriod(period))
  }

  @Builder
  KpiGrid() {
    Row({ space: 10 }) {
      this.KpiCard(`${this.state.stats.issueCount}`, '隐患总数', Ids.statsKpiIssues)
      this.KpiCard(`${this.state.stats.resolvedCount}`, '已整改', Ids.statsKpiResolved)
      this.KpiCard(`${Math.round(this.state.stats.completionRate * 100)}%`, '整改完成率', Ids.statsKpiCompletion)
      this.KpiCard(`${Math.round(this.state.stats.patrolCompletionRate * 100)}%`, '巡检完成率', Ids.statsKpiPatrol)
    }
    .width('100%')
  }

  @Builder
  KpiCard(value: string, label: string, targetId: string) {
    Column({ space: 4 }) {
      Text(value)
        .id(targetId)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Text(label)
        .fontSize(10)
        .fontColor(Theme.textSecondary)
    }
    .layoutWeight(1)
    .height(76)
    .borderRadius(16)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  TrendChart() {
    Column({ space: 8 }) {
      Text('隐患趋势')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .width('100%')
      Column() {
        Row() {
          ForEach(this.state.stats.trend, (point: TrendPoint) => {
            Column({ space: 4 }) {
              Stack({ alignContent: Alignment.Bottom }) {
                Column()
                  .width(8)
                  .height(this.barHeight(point.created))
                  .borderRadius(4)
                  .backgroundColor(Theme.brandPrimary)
                Column()
                  .width(8)
                  .height(this.barHeight(point.resolved))
                  .borderRadius(4)
                  .backgroundColor(Theme.brandLight)
                  .position({ x: 6, y: 0 })
              }
              .width(18)
              .height(80)
              Text(point.label)
                .fontSize(9)
                .fontColor(Theme.textTertiary)
            }
            .layoutWeight(1)
          }, (point: TrendPoint) => point.label)
        }
        .width('100%')
        .height(100)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .id(Ids.statsTrendChart)
      .width('100%')
      .height(120)
      .padding(12)
      .borderRadius(16)
      .backgroundColor(Theme.surfacePrimary)
      .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
    }
    .width('100%')
  }

  @Builder
  RiskChart() {
    Column({ space: 8 }) {
      Text('风险等级分布')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .width('100%')
      Column({ space: 8 }) {
        this.RiskRow('低', this.state.stats.riskDistribution['low'] ?? 0, Theme.safe)
        this.RiskRow('中', this.state.stats.riskDistribution['medium'] ?? 0, Theme.warning)
        this.RiskRow('高', this.state.stats.riskDistribution['high'] ?? 0, Theme.danger)
        this.RiskRow('重大', this.state.stats.riskDistribution['critical'] ?? 0, Theme.critical)
      }
      .id(Ids.statsRiskChart)
      .width('100%')
      .padding(12)
      .borderRadius(16)
      .backgroundColor(Theme.surfacePrimary)
      .shadow({ radius: 8, color: 'rgba(13,148,136,0.10)', offsetY: 3 })
    }
    .width('100%')
  }

  @Builder
  RiskRow(label: string, count: number, color: string) {
    Row() {
      Text(label)
        .fontSize(12)
        .fontColor(Theme.textSecondary)
        .width(36)
      Row() {
        Row()
          .width(`${Math.min(100, Math.max(4, count * 10))}%`)
          .height(8)
          .borderRadius(4)
          .backgroundColor(color)
      }
      .layoutWeight(1)
      .height(8)
      .borderRadius(4)
      .backgroundColor(Theme.surfaceSecondary)
      Text(`${count}`)
        .fontSize(12)
        .fontColor(Theme.textPrimary)
        .width(24)
        .textAlign(TextAlign.End)
    }
    .width('100%')
    .height(20)
  }

  private barHeight(count: number): number {
    return Math.max(4, Math.min(80, count * 12 + 4))
  }
}
