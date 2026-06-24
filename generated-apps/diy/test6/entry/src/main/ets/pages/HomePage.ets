// 手作·印记 — 首页 / Home surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { SectionHeader } from '../components/Widgets';
import { AppStore } from '../services/AppStore';
import { ReminderService } from '../services/ReminderService';
import { Course, CourseRow, PointTransaction, PointRow, Member, Material, KEY_COURSES, KEY_POINT_TX, KEY_MEMBERS, KEY_MATERIALS } from '../common/Models';
import { TimeUtil } from '../common/Util';
import { NavOpen } from './Index';

@Component
export struct HomePage {
  @StorageLink(KEY_COURSES) coursesLink: Course[] = [];
  @StorageLink(KEY_POINT_TX) pointLink: PointTransaction[] = [];
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @StorageLink(KEY_MATERIALS) materialsLink: Material[] = [];
  onOpen: (req: NavOpen) => void = () => {};
  goToTab: (tab: TabId) => void = () => {};

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          this.Header()
          this.Reminders()
          this.TodayCourses()
          this.RecentPoints()
          Column().height(20)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 8, bottom: 120 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // Quick check-in FAB.
      Row() {
        SvgIcon({ variant: 'checkin-fab', iconSize: 26 })
      }
      .width(58)
      .height(58)
      .borderRadius(29)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .margin({ right: Theme.pageHorizontalPadding, bottom: Theme.bottomTabHeight + 26 })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('home-checkin-button')
      .onClick(() => this.onOpen({ target: 'points' }))
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header() {
    Column() {
      Text('手作·印记')
        .fontSize(Theme.fontPageTitle)
        .fontColor(Theme.textTitle)
        .margin({ top: 8, bottom: 4 })
      Text(ReminderService.todayLabel())
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textMuted)
        .id('home-today-date')
        .margin({ bottom: 18 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Reminders() {
    Row() {
      // Sleeping card.
      Column() {
        Text('沉睡会员')
          .fontSize(Theme.fontBody)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
        Text(`${ReminderService.sleepingCount()}`)
          .fontSize(Theme.fontBigNumberSmall)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textTitle)
          .id('home-sleeping-count')
          .margin({ top: 6 })
        Text('需要唤醒')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.textBody)
      }
      .layoutWeight(1)
      .padding(16)
      .borderRadius(Theme.radiusReminder)
      .linearGradient(BrandGradient.sleeping)
      .margin({ right: 6 })
      .alignItems(HorizontalAlign.Start)
      .id('home-sleeping-card')
      .onClick(() => this.onOpen({ target: 'members' }))

      // Low-stock card.
      Column() {
        Text('低库存物料')
          .fontSize(Theme.fontBody)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnBrand)
        Text(`${ReminderService.lowStockCount()}`)
          .fontSize(Theme.fontBigNumberSmall)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnBrand)
          .id('home-low-stock-count')
          .margin({ top: 6 })
        Text('待补货')
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.92)')
      }
      .layoutWeight(1)
      .padding(16)
      .borderRadius(Theme.radiusReminder)
      .linearGradient(BrandGradient.alert)
      .margin({ left: 6 })
      .alignItems(HorizontalAlign.Start)
      .id('home-low-stock-card')
      .onClick(() => this.onOpen({ target: 'inventory' }))
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  TodayCourses() {
    SectionHeader({ text: '今日课程', iconVariant: 'section-courses' })
    Column() {
      if (this.todayCourses().length === 0) {
        Text('今日暂无课程')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 24, bottom: 24 })
          .id('home-empty-today-courses')
      } else {
        ForEach(this.todayCourses(), (c: CourseRow) => {
          Row() {
            this.Avatar(c.title)
            Column() {
              Text(c.title)
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
              Text(`${c.timeLabel} · 余 ${Math.max(c.capacity - c.booked, 0)} 席`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .margin({ left: 14 })
            .alignItems(HorizontalAlign.Start)

            Text(c.isFull ? '已满' : '预约中')
              .fontSize(Theme.fontCaption)
              .fontWeight(FontWeight.Medium)
              .fontColor(c.isFull ? Theme.tagLowStockText : Theme.tagBlueText)
              .backgroundColor(c.isFull ? Theme.tagLowStockBg : Theme.tagBlueBg)
              .padding({ left: 10, right: 10, top: 5, bottom: 5 })
              .borderRadius(Theme.radiusChip)
          }
          .width('100%')
          .padding({ top: 14, bottom: 14 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`home-today-course-${c.id}`)
        }, (c: CourseRow) => c.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('home-today-course-list')
  }

  @Builder
  RecentPoints() {
    SectionHeader({ text: '积分动态', iconVariant: 'section-points' })
    Column() {
      if (this.recentPoints().length === 0) {
        Text('暂无积分动态')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 24, bottom: 24 })
          .id('home-empty-recent-points')
      } else {
        ForEach(this.recentPoints(), (p: PointRow) => {
          Row() {
            Column() {
              Text(this.pointTypeLabel(p.type, p.reason))
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
              Text(`${p.memberName} · ${TimeUtil.relativeDays(p.createdAt, TimeUtil.now())}`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)

            Text(`${p.amount >= 0 ? '+' : ''}${p.amount}`)
              .fontSize(Theme.fontCardTitle)
              .fontWeight(FontWeight.Bold)
              .fontColor(p.amount >= 0 ? Theme.success : Theme.brandPrimary)
          }
          .width('100%')
          .padding({ top: 14, bottom: 14 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`home-recent-point-${p.id}`)
        }, (p: PointRow) => p.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('home-recent-point-list')
  }

  @Builder
  Avatar(title: string) {
    Text(title.length > 0 ? title.charAt(0) : '手')
      .width(36)
      .height(36)
      .borderRadius(18)
      .fontSize(Theme.fontBody)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textOnBrand)
      .linearGradient(BrandGradient.primary)
      .textAlign(TextAlign.Center)
  }

  private todayCourses(): CourseRow[] {
    const today = TimeUtil.startOfDay(TimeUtil.now());
    return AppStore.get().courseRows(today);
  }

  private recentPoints(): PointRow[] {
    const all = AppStore.get().pointRows('', '');
    return all.slice(0, 4);
  }

  private pointTypeLabel(type: string, reason: string): string {
    if (reason.length > 0) {
      return reason;
    }
    if (type === 'checkin') {
      return '签到奖励';
    }
    if (type === 'earn') {
      return '积分增加';
    }
    if (type === 'spend') {
      return '积分消耗';
    }
    return '积分调整';
  }
}
