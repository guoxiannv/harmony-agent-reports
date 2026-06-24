import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Course, Material, Member, Reservation } from '../model/Models';
import promptAction from '@ohos.promptAction';

interface MemberOption {
  id: string;
  label: string;
}

@Component
export struct CourseDetailPage {
  courseId: string = '';
  onBack: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private course: Course | null = null;
  @State private materials: Material[] = [];
  @State private reservations: Reservation[] = [];
  @State private memberCache: Record<string, Member> = {};
  @State private bookedCount: number = 0;
  @State private isReady: boolean = false;
  @State private pickerOpen: boolean = false;
  @State private memberOptions: MemberOption[] = [];

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    await this.refresh();
  }

  private async refresh(): Promise<void> {
    if (!this.controller || !this.courseId) {
      this.isReady = true;
      return;
    }
    const c: Course | undefined = await this.controller.getCourse(this.courseId);
    const reservationList: Reservation[] = await this.controller.listReservationsByCourse(this.courseId);

    const mats: Material[] = [];
    for (const ref of c?.materials ?? []) {
      if (ref.materialId) {
        const m: Material | undefined = await this.controller.getMaterial(ref.materialId);
        if (m) {
          mats.push(m);
        }
      }
    }

    const memberCache: Record<string, Member> = this.memberCache;
    let active = 0;
    for (const r of reservationList) {
      if (r.status === 'booked') {
        active += 1;
      }
      if (r.memberId && !memberCache[r.memberId]) {
        const m: Member | undefined = await this.controller.getMember(r.memberId);
        if (m) {
          memberCache[r.memberId] = m;
        }
      }
    }

    this.course = c ?? null;
    this.reservations = reservationList;
    this.materials = mats;
    this.memberCache = memberCache;
    this.bookedCount = active;
    this.isReady = true;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const yyyy: number = d.getFullYear();
    const mm: string = (d.getMonth() + 1).toString().padStart(2, '0');
    const dd: string = d.getDate().toString().padStart(2, '0');
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mi: string = d.getMinutes().toString().padStart(2, '0');
    return `${yyyy}-${mm}-${dd} ${hh}:${mi}`;
  }

  private capacityText(): string {
    const c = this.course;
    if (!c) {
      return '—';
    }
    return `${this.bookedCount}/${c.capacity}`;
  }

  private materialQuantity(materialId: string): number {
    const c = this.course;
    if (!c) {
      return 0;
    }
    for (const ref of c.materials) {
      if (ref.materialId === materialId) {
        return ref.quantity;
      }
    }
    return 0;
  }

  private materialStockStatus(m: Material): string {
    const need: number = this.materialQuantity(m.id);
    if (m.stock < m.safetyStock) {
      return `库存 ${m.stock}（低于安全库存 ${m.safetyStock}）`;
    }
    return `库存 ${m.stock}，本课需 ${need}`;
  }

  private materialStockColor(m: Material): string {
    if (m.stock < m.safetyStock) {
      return Theme.ochre;
    }
    return Theme.textSecondary;
  }

  private memberName(memberId: string): string {
    const m: Member | undefined = this.memberCache[memberId];
    return m && m.name ? m.name : '未知会员';
  }

  private async openBookDialog(): Promise<void> {
    if (!this.controller) {
      return;
    }
    const all: Member[] = await this.controller.listMembers();
    const opts: MemberOption[] = [];
    for (const m of all) {
      opts.push({ id: m.id, label: `${m.name || '未命名'}（${m.points} 积分）` });
    }
    if (opts.length === 0) {
      promptAction.showToast({ message: '暂无可选会员，请先添加会员', duration: 2000 });
      return;
    }
    this.memberOptions = opts;
    this.pickerOpen = true;
  }

  private closeBookDialog(): void {
    this.pickerOpen = false;
  }

  private async onPickMember(memberId: string): Promise<void> {
    if (!this.controller || !this.course) {
      this.pickerOpen = false;
      return;
    }
    this.pickerOpen = false;
    const result = await this.controller.bookCourse(this.course.id, memberId);
    if (result.success) {
      promptAction.showToast({ message: '预约成功', duration: 2000 });
      await this.refresh();
    } else {
      promptAction.showToast({ message: result.message ?? '预约失败', duration: 2500 });
    }
  }

  private async onCancelReservation(reservationId: string): Promise<void> {
    if (!this.controller) {
      return;
    }
    const result = await this.controller.cancelReservation(reservationId);
    if (result.success) {
      promptAction.showToast({ message: '已取消预约', duration: 2000 });
      await this.refresh();
    } else {
      promptAction.showToast({ message: result.message ?? '取消失败', duration: 2500 });
    }
  }

  build(): void {
    Stack({ alignContent: Alignment.Center }) {
      Column() {
        this.HeaderBar()
        if (!this.isReady) {
          Text('加载中…')
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .padding({ top: 80 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else if (!this.course) {
          Text('课程不存在')
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .padding({ top: 80 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          Scroll() {
            Column() {
              this.TitleCard()
              this.MaterialsSection()
              this.ReservationsSection()
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding({ bottom: 120 })
          }
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
          this.BookButtonBar()
        }
      }
      .width('100%')
      .height('100%')
      .linearGradient({
        angle: 180,
        direction: GradientDirection.Bottom,
        colors: [[Theme.pageBgStart, 0.0], [Theme.pageBgMid, 0.55], [Theme.pageBgEnd, 1.0]],
      })

      if (this.pickerOpen) {
        this.MemberPickerSheet()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  HeaderBar(): void {
    Row() {
      Column() {
        Text('‹')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .id('course-detail-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('课程详情')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .margin({ left: 12 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  TitleCard(): void {
    Column() {
      Text(this.course && this.course.title ? this.course.title : '未命名课程')
        .id('course-detail-title')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 14 })

      Row() {
        Column() {
          SvgIcon({ variant: 'course-pottery', iconSize: 16 })
        }
        .width(28)
        .height(28)
        .borderRadius(8)
        .backgroundColor(Theme.clayLight)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Text(this.course ? this.formatTime(this.course.startTime) : '—')
          .id('course-detail-time')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ left: 8 })
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')

      Row() {
        Column() {
          Text(`${this.capacityText()}`)
            .id('course-detail-capacity')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.clay)
            .fontFamily('monospace')
          Text('已预约 / 容量')
            .fontSize(11)
            .fontColor(Theme.textSecondary)
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Column() {
          Text(this.course ? `${this.course.rewardPoints}` : '0')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.moss)
            .fontFamily('monospace')
          Text('奖励积分')
            .fontSize(11)
            .fontColor(Theme.textSecondary)
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)
      .margin({ top: 16 })
      .padding({ top: 16 })
      .border({ width: { top: 1.5 }, color: { top: Theme.dashedDivider }, style: { top: BorderStyle.Dashed } })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  SectionTitle(title: string): void {
    Row() {
      Column()
        .width(8)
        .height(8)
        .borderRadius(4)
        .backgroundColor(Theme.clay)
        .margin({ right: 8 })
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
    }
    .alignItems(VerticalAlign.Center)
    .margin({ top: 24, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  MaterialsSection(): void {
    Column() {
      this.SectionTitle('耗材清单')

      Column() {
        if (this.materials.length === 0) {
          Text('本课程暂无耗材')
            .id('course-materials-empty')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .padding({ top: 24, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          ForEach(this.materials, (m: Material) => {
            Row() {
              Column() {
                Text(m.name && m.name.length > 0 ? m.name : '未命名材料')
                  .fontSize(14)
                  .fontColor(Theme.textPrimary)
                Text(this.materialStockStatus(m))
                  .fontSize(12)
                  .fontColor(this.materialStockColor(m))
                  .margin({ top: 2 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text(`×${this.materialQuantity(m.id)}`)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.clay)
                .fontFamily('monospace')
            }
            .id(`course-material-${m.id}`)
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .padding({ top: 12, bottom: 12 })
          }, (m: Material) => m.id)
        }
      }
      .id('course-detail-material-list')
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  ReservationsSection(): void {
    Column() {
      this.SectionTitle('预约名单')

      Column() {
        if (this.reservations.length === 0) {
          Text('还没有会员预约')
            .id('course-reservations-empty')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .padding({ top: 24, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          ForEach(this.reservations, (r: Reservation) => {
            Row() {
              Column() {
                Text(this.memberName(r.memberId))
                  .fontSize(14)
                  .fontColor(r.status === 'booked' ? Theme.textPrimary : Theme.textSecondary)
                Text(r.status === 'booked' ? '已预约' : (r.status === 'cancelled' ? '已取消' : '已完成'))
                  .fontSize(11)
                  .fontColor(r.status === 'booked' ? Theme.moss : Theme.textSecondary)
                  .margin({ top: 2 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              if (r.status === 'booked') {
                Text('取消')
                  .id(`course-detail-cancel-booking-button-${r.id}`)
                  .fontSize(13)
                  .fontColor(Theme.ochre)
                  .padding({ left: 10, right: 10, top: 6, bottom: 6 })
                  .backgroundColor(Theme.errorBg)
                  .borderRadius(10)
                  .onClick(() => this.onCancelReservation(r.id))
              }
            }
            .id(`course-reservation-${r.id}`)
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .padding({ top: 12, bottom: 12 })
          }, (r: Reservation) => r.id)
        }
      }
      .id('course-detail-reservations-list')
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  BookButtonBar(): void {
    Row() {
      Text('邀约上课')
        .id('course-detail-book-button')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(Theme.clay)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 26, right: 26, top: 14, bottom: 14 })
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .onClick(() => this.openBookDialog())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 12, bottom: 24 })
    .backgroundColor('rgba(251, 248, 245, 0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
  }

  @Builder
  MemberPickerSheet(): void {
    Column() {
      Column().width('100%').height('100%').backgroundColor('rgba(58, 45, 40, 0.32)')
        .onClick(() => this.closeBookDialog())
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      Row() {
        Text('选择会员预约')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text('关闭')
          .fontSize(14)
          .fontColor(Theme.clay)
          .onClick(() => this.closeBookDialog())
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Scroll() {
        Column() {
          ForEach(this.memberOptions, (opt: MemberOption) => {
            Row() {
              Text(opt.label)
                .fontSize(14)
                .fontColor(Theme.textPrimary)
                .layoutWeight(1)
              Text('预约')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textLight)
                .backgroundColor(Theme.clay)
                .borderRadius(10)
                .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .padding({ top: 12, bottom: 12 })
            .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })
            .onClick(() => this.onPickMember(opt.id))
          }, (opt: MemberOption) => opt.id)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('86%')
    .height('62%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowDarkCard())
  }
}
