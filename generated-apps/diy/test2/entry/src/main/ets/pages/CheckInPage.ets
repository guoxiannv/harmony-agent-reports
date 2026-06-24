import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CheckInForm, Course, Member } from '../model/Models';
import promptAction from '@ohos.promptAction';

interface MemberOption {
  id: string;
  label: string;
}

interface CourseOption {
  id: string;
  label: string;
}

@Component
export struct CheckInPage {
  onBack: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private memberOptions: MemberOption[] = [];
  @State private courseOptions: CourseOption[] = [];
  @State private selectedMemberId: string = '';
  @State private selectedCourseId: string = '';
  @State private type: 'check-in' | 'spend' = 'check-in';
  @State private amountText: string = '';
  @State private pointsText: string = '';
  @State private submitting: boolean = false;
  @State private errorMessage: string = '';
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    const members: Member[] = await controller.listMembers();
    const memberOpts: MemberOption[] = [];
    for (const m of members) {
      memberOpts.push({ id: m.id, label: `${m.name || '未命名会员'}（${m.points} 积分）` });
    }
    const todayCourses: Course[] = await controller.listCourses(Date.now());
    const courseOpts: CourseOption[] = [];
    for (const c of todayCourses) {
      courseOpts.push({ id: c.id, label: c.title && c.title.length > 0 ? c.title : '未命名课程' });
    }
    this.memberOptions = memberOpts;
    this.courseOptions = courseOpts;
    this.isReady = true;
  }

  private selectedMemberIndex(): number {
    if (!this.selectedMemberId) {
      return -1;
    }
    for (let i = 0; i < this.memberOptions.length; i++) {
      if (this.memberOptions[i].id === this.selectedMemberId) {
        return i;
      }
    }
    return -1;
  }

  private selectedCourseIndex(): number {
    if (!this.selectedCourseId) {
      return -1;
    }
    for (let i = 0; i < this.courseOptions.length; i++) {
      if (this.courseOptions[i].id === this.selectedCourseId) {
        return i;
      }
    }
    return -1;
  }

  private memberValueText(): string {
    if (!this.selectedMemberId) {
      return '请选择会员（必选）';
    }
    for (const opt of this.memberOptions) {
      if (opt.id === this.selectedMemberId) {
        return opt.label;
      }
    }
    return '请选择会员（必选）';
  }

  private courseValueText(): string {
    if (!this.selectedCourseId) {
      return '不关联课程（可选）';
    }
    for (const opt of this.courseOptions) {
      if (opt.id === this.selectedCourseId) {
        return opt.label;
      }
    }
    return '不关联课程（可选）';
  }

  private selectType(t: 'check-in' | 'spend'): void {
    this.type = t;
  }

  private isSpend(): boolean {
    return this.type === 'spend';
  }

  private spendRatioHint(): string {
    const ratio: number = this.controller && this.controller.settings ? this.controller.settings.spendRatio : 1;
    return `按 ¥1 = ${ratio} 积分自动计算（留空则自动）`;
  }

  private parseIntSafe(text: string): number {
    const t: string = text.trim();
    if (t.length === 0) {
      return 0;
    }
    const n: number = parseInt(t, 10);
    if (isNaN(n)) {
      return 0;
    }
    return n;
  }

  private async onSubmit(): Promise<void> {
    if (this.submitting) {
      return;
    }
    this.errorMessage = '';

    if (!this.selectedMemberId) {
      this.errorMessage = '请选择会员';
      return;
    }
    if (this.isSpend()) {
      const amount: number = this.parseIntSafe(this.amountText);
      const pointsInput: number = this.parseIntSafe(this.pointsText);
      if (amount <= 0 && pointsInput <= 0) {
        this.errorMessage = '消费金额或积分至少填写一项';
        return;
      }
    }

    this.submitting = true;

    const form: CheckInForm = new CheckInForm();
    form.selectedMemberId = this.selectedMemberId;
    form.type = this.type;
    form.amount = this.isSpend() ? this.parseIntSafe(this.amountText) : 0;
    form.points = this.isSpend() ? this.parseIntSafe(this.pointsText) : 0;
    form.selectedCourseId = this.selectedCourseId && this.selectedCourseId.length > 0 ? this.selectedCourseId : undefined;

    if (!this.controller) {
      const registry = await ServiceRegistry.get(getContext(this));
      this.controller = new AppController(registry);
      await this.controller.loadSettings();
    }

    const result = await this.controller.submitCheckIn(form);
    this.submitting = false;
    if (result.success) {
      promptAction.showToast({ message: this.isSpend() ? '消费已记录' : '签到成功', duration: 2000 });
      this.amountText = '';
      this.pointsText = '';
      this.selectedCourseId = '';
      const members: Member[] = await this.controller.listMembers();
      const memberOpts: MemberOption[] = [];
      for (const m of members) {
        memberOpts.push({ id: m.id, label: `${m.name || '未命名会员'}（${m.points} 积分）` });
      }
      this.memberOptions = memberOpts;
    } else {
      promptAction.showToast({ message: result.message ?? '提交失败', duration: 2500 });
    }
  }

  build(): void {
    Column() {
      this.HeaderBar()
      Scroll() {
        Column() {
          this.FormBody()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      this.FooterBar()
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Bottom,
      colors: [[Theme.pageBgStart, 0.0], [Theme.pageBgMid, 0.55], [Theme.pageBgEnd, 1.0]],
    })
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
      .id('check-in-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('签到 / 消费')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .margin({ left: 12 })

      Column() {
        SvgIcon({ variant: 'check-in-fab', iconSize: 20 })
      }
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.clayLight)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  SectionLabel(label: string): void {
    Text(label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .margin({ top: 20, bottom: 8 })
  }

  @Builder
  FormBody(): void {
    Column() {
      this.SectionLabel('会员')
      Select(this.memberOptions.map((opt: MemberOption) => ({
        value: opt.label,
        icon: '',
      } as SelectOption)))
        .id('check-in-member-picker')
        .selected(this.selectedMemberIndex())
        .value(this.memberValueText())
        .font({ size: 14 })
        .selectedOptionFont({ size: 14, weight: FontWeight.Medium })
        .selectedOptionBgColor(Theme.clayLight)
        .optionFont({ size: 14 })
        .optionBgColor(Theme.cardBg)
        .width('100%')
        .height(50)
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .onSelect((index: number) => {
          if (index >= 0 && index < this.memberOptions.length) {
            this.selectedMemberId = this.memberOptions[index].id;
          }
        })

      this.SectionLabel('类型')
      Row() {
        Text('签到')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.type === 'check-in' ? Theme.textLight : Theme.textPrimary)
          .backgroundColor(this.type === 'check-in' ? Theme.clay : Theme.clayLight)
          .borderRadius(Theme.radiusButton)
          .padding({ left: 18, right: 18, top: 12, bottom: 12 })
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .onClick(() => this.selectType('check-in'))

        Text('消费')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.type === 'spend' ? Theme.textLight : Theme.textPrimary)
          .backgroundColor(this.type === 'spend' ? Theme.clay : Theme.clayLight)
          .borderRadius(Theme.radiusButton)
          .padding({ left: 18, right: 18, top: 12, bottom: 12 })
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .margin({ left: 12 })
          .onClick(() => this.selectType('spend'))
      }
      .id('check-in-type-toggle')
      .width('100%')
      .alignItems(VerticalAlign.Center)

      if (this.isSpend()) {
        this.SectionLabel('消费金额（元）')
        TextInput({ text: this.amountText, placeholder: '本次消费金额' })
          .id('check-in-amount-input')
          .type(InputType.Number)
          .width('100%')
          .height(50)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .placeholderColor('#C8BBAF')
          .placeholderFont({ size: 14 })
          .backgroundColor(Theme.cardBg)
          .borderRadius(14)
          .border({ width: 1.5, color: Theme.borderDefault })
          .padding({ left: 15, right: 15 })
          .onChange((v: string) => this.amountText = v)

        this.SectionLabel('积分（留空自动计算）')
        TextInput({ text: this.pointsText, placeholder: '0' })
          .id('check-in-points-input')
          .type(InputType.Number)
          .width('100%')
          .height(50)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .placeholderColor('#C8BBAF')
          .placeholderFont({ size: 14 })
          .backgroundColor(Theme.cardBg)
          .borderRadius(14)
          .border({ width: 1.5, color: Theme.borderDefault })
          .padding({ left: 15, right: 15 })
          .onChange((v: string) => this.pointsText = v)

        Text(this.spendRatioHint())
          .fontSize(12)
          .fontColor(Theme.textSecondary)
          .margin({ top: 6 })
      }

      this.SectionLabel('关联课程（可选）')
      Select(this.courseOptions.map((opt: CourseOption) => ({
        value: opt.label,
        icon: '',
      } as SelectOption)))
        .id('check-in-course-picker')
        .selected(this.selectedCourseIndex())
        .value(this.courseValueText())
        .font({ size: 14 })
        .selectedOptionFont({ size: 14, weight: FontWeight.Medium })
        .selectedOptionBgColor(Theme.clayLight)
        .optionFont({ size: 14 })
        .optionBgColor(Theme.cardBg)
        .width('100%')
        .height(50)
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .onSelect((index: number) => {
          if (index >= 0 && index < this.courseOptions.length) {
            this.selectedCourseId = this.courseOptions[index].id;
          }
        })

      if (this.errorMessage.length > 0) {
        Text(this.errorMessage)
          .fontSize(13)
          .fontColor(Theme.errorText)
          .backgroundColor(Theme.errorBg)
          .borderRadius(10)
          .padding({ left: 12, right: 12, top: 10, bottom: 10 })
          .margin({ top: 16 })
          .width('100%')
      }

      if (!this.isReady) {
        Text('加载会员与课程中…')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ top: 20 })
          .width('100%')
          .textAlign(TextAlign.Center)
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FooterBar(): void {
    Row() {
      Text(this.isSpend() ? '记录消费' : '签到')
        .id('check-in-submit-button')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(this.submitting ? Theme.disabledBg : Theme.clay)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 26, right: 26, top: 14, bottom: 14 })
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .onClick(() => this.onSubmit())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 12, bottom: 24 })
    .backgroundColor('rgba(251, 248, 245, 0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
  }
}
