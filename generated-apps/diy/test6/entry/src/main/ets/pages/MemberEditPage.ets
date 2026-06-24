// 手作·印记 — 编辑会员 / MemberEdit surface (create + edit).
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Member, CRAFT_PRESETS, KEY_MEMBERS } from '../common/Models';
import { TimeUtil } from '../common/Util';

const PLACEHOLDER_PREFIX: string = 'placeholder:';

@Component
export struct MemberEditPage {
  @Prop editingId: string;
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @State name: string = '';
  @State phone: string = '';
  @State nickname: string = '';
  @State birthday: string = '';
  @State notes: string = '';
  @State allergy: string = '';
  @State crafts: string[] = [];
  @State works: string[] = [];
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  aboutToAppear(): void {
    if (this.editingId.length > 0) {
      const m = AppStore.get().getMember(this.editingId);
      if (m !== null) {
        this.name = m.name;
        this.phone = m.phone;
        this.nickname = m.nickname;
        this.birthday = m.birthday;
        this.notes = m.notes;
        this.allergy = m.allergy;
        this.crafts = this.clone(m.crafts);
        this.works = this.clone(m.workImages);
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        Text(this.editingId.length > 0 ? '编辑会员' : '新增会员')
          .fontSize(Theme.fontPageTitle)
          .fontColor(Theme.textTitle)
          .margin({ top: 6, bottom: 4 })
        Text('留下属于 Ta 的手作印记')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .margin({ bottom: 18 })

        this.Field('姓名 *', this.name, '会员姓名', (v: string) => { this.name = v; }, 'member-edit-name-input', false)
        this.Field('手机号 *', this.phone, '11位手机号', (v: string) => { this.phone = v; }, 'member-edit-phone-input', false)
        this.Field('昵称', this.nickname, '昵称', (v: string) => { this.nickname = v; }, 'member-edit-nickname-input', false)
        this.BirthdayField()
        this.CraftsPicker()
        this.Field('过敏 / 注意事项', this.allergy, '如对某些材料过敏', (v: string) => { this.allergy = v; }, 'member-edit-allergy-input', false)
        this.Field('备注', this.notes, '记录会员偏好或故事', (v: string) => { this.notes = v; }, 'member-edit-notes-input', true)
        this.WorksUploader()
        this.Buttons()
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
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('member-edit-page-back-button')
      .onClick(() => this.onCancel())

      Text(this.editingId.length > 0 ? '编辑会员' : '新增会员')
        .fontSize(Theme.fontTopNav)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Column().width(40)
    }
    .width('100%')
    .padding({ top: 10, bottom: 6 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Field(label: string, value: string, placeholder: string, onChange: (v: string) => void, fieldId: string, multiLine: boolean) {
    Column() {
      Text(label)
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      if (multiLine) {
        TextArea({ text: value, placeholder: placeholder })
          .width('100%')
          .height(90)
          .padding(15)
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.pageBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textTitle)
          .placeholderColor(Theme.textMuted)
          .id(fieldId)
          .onChange((v: string) => { onChange(v); })
      } else {
        TextInput({ text: value, placeholder: placeholder })
          .width('100%')
          .height(50)
          .padding({ left: 15, right: 15 })
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.pageBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textTitle)
          .placeholderColor(Theme.textMuted)
          .id(fieldId)
          .onChange((v: string) => { onChange(v); })
      }
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  BirthdayField() {
    Column() {
      Text('生日')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      Row() {
        Text(this.birthday.length > 0 ? this.birthday : '选择生日')
          .fontSize(Theme.fontBody)
          .fontColor(this.birthday.length > 0 ? Theme.textTitle : Theme.textMuted)
          .layoutWeight(1)
        SvgIcon({ variant: 'expand', iconSize: 18 })
      }
      .width('100%')
      .height(50)
      .padding({ left: 15, right: 15 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
      .alignItems(VerticalAlign.Center)
      .id('member-edit-birthday-picker')
      .onClick(() => this.openDatePicker())
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  CraftsPicker() {
    Column() {
      Text('擅长工艺')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 8 })
        .alignSelf(ItemAlign.Start)
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(CRAFT_PRESETS, (c: string) => {
          Text(c)
            .fontSize(Theme.fontCaption)
            .fontColor(this.craftSelected(c) ? Theme.textOnBrand : Theme.brandDark)
            .backgroundColor(this.craftSelected(c) ? Theme.brandPrimary : Theme.chipSoftBg)
            .padding({ left: 12, right: 12, top: 7, bottom: 7 })
            .borderRadius(Theme.radiusChip)
            .margin({ right: 8, bottom: 8 })
            .onClick(() => this.toggleCraft(c))
        }, (c: string) => c)
      }
      .width('100%')
      .id('member-edit-crafts-picker')
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  WorksUploader() {
    Column() {
      Text('作品图')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 8 })
        .alignSelf(ItemAlign.Start)
      Grid() {
        ForEach(this.works, (img: string, idx: number) => {
          GridItem() {
            Column() {
              // Placeholder work image rendered as a clay gradient block.
              Column()
                .width('100%')
                .height('100%')
                .linearGradient(BrandGradient.primary)
            }
            .width('100%')
            .aspectRatio(1)
            .borderRadius(Theme.radiusInput)
            .border({ width: 1, color: Theme.borderSoft })
            .id(`member-work-${idx}`)
          }
        }, (img: string, idx: number) => `${idx}`)

        if (this.works.length < 6) {
          GridItem() {
            Row() {
              SvgIcon({ variant: 'upload', iconSize: 24 })
            }
            .width('100%')
            .aspectRatio(1)
            .borderRadius(Theme.radiusInput)
            .backgroundColor(Theme.pageBg)
            .border({ width: 1, color: 'rgba(158,79,44,0.25)' })
            .justifyContent(FlexAlign.Center)
            .alignItems(VerticalAlign.Center)
            .onClick(() => this.addWork())
          }
        }
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .height(this.worksGridHeight())
      .id('member-edit-works-uploader')
    }
    .width('100%')
    .margin({ bottom: 20 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Buttons() {
    Row() {
      Column() {
        Text('取消')
          .fontSize(Theme.fontBody)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.brandPrimary)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .backgroundColor(Color.Transparent)
      .border({ width: 1.5, color: Theme.brandSecondary })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('member-edit-cancel-button')
      .onClick(() => this.onCancel())
      .margin({ right: 6 })

      Column() {
        Text('保存')
          .fontSize(Theme.fontBody)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnBrand)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('member-edit-save-button')
      .onClick(() => this.save())
      .margin({ left: 6 })
    }
    .width('100%')
    .margin({ top: 8 })
  }

  private craftSelected(c: string): boolean {
    for (let i = 0; i < this.crafts.length; i++) {
      if (this.crafts[i] === c) {
        return true;
      }
    }
    return false;
  }

  private toggleCraft(c: string): void {
    const next: string[] = [];
    let found = false;
    for (let i = 0; i < this.crafts.length; i++) {
      if (this.crafts[i] === c) {
        found = true;
      } else {
        next.push(this.crafts[i]);
      }
    }
    if (!found) {
      next.push(c);
    }
    this.crafts = next;
  }

  private addWork(): void {
    if (this.works.length >= 6) {
      Ui.toast('最多 6 张作品图');
      return;
    }
    const next: string[] = [];
    for (let i = 0; i < this.works.length; i++) {
      next.push(this.works[i]);
    }
    next.push(PLACEHOLDER_PREFIX + TimeUtil.now());
    this.works = next;
    Ui.toast('已添加作品图占位（相机/相册选取将在后续版本支持）');
  }

  private worksGridHeight(): number {
    const cols = 3;
    const slots = this.works.length + (this.works.length < 6 ? 1 : 0);
    const rows = Math.ceil(slots / cols);
    const cell = 110;
    return rows * (cell + 10);
  }

  private openDatePicker(): void {
    try {
      DatePickerDialog.show({
        onDateAccept: (date: Date) => {
          this.birthday = TimeUtil.ymd(date.getFullYear(), date.getMonth(), date.getDate());
        },
      });
    } catch (e) {
      Ui.toast('日期选择不可用');
    }
  }

  private save(): void {
    const form: Member = {
      id: this.editingId,
      name: this.name,
      phone: this.phone,
      nickname: this.nickname,
      birthday: this.birthday,
      crafts: this.clone(this.crafts),
      notes: this.notes,
      allergy: this.allergy,
      workImages: this.clone(this.works),
      points: 0,
      totalSpend: 0,
      lastVisitAt: 0,
      createdAt: 0,
    };
    const res = AppStore.get().saveMember(form, this.editingId);
    if (res.ok) {
      Ui.toast(res.message);
      this.onDone();
    } else {
      Ui.toast(res.message);
    }
  }

  private clone(src: string[]): string[] {
    const out: string[] = [];
    for (let i = 0; i < src.length; i++) {
      out.push(src[i]);
    }
    return out;
  }
}
