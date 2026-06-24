import { Theme, BrandGradient } from '../common/Theme';
import { StatsController } from '../controllers/StatsController';
import { StatsSnapshot, TrendPoint, StatusDistributionItem, TopLocationItem } from '../services/StatsService';
import { PageHeader, EmptyStateView, GhostButton } from '../components/CommonUi';

@Component
export struct StatsPage {
  @State period: '7d' | '30d' | 'all' = '7d';
  @State stats: StatsSnapshot = {
    hazardTotal: 0,
    closedRate: 0,
    inspectionCompletion: 0,
    overdueCount: 0,
    trend: [],
    statusDistribution: [],
    topLocations: []
  };
  private controller = new StatsController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    this.stats = this.controller.getStats(this.period);
  }

  private setPeriod(p: '7d' | '30d' | 'all'): void {
    this.period = p;
    this.refresh();
  }

  private maxTrend(): number {
    if (this.stats.trend.length === 0) return 1;
    return Math.max(...this.stats.trend.map(t => t.count), 1);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({ title: '统计看板' })

      Scroll() {
        Column({ space: 16 }) {
          Row({ space: 8 }) {
            GhostButton({ label: '近7天', active: this.period === '7d', onTap: () => this.setPeriod('7d') })
            GhostButton({ label: '近30天', active: this.period === '30d', onTap: () => this.setPeriod('30d') })
            GhostButton({ label: '全部', active: this.period === 'all', onTap: () => this.setPeriod('all') })
          }
          .id('stats-period-picker')
          .width('100%')

          Grid() {
            GridItem() {
              this.MetricCard('隐患总数', `${this.stats.hazardTotal}`, BrandGradient.inspect, 'stats-hazard-total-card')
            }
            GridItem() {
              this.MetricCard('整改率', `${this.stats.closedRate}%`, BrandGradient.hazard, 'stats-closed-rate-card')
            }
            GridItem() {
              this.MetricCard('巡检完成率', `${this.stats.inspectionCompletion}%`, BrandGradient.note, 'stats-inspection-completion-card')
            }
            GridItem() {
              this.MetricCard('逾期数', `${this.stats.overdueCount}`, BrandGradient.contact, 'stats-overdue-count-card')
            }
          }
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap(12)
          .rowsGap(12)
          .width('100%')
          .height(220)

          Column({ space: 12 }) {
            Text('近7日隐患趋势')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .width('100%')

            Column() {
              this.TrendBars()
            }
            .id('stats-trend-chart')
            .width('100%')
            .height(160)
            .padding(12)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusCard)
            .justifyContent(FlexAlign.End)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          Column({ space: 12 }) {
            Text('隐患状态分布')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .width('100%')

            Row() {
              this.StatusDonut()
              Column({ space: 8 }) {
                ForEach(this.stats.statusDistribution, (item: StatusDistributionItem) => {
                  Row({ space: 8 }) {
                    Column()
                      .width(10)
                      .height(10)
                      .borderRadius(5)
                      .backgroundColor(hazardStatusColor(item.status))
                    Text(`${item.label} ${item.count}`)
                      .fontSize(12)
                      .fontColor(Theme.textSecondary)
                  }
                }, (item: StatusDistributionItem) => item.status)
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
            }
            .id('stats-status-distribution')
            .width('100%')
            .height(160)
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          Column({ space: 12 }) {
            Text('隐患高发位置 Top 5')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .width('100%')

            List({ space: 8 }) {
              if (this.stats.topLocations.length === 0) {
                ListItem() {
                  EmptyStateView({ title: '暂无位置数据' })
                    .id('stats-empty-locations')
                }
              }
              ForEach(this.stats.topLocations, (item: TopLocationItem, index: number) => {
                ListItem() {
                  Row() {
                    Text(`${index + 1}`)
                      .fontSize(12)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.brandPrimary)
                      .width(24)
                    Text(item.location)
                      .fontSize(14)
                      .fontColor(Theme.textSecondary)
                      .layoutWeight(1)
                    Text(`${item.count}`)
                      .fontSize(14)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.textPrimary)
                  }
                  .width('100%')
                  .height(40)
                }
                .id(`stats-location-${index}`)
              }, (item: TopLocationItem, index: number) => `${index}`)
            }
            .id('stats-top-locations-list')
            .width('100%')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          Blank().height(24)
        }
        .width('100%')
        .padding(16)
        .padding({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  MetricCard(label: string, value: string, gradient: LinearGradient, id: string) {
    Column({ space: 4 }) {
      Text(value)
        .id(id)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
      Text(label)
        .fontSize(12)
        .fontColor('rgba(255,255,255,0.9)')
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .linearGradient(gradient)
    .borderRadius(Theme.radiusCard)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  TrendBars() {
    Row({ space: 4 }) {
      ForEach(this.stats.trend, (point: TrendPoint) => {
        Column() {
          Blank().layoutWeight(1)
          Column()
            .width('100%')
            .height(`${Math.max(4, (point.count / this.maxTrend()) * 100)}%`)
            .borderRadius({ topLeft: 4, topRight: 4 })
            .linearGradient(BrandGradient.primary)
          Text(point.date)
            .fontSize(9)
            .fontColor(Theme.textQuaternary)
            .margin({ top: 4 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .height('100%')
      }, (point: TrendPoint) => point.date)
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Bottom)
  }

  @Builder
  StatusDonut() {
    Stack() {
      Column()
        .width(100)
        .height(100)
        .borderRadius(50)
        .backgroundColor(Theme.borderDefault)
      Column()
        .width(70)
        .height(70)
        .borderRadius(35)
        .backgroundColor(Theme.cardBg)
    }
    .width(100)
    .height(100)
  }
}

function hazardStatusColor(status: string): string {
  if (status === 'pending') return Theme.textQuaternary;
  if (status === 'in_progress') return Theme.info;
  if (status === 'awaiting_acceptance') return Theme.warning;
  if (status === 'closed') return Theme.success;
  return Theme.textTertiary;
}
