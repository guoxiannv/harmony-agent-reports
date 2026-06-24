// 手作·印记 — 积分补录 / PointRecord surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Member, KEY_MEMBERS } from '../common/Models';

@Component
export struct PointRecordPage {
  @Prop memberIdInit: string;
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @State selectedMemberId: string = '';
  @State type: string = 'earn'; // earn | spend | adjust
  @State amount: string = '';
  @State reason: string = '';
  @State keyword: string = '';
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  aboutToAppear(): void {
    if (this.memberIdInit.length > 0) {
      this.selectedMemberId = this.memberIdInit;
    }
  }

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        Text('积分补录')
          .fontSize(Theme.fontPageTitle)
          .fontColor(Theme.textTitle)
          .margin({ top: 6, bottom: 4 })
        Text('手动记录消费、奖励或调整')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .margin({ bottom: 18 })

        Text('选择会员 *')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ bottom: 6 })
          .alignSelf(ItemAlign.Start)
        TextInput({ text: this.keyword, placeholder: '搜索会员' })
          .width('100%')
          .height(46)
          .padding({ left: 14, right: 14 })
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .placeholderColor(Theme.textMuted)
          .margin({ bottom: 12 })
          .onChange((v: string) => { this.keyword = v; })
        this.MemberList()

        Text('类型')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ top: 12, bottom: 6 })
          .alignSelf(ItemAlign.Start)
        this.TypePicker()

        this.AmountField()
        this.ReasonField()
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
      .onClick(() => this.onCancel())

      Text('积分补录')
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
  MemberList() {
    Column() {
      ForEach(this.filteredMembers(), (m: Member) => {
        Row() {
          Text(m.name)
            .fontSize(Theme.fontBody)
            .fontColor(Theme.textTitle)
            .layoutWeight(1)
          Text(`积分 ${m.points}`)
            .fontSize(Theme.fontCaption)
            .fontColor(this.selectedMemberId === m.id ? Theme.brandPrimary : Theme.textMuted)
        }
        .width('100%')
        .padding({ left: 12, right: 12, top: 12, bottom: 12 })
        .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
        .backgroundColor(this.selectedMemberId === m.id ? Theme.chipSoftBg : Color.Transparent)
        .borderRadius(Theme.radiusTiny)
        .onClick(() => { this.selectedMemberId = m.id; })
      }, (m: Member) => m.id)
    }
    .width('100%')
    .padding({ top: 4, bottom: 4 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
    .id('point-record-member-picker')
  }

  @Builder
  TypePicker() {
    Row() {
      this.TypeChip('收入', 'earn', Theme.success)
      this.TypeChip('支出', 'spend', Theme.danger)
      this.TypeChip('调整', 'adjust', Theme.accent)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding(4)
    .borderRadius(Theme.radiusSmall)
    .backgroundColor(Theme.pageBg)
    .border({ width: 1, color: Theme.borderSoft })
    .id('point-record-type-picker')
    .margin({ bottom: 14 })
  }

  @Builder
  TypeChip(label: string, value: string, color: string) {
    Text(label)
      .fontSize(Theme.fontBody)
      .fontColor(this.type === value ? Theme.textOnBrand : color)
      .padding({ left: 18, right: 18, top: 8, bottom: 8 })
      .borderRadius(Theme.radiusPill)
      .backgroundColor(this.type === value ? color : Color.Transparent)
      .onClick(() => { this.type = value; })
  }

  @Builder
  AmountField() {
    Column() {
      Text('数值 *')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      TextInput({ text: this.amount, placeholder: '输入正整数' })
        .width('100%')
        .height(50)
        .padding({ left: 15, right: 15 })
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textTitle)
        .placeholderColor(Theme.textMuted)
        .type(InputType.Number)
        .id('point-record-amount-input')
        .onChange((v: string) => { this.amount = v; })
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  ReasonField() {
    Column() {
      Text('原因 / 说明')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      TextInput({ text: this.reason, placeholder: '如：消费补录、活动奖励' })
        .width('100%')
        .height(50)
        .padding({ left: 15, right: 15 })
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textTitle)
        .placeholderColor(Theme.textMuted)
        .id('point-record-reason-input')
        .onChange((v: string) => { this.reason = v; })
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Buttons() {
    Row() {
      Column() {
        Text('取消')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.brandPrimary)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .border({ width: 1.5, color: Theme.brandSecondary })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('point-record-cancel-button')
      .margin({ right: 6 })
      .onClick(() => this.onCancel())

      Column() {
        Text('保存')
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
      .id('point-record-save-button')
      .margin({ left: 6 })
      .onClick(() => this.save())
    }
    .width('100%')
    .margin({ top: 16 })
  }

  private filteredMembers(): Member[] {
    const all = AppStore.get().getMembers();
    const kw = this.keyword.trim().toLowerCase();
    const out: Member[] = [];
    for (let i = 0; i < all.length; i++) {
      if (kw.length > 0) {
        const hay = (all[i].name + ' ' + all[i].phone).toLowerCase();
        if (hay.indexOf(kw) < 0) {
          continue;
        }
      }
      out.push(all[i]);
    }
    return out;
  }

  private save(): void {
    if (this.selectedMemberId.length === 0) {
      Ui.toast('请选择会员');
      return;
    }
    const val = parseInt(this.amount, 10);
    if (isNaN(val) || val <= 0) {
      Ui.toast('请输入有效数值');
      return;
    }
    const store = AppStore.get();
    const reason = this.reason.trim().length > 0 ? this.reason.trim() : this.defaultReason();
    let signed = val;
    if (this.type === 'spend') {
      signed = -val;
    } else if (this.type === 'adjust') {
      // adjust is a positive addition by default; use earn sign.
      signed = val;
    }
    const bal = store.applyPointTx(this.selectedMemberId, this.type === 'adjust' ? 'adjust' : (this.type === 'spend' ? 'spend' : 'earn'), signed, reason, 'manual', '');
    if (bal < 0) {
      Ui.toast('积分余额不足');
      return;
    }
    Ui.toast('已记录');
    this.onDone();
  }

  private defaultReason(): string {
    if (this.type === 'spend') {
      return '积分消耗';
    }
    if (this.type === 'adjust') {
      return '积分调整';
    }
    return '积分增加';
  }
}
