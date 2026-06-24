import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme, BrandGradient } from '../common/Theme'
import { ChartPoint, ChartInsight, ChartMetric, ChartPeriod } from '../models/ChartModels'
import { Pet } from '../models/Pet'
import { RecordType } from '../models/Record'

interface ChartsPageProps {
  state: AppState
  repository: Repository
}

@Component
export struct ChartsPage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))

  private chartData(): ChartPoint[] {
    const days: number = this.state.chartSelection.period === 'week' ? 7 : 30
    const records = this.state.records.filter((r) => r.petId === this.state.chartSelection.petId)
    const result: ChartPoint[] = []
    for (let i: number = days - 1; i >= 0; i--) {
      const d: Date = new Date(Date.now() - i * 24 * 60 * 60 * 1000)
      const dateKey: string = d.toISOString().slice(0, 10)
      const dayRecords = records.filter((r) => r.datetime.slice(0, 10) === dateKey)
      let value: number = 0
      const metric: ChartMetric = this.state.chartSelection.metric
      if (metric === 'weight') {
        const w = dayRecords.filter((r) => r.type === RecordType.WEIGHT).sort((a, b) => b.datetime.localeCompare(a.datetime))[0]
        value = w ? w.weightValue : 0
      } else if (metric === 'food') {
        value = dayRecords.filter((r) => r.type === RecordType.FOOD).reduce((sum, r) => sum + r.foodAmount, 0)
      } else if (metric === 'waste') {
        value = dayRecords.filter((r) => r.type === RecordType.WASTE).length
      } else {
        value = dayRecords.filter((r) => r.type === RecordType.MEDICINE).length
      }
      result.push({ dateLabel: `${d.getMonth() + 1}/${d.getDate()}`, value })
    }
    return result
  }

  private chartInsight(): ChartInsight {
    const data: ChartPoint[] = this.chartData()
    const insight: ChartInsight = new ChartInsight()
    if (data.length === 0 || data.every((p) => p.value === 0)) {
      insight.summary = '暂无数据，添加记录后查看趋势'
      insight.trend = 'flat'
      return insight
    }
    const first: number = data.find((p) => p.value > 0)?.value ?? 0
    const last: number = [...data].reverse().find((p) => p.value > 0)?.value ?? 0
    const change: number = first === 0 ? 0 : Math.round(((last - first) / first) * 100)
    insight.changePercent = change
    if (change > 0) insight.trend = 'up'
    else if (change < 0) insight.trend = 'down'
    else insight.trend = 'flat'
    const label: string = this.metricLabelLong(this.state.chartSelection.metric)
    insight.summary = `${label}较上期${change >= 0 ? '增长' : '下降'} ${Math.abs(change)}%`
    return insight
  }

  private metricLabelLong(metric: ChartMetric): string {
    if (metric === 'weight') return '体重'
    if (metric === 'food') return '食量'
    if (metric === 'waste') return '排泄次数'
    return '用药次数'
  }

  private maxValue(): number {
    const values: number[] = this.chartData().map((p) => p.value)
    const max: number = Math.max(...values, 1)
    return Math.ceil(max * 1.2)
  }

  private metricLabel(metric: ChartMetric): string {
    if (metric === 'weight') return '体重'
    if (metric === 'food') return '饮食'
    if (metric === 'waste') return '排泄'
    return '用药'
  }

  build() {
    Column({ space: 0 }) {
      Text('趋势')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')
        .margin({ top: 24, bottom: 16 })

      // Pet switcher
      Scroll() {
        Row({ space: 10 }) {
          ForEach(this.state.pets, (pet: Pet) => {
            Text(pet.name)
              .id(`charts-pet-chip-${pet.id}`)
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.state.chartSelection.petId === pet.id ? Theme.textOnPrimary : Theme.textSecondary)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .backgroundColor(this.state.chartSelection.petId === pet.id ? Theme.brandPrimary : Theme.cardBg)
              .borderRadius(Theme.radiusPill)
              .onClick(() => {
                this.state.chartSelection.petId = pet.id
              })
          }, (pet: Pet) => pet.id)
        }
      }
      .id('charts-pet-switcher')
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Horizontal)
      .margin({ bottom: 16 })

      // Metric tabs
      Row({ space: 8 }) {
        this.MetricChip('weight', 'charts-metric-weight')
        this.MetricChip('food', 'charts-metric-food')
        this.MetricChip('waste', 'charts-metric-waste')
        this.MetricChip('medicine', 'charts-metric-medicine')
      }
      .id('charts-metric-tabs')
      .width('100%')
      .margin({ bottom: 16 })

      // Period switch
      Row({ space: 8 }) {
        this.PeriodChip('week', '周', 'charts-period-week')
        this.PeriodChip('month', '月', 'charts-period-month')
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .margin({ bottom: 16 })

      // Chart card
      Column({ space: 16 }) {
        if (this.state.pets.length === 0) {
          Text('请先添加宠物')
            .id('charts-empty-no-pet')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding({ top: 80, bottom: 80 })
        } else if (this.chartData().every((p) => p.value === 0)) {
          Text('暂无该指标数据')
            .id('charts-empty')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding({ top: 80, bottom: 80 })
        } else {
          this.BarChart()
        }

        // Insight card
        Column({ space: 6 }) {
          Text(this.chartInsight().summary)
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textSecondary)
          if (this.chartInsight().changePercent !== null) {
            Text(`${this.chartInsight().trend === 'up' ? '↑' : this.chartInsight().trend === 'down' ? '↓' : '→'} ${this.chartInsight().changePercent}%`)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.chartInsight().trend === 'up' ? Theme.brandPrimary : this.chartInsight().trend === 'down' ? Theme.pawPink : Theme.textQuaternary)
          }
        }
        .id('charts-insight-card')
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.brandSoft)
        .borderRadius(Theme.radiusCard)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(18)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow({ radius: 16, color: 'rgba(15,23,42,0.06)', offsetY: 4 })
    }
    .id('charts-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  MetricChip(metric: ChartMetric, id: string) {
    Text(this.metricLabel(metric))
      .id(id)
      .fontSize(13)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.state.chartSelection.metric === metric ? Theme.textOnPrimary : Theme.textSecondary)
      .padding({ left: 14, right: 14, top: 8, bottom: 8 })
      .backgroundColor(this.state.chartSelection.metric === metric ? Theme.brandPrimary : Theme.cardBg)
      .borderRadius(Theme.radiusPill)
      .onClick(() => {
        this.state.chartSelection.metric = metric
      })
  }

  @Builder
  PeriodChip(period: ChartPeriod, label: string, id: string) {
    Text(label)
      .id(id)
      .fontSize(13)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.state.chartSelection.period === period ? Theme.textOnPrimary : Theme.textSecondary)
      .padding({ left: 16, right: 16, top: 6, bottom: 6 })
      .backgroundColor(this.state.chartSelection.period === period ? Theme.brandPrimary : Theme.cardBg)
      .borderRadius(Theme.radiusPill)
      .onClick(() => {
        this.state.chartSelection.period = period
      })
  }

  @Builder
  BarChart() {
    Column({ space: 8 }) {
      Text(this.metricLabel(this.state.chartSelection.metric))
        .fontSize(12)
        .fontColor(Theme.textTertiary)

      Row({ space: 4 }) {
        ForEach(this.chartData(), (point: ChartPoint, index: number) => {
          Column() {
            Column()
              .width(8)
              .height(point.value > 0 ? (point.value / this.maxValue()) * 160 : 2)
              .borderRadius(4)
              .backgroundColor(Theme.brandPrimary)

            Text(point.dateLabel.slice(point.dateLabel.indexOf('/') + 1))
              .fontSize(10)
              .fontColor(Theme.textQuaternary)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.End)
        }, (point: ChartPoint, index: number) => `${index}`)
      }
      .id('charts-canvas')
      .width('100%')
      .height(180)
      .alignItems(VerticalAlign.Bottom)
    }
    .width('100%')
  }
}
