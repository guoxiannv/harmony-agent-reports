import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Member } from '../model/Models';

@Component
export struct RedeemSheetPage {
  onBack: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private members: Member[] = [];
  @State private selectedMemberId: string = '';
  @State private pointsText: string = '';
  @State private description: string = '';
  @State private submitting: boolean = false;
  @State private errorMessage: string = '';
  @State private successMessage: string = '';
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    const list: Member[] = await controller.listMembers('');
    this.members = list;
    this.isReady = true;
  }

  private memberDisplayName(m: Member): string {
    const name = m.name || '未命名会员';
    return `${name} · ${m.points} 积分`;
  }

  private selectedMember(): Member | undefined {
    if (!this.selectedMemberId) {
      return undefined;
    }
    for (const m of this.members) {
      if (m.id === this.selectedMemberId) {
        return m;
      }
    }
    return undefined;
  }

  private parsePoints(): number {
    const n: number = parseInt(this.pointsText, 10);
    if (isNaN(n) || n < 0) {
      return 0;
    }
    return n;
  }

  private async onSubmit(): Promise<void> {
    if (this.submitting) {
      return;
    }
    this.errorMessage = '';
    this.successMessage = '';
    if (!this.selectedMemberId) {
      this.errorMessage = '请选择会员';
      return;
    }
    const points: number = this.parsePoints();
    if (points <= 0) {
      this.errorMessage = '请填写有效的兑换积分';
      return;
    }
    const member = this.selectedMember();
    if (member && member.points < points) {
      this.errorMessage = `${member.name || '该会员'}积分不足（当前 ${member.points}）`;
      return;
    }
    const desc: string = this.description.trim().length > 0 ? this.description.trim() : '积分兑换';

    this.submitting = true;
    try {
      if (!this.controller) {
        const registry = await ServiceRegistry.get(getContext(this));
        this.controller = new AppController(registry);
        await this.controller.loadSettings();
      }
      const result = await this.controller.redeemPoints(this.selectedMemberId, points, desc);
      this.submitting = false;
      if (result.success) {
        this.successMessage = '兑换成功';
        this.pointsText = '';
        this.description = '';
        const list: Member[] = await this.controller.listMembers('');
        this.members = list;
      } else {
        this.errorMessage = result.message ?? '兑换失败，请重试';
      }
    } catch (e) {
      this.submitting = false;
      this.errorMessage = '兑换失败，请重试';
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
      .id('redeem-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('积分兑换')
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
  FormBody(): void {
    Column() {
      this.SectionLabel('选择会员')
      this.MemberPicker()

      this.SectionLabel('兑换积分')
      this.FieldPoints()

      this.SectionLabel('说明（可选）')
      this.FieldDescription()

      if (this.selectedMember()) {
        Row() {
          Text('当前可用')
            .fontSize(12)
            .fontColor(Theme.textSecondary)
          Text(this.selectedMember()!.points.toString())
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.clay)
            .fontFamily('monospace')
            .margin({ left: 6 })
          Text('积分')
            .fontSize(12)
            .fontColor(Theme.textSecondary)
            .margin({ left: 4 })
        }
        .alignItems(VerticalAlign.Bottom)
        .margin({ top: 12 })
      }

      if (this.errorMessage.length > 0) {
        Text(this.errorMessage)
          .fontSize(13)
          .fontColor(Theme.errorText)
          .backgroundColor(Theme.errorBg)
          .borderRadius(10)
          .padding({ left: 12, right: 12, top: 10, bottom: 10 })
          .margin({ top: 12 })
          .width('100%')
      }

      if (this.successMessage.length > 0) {
        Text(this.successMessage)
          .fontSize(13)
          .fontColor(Theme.moss)
          .backgroundColor('rgba(126, 146, 115, 0.16)')
          .borderRadius(10)
          .padding({ left: 12, right: 12, top: 10, bottom: 10 })
          .margin({ top: 12 })
          .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  SectionLabel(label: string): void {
    Text(label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .margin({ top: 16, bottom: 8 })
  }

  @Builder
  MemberPicker(): void {
    Column() {
      if (!this.isReady) {
        Text('加载中…')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
      } else if (this.members.length === 0) {
        Text('暂无会员，请先添加会员')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
      } else {
        Select(this.buildSelectOptions())
          .id('redeem-member-picker')
          .selected(this.selectedIndex())
          .value(this.selectedMemberId ? this.pickerValue() : '请选择会员')
          .width('100%')
          .height(50)
          .font({ size: 14 })
          .fontColor(Theme.textPrimary)
          .selectedOptionFont({ size: 14, weight: FontWeight.Medium })
          .selectedOptionBgColor(Theme.clayLight)
          .optionFont({ size: 14 })
          .backgroundColor(Theme.cardBg)
          .borderRadius(14)
          .border({ width: 1.5, color: Theme.borderDefault })
          .onSelect((index: number) => {
            const m: Member | undefined = this.members[index];
            if (m) {
              this.selectedMemberId = m.id;
            }
          })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private selectedIndex(): number {
    for (let i = 0; i < this.members.length; i++) {
      if (this.members[i].id === this.selectedMemberId) {
        return i;
      }
    }
    return -1;
  }

  private buildSelectOptions(): SelectOption[] {
    const options: SelectOption[] = [];
    for (const m of this.members) {
      options.push({ value: this.memberDisplayName(m) });
    }
    return options;
  }

  private pickerValue(): string {
    const m = this.selectedMember();
    return m ? this.memberDisplayName(m) : '请选择会员';
  }

  @Builder
  FieldPoints(): void {
    TextInput({ text: this.pointsText, placeholder: '输入要兑换的积分数' })
      .id('redeem-points-input')
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
  }

  @Builder
  FieldDescription(): void {
    TextArea({ text: this.description, placeholder: '如 兑换拉坯体验券一份' })
      .id('redeem-description-input')
      .width('100%')
      .height(96)
      .fontSize(14)
      .fontColor(Theme.textPrimary)
      .placeholderColor('#C8BBAF')
      .placeholderFont({ size: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })
      .padding({ left: 15, right: 15, top: 12, bottom: 12 })
      .onChange((v: string) => this.description = v)
  }

  @Builder
  FooterBar(): void {
    Row() {
      Text('确认兑换')
        .id('redeem-submit-button')
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
