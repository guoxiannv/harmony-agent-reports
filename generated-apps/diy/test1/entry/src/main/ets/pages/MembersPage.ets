import { AppController } from '../viewmodel/AppController';
import { Member, craftLabel, ALL_CRAFTS, CraftTag } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct MembersPage {
  @ObjectLink ctrl: AppController;
  onAddMember: () => void = () => {};
  onMemberDetail: (id: string) => void = () => {};
  @State query: string = '';
  @State craftFilter: string = '';
  @State showFilter: boolean = false;

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Text('会员')
          .fontSize(Theme.pageTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Button() {
          SvgIcon({ variant: 'plus', iconSize: 20, color: Theme.cardBg })
        }
        .id('members-add-button')
        .width(40)
        .height(40)
        .backgroundColor(Theme.terracotta)
        .borderRadius(20)
        .shadow({ radius: 12, color: 'rgba(198,123,92,0.32)' })
        .onClick(() => this.onAddMember())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 12 })

      // Search + filter
      Row({ space: 10 }) {
        TextInput({ placeholder: '搜索姓名或手机号', text: this.query })
          .id('members-search-input')
          .layoutWeight(1)
          .height(44)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .onChange((value: string) => {
            this.query = value;
          })
        Button() {
          SvgIcon({ variant: 'filter', iconSize: 20, color: this.showFilter ? Theme.terracotta : Theme.clayGray })
        }
        .id('members-filter-button')
        .width(44)
        .height(44)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: this.showFilter ? Theme.terracotta : Theme.borderDefault })
        .borderRadius(Theme.radiusSmall)
        .onClick(() => {
          this.showFilter = !this.showFilter;
        })
      }
      .width('100%')
      .margin({ bottom: 12 })

      // Craft chips
      if (this.showFilter) {
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          this.CraftChip('全部', this.craftFilter === '', () => this.craftFilter = '')
          ForEach(ALL_CRAFTS, (craft: CraftTag) => {
            this.CraftChip(craftLabel(craft), this.craftFilter === craft, () => {
              this.craftFilter = this.craftFilter === craft ? '' : craft;
            })
          }, (craft: CraftTag) => craft)
        }
        .width('100%')
        .margin({ bottom: 12 })
      }

      // List
      List({ space: 12 }) {
        if (this.filteredMembers().length === 0) {
          ListItem() {
            this.EmptyState()
          }
          .id('members-empty-state')
        } else {
          ForEach(this.filteredMembers(), (member: Member) => {
            ListItem() {
              this.MemberCard(member)
            }
            .id(`members-item-${member.id}`)
            .onClick(() => this.onMemberDetail(member.id))
          }, (member: Member) => member.id)
        }
      }
      .id('members-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  CraftChip(label: string, active: boolean, onTap: () => void) {
    Text(label)
      .fontSize(12)
      .fontWeight(FontWeight.Medium)
      .fontColor(active ? Theme.textOnAccent : Theme.textSecondary)
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .backgroundColor(active ? Theme.terracotta : Theme.chipSoftBg)
      .borderRadius(999)
      .margin({ bottom: 8 })
      .onClick(onTap)
  }

  @Builder
  MemberCard(member: Member) {
    Row({ space: 12 }) {
      if (member.avatarUri) {
        Image(member.avatarUri)
          .width(52)
          .height(52)
          .borderRadius(26)
          .objectFit(ImageFit.Cover)
      } else {
        Column() {
          SvgIcon({ variant: 'user', iconSize: 24, color: Theme.clayGray })
        }
        .width(52)
        .height(52)
        .backgroundColor(Theme.ricePaper)
        .borderRadius(26)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }

      Column({ space: 4 }) {
        Text(member.name)
          .fontSize(Theme.cardTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(member.phone)
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
        Row({ space: 6 }) {
          ForEach(member.crafts.slice(0, 3), (craft: string) => {
            Text(craftLabel(craft))
              .fontSize(10)
              .fontColor(Theme.terracotta)
              .padding({ left: 8, right: 8, top: 3, bottom: 3 })
              .backgroundColor('rgba(198,123,92,0.10)')
              .borderRadius(8)
          }, (craft: string) => craft)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Column({ space: 2 }) {
        Text(`${member.pointsBalance}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.caramel)
        Text('积分')
          .fontSize(10)
          .fontColor(Theme.textQuaternary)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 12, color: Theme.shadowNear })
  }

  @Builder
  EmptyState() {
    Column({ space: 8 }) {
      Text('还没有会员')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('点击右上角添加第一位会员')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .width('100%')
    .padding({ top: 80, bottom: 80 })
    .alignItems(HorizontalAlign.Center)
  }

  private filteredMembers(): Member[] {
    return this.ctrl.filteredMembers(this.query, this.craftFilter || undefined);
  }
}
