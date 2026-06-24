import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { Member } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct MembersPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onProfile: (id: string) => void = () => {};

  @State query: string = '';
  @State filter: 'all' | 'dormant' = 'all';
  @State showAdd: boolean = false;
  @State newName: string = '';
  @State newPhone: string = '';
  @State newCrafts: string = '';
  @State newBio: string = '';

  build() {
    Column() {
      this.Header('会员列表')

      Scroll() {
        Column({ space: 16 }) {
          TextInput({ text: this.query, placeholder: '搜索昵称/手机号' })
            .id('members-search-input')
            .width('100%')
            .height(44)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.cardBg)
            .placeholderColor(Theme.textTertiary)
            .onChange((v) => this.query = v)

          Row({ space: 10 }) {
            this.FilterChip('全部', 'all', 'members-filter-all')
            this.FilterChip('沉睡', 'dormant', 'members-filter-dormant')
          }
          .width('100%')

          Button('+ 新增会员', { type: ButtonType.Normal })
            .id('members-add-button')
            .width('100%')
            .height(44)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.brandPrimary)
            .fontColor(Theme.textOnBrand)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .onClick(() => this.showAdd = true)

          Column({ space: 0 }) {
            ForEach(this.filteredMembers(), (m: Member, index: number) => {
              this.MemberItem(m, index)
            }, (m: Member) => m.id)
          }
          .id('members-list')
          .width('100%')
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.filteredMembers().length === 0) {
            Column({ space: 8 }) {
              Text('暂无会员')
                .id('members-empty-state')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Text('点击上方按钮添加第一位会员')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(32)
          }
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      if (this.showAdd) {
        this.AddDialog()
      }
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

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  FilterChip(label: string, value: 'all' | 'dormant', targetId: string) {
    Button(label, { type: ButtonType.Normal })
      .id(targetId)
      .height(36)
      .layoutWeight(1)
      .borderRadius(12)
      .backgroundColor(this.filter === value ? Theme.brandPrimary : Theme.cardBg)
      .fontColor(this.filter === value ? Theme.textOnBrand : Theme.textSecondary)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .onClick(() => this.filter = value)
  }

  @Builder
  MemberItem(m: Member, index: number) {
    Row({ space: 12 }) {
      Column() {
        Text(m.name.slice(0, 1))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandPrimary)
      }
      .width(44)
      .height(44)
      .borderRadius(Theme.radiusSmall)
      .backgroundColor(Theme.brandSoft)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column({ space: 4 }) {
        Text(m.name)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(`${m.crafts.join(' · ')} · ${m.level}`)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text(`>${m.points}`)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
    }
    .id(`member-item-${m.id}`)
    .width('100%')
    .padding(16)
    .border({ width: { bottom: index < this.filteredMembers().length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .alignItems(VerticalAlign.Center)
    .onClick(() => this.onProfile(m.id))
  }

  @Builder
  AddDialog() {
    Column({ space: 12 }) {
      Text('新增会员')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)

      TextInput({ text: this.newName, placeholder: '昵称' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newName = v)

      TextInput({ text: this.newPhone, placeholder: '手机号' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newPhone = v)

      TextInput({ text: this.newCrafts, placeholder: '擅长工艺，用空格分隔' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newCrafts = v)

      TextArea({ text: this.newBio, placeholder: '个人简介' })
        .width('100%')
        .height(80)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newBio = v)

      Row({ space: 12 }) {
        Button('取消', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.borderDefault)
          .fontColor(Theme.textPrimary)
          .onClick(() => this.showAdd = false)

        Button('保存', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.brandPrimary)
          .fontColor(Theme.textOnBrand)
          .onClick(() => this.saveMember())
      }
      .width('100%')
    }
    .width('90%')
    .padding(20)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 10, color: Theme.cardShadow })
    .position({ x: '5%', y: '20%' })
  }

  private filteredMembers(): Member[] {
    let list = this.state.members;
    if (this.filter === 'dormant') {
      const cutoff = Date.now() - this.state.settings.dormantThresholdDays * 24 * 60 * 60 * 1000;
      list = list.filter(m => m.lastActiveAt < cutoff);
    }
    if (this.query.length > 0) {
      const q = this.query.toLowerCase();
      list = list.filter(m => m.name.includes(q) || m.phone.includes(q));
    }
    return list;
  }

  private saveMember(): void {
    const crafts = this.newCrafts.split(/\s+/).filter(s => s.length > 0);
    this.ctrl.addMember(this.newName, this.newPhone, crafts, this.newBio).then(() => {
      this.newName = '';
      this.newPhone = '';
      this.newCrafts = '';
      this.newBio = '';
      this.showAdd = false;
      promptAction.showToast({ message: '会员已添加' });
    });
  }
}
