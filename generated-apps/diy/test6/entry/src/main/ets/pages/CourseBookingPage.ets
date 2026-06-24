// 手作·印记 — 预约课程 / CourseBooking surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Member, Course, KEY_MEMBERS, KEY_COURSES } from '../common/Models';

@Component
export struct CourseBookingPage {
  @Prop courseId: string;
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @StorageLink(KEY_COURSES) coursesLink: Course[] = [];
  @State selectedMemberId: string = '';
  @State remark: string = '';
  @State usePoints: boolean = true;
  @State keyword: string = '';
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        Text('预约课程')
          .fontSize(Theme.fontPageTitle)
          .fontColor(Theme.textTitle)
          .margin({ top: 6, bottom: 4 })
        Text(this.course()?.title ?? '')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .margin({ bottom: 18 })

        // Member picker.
        Text('选择会员 *')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ bottom: 6 })
          .alignSelf(ItemAlign.Start)
        TextInput({ text: this.keyword, placeholder: '搜索姓名 / 手机号' })
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

        // Remark.
        Text('备注')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ top: 12, bottom: 6 })
          .alignSelf(ItemAlign.Start)
        TextArea({ text: this.remark, placeholder: '给这节课留个备注（可选）' })
          .width('100%')
          .height(80)
          .padding(14)
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .placeholderColor(Theme.textMuted)
          .id('course-booking-remark-input')
          .onChange((v: string) => { this.remark = v; })

        // Use points toggle.
        Row() {
          Column() {
            Text('积分抵扣')
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textTitle)
            Text('可用现有积分抵扣本次课程积分奖励')
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textMuted)
              .margin({ top: 2 })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Toggle({ type: ToggleType.Switch, isOn: this.usePoints })
            .selectedColor(Theme.brandPrimary)
            .id('course-booking-use-points-toggle')
            .onChange((on: boolean) => { this.usePoints = on; })
        }
        .width('100%')
        .padding(14)
        .borderRadius(Theme.radiusCard)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderSoft })
        .margin({ top: 14 })
        .alignItems(VerticalAlign.Center)

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

      Text('预约课程')
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
          Text(m.name.length > 0 ? m.name.charAt(0) : '会')
            .width(36)
            .height(36)
            .borderRadius(18)
            .fontSize(Theme.fontCaption)
            .fontColor(Theme.textOnBrand)
            .linearGradient(BrandGradient.primary)
            .textAlign(TextAlign.Center)
          Column() {
            Text(m.name)
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textTitle)
            Text(`积分 ${m.points}`)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textMuted)
              .margin({ top: 2 })
          }
          .layoutWeight(1)
          .margin({ left: 12 })
          .alignItems(HorizontalAlign.Start)

          Row() {
            Circle({ width: 18, height: 18 })
              .fill(this.selectedMemberId === m.id ? Theme.brandPrimary : Theme.cardBg)
              .stroke(this.selectedMemberId === m.id ? Theme.brandPrimary : Theme.borderDefault)
              .strokeWidth(1.5)
          }
          .width(24)
          .height(24)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .padding({ top: 12, bottom: 12 })
        .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
        .onClick(() => { this.selectedMemberId = m.id; })
      }, (m: Member) => m.id)
    }
    .width('100%')
    .padding({ left: 14, right: 14, top: 4, bottom: 4 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
    .id('course-booking-member-picker')
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
      .id('course-booking-cancel-button')
      .margin({ right: 6 })
      .onClick(() => this.onCancel())

      Column() {
        Text('确认预约')
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
      .id('course-booking-submit-button')
      .margin({ left: 6 })
      .onClick(() => this.submit())
    }
    .width('100%')
    .margin({ top: 24 })
  }

  private course(): Course | null {
    return AppStore.get().getCourse(this.courseId);
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

  private submit(): void {
    if (this.selectedMemberId.length === 0) {
      Ui.toast('请选择会员');
      return;
    }
    const res = AppStore.get().createBooking(this.courseId, this.selectedMemberId, this.remark, this.usePoints);
    if (res.ok) {
      Ui.toast('预约成功');
      this.onDone();
    } else {
      Ui.toast(res.message);
    }
  }
}
