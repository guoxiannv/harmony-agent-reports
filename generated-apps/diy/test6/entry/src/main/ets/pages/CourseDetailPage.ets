// 手作·印记 — 课程详情 / CourseDetail surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionHeader } from '../components/Widgets';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Course, CourseMaterial, Booking, Member, Material, KEY_COURSES, KEY_BOOKINGS, KEY_MATERIALS } from '../common/Models';
import { TimeUtil } from '../common/Util';
import { NavOpen } from './Index';

interface MaterialLine {
  id: string;
  name: string;
  quantity: number;
  unit: string;
}
interface BookingLine {
  id: string;
  memberName: string;
  remark: string;
  status: string;
}

@Component
export struct CourseDetailPage {
  @Prop courseId: string;
  @StorageLink(KEY_COURSES) coursesLink: Course[] = [];
  @StorageLink(KEY_BOOKINGS) bookingsLink: Booking[] = [];
  @StorageLink(KEY_MATERIALS) materialsLink: Material[] = [];
  onOpen: (req: NavOpen) => void = () => {};
  onBack: () => void = () => {};

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        this.HeroCard()
        SectionHeader({ text: '消耗物料', iconVariant: 'section-courses' })
        this.MaterialList()
        SectionHeader({ text: '预约名单', iconVariant: 'tab-members' })
        this.BookingList()
        this.BottomActions()
        Column().height(40)
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  TopNav() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 22 })
      }
      .width(40)
      .height(40)
      .borderRadius(Theme.radiusPill)
      .backgroundColor('rgba(255,255,255,0.18)')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('course-detail-back-button')
      .onClick(() => this.onBack())

      Column().width(40)
      Row() {
        Text('删除')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.danger)
      }
      .width(56)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('course-detail-edit-button')
      .onClick(() => this.doDelete())
    }
    .width('100%')
    .padding({ top: 10, bottom: 6 })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  HeroCard() {
    Column() {
      Text(this.course()?.title ?? '')
        .fontSize(Theme.fontSection)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
        .id('course-detail-title')
        .margin({ bottom: 8 })
      Row() {
        Text(TimeUtil.dateTimeLabel(this.course()?.startAt ?? 0))
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textOnBrand)
          .id('course-detail-datetime')
          .layoutWeight(1)
      }
      Row() {
        Text(`容量 ${this.course()?.capacity ?? 0}`)
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.92)')
          .id('course-detail-capacity')
        Text('·')
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.7)')
          .margin({ left: 6, right: 6 })
        Text(`已预约 ${this.getActiveCount()}`)
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.92)')
        Text('·')
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.7)')
          .margin({ left: 6, right: 6 })
        Text(`¥${this.course()?.price ?? 0}`)
          .fontSize(Theme.fontCaption)
          .fontColor('rgba(255,255,255,0.92)')
      }
      .margin({ top: 8 })
    }
    .width('100%')
    .padding(20)
    .borderRadius(Theme.radiusCard)
    .linearGradient(BrandGradient.primary)
    .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  MaterialList() {
    Column() {
      if (this.materialLines().length === 0) {
        Text('未关联物料')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 18, bottom: 18 })
          .id('course-empty-materials')
      } else {
        ForEach(this.materialLines(), (ml: MaterialLine) => {
          Row() {
            Text(ml.name)
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textTitle)
              .layoutWeight(1)
            Text(`${ml.quantity} ${ml.unit}`)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.brandPrimary)
          }
          .width('100%')
          .padding({ top: 12, bottom: 12 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`course-material-${ml.id}`)
        }, (ml: MaterialLine) => ml.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
  }

  @Builder
  BookingList() {
    Column() {
      if (this.bookingLines().length === 0) {
        Text('暂无预约')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 18, bottom: 18 })
          .id('course-empty-bookings')
      } else {
        ForEach(this.bookingLines(), (bl: BookingLine) => {
          Row() {
            Text(bl.memberName.length > 0 ? bl.memberName.charAt(0) : '会')
              .width(32)
              .height(32)
              .borderRadius(16)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textOnBrand)
              .linearGradient(BrandGradient.primary)
              .textAlign(TextAlign.Center)
            Column() {
              Text(bl.memberName)
                .fontSize(Theme.fontBody)
                .fontColor(Theme.textTitle)
              if (bl.remark.length > 0) {
                Text(bl.remark)
                  .fontSize(Theme.fontCaption)
                  .fontColor(Theme.textMuted)
                  .margin({ top: 2 })
              }
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding({ top: 12, bottom: 12 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`course-booking-${bl.id}`)
        }, (bl: BookingLine) => bl.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('course-detail-booking-list')
  }

  @Builder
  BottomActions() {
    Row() {
      Column() {
        Text('取消课程')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.brandPrimary)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .backgroundColor(Color.Transparent)
      .border({ width: 1.5, color: Theme.brandSecondary })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('course-detail-cancel-button')
      .onClick(() => this.doCancelCourse())
      .margin({ right: 6 })

      Column() {
        Text(this.isFull() ? '已满员' : '预约会员')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textOnBrand)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('course-detail-book-button')
      .opacity(this.isFull() ? 0.5 : 1)
      .onClick(() => { if (!this.isFull()) { this.onOpen({ target: 'course-booking', courseId: this.courseId }); } })
      .margin({ left: 6 })
    }
    .width('100%')
    .margin({ top: 24 })
  }

  private course(): Course | null {
    return AppStore.get().getCourse(this.courseId);
  }

  private getActiveCount(): number {
    return AppStore.get().activeBookingsForCourse(this.courseId).length;
  }

  private isFull(): boolean {
    const c = this.course();
    return c !== null && this.getActiveCount() >= c.capacity;
  }

  private materialLines(): MaterialLine[] {
    const c = this.course();
    if (c === null) {
      return [];
    }
    const out: MaterialLine[] = [];
    for (let i = 0; i < c.materials.length; i++) {
      const cm: CourseMaterial = c.materials[i];
      const m: Material | null = AppStore.get().getMaterial(cm.materialId);
      out.push({
        id: cm.materialId,
        name: m !== null ? m.name : '已删除物料',
        quantity: cm.quantity,
        unit: m !== null ? m.unit : '',
      });
    }
    return out;
  }

  private bookingLines(): BookingLine[] {
    const list: Booking[] = AppStore.get().activeBookingsForCourse(this.courseId);
    const out: BookingLine[] = [];
    for (let i = 0; i < list.length; i++) {
      const b = list[i];
      const mem: Member | null = AppStore.get().getMember(b.memberId);
      out.push({
        id: b.id,
        memberName: mem !== null ? mem.name : '已删除会员',
        remark: b.remark,
        status: b.status,
      });
    }
    return out;
  }

  private doCancelCourse(): void {
    Ui.confirm('取消课程', '将取消所有预约并归还物料库存。', () => {
      AppStore.get().cancelCourseBookingsForCourse(this.courseId);
      Ui.toast('已取消全部预约');
    });
  }

  private doDelete(): void {
    Ui.confirm('删除课程', '删除课程将取消其全部预约并归还库存。', () => {
      AppStore.get().deleteCourse(this.courseId);
      Ui.toast('已删除课程');
      this.onBack();
    });
  }
}
