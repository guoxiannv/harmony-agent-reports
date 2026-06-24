import { AppController } from '../viewmodel/AppController';
import { Course, Booking, CourseMaterial, Member, InventoryItem } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct CourseDetailPage {
  @ObjectLink ctrl: AppController;
  @Prop courseId: string;
  onBack: () => void = () => {};
  onEdit: () => void = () => {};
  @State showBook: boolean = false;
  @State bookMemberId: string = '';

  private get course(): Course | undefined {
    return this.ctrl.getCourseById(this.courseId);
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Button() {
            SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary })
          }
          .width(40)
          .height(40)
          .backgroundColor(Color.Transparent)
          .onClick(() => this.onBack())

          Text('课程详情')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)

          Button('编辑')
            .id('course-detail-edit-button')
            .fontSize(14)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .onClick(() => this.onEdit())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        if (this.course) {
          this.InfoCard(this.course)
          this.StudentSection()
          this.MaterialSection()
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .bindSheet(
      this.showBook,
      this.BookSheet(),
      {
        height: SheetSize.FIT_CONTENT,
        onWillDisappear: () => this.showBook = false,
      }
    )
  }

  @Builder
  InfoCard(course: Course) {
    Column({ space: 8 }) {
      Text(course.title)
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text(`${this.formatDate(course.startTime)} ${this.formatTime(course.startTime)} · ${course.teacher}`)
        .fontSize(Theme.bodySize)
        .fontColor(Theme.textTertiary)
        .width('100%')
      Text(`${this.confirmedCount()}/${course.capacity} 人已报名`)
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textQuaternary)
        .width('100%')

      if (course.status !== 'completed') {
        Row({ space: 12 }) {
          Button('预约')
            .id('course-detail-book-button')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnAccent)
            .backgroundColor(Theme.terracotta)
            .borderRadius(999)
            .onClick(() => {
              this.bookMemberId = '';
              this.showBook = true;
            })

          Button('扣减材料')
            .id('course-detail-deduct-button')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .border({ width: 1.5, color: Theme.terracotta })
            .borderRadius(999)
            .onClick(() => this.deduct())
        }
        .width('100%')
        .margin({ top: 12 })
      } else {
        Text('课程已完成，材料已扣减')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.celadon)
          .padding({ top: 8 })
          .width('100%')
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 12, color: Theme.shadowNear })
    .margin({ bottom: 16 })
  }

  @Builder
  StudentSection() {
    Column({ space: 10 }) {
      Row() {
        Text('报名学员')
          .fontSize(Theme.sectionTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Blank()
      }
      .width('100%')

      if (this.students().length === 0) {
        Column({ space: 6 }) {
          Text('暂无学员报名')
            .fontSize(Theme.cardTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Text('点击上方预约按钮添加学员')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .id('course-students-empty')
        .width('100%')
        .padding({ top: 40, bottom: 40 })
        .alignItems(HorizontalAlign.Center)
      } else {
        List({ space: 0 }) {
          ForEach(this.students(), (b: Booking) => {
            ListItem() {
              Row({ space: 12 }) {
                SvgIcon({ variant: 'user', iconSize: 18, color: Theme.clayGray })
                Text(this.ctrl.memberName(b.memberId))
                  .fontSize(Theme.bodySize)
                  .fontColor(Theme.textPrimary)
                  .layoutWeight(1)
                Text(b.status === 'completed' ? '已完成' : '已报名')
                  .fontSize(11)
                  .fontColor(b.status === 'completed' ? Theme.celadon : Theme.cobalt)
              }
              .width('100%')
              .padding({ top: 12, bottom: 12 })
              .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })
            }
            .id(`course-student-${b.id}`)
          }, (b: Booking) => b.id)
        }
        .id('course-detail-student-list')
        .width('100%')
        .scrollBar(BarState.Off)
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .margin({ bottom: 16 })
  }

  @Builder
  MaterialSection() {
    Column({ space: 10 }) {
      Row() {
        Text('材料清单')
          .fontSize(Theme.sectionTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Blank()
      }
      .width('100%')

      if (this.course?.materials.length === 0) {
        Column({ space: 6 }) {
          Text('未配置材料')
            .fontSize(Theme.cardTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Text('编辑课程可添加消耗材料')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .id('course-materials-empty')
        .width('100%')
        .padding({ top: 40, bottom: 40 })
        .alignItems(HorizontalAlign.Center)
      } else {
        List({ space: 0 }) {
          ForEach(this.course?.materials ?? [], (mat: CourseMaterial) => {
            ListItem() {
              Row({ space: 12 }) {
                SvgIcon({ variant: 'package', iconSize: 18, color: Theme.clayGray })
                Text(mat.name)
                  .fontSize(Theme.bodySize)
                  .fontColor(Theme.textPrimary)
                  .layoutWeight(1)
                Text(`${mat.quantityPerStudent}${mat.unit}/人`)
                  .fontSize(Theme.captionSize)
                  .fontColor(Theme.textTertiary)
              }
              .width('100%')
              .padding({ top: 12, bottom: 12 })
              .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })
            }
            .id(`course-material-${mat.itemId}`)
          }, (mat: CourseMaterial) => mat.itemId)
        }
        .id('course-detail-material-list')
        .width('100%')
        .scrollBar(BarState.Off)
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
  }

  @Builder
  BookSheet() {
    Column({ space: 16 }) {
      Text('预约课程')
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      TextInput({ placeholder: '输入会员ID', text: this.bookMemberId })
        .width('100%')
        .height(48)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusSmall)
        .placeholderColor(Theme.textPlaceholder)
        .fontSize(Theme.bodySize)
        .padding({ left: 16, right: 16 })
        .onChange((value: string) => this.bookMemberId = value)

      Button('确认预约')
        .width('100%')
        .height(48)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnAccent)
        .backgroundColor(Theme.terracotta)
        .borderRadius(999)
        .onClick(async () => {
          if (!this.bookMemberId) {
            promptAction.showToast({ message: '请选择会员' });
            return;
          }
          const result: 'ok' | 'full' | 'exists' = await this.ctrl.bookCourse(this.courseId, this.bookMemberId);
          if (result === 'ok') {
            promptAction.showToast({ message: '预约成功' });
            this.showBook = false;
          } else if (result === 'full') {
            promptAction.showToast({ message: '课程名额已满' });
          } else {
            promptAction.showToast({ message: '该会员已预约' });
          }
        })
    }
    .width('100%')
    .padding(24)
  }

  private async deduct(): Promise<void> {
    await this.ctrl.deductCourseMaterials(this.courseId);
    promptAction.showToast({ message: '材料已扣减' });
  }

  private students(): Booking[] {
    return this.ctrl.bookingsForCourse(this.courseId);
  }

  private confirmedCount(): number {
    return this.students().filter((b: Booking) => b.status === 'confirmed').length;
  }

  private formatDate(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getMonth() + 1}月${d.getDate()}日`;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getHours().toString().padStart(2, '0')}:${d.getMinutes().toString().padStart(2, '0')}`;
  }
}
