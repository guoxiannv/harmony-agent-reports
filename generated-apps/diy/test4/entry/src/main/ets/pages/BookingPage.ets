import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { promptAction } from '@kit.ArkUI';

@Component
export struct BookingPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBack: () => void = () => {};

  @State selectedCourseId: string = '';
  @State selectedDate: string = this.formatToday();
  @State selectedTime: string = '';
  @State selectedMemberId: string = '';
  @State error: string = '';

  build() {
    Column() {
      this.Header('课程预约')

      Scroll() {
        Column({ space: 16 }) {
          Column({ space: 8 }) {
            Text('选择课程')
              .fontSize(13)
              .fontColor(Theme.textSecondary)
            Select(this.courseOptions())
              .id('booking-course-picker')
              .width('100%')
              .height(44)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.textPrimary)
              .selected(this.selectedCourseIndex())
              .onSelect((index: number) => {
                this.selectedCourseId = this.state.courses[index]?.id ?? '';
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Column({ space: 8 }) {
            Text('选择日期')
              .fontSize(13)
              .fontColor(Theme.textSecondary)
            TextInput({ text: this.selectedDate, placeholder: 'YYYY-MM-DD' })
              .id('booking-date-picker')
              .width('100%')
              .height(44)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.cardBg)
              .onChange((v) => this.selectedDate = v)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Column({ space: 8 }) {
            Text('选择时段')
              .fontSize(13)
              .fontColor(Theme.textSecondary)
            Select(this.timeOptions())
              .id('booking-time-picker')
              .width('100%')
              .height(44)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.textPrimary)
              .selected(this.timeIndex())
              .onSelect((index: number) => {
                const slots = ['09:00', '10:30', '14:00', '15:30', '17:00', '19:00'];
                this.selectedTime = slots[index] ?? '';
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Column({ space: 8 }) {
            Text('选择会员')
              .fontSize(13)
              .fontColor(Theme.textSecondary)
            Select(this.memberOptions())
              .id('booking-member-picker')
              .width('100%')
              .height(44)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.textPrimary)
              .selected(this.memberIndex())
              .onSelect((index: number) => {
                this.selectedMemberId = this.state.members[index]?.id ?? '';
              })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          if (this.stockWarning().length > 0) {
            Text(this.stockWarning())
              .id('booking-stock-warning')
              .fontSize(13)
              .fontColor(Theme.alert)
              .width('100%')
          }

          if (this.error.length > 0) {
            Text(this.error)
              .id('booking-error-message')
              .fontSize(13)
              .fontColor(Theme.alert)
              .width('100%')
          }

          Button('提交预约', { type: ButtonType.Normal })
            .id('booking-submit-button')
            .width('100%')
            .height(48)
            .borderRadius(Theme.radiusButton)
            .backgroundColor(Theme.brandPrimary)
            .fontColor(Theme.textOnBrand)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .onClick(() => this.submit())
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

      Row() {
        Button({ type: ButtonType.Circle }) {
          Text('<')
            .fontSize(18)
            .fontColor(Theme.textOnBrand)
        }
        .id('back-button')
        .width(40)
        .height(40)
        .backgroundColor('rgba(255,255,255,0.16)')
        .onClick(() => this.onBack())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  private courseOptions(): Array<SelectOption> {
    return this.state.courses.map(c => ({ value: c.title } as SelectOption));
  }

  private selectedCourseIndex(): number {
    return this.state.courses.findIndex(c => c.id === this.selectedCourseId);
  }

  private timeOptions(): Array<SelectOption> {
    const slots = ['09:00', '10:30', '14:00', '15:30', '17:00', '19:00'];
    return slots.map(s => ({ value: s } as SelectOption));
  }

  private timeIndex(): number {
    const slots = ['09:00', '10:30', '14:00', '15:30', '17:00', '19:00'];
    return slots.findIndex(s => s === this.selectedTime);
  }

  private memberOptions(): Array<SelectOption> {
    return this.state.members.map(m => ({ value: m.name } as SelectOption));
  }

  private memberIndex(): number {
    return this.state.members.findIndex(m => m.id === this.selectedMemberId);
  }

  private stockWarning(): string {
    const course = this.state.courses.find(c => c.id === this.selectedCourseId);
    if (!course) return '';
    for (const r of course.recipe) {
      const mat = this.state.materials.find(m => m.id === r.materialId);
      if (mat && mat.stock < r.amount) {
        return `库存不足：${mat.name} 仅剩 ${mat.stock}${mat.unit}`;
      }
    }
    return '';
  }

  private submit(): void {
    this.error = '';
    if (this.selectedCourseId.length === 0 || this.selectedDate.length === 0 ||
      this.selectedTime.length === 0 || this.selectedMemberId.length === 0) {
      this.error = '请完善预约信息';
      return;
    }
    this.ctrl.createBooking(this.selectedMemberId, this.selectedCourseId, this.selectedDate, this.selectedTime).then((result) => {
      if (typeof result === 'string') {
        this.error = result;
      } else {
        promptAction.showToast({ message: '预约成功' });
        this.onBack();
      }
    });
  }

  private formatToday(): string {
    const d = new Date();
    const y = d.getFullYear();
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${y}-${m}-${day}`;
  }
}
