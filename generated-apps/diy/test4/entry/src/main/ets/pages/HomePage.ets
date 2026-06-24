import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { DateUtil } from '../utils/AppUtils';

@Component
export struct HomePage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onPoints: () => void = () => {};
  onBooking: () => void = () => {};
  onDormant: () => void = () => {};
  onInventory: () => void = () => {};

  build() {
    Column({ space: 16 }) {
      Stack({ alignContent: Alignment.Center }) {
        Column()
          .width('100%')
          .height(56)
          .linearGradient({
            angle: 180,
            direction: GradientDirection.Bottom,
            colors: [[Theme.headerGradientStart, 0.0], [Theme.headerGradientEnd, 1.0]]
          })
          .borderRadius({ bottomLeft: 28, bottomRight: 28 })

        Text('手作·印记')
          .id('home-header-title')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnBrand)
      }
      .width('100%')
      .height(56)

      Scroll() {
        Column({ space: 16 }) {
          Row() {
            Column({ space: 6 }) {
              Text('今日到店')
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnBrand)
              Text('签到即可 +5 积分，记录你的手作时光')
                .fontSize(13)
                .fontColor(Theme.textOnBrand)
                .opacity(0.92)
            }
            .alignItems(HorizontalAlign.Start)

            Button('签到', { type: ButtonType.Normal })
              .id('home-checkin-button')
              .height(48)
              .borderRadius(Theme.radiusButton)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.brandPrimary)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .padding({ left: 24, right: 24 })
              .onClick(() => this.ctrl.checkinCurrent())
          }
          .width('100%')
          .height(96)
          .padding(20)
          .borderRadius(Theme.radiusCard)
          .linearGradient({
            angle: 135,
            direction: GradientDirection.RightTop,
            colors: [[Theme.brandPrimary, 0.0], [Theme.brandDark, 1.0]]
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Row() {
            Column({ space: 4 }) {
              Text('当前积分')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
              Text(`${this.currentPoints()}`)
                .id('points-balance')
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.brandPrimary)
            }
            .alignItems(HorizontalAlign.Start)

            Column()
              .id('home-points-detail-link')
              .width(40)
              .height(40)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.brandSoft)
              .onClick(() => this.onPoints())
          }
          .id('home-points-card')
          .width('100%')
          .padding(20)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Column({ space: 12 }) {
            Row({ space: 8 }) {
              CalendarIcon({ iconSize: 20, color: Theme.brandPrimary })
              Text('待上课程')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
            }
            .width('100%')

            UpcomingLessonRow({ state: this.state })

            Button('预约课程', { type: ButtonType.Normal })
              .id('home-book-lesson-button')
              .height(40)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.brandLight)
              .fontColor(Theme.textOnBrand)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .padding({ left: 18, right: 18 })
              .onClick(() => this.onBooking())
          }
          .id('home-upcoming-lesson-card')
          .width('100%')
          .padding(20)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .alignItems(HorizontalAlign.Start)

          Column({ space: 12 }) {
            MenuRow({
              rowId: 'home-dormant-link',
              title: '沉睡提醒',
              badge: `${this.state.dormantMembers().length}`,
              onTap: () => this.onDormant(),
              iconColor: Theme.alert,
            })
            MenuRow({
              rowId: 'home-inventory-link',
              title: '库存管理',
              badge: '',
              onTap: () => this.onInventory(),
              iconColor: Theme.success,
            })
          }
          .width('100%')

          if (this.isEmpty()) {
            Column({ space: 12 }) {
              Text('还没有记录')
                .id('home-empty-state')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Text('签到或预约第一节课程，开启你的手作之旅')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(32)
            .borderRadius(Theme.radiusCard)
            .backgroundColor(Theme.cardBg)
          }
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  private currentPoints(): number {
    const m = this.state.currentMember();
    return m ? m.points : 0;
  }

  private isEmpty(): boolean {
    return this.state.members.length === 0 && this.state.bookings.length === 0;
  }
}

