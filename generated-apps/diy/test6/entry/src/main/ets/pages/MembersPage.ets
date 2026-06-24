// 手作·印记 — 会员 / Members surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyHint } from '../components/Widgets';
import { AppStore } from '../services/AppStore';
import { Member, MemberRow, KEY_MEMBERS } from '../common/Models';
import { NavOpen } from './Index';

@Component
export struct MembersPage {
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @Prop sleepingOnlyInit: boolean = false;
  @State keyword: string = '';
  @State sleepingOnly: boolean = false;
  onOpen: (req: NavOpen) => void = () => {};
  onConsumedSleepingFilter: () => void = () => {};

  aboutToAppear(): void {
    if (this.sleepingOnlyInit) {
      this.sleepingOnly = true;
      this.onConsumedSleepingFilter();
    }
  }

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          Text('会员')
            .fontSize(Theme.fontPageTitle)
            .fontColor(Theme.textTitle)
            .margin({ top: 8, bottom: 4 })
          Row() {
            Text('共 ')
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textMuted)
            Text(`${AppStore.get().getMembers().length}`)
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textMuted)
              .id('members-total-count')
            Text(' 位匠人')
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textMuted)
          }
          .margin({ bottom: 18 })

          this.SearchBar()

          if (this.rows().length === 0) {
            EmptyHint({
              iconVariant: 'empty-pottery',
              title: '还没遇到第一位匠人',
              caption: '点击右下角添加会员，留下第一枚手作印记',
            })
              .margin({ top: 40 })
          } else {
            this.MemberList()
          }
          Column().height(120)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 8 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // Add member FAB.
      Row() {
        SvgIcon({ variant: 'add-fab', iconSize: 26 })
      }
      .width(58)
      .height(58)
      .borderRadius(29)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .margin({ right: Theme.pageHorizontalPadding, bottom: Theme.bottomTabHeight + 26 })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('members-add-button')
      .onClick(() => this.onOpen({ target: 'member-edit' }))
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  SearchBar() {
    Row() {
      Row() {
        SvgIcon({ variant: 'search', iconSize: 20 })
        TextInput({ text: this.keyword, placeholder: '搜索姓名 / 手机号' })
          .layoutWeight(1)
          .backgroundColor(Color.Transparent)
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textTitle)
          .placeholderColor(Theme.textMuted)
          .placeholderFont({ size: Theme.fontBody })
          .margin({ left: 8 })
          .onChange((v: string) => { this.keyword = v; })
      }
      .layoutWeight(1)
      .height(50)
      .padding({ left: 14, right: 14 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: 'rgba(158,79,44,0.12)' })

      Row() {
        SvgIcon({ variant: 'filter', iconSize: 18 })
        Text('沉睡')
          .fontSize(Theme.fontCaption)
          .fontColor(this.sleepingOnly ? Theme.brandPrimary : Theme.textMuted)
          .margin({ left: 6 })
      }
      .height(50)
      .padding({ left: 14, right: 14 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(this.sleepingOnly ? Theme.tagLowStockBg : Theme.pageBg)
      .border({ width: 1, color: this.sleepingOnly ? Theme.brandSecondary : 'rgba(158,79,44,0.10)' })
      .margin({ left: 10 })
      .id('members-filter-sleeping')
      .onClick(() => { this.sleepingOnly = !this.sleepingOnly; })
    }
    .width('100%')
    .margin({ bottom: 18 })
  }

  @Builder
  MemberList() {
    Column() {
      ForEach(this.rows(), (m: MemberRow) => {
        Row() {
          Text(m.name.length > 0 ? m.name.charAt(0) : '会')
            .width(48)
            .height(48)
            .borderRadius(24)
            .fontSize(Theme.fontCardTitle)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textOnBrand)
            .linearGradient(BrandGradient.primary)
            .textAlign(TextAlign.Center)

          Column() {
            Row() {
              Text(m.name)
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
              if (m.craftsLabel.length > 0) {
                Text(m.craftsLabel)
                  .fontSize(Theme.fontCaption)
                  .fontColor(Theme.brandDark)
                  .backgroundColor(Theme.chipSoftBg)
                  .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                  .borderRadius(Theme.radiusChip)
                  .margin({ left: 6 })
              }
              if (m.isSleeping) {
                Text('沉睡')
                  .fontSize(Theme.fontCaption)
                  .fontColor(Theme.tagSleepingText)
                  .backgroundColor(Theme.tagSleepingBg)
                  .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                  .borderRadius(Theme.radiusChip)
                  .margin({ left: 6 })
              }
            }
            Text(`${this.maskPhone(m.phone)} · 积分 ${m.points}`)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textMuted)
              .margin({ top: 4 })
          }
          .layoutWeight(1)
          .margin({ left: 14 })
          .alignItems(HorizontalAlign.Start)

          Column() {
            Text(m.lastVisitLabel)
              .fontSize(Theme.fontTiny)
              .fontColor(m.isSleeping ? Theme.danger : Theme.textMuted)
          }
          .alignItems(HorizontalAlign.End)
        }
        .width('100%')
        .padding({ top: 14, bottom: 14 })
        .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
        .id(`members-item-${m.id}`)
        .onClick(() => this.onOpen({ target: 'member-detail', memberId: m.id }))
      }, (m: MemberRow) => m.id)
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('members-list')
  }

  private rows(): MemberRow[] {
    return AppStore.get().memberRows(this.keyword, this.sleepingOnly);
  }

  private maskPhone(phone: string): string {
    if (phone.length < 7) {
      return phone;
    }
    return phone.substring(0, 3) + '****' + phone.substring(phone.length - 4);
  }
}
