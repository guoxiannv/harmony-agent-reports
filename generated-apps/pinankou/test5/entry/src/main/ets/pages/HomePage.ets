import { Theme } from '../common/Theme';
import { HomeStats, Activity } from '../models/Models';
import { Formatters } from '../common/Formatters';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyStateView } from '../components/EmptyStateView';

@Component
export struct HomePage {
  @Prop stats: HomeStats = new HomeStats();
  @Prop activities: Activity[] = [];
  onReportRisk: () => void = () => {};
  onNavigateInspection: () => void = () => {};
  onNavigateEmergency: () => void = () => {};

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Row() {
          Text('平安扣')
            .id('home-header-title')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .letterSpacing(-0.3)
          Blank()
          Image($rawfile('icon_打开通知中心.svg'))
            .width(20)
            .height(20)
            .fillColor(Theme.textPrimary)
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })

        Row() {
          Column({ space: 6 }) {
            Text('今日安全，由我守护')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
            Text('完成巡检 · 闭环隐患 · 守护现场')
              .fontSize(14)
              .fontColor('rgba(255,255,255,0.92)')
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Image($rawfile('icon_安全盾牌图标.svg'))
            .width(48)
            .height(48)
            .fillColor('#FFFFFF')
        }
        .width('100%')
        .padding(22)
        .linearGradient({
          angle: 135,
          direction: GradientDirection.RightTop,
          colors: [['#0D9488', 0.0], ['#2DD4BF', 1.0]]
        })
        .borderRadius(Theme.radiusHero)

        Row({ space: 12 }) {
          this.StatCard('今日巡检', this.stats.todayInspectionCount, 'home-stat-today-inspection', 'icon_check')
          this.StatCard('待处理隐患', this.stats.pendingRiskCount, 'home-stat-pending-risk', 'icon_risk')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row({ space: 12 }) {
          this.StatCard('逾期风险', this.stats.overdueRiskCount, 'home-stat-overdue-risk', 'icon_warning')
          this.StatCard('整改闭环率', this.stats.closedRate, 'home-stat-closed-rate', 'icon_check')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Column({ space: 12 }) {
          Text('快捷入口')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .width('100%')

          Row({ space: 12 }) {
            this.QuickAction('上报隐患', 'add', 'home-quick-action-report', Theme.brandPrimary, '#FFFFFF', () => this.onReportRisk())
            this.QuickAction('开始巡检', 'inspection', 'home-quick-action-inspection', '#CCFBF1', Theme.brandPrimary, () => this.onNavigateInspection())
            this.QuickAction('应急联系', 'emergency', 'home-quick-action-contact', '#FFEDD5', '#D97706', () => this.onNavigateEmergency())
            this.QuickAction('统计报表', 'more', '', '#E0F2FE', '#0EA5E9', () => {})
          }
          .width('100%')
        }
        .width('100%')

        Column({ space: 12 }) {
          Row() {
            Text('隐患状态分布')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Blank()
            Row({ space: 8 }) {
              this.Legend('待整改', '#0D9488')
              this.Legend('整改中', '#0EA5E9')
              this.Legend('待复核', '#D97706')
              this.Legend('已关闭', '#16A34A')
            }
          }
          .width('100%')

          this.RiskDistribution()
        }
        .id('home-chart-risk-distribution')
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)

        Column({ space: 12 }) {
          Text('最近动态')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .width('100%')

          Column() {
            if (this.activities.length === 0) {
              EmptyStateView({ message: '暂无动态', testId: 'home-empty-activity' })
            } else {
              ForEach(this.activities, (activity: Activity) => {
                Row({ space: 12 }) {
                  Circle({ width: 8, height: 8 })
                    .fill(this.activityColor(activity.type))
                    .margin({ top: 6 })

                  Column({ space: 2 }) {
                    Text(activity.title)
                      .fontSize(14)
                      .fontWeight(FontWeight.Medium)
                      .fontColor(Theme.textPrimary)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(Formatters.dateTimeString(activity.timestamp))
                      .fontSize(12)
                      .fontColor(Theme.textSecondary)
                  }
                  .layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)
                }
                .id(`home-activity-${activity.id}`)
                .width('100%')
                .padding({ top: 12, bottom: 12 })
                .border({ width: { bottom: 1 }, color: Theme.borderSoft })
              }, (activity: Activity) => activity.id)
            }
          }
          .id('home-recent-activity-list')
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
        }
        .width('100%')
      }
      .width('100%')
      .padding(Theme.pageHorizontalPadding)
      .padding({ bottom: 100 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  StatCard(label: string, value: string | number, componentId: string, icon: string) {
    Column({ space: 4 }) {
      SvgIcon({ variant: icon, iconSize: 28, color: Theme.brandPrimary })
      Text(label)
        .fontSize(12)
        .fontColor(Theme.textSecondary)
      Text(String(value))
        .id(componentId)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .letterSpacing(-0.5)
    }
    .width('48%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  QuickAction(label: string, icon: string, componentId: string, bg: string, iconColor: string, onTap: () => void) {
    Column({ space: 6 }) {
      Column() {
        SvgIcon({ variant: icon, iconSize: 20, color: iconColor })
      }
      .width(40)
      .height(40)
      .backgroundColor(bg)
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(label)
        .fontSize(12)
        .fontColor(Theme.textPrimary)
    }
    .id(componentId)
    .layoutWeight(1)
    .padding({ top: 14, bottom: 14 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(HorizontalAlign.Center)
    .onClick(onTap)
  }

  @Builder
  Legend(label: string, color: string) {
    Row({ space: 4 }) {
      Circle({ width: 8, height: 8 })
        .fill(color)
      Text(label)
        .fontSize(11)
        .fontColor(Theme.textSecondary)
    }
  }

  @Builder
  RiskDistribution() {
    Row() {
      this.Bar('待整改', Number(this.stats.riskDistribution.pending ?? 0), '#0D9488')
      this.Bar('整改中', Number(this.stats.riskDistribution.inprogress ?? 0), '#0EA5E9')
      this.Bar('待复核', Number(this.stats.riskDistribution.review ?? 0), '#D97706')
      this.Bar('已关闭', Number(this.stats.riskDistribution.closed ?? 0), '#16A34A')
      this.Bar('已退回', Number(this.stats.riskDistribution.rejected ?? 0), '#8B5CF6')
    }
    .width('100%')
    .height(120)
    .padding({ top: 10 })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Bottom)
  }

  @Builder
  Bar(label: string, count: number, color: string) {
    Column() {
      Column() {
        Text(String(count))
          .fontSize(11)
          .fontColor(Theme.textSecondary)
          .margin({ bottom: 4 })
      }
      .width(28)
      .height(`${Math.min(100, Math.max(8, count * 12))}%`)
      .backgroundColor(color)
      .borderRadius({ topLeft: 6, topRight: 6 })
      .justifyContent(FlexAlign.Start)

      Text(label)
        .fontSize(11)
        .fontColor(Theme.textSecondary)
        .margin({ top: 8 })
    }
    .height('100%')
    .justifyContent(FlexAlign.End)
  }

  private activityColor(type: string): string {
    if (type === 'inspection') {
      return '#16A34A'
    } else if (type === 'fix') {
      return '#0EA5E9'
    } else if (type === 'review') {
      return '#D97706'
    }
    return '#0D9488'
  }
}
