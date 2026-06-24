import { Theme, BrandGradient } from '../common/Theme';
import { AppSurface } from '../common/TabTypes';
import { SvgIcon } from '../common/SvgIcon';
import { HomeController } from '../controllers/HomeController';
import { HomeSummary } from '../services/StatsService';
import { Activity, ActivityKind } from '../model/Activity';
import { EmptyStateView, SectionTitle } from '../components/CommonUi';
import { formatDate } from '../services/IdGenerator';

@Component
export struct HomePage {
  @State summary: HomeSummary = { pendingTasksCount: 0, hazardTotal: 0, closedCount: 0, inspectionTotal: 0, completedInspectionCount: 0 };
  @State activities: Activity[] = [];
  onNavigate?: (target: AppSurface) => void;
  onOpenDetail?: (target: AppSurface, id: string) => void;
  private controller = new HomeController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    this.summary = this.controller.summary();
    this.activities = this.controller.recentActivities(20);
  }

  private greeting(): string {
    const h = new Date().getHours();
    if (h < 12) return '早上好，安全员';
    if (h < 18) return '下午好，安全员';
    return '晚上好，安全员';
  }

  private activityColor(kind: ActivityKind): string {
    if (kind === ActivityKind.INSPECTION) return Theme.success;
    if (kind === ActivityKind.HAZARD) return Theme.danger;
    if (kind === ActivityKind.SAFETY_NOTE) return Theme.info;
    return Theme.indigo;
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        this.Header()
        this.QuickGrid()
        this.TaskSummary()
        this.RecentActivity()
      }
      .width('100%')
      .padding({ bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }

  @Builder
  Header() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Row() {
          Column({ space: 4 }) {
            Text(this.greeting())
              .id('home-header-title')
              .fontSize(14)
              .fontColor('rgba(255,255,255,0.85)')
            Text('平安扣')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnBrand)
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)

          Column() {
            SvgIcon({ variant: 'user', iconSize: 24 })
          }
          .width(44)
          .height(44)
          .borderRadius(22)
          .backgroundColor('rgba(255,255,255,0.25)')
          .justifyContent(FlexAlign.Center)
          .onClick(() => {
            if (this.onNavigate) this.onNavigate('profile');
          })
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Row({ space: 12 }) {
          this.SummaryPill(`${this.summary.pendingTasksCount}`, '待处理隐患')
          this.SummaryPill(`${this.summary.completedInspectionCount}`, '今日巡检')
          this.SummaryPill(`${this.summary.hazardTotal - this.summary.closedCount}`, '待办事项')
        }
        .id('home-summary-card')
        .width('100%')
        .margin({ top: 16 })
      }
      .width('100%')
      .padding({ top: 52, left: 20, right: 20, bottom: 24 })
      .linearGradient(BrandGradient.hero)
      .borderRadius({ bottomLeft: 24, bottomRight: 24 })
    }
    .width('100%')
  }

  @Builder
  SummaryPill(number: string, label: string) {
    Column({ space: 2 }) {
      Text(number)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
      Text(label)
        .fontSize(11)
        .fontColor('rgba(255,255,255,0.9)')
    }
    .layoutWeight(1)
    .padding(12)
    .borderRadius(14)
    .backgroundColor('rgba(255,255,255,0.18)')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  QuickGrid() {
    Column({ space: 12 }) {
      SectionTitle({ title: '快捷入口' })

      Grid() {
        GridItem() {
          this.QuickCard('inspect', '开始巡检', '按计划逐项打卡', 'home-open-inspections-button', () => {
            if (this.onNavigate) this.onNavigate('inspections');
          })
        }
        GridItem() {
          this.QuickCard('hazard', '上报隐患', '拍照描述立即提交', 'home-report-hazard-button', () => {
            if (this.onOpenDetail) this.onOpenDetail('hazard-detail', '');
          })
        }
        GridItem() {
          this.QuickCard('note', '记录事项', '分配责任人跟踪', 'home-add-safety-note-button', () => {
            if (this.onOpenDetail) this.onOpenDetail('safety-note-detail', '');
          })
        }
        GridItem() {
          this.QuickCard('contact', '应急联系', '一键呼叫关键人', 'home-open-contacts-button', () => {
            if (this.onNavigate) this.onNavigate('contacts');
          })
        }
      }
      .id('home-quick-grid')
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(12)
      .rowsGap(12)
      .width('100%')
      .height(232)
    }
    .width('100%')
    .padding(16)
  }

  @Builder
  QuickCard(icon: string, title: string, sub: string, id: string, onTap: () => void) {
    Column({ space: 0 }) {
      Column() {
        SvgIcon({ variant: icon, iconSize: 22 })
      }
      .width(44)
      .height(44)
      .borderRadius(12)
      .linearGradient(icon === 'inspect' ? BrandGradient.inspect : icon === 'hazard' ? BrandGradient.hazard : icon === 'note' ? BrandGradient.note : BrandGradient.contact)
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 12 })

      Text(title)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
      Text(sub)
        .fontSize(12)
        .fontColor(Theme.textTertiary)
        .margin({ top: 2 })
    }
    .id(id)
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
    .alignItems(HorizontalAlign.Start)
    .onClick(onTap)
  }

  @Builder
  TaskSummary() {
    Column({ space: 14 }) {
      Text('待处理任务')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')

      Row() {
        this.TaskCol(`${this.summary.hazardTotal - this.summary.closedCount}`, '隐患')
        this.TaskCol(`${this.summary.inspectionTotal - this.summary.completedInspectionCount}`, '巡检')
        this.TaskCol(`${this.summary.pendingTasksCount}`, '事项')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, bottom: 12 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
  }

  @Builder
  TaskCol(number: string, label: string) {
    Column({ space: 4 }) {
      Text(number)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandPrimary)
      Text(label)
        .fontSize(11)
        .fontColor(Theme.textTertiary)
    }
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  RecentActivity() {
    Column({ space: 12 }) {
      Row() {
        Text('最近动态')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text('查看全部')
          .fontSize(12)
          .fontColor(Theme.brandPrimary)
      }
      .width('100%')

      Column({ space: 12 }) {
        if (this.activities.length === 0) {
          EmptyStateView({ title: '暂无动态', subtitle: '开始记录安全相关工作' })
            .id('home-empty-activity')
        }
        ForEach(this.activities, (activity: Activity) => {
          Row({ space: 12 }) {
            Column()
              .width(8)
              .height(8)
              .borderRadius(4)
              .backgroundColor(this.activityColor(activity.kind))
              .margin({ top: 6 })
            Column({ space: 2 }) {
              Text(activity.title)
                .fontSize(14)
                .fontColor(Theme.textSecondary)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(activity.subtitle + ' · ' + formatDate(activity.timestamp))
                .fontSize(11)
                .fontColor(Theme.textQuaternary)
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .alignItems(VerticalAlign.Top)
        }, (activity: Activity) => activity.id)
      }
      .id('home-recent-activity-list')
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
  }
}
