// Stats.ets - statistics dashboard surface (stats-page, tab-stats).
//
// Semantic targets:
//   stats-period-week/month/quarter,
//   stats-hazard-total, stats-pending-count, stats-completion-rate,
//   stats-inspection-rate, stats-overdue-count,
//   stats-trend-chart, stats-distribution-chart
import { AppController } from '../controller/AppController';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { StatsPeriod, StatsSnapshot, StatsTrendPoint, StatsDistributionSlice } from '../model/Types';

const PERIODS: StatsPeriod[] = ['本周', '本月', '本季度'];

@Component
export struct StatsPage {
  controller: AppController;

  build() {
    Scroll() {
      Column() {
        this.Title()
        this.PeriodChips()
        this.MetricsGrid()
        this.TrendCard()
        this.DistributionCard()
      }
      .width('100%')
      .padding({ bottom: 40 })
      .alignItems(HorizontalAlign.Center)
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  Title() {
    Text('统计看板')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.slate900)
      .width('100%')
      .padding({ left: 16, top: 16, bottom: 8 })
  }

  @Builder
  PeriodChips() {
    Row() {
      ForEach(PERIODS, (p: StatsPeriod) => {
        Text(p)
          .fontSize(13)
          .fontColor(this.controller.statsPeriod === p ? '#FFFFFF' : Theme.slate600)
          .padding({ left: 16, right: 16, top: 8, bottom: 8 })
          .borderRadius(20)
          .backgroundColor(this.controller.statsPeriod === p ? Theme.teal : 'rgba(255,255,255,0.7)')
          .margin({ right: 8 })
          .onClick(() => { this.controller.changeStatsPeriod(p); })
      }, (p: StatsPeriod) => p)
    }
    .id('stats-period-week')
    .width('100%')
    .padding({ left: 16, bottom: 12 })
  }

  @Builder
  MetricsGrid() {
    Flex({ wrap: FlexWrap.Wrap }) {
      this.MetricCard('stats-hazard-total', String(this.snap().hazardTotal), '隐患总数', 'metric-hazard-total', Theme.riskLow)
      this.MetricCard('stats-pending-count', String(this.snap().pendingCount), '待整改', 'metric-pending', Theme.riskMid)
      this.MetricCard('stats-completion-rate', `${this.snap().completionRate}%`, '整改完成率', 'metric-completion', Theme.doneGreen)
      this.MetricCard('stats-inspection-rate', `${this.snap().inspectionRate}%`, '巡检完成率', 'metric-inspection-rate', Theme.sky600)
      this.MetricCard('stats-overdue-count', String(this.snap().overdueCount), '逾期事项', 'metric-overdue', Theme.riskHigh)
      this.MetricCard('stats-hazard-total', String(this.snap().hazardTotal), '本月新增', 'metric-month', Theme.doneGreen)
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
  }

  @Builder
  MetricCard(sid: string, value: string, label: string, icon: string, accent: string) {
    Column() {
      Row() {
        SvgIcon({ variant: icon, iconSize: 20, color: Theme.slate900 })
      }
      .width(36)
      .height(36)
      .borderRadius(12)
      .backgroundColor(this.metricBg(accent))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(value)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(accent)
        .margin({ top: 10 })

      Text(label)
        .fontSize(12)
        .fontColor(Theme.slate400)
        .margin({ top: 2 })
    }
    .id(sid)
    .width('31%')
    .padding(14)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .margin({ right: 6, bottom: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  TrendCard() {
    Column() {
      Text('隐患上报趋势')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.slate900)
      Text(`近 ${this.snap().trend.length} 天`)
        .fontSize(11)
        .fontColor(Theme.slate400)
        .margin({ top: 2 })

      // Trend bar chart built from Columns.
      Row() {
        ForEach(this.snap().trend, (p, _idx) => {
          Column() {
            Column()
              .width(10)
              .height(this.trendBarHeight(p.value))
              .borderRadius(4)
              .backgroundColor(this.trendColor(p.value))
            Text(p.label.substring(3))
              .fontSize(8)
              .fontColor(Theme.slate400)
              .margin({ top: 4 })
              .maxLines(1)
          }
          .layoutWeight(1)
          .height(120)
          .justifyContent(FlexAlign.End)
          .alignItems(HorizontalAlign.Center)
        }, (p) => p.label)
      }
      .id('stats-trend-chart')
      .width('100%')
      .height(140)
      .margin({ top: 12 })
      .alignItems(VerticalAlign.Bottom)
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 8 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  DistributionCard() {
    Row() {
      // Ring (Stack with overlapping arcs is complex in ArkUI; use a simple
      // donut via stacked Column bars as a ring proxy + center total).
      Column() {
        Stack() {
          Text(`${this.snap().hazardTotal}\n总计`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.teal)
            .textAlign(TextAlign.Center)
        }
        .width(120)
        .height(120)
        .borderRadius(60)
        .border({ width: 18, color: this.ringColor() })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .alignItems(HorizontalAlign.Center)

      Column() {
        ForEach(this.snap().distribution, (s) => {
          Row() {
            Column()
              .width(12)
              .height(12)
              .borderRadius(3)
              .backgroundColor(s.color)
            Text(s.label)
              .fontSize(13)
              .fontColor(Theme.slate600)
              .margin({ left: 8 })
              .layoutWeight(1)
            Text(String(s.value))
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.slate900)
          }
          .width('100%')
          .margin({ bottom: 10 })
          .alignItems(VerticalAlign.Center)
        }, (s) => s.label)
      }
      .id('stats-distribution-chart')
      .layoutWeight(1)
      .margin({ left: 16 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 10 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .alignItems(VerticalAlign.Center)
  }

  private snap(): StatsSnapshot {
    return this.controller.statsSnapshot();
  }

  private metricBg(c: string): string {
    if (c === Theme.riskHigh) return 'rgba(254,226,226,0.7)';
    if (c === Theme.riskMid) return 'rgba(254,243,199,0.7)';
    if (c === Theme.doneGreen) return 'rgba(209,250,229,0.7)';
    return 'rgba(219,234,254,0.7)';
  }

  private trendBarHeight(v: number): number {
    if (v <= 0) return 4;
    const max: number = this.maxTrend();
    if (max <= 0) return 4;
    return Math.max(8, Math.round((v / max) * 96));
  }

  private trendColor(v: number): string {
    if (v <= 0) return Theme.slate200;
    return Theme.teal500;
  }

  private maxTrend(): number {
    let m: number = 0;
    const t: StatsSnapshot = this.snap();
    for (let i = 0; i < t.trend.length; i++) {
      if (t.trend[i].value > m) {
        m = t.trend[i].value;
      }
    }
    return m;
  }

  private ringColor(): string {
    // Dominant distribution color or teal default when empty.
    const dist = this.snap().distribution;
    let max: number = 0;
    let color: string = Theme.teal;
    for (let i = 0; i < dist.length; i++) {
      if (dist[i].value > max) {
        max = dist[i].value;
        color = dist[i].color;
      }
    }
    return max === 0 ? Theme.slate200 : color;
  }
}
