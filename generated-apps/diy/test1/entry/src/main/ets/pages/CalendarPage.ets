import { AppController } from '../viewmodel/AppController';
import { Course, Booking } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct CalendarPage {
  @ObjectLink ctrl: AppController;
  onAddCourse: () => void = () => {};
  onCourseDetail: (id: string) => void = () => {};
  @State viewMode: string = 'day';
  @State currentDay: number = Date.now();

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Text('课程日历')
          .fontSize(Theme.pageTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Button() {
          SvgIcon({ variant: 'plus', iconSize: 20, color: Theme.cardBg })
        }
        .id('calendar-add-course-button')
        .width(40)
        .height(40)
        .backgroundColor(Theme.terracotta)
        .borderRadius(20)
        .shadow({ radius: 12, color: 'rgba(198,123,92,0.32)' })
        .onClick(() => this.onAddCourse())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 12 })

      // Controls
      Row({ space: 10 }) {
        Button() {
          SvgIcon({ variant: 'back', iconSize: 18, color: Theme.textSecondary })
        }
        .id('calendar-prev-button')
        .width(36)
        .height(36)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderDefault })
        .borderRadius(18)
        .onClick(() => this.shiftDay(-1))

        Column() {
          Text(this.formatDate(this.currentDay))
            .fontSize(Theme.bodySize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)

        Button() {
          SvgIcon({ variant: 'back', iconSize: 18, color: Theme.textSecondary })
        }
        .id('calendar-next-button')
        .width(36)
        .height(36)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderDefault })
        .borderRadius(18)
        .onClick(() => this.shiftDay(1))

        Button('今天')
          .id('calendar-today-button')
          .width(56)
          .height(36)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.terracotta)
          .backgroundColor(Color.Transparent)
          .border({ width: 1.5, color: Theme.terracotta })
          .borderRadius(999)
          .onClick(() => this.currentDay = Date.now())
      }
      .width('100%')
      .margin({ bottom: 12 })

      // View switch
      Row({ space: 8 }) {
        this.ViewChip('day', '日')
        this.ViewChip('week', '周')
        this.ViewChip('month', '月')
      }
      .id('calendar-view-switch')
      .width('100%')
      .margin({ bottom: 16 })

      // Course list
      List({ space: 12 }) {
        if (this.courses().length === 0) {
          ListItem() {
            this.EmptyState()
          }
          .id('calendar-empty-state')
        } else {
          ForEach(this.courses(), (course: Course) => {
            ListItem() {
              this.CourseCard(course)
            }
            .id(`calendar-course-${course.id}`)
            .onClick(() => this.onCourseDetail(course.id))
          }, (course: Course) => course.id)
        }
      }
      .id('calendar-course-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  ViewChip(mode: string, label: string) {
    Text(label)
      .fontSize(13)
      .fontWeight(FontWeight.Bold)
      .fontColor(this.viewMode === mode ? Theme.textOnAccent : Theme.textSecondary)
      .padding({ left: 18, right: 18, top: 6, bottom: 6 })
      .backgroundColor(this.viewMode === mode ? Theme.terracotta : Theme.chipSoftBg)
      .borderRadius(999)
      .onClick(() => this.viewMode = mode)
  }

  @Builder
  CourseCard(course: Course) {
    Row({ space: 14 }) {
      Column({ space: 2 }) {
        Text(this.formatTime(course.startTime))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.terracotta)
        Text(this.formatAmPm(course.startTime))
          .fontSize(11)
          .fontColor(Theme.textTertiary)
      }
      .width(56)
      .padding({ top: 10, bottom: 10 })
      .backgroundColor(Theme.ricePaper)
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column({ space: 4 }) {
        Text(course.title)
          .fontSize(Theme.cardTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(`${this.confirmedCount(course.id)}/${course.capacity} 人已报名 · ${course.teacher}`)
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
        Text(course.status === 'completed' ? '已完成' : '进行中')
          .fontSize(11)
          .fontColor(course.status === 'completed' ? Theme.celadon : Theme.cobalt)
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor(course.status === 'completed' ? 'rgba(168,181,160,0.12)' : 'rgba(90,111,124,0.10)')
          .borderRadius(8)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 10, color: Theme.shadowNear })
  }

  @Builder
  EmptyState() {
    Column({ space: 8 }) {
      Text('今日暂无课程')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('点击右上角添加课程')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .width('100%')
    .padding({ top: 80, bottom: 80 })
    .alignItems(HorizontalAlign.Center)
  }

  private courses(): Course[] {
    return this.ctrl.coursesForDay(this.currentDay);
  }

  private confirmedCount(courseId: string): number {
    return this.ctrl.bookingsForCourse(courseId).filter((b: Booking) => b.status === 'confirmed').length;
  }

  private shiftDay(delta: number): void {
    const d: Date = new Date(this.currentDay);
    d.setDate(d.getDate() + delta);
    this.currentDay = d.getTime();
  }

  private formatDate(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getMonth() + 1}月${d.getDate()}日`;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getHours().toString().padStart(2, '0')}:${d.getMinutes().toString().padStart(2, '0')}`;
  }

  private formatAmPm(ts: number): string {
    const h: number = new Date(ts).getHours();
    return h < 12 ? '上午' : '下午';
  }
}
