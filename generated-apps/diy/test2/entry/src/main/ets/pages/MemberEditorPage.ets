import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CRAFT_TAG_LABELS, CraftTag, Member } from '../model/Models';

interface CraftOption {
  tag: CraftTag;
  label: string;
}

const CRAFT_OPTIONS: CraftOption[] = [
  { tag: 'pottery', label: CRAFT_TAG_LABELS.pottery },
  { tag: 'woodwork', label: CRAFT_TAG_LABELS.woodwork },
  { tag: 'leather', label: CRAFT_TAG_LABELS.leather },
  { tag: 'floristry', label: CRAFT_TAG_LABELS.floristry },
  { tag: 'silver', label: CRAFT_TAG_LABELS.silver },
  { tag: 'textile', label: CRAFT_TAG_LABELS.textile },
  { tag: 'other', label: CRAFT_TAG_LABELS.other },
];

@Component
export struct MemberEditorPage {
  memberId: string = '';
  onBack: () => void = () => {};
  onSaved: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private isEdit: boolean = false;
  @State private name: string = '';
  @State private phone: string = '';
  @State private birthday: string = '';
  @State private notes: string = '';
  @State private craftTags: CraftTag[] = [];
  @State private interestTags: string = '';
  @State private saving: boolean = false;
  @State private errorMessage: string = '';

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    if (this.memberId && this.memberId.length > 0) {
      this.isEdit = true;
      const m: Member | undefined = await controller.getMember(this.memberId);
      if (m) {
        this.name = m.name;
        this.phone = m.phone;
        this.birthday = m.birthday ?? '';
        this.notes = m.notes ?? '';
        this.craftTags = m.craftTags.slice();
        this.interestTags = m.interestTags.join('、');
      }
    }
  }

  private isCraftSelected(tag: CraftTag): boolean {
    return this.craftTags.indexOf(tag) >= 0;
  }

  private toggleCraft(tag: CraftTag): void {
    const idx: number = this.craftTags.indexOf(tag);
    if (idx >= 0) {
      const next: CraftTag[] = this.craftTags.slice();
      next.splice(idx, 1);
      this.craftTags = next;
    } else {
      const next: CraftTag[] = this.craftTags.slice();
      next.push(tag);
      this.craftTags = next;
    }
  }

  private async onSave(): Promise<void> {
    if (this.saving) {
      return;
    }
    const nameTrim: string = this.name.trim();
    const phoneTrim: string = this.phone.trim();
    if (nameTrim.length === 0) {
      this.errorMessage = '请填写会员昵称';
      return;
    }
    if (phoneTrim.length === 0) {
      this.errorMessage = '请填写联系方式';
      return;
    }

    this.saving = true;
    this.errorMessage = '';

    const interestsRaw: string = this.interestTags.trim();
    const interestList: string[] = interestsRaw.length > 0
      ? interestsRaw.split(/[、,，\s]+/).filter((s: string) => s.length > 0)
      : [];

    const member: Member = new Member();
    member.id = this.isEdit ? this.memberId : '';
    member.name = nameTrim;
    member.phone = phoneTrim;
    member.birthday = this.birthday.trim().length > 0 ? this.birthday.trim() : undefined;
    member.notes = this.notes.trim().length > 0 ? this.notes.trim() : undefined;
    member.craftTags = this.craftTags.slice();
    member.interestTags = interestList;

    try {
      if (!this.controller) {
        const registry = await ServiceRegistry.get(getContext(this));
        this.controller = new AppController(registry);
        await this.controller.loadSettings();
      }
      if (this.isEdit) {
        const existing: Member | undefined = await this.controller.getMember(this.memberId);
        if (existing) {
          member.points = existing.points;
          member.lastVisitAt = existing.lastVisitAt;
          member.gallery = existing.gallery.slice();
          member.createdAt = existing.createdAt;
        }
      }
      await this.controller.saveMember(member);
      this.saving = false;
      this.onSaved();
    } catch (e) {
      this.saving = false;
      this.errorMessage = '保存失败，请重试';
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
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text(this.isEdit ? '编辑会员' : '新增会员')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .margin({ left: 12 })

      Text('取消')
        .fontSize(14)
        .fontColor(Theme.clay)
        .padding({ left: 8, right: 8, top: 8, bottom: 8 })
        .onClick(() => this.onBack())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  FormBody(): void {
    Column() {
      this.PhotoPlaceholder()
      this.SectionLabel('基本信息')
      this.FieldName()
      this.FieldPhone()
      this.FieldBirthday()
      this.SectionLabel('擅长工艺')
      this.CraftChips()
      this.SectionLabel('兴趣标签')
      this.FieldInterests()
      this.SectionLabel('备注')
      this.FieldNotes()

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
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  PhotoPlaceholder(): void {
    Column() {
      Column() {
        Text('＋')
          .fontSize(32)
          .fontColor(Theme.textSecondary)
      }
      .width(88)
      .height(88)
      .borderRadius(44)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1.5, color: Theme.borderDefault })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text('点击添加头像（可选）')
        .fontSize(12)
        .fontColor(Theme.textSecondary)
        .margin({ top: 8 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 8, bottom: 24 })
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
  FieldName(): void {
    Column() {
      TextInput({ text: this.name, placeholder: '会员昵称（必填）' })
        .id('member-name-input')
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
        .onChange((v: string) => this.name = v)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FieldPhone(): void {
    TextInput({ text: this.phone, placeholder: '联系方式（必填）' })
      .id('member-phone-input')
      .type(InputType.PhoneNumber)
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
      .margin({ top: 10 })
      .onChange((v: string) => this.phone = v)
  }

  @Builder
  FieldBirthday(): void {
    TextInput({ text: this.birthday, placeholder: '生日（可选，如 1995-08-16）' })
      .id('member-birthday-input')
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
      .margin({ top: 10 })
      .onChange((v: string) => this.birthday = v)
  }

  @Builder
  CraftChips(): void {
    Flex({ wrap: FlexWrap.Wrap }) {
      ForEach(CRAFT_OPTIONS, (opt: CraftOption) => {
        Text(opt.label)
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.isCraftSelected(opt.tag) ? Theme.textLight : Theme.textPrimary)
          .backgroundColor(this.isCraftSelected(opt.tag) ? Theme.clay : Theme.clayLight)
          .borderRadius(Theme.radiusPill)
          .padding({ left: 12, right: 12, top: 7, bottom: 7 })
          .margin({ right: 8, bottom: 8 })
          .onClick(() => this.toggleCraft(opt.tag))
      }, (opt: CraftOption) => opt.tag)
    }
    .width('100%')
  }

  @Builder
  FieldInterests(): void {
    TextInput({ text: this.interestTags, placeholder: '用顿号分隔，如 拉坯、釉色' })
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
      .onChange((v: string) => this.interestTags = v)
  }

  @Builder
  FieldNotes(): void {
    TextArea({ text: this.notes, placeholder: '记录偏好、忌口、特别说明…' })
      .id('member-notes-input')
      .width('100%')
      .height(110)
      .fontSize(14)
      .fontColor(Theme.textPrimary)
      .placeholderColor('#C8BBAF')
      .placeholderFont({ size: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })
      .padding({ left: 15, right: 15, top: 12, bottom: 12 })
      .onChange((v: string) => this.notes = v)
  }

  @Builder
  FooterBar(): void {
    Row() {
      Text('保存')
        .id('member-save-button')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(this.saving ? Theme.disabledBg : Theme.clay)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 26, right: 26, top: 14, bottom: 14 })
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .onClick(() => this.onSave())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 12, bottom: 24 })
    .backgroundColor('rgba(251, 248, 245, 0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
  }
}