export class UpcomingLessonInfo {
  courseTitle: string = '';
  date: string = '';
  timeSlot: string = '';
}

@Component
struct UpcomingLessonRow {
  @ObjectLink state: AppState;

  build() {
    if (this.upcomingLesson()) {
      Row({ space: 12 }) {
        Column() {
          PotteryIcon({ iconSize: 24, color: Theme.brandDark })
        }
        .width(48)
        .height(48)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.brandSoft)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Column({ space: 4 }) {
          Text(this.upcomingLesson()?.courseTitle ?? '')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Text(`${this.upcomingLesson()?.date ?? ''} ${this.upcomingLesson()?.timeSlot ?? ''}`)
            .fontSize(13)
            .fontColor(Theme.textSecondary)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
    } else {
      Text('暂无待上课程')
        .fontSize(14)
        .fontColor(Theme.textSecondary)
    }
  }

  private upcomingLesson(): UpcomingLessonInfo | null {
    const today = DateUtil.today();
    const list = this.state.bookings
      .filter(b => b.status === 'confirmed' && b.date >= today)
      .sort((a, b) => (a.date > b.date ? 1 : -1));
    const first = list[0];
    if (!first) return null;
    const course = this.state.courses.find(c => c.id === first.courseId);
    const info = new UpcomingLessonInfo();
    info.courseTitle = course?.title ?? '课程';
    info.date = first.date;
    info.timeSlot = first.timeSlot;
    return info;
  }
}

@Component
struct CalendarIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = Theme.brandPrimary;

  build() {
    Stack() {
      Path()
        .commands('M3 4 h18 a2 2 0 0 1 2 2 v14 a2 2 0 0 1 -2 2 H3 a2 2 0 0 1 -2 -2 V6 a2 2 0 0 1 2 -2 z')
        .stroke(this.color)
        .strokeWidth(2)
        .fill(Color.Transparent)
      Path()
        .commands('M16 2 v4 M8 2 v4 M3 10 h18')
        .stroke(this.color)
        .strokeWidth(2)
        .fill(Color.Transparent)
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }
}

@Component
struct PotteryIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = Theme.brandDark;

  build() {
    Path()
      .commands('M12 21c4.97 0 9-4.03 9-9-2.5 0-3-1.5-3-3 0-2-1.5-3-3-3s-3 1-3 3c0 1.5-.5 3-3 3 0 4.97 4.03 9 9 9z')
      .stroke(this.color)
      .strokeWidth(2)
      .fill(Color.Transparent)
      .width(this.iconSize)
      .height(this.iconSize)
  }
}

@Component
struct MenuRow {
  @Prop rowId: string = '';
  @Prop title: string = '';
  @Prop badge: string = '';
  @Prop iconColor: string = Theme.brandPrimary;
  onTap: () => void = () => {};

  build() {
    Row() {
      Row({ space: 12 }) {
        Column() {
          AlertIcon({ iconSize: 22, color: this.iconColor })
        }
        .width(40)
        .height(40)
        .borderRadius(Theme.radiusTiny)
        .backgroundColor(Theme.brandSoft)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Row({ space: 8 }) {
          Text(this.title)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          if (this.badge.length > 0) {
            Text(this.badge)
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnBrand)
              .backgroundColor(Theme.alert)
              .padding({ left: 8, right: 8, top: 2, bottom: 2 })
              .borderRadius(10)
          }
        }
      }

      Text('>')
        .fontSize(16)
        .fontColor(Theme.textSecondary)
    }
    .id(this.rowId)
    .width('100%')
    .height(64)
    .padding(16)
    .borderRadius(18)
    .backgroundColor(Theme.cardBg)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .onClick(() => this.onTap())
  }
}

@Component
struct AlertIcon {
  @Prop iconSize: number = 22;
  @Prop color: string = Theme.alert;

  build() {
    Path()
      .commands('M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0zM12 9v4')
      .stroke(this.color)
      .strokeWidth(2)
      .fill(Color.Transparent)
      .width(this.iconSize)
      .height(this.iconSize)
  }
}
