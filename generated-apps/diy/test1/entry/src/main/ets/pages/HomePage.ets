import { AppController } from '../viewmodel/AppController';
import { Course, Member } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct HomePage {
  @ObjectLink ctrl: AppController;
  onCheckin: () => void = () => {};
  onAddMember: () => void = () => {};
  onBookCourse: () => void = () => {};
  onInventory: () => void = () => {};
  onDormantList: () => void = () => {};
  onCourseDetail: (id: string) => void = () => {};

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Text('手作·印记')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Button() {
            SvgIcon({ variant: 'checkin', iconSize: 20, color: Theme.terracotta })
          }
          .id('home-checkin-button')
          .width(40)
          .height(40)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderDefault })
          .borderRadius(20)
          .shadow({ radius: 8, color: Theme.shadowNear })
          .onClick(() => this.onCheckin())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        // Hero card
        Column({ space: 6 }) {
          Text('今日工坊')
            .fontSize(Theme.heroSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Text(this.heroSub())
            .fontSize(Theme.bodySize)
            .fontColor(Theme.textTertiary)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding(22)
        .linearGradient({
          angle: 145,
          direction: GradientDirection.RightBottom,
          colors: [['#FFFDF9', 0.0], ['#F8F1E9', 0.55], ['#F0E6DA', 1.0]],
        })
        .border({ width: 1, color: Theme.borderDefault })
        .borderRadius(Theme.radiusHero)
        .shadow({ radius: 24, color: Theme.shadowFar, offsetX: 0, offsetY: 8 })
        .margin({ bottom: 20 })

        // Quick actions
        Row({ space: 12 }) {
          this.QuickButton('home-quick-add-member', 'members', '新增会员', () => this.onAddMember())
          this.QuickButton('home-quick-book-course', 'calendar', '预约课程', () => this.onBookCourse())
          this.QuickButton('home-quick-inventory', 'inventory', '库存', () => this.onInventory())
        }
        .width('100%')
        .margin({ bottom: 20 })

        // Dormant alert
        if (this.dormantCount() > 0) {
          Row({ space: 14 }) {
            Column() {
              SvgIcon({ variant: 'alert', iconSize: 22, color: Theme.rust })
            }
            .width(44)
            .height(44)
            .backgroundColor('rgba(160,82,45,0.12)')
            .borderRadius(14)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)

            Column({ space: 4 }) {
              Text('沉睡会员提醒')
                .fontSize(Theme.cardTitleSize)
                .fontColor(Theme.textPrimary)
                .fontWeight(FontWeight.Bold)
              Text(`超过 ${this.ctrl.settings.dormantThresholdDays} 天未到店的会员：${this.dormantCount()} 人`)
                .fontSize(Theme.captionSize)
                .fontColor(Theme.textTertiary)
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)
          }
          .id('home-dormant-alert-card')
          .width('100%')
          .padding(16)
          .backgroundColor('rgba(160,82,45,0.08)')
          .border({ width: { left: 4, top: 1, right: 1, bottom: 1 }, color: { left: Theme.rust, top: 'rgba(160,82,45,0.20)', right: 'rgba(160,82,45,0.20)', bottom: 'rgba(160,82,45,0.20)' } })
          .borderRadius(18)
          .onClick(() => this.onDormantList())
          .margin({ bottom: 20 })
        }

        // Today's courses
        Row() {
          Text('今日课程')
            .fontSize(Theme.sectionTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Blank()
        }
        .width('100%')
        .margin({ bottom: 14 })

        Column({ space: 12 }) {
          if (this.todayCourses().length === 0) {
            this.EmptyToday()
          } else {
            ForEach(this.todayCourses(), (course: Course) => {
              this.CourseRow(course)
            }, (course: Course) => course.id)
          }
        }
        .id('home-today-course-list')
        .width('100%')
        .padding({ bottom: 24 })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }

  @Builder
  QuickButton(id: string, icon: string, label: string, onTap: () => void) {
    Column({ space: 8 }) {
      Column() {
        SvgIcon({ variant: icon, iconSize: 20, color: Theme.terracotta })
      }
      .width(36)
      .height(36)
      .backgroundColor('rgba(198,123,92,0.10)')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      Text(label)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
    }
    .id(id)
    .layoutWeight(1)
    .padding({ top: 16, bottom: 16 })
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(18)
    .shadow({ radius: 12, color: Theme.shadowNear })
    .onClick(onTap)
  }

  @Builder
  CourseRow(course: Course) {
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
        Text(`${this.confirmedCount(course.id)} 人已报名 · 老师：${course.teacher}`)
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .id(`home-today-course-${course.id}`)
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(18)
    .shadow({ radius: 10, color: Theme.shadowNear })
    .onClick(() => this.onCourseDetail(course.id))
  }

  @Builder
  EmptyToday() {
    Column({ space: 8 }) {
      Text('今日暂无课程')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('去课程日历添加一节手作课吧')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .id('home-today-empty')
    .width('100%')
    .padding({ top: 40, bottom: 40 })
    .alignItems(HorizontalAlign.Center)
  }

  private heroSub(): string {
    const courses: number = this.todayCourses().length;
    const dormant: number = this.dormantCount();
    return `有 ${courses} 位会员预约了课程，${dormant} 位沉睡会员等待唤醒。`;
  }

  private todayCourses(): Course[] {
    return this.ctrl.coursesForDay(Date.now());
  }

  private dormantCount(): number {
    return this.ctrl.dormantMembers().length;
  }

  private confirmedCount(courseId: string): number {
    return this.ctrl.bookingsForCourse(courseId).filter((b) => b.status === 'confirmed').length;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const h: number = d.getHours();
    const m: number = d.getMinutes();
    return `${h.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}`;
  }

  private formatAmPm(ts: number): string {
    const h: number = new Date(ts).getHours();
    return h < 12 ? '上午' : '下午';
  }
}
