import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { DateUtil } from '../utils/AppUtils';
import { LessonBooking } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct CalendarPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBooking: () => void = () => {};

  @State displayMonth: Date = new Date();
  @State selectedDate: string = DateUtil.today();

  build() {
    Column() {
      this.Header('课程日历')

      Scroll() {
        Column({ space: 16 }) {
          Row() {
            Button({ type: ButtonType.Circle }) {
              Text('<')
                .fontSize(18)
                .fontColor(Theme.textPrimary)
            }
            .id('calendar-prev-month')
            .width(36)
            .height(36)
            .backgroundColor(Theme.cardBg)
            .onClick(() => this.prevMonth())

            Text(DateUtil.monthLabel(this.displayMonth))
              .id('calendar-month-title')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)

            Button({ type: ButtonType.Circle }) {
              Text('>')
                .fontSize(18)
                .fontColor(Theme.textPrimary)
            }
            .id('calendar-next-month')
            .width(36)
            .height(36)
            .backgroundColor(Theme.cardBg)
            .onClick(() => this.nextMonth())
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Grid() {
            ForEach(this.days(), (day: CalendarDay) => {
              GridItem() {
                Column() {
                  Text(`${day.dayOfMonth}`)
                    .fontSize(14)
                    .fontWeight(day.isSelected ? FontWeight.Bold : FontWeight.Medium)
                    .fontColor(day.isCurrentMonth ? Theme.textPrimary : Theme.textTertiary)
                }
                .width('100%')
                .height(44)
                .borderRadius(Theme.radiusSmall)
                .backgroundColor(day.isSelected ? Theme.brandSoft : Color.Transparent)
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              }
              .id(`calendar-day-${day.date}`)
              .onClick(() => this.selectDate(day.date))
            }, (day: CalendarDay) => day.date)
          }
          .id('calendar-grid')
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
          .columnsGap(4)
          .rowsGap(4)
          .width('100%')

          Row() {
            Text(`已选日期：${this.selectedDate}`)
              .fontSize(14)
              .fontColor(Theme.textSecondary)
            Button('预约课程', { type: ButtonType.Normal })
              .id('calendar-book-button')
              .height(36)
              .borderRadius(12)
              .backgroundColor(Theme.brandPrimary)
              .fontColor(Theme.textOnBrand)
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .padding({ left: 14, right: 14 })
              .onClick(() => this.onBooking())
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Column({ space: 0 }) {
            ForEach(this.selectedDayLessons(), (b: LessonBooking, index: number) => {
              this.LessonItem(b, index)
            }, (b: LessonBooking) => b.id)
          }
          .id('calendar-selected-day-lessons')
          .width('100%')
          .padding({ top: 8, bottom: 8 })
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.selectedDayLessons().length === 0) {
            Column({ space: 8 }) {
              Text('当日暂无课程')
                .id('calendar-day-empty')
                .fontSize(14)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(24)
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

  @Builder
  Header(title: string) {
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

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  LessonItem(b: LessonBooking, index: number) {
    Row() {
      Column({ space: 4 }) {
        Text(this.courseTitle(b.courseId))
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(`${b.timeSlot} · ${this.memberName(b.memberId)}`)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)

      Button('取消', { type: ButtonType.Normal })
        .height(32)
        .borderRadius(10)
        .backgroundColor(Theme.alertSoft)
        .fontColor(Theme.alert)
        .fontSize(13)
        .padding({ left: 12, right: 12 })
        .onClick(() => this.ctrl.cancelBooking(b.id).then(() => {
          promptAction.showToast({ message: '已取消预约' });
        }))
    }
    .id(`calendar-lesson-${b.id}`)
    .width('100%')
    .padding(16)
    .border({ width: { bottom: index < this.selectedDayLessons().length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  private courseTitle(id: string): string {
    return this.state.courses.find(c => c.id === id)?.title ?? '课程';
  }

  private memberName(id: string): string {
    return this.state.members.find(m => m.id === id)?.name ?? '会员';
  }

  private prevMonth(): void {
    this.displayMonth = new Date(this.displayMonth.getFullYear(), this.displayMonth.getMonth() - 1, 1);
  }

  private nextMonth(): void {
    this.displayMonth = new Date(this.displayMonth.getFullYear(), this.displayMonth.getMonth() + 1, 1);
  }

  private selectDate(date: string): void {
    this.selectedDate = date;
  }

  private days(): CalendarDay[] {
    const year = this.displayMonth.getFullYear();
    const month = this.displayMonth.getMonth();
    const firstDay = new Date(year, month, 1).getDay();
    const total = new Date(year, month + 1, 0).getDate();
    const days: CalendarDay[] = [];
    const prevTotal = new Date(year, month, 0).getDate();
    for (let i = firstDay - 1; i >= 0; i--) {
      const d = prevTotal - i;
      days.push({ date: `${year}-${String(month).padStart(2, '0')}-${String(d).padStart(2, '0')}`, dayOfMonth: d, isCurrentMonth: false, isSelected: false });
    }
    for (let i = 1; i <= total; i++) {
      const ds = `${year}-${String(month + 1).padStart(2, '0')}-${String(i).padStart(2, '0')}`;
      days.push({ date: ds, dayOfMonth: i, isCurrentMonth: true, isSelected: ds === this.selectedDate });
    }
    const remainder = (7 - (days.length % 7)) % 7;
    for (let i = 1; i <= remainder; i++) {
      days.push({ date: `${year}-${String(month + 2).padStart(2, '0')}-${String(i).padStart(2, '0')}`, dayOfMonth: i, isCurrentMonth: false, isSelected: false });
    }
    return days;
  }

  private selectedDayLessons(): LessonBooking[] {
    return this.state.bookingsForDate(this.selectedDate);
  }
}

export class CalendarDay {
  date: string = '';
  dayOfMonth: number = 0;
  isCurrentMonth: boolean = false;
  isSelected: boolean = false;
}
