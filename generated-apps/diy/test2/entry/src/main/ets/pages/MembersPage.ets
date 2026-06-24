import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CRAFT_TAG_LABELS, CraftTag, Member } from '../model/Models';

function craftTagLabelOf(tag: CraftTag): string {
  switch (tag) {
    case 'pottery': return CRAFT_TAG_LABELS.pottery;
    case 'woodwork': return CRAFT_TAG_LABELS.woodwork;
    case 'leather': return CRAFT_TAG_LABELS.leather;
    case 'floristry': return CRAFT_TAG_LABELS.floristry;
    case 'silver': return CRAFT_TAG_LABELS.silver;
    case 'textile': return CRAFT_TAG_LABELS.textile;
    case 'other': return CRAFT_TAG_LABELS.other;
    default: return CRAFT_TAG_LABELS.other;
  }
}

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
export struct MembersPage {
  onAddMember: () => void = () => {};
  onOpenMember: (id: string) => void = (_id: string) => {};

  @State private controller: AppController | null = null;
  @State private query: string = '';
  @State private filterTag: CraftTag | null = null;
  @State private filterOpen: boolean = false;
  @State private members: Member[] = [];
  @State private sleepingIds: Set<string> = new Set<string>();
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    await this.bootstrap();
  }

  private async bootstrap(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    await this.refresh();
  }

  private async refresh(): Promise<void> {
    if (!this.controller) {
      return;
    }
    const tag: CraftTag | undefined = this.filterTag ?? undefined;
    const list: Member[] = await this.controller.listMembers(this.query, tag);
    const sleeping: Member[] = await this.controller.listSleepingMembers();
    const ids: Set<string> = new Set<string>();
    for (const m of sleeping) {
      ids.add(m.id);
    }
    this.members = list;
    this.sleepingIds = ids;
    this.isReady = true;
  }

  private onSearchChange(value: string): void {
    this.query = value;
    this.refresh();
  }

  private toggleFilter(): void {
    this.filterOpen = !this.filterOpen;
  }

  private selectFilter(tag: CraftTag | null): void {
    this.filterTag = tag;
    this.filterOpen = false;
    this.refresh();
  }

  private memberInitial(m: Member): string {
    return m.name && m.name.length > 0 ? m.name.charAt(0) : '?';
  }

  private sleepingDays(m: Member): number {
    if (!m.lastVisitAt) {
      return 0;
    }
    const days: number = Math.floor((Date.now() - m.lastVisitAt) / (24 * 60 * 60 * 1000));
    return days;
  }

  private isSleeping(m: Member): boolean {
    return this.sleepingIds.has(m.id);
  }

  private craftTagLabel(tag: CraftTag): string {
    return craftTagLabelOf(tag);
  }

  build(): void {
    Column() {
      this.HeaderBar()
      this.SearchBar()
      if (this.filterOpen) {
        this.FilterSheet()
      }
      this.MembersList()
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
      Text('会员')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)

      Column() {
        SvgIcon({ variant: 'add', iconSize: 20 })
      }
      .id('members-add-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.clay)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow(Theme.shadowButton())
      .onClick(() => this.onAddMember())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 8, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  SearchBar(): void {
    Row() {
      TextInput({ text: this.query, placeholder: '搜索昵称或手机号' })
        .id('members-search-input')
        .layoutWeight(1)
        .height(48)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .placeholderColor('#C8BBAF')
        .placeholderFont({ size: 14 })
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .padding({ left: 14, right: 14 })
        .onChange((value: string) => this.onSearchChange(value))

      Column() {
        SvgIcon({ variant: 'filter', iconSize: 20 })
      }
      .id('members-filter-button')
      .width(44)
      .height(44)
      .borderRadius(12)
      .backgroundColor(Theme.pageBgMid)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ left: 10 })
      .onClick(() => this.toggleFilter())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 12, bottom: 16, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  FilterSheet(): void {
    Column() {
      Row() {
        Text('按工艺筛选')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text('清除')
          .fontSize(13)
          .fontColor(Theme.clay)
          .onClick(() => this.selectFilter(null))
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(CRAFT_OPTIONS, (opt: CraftOption) => {
          Text(opt.label)
            .fontSize(13)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.filterTag === opt.tag ? Theme.textLight : Theme.textPrimary)
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .backgroundColor(this.filterTag === opt.tag ? Theme.clay : Theme.clayLight)
            .borderRadius(Theme.radiusPill)
            .margin({ right: 8, bottom: 8 })
            .onClick(() => this.selectFilter(opt.tag))
        }, (opt: CraftOption) => opt.tag)
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 12 })
  }

  @Builder
  MembersList(): void {
    Scroll() {
      Column() {
        if (this.isReady && this.members.length === 0) {
          this.EmptyState()
        } else {
          Column() {
            ForEach(this.members, (m: Member) => {
              this.MemberCard(m)
            }, (m: Member) => m.id)
          }
          .id('members-list')
          .width('100%')
          .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 140 })
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  @Builder
  MemberCard(m: Member): void {
    Row() {
      Column() {
        Text(this.memberInitial(m))
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#5D4237')
          .fontFamily('monospace')
      }
      .width(52)
      .height(52)
      .borderRadius(26)
      .backgroundColor(Theme.pageBgEnd)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(m.name || '未命名会员')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)

        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(m.craftTags, (tag: CraftTag) => {
            Text(this.craftTagLabel(tag))
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor('#5D4237')
              .backgroundColor(Theme.clayLight)
              .borderRadius(Theme.radiusPill)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .margin({ right: 6, top: 6 })
          }, (tag: CraftTag) => tag)

          if (this.isSleeping(m)) {
            Text(`沉睡 ${this.sleepingDays(m)} 天`)
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textLight)
              .backgroundColor(Theme.ochre)
              .borderRadius(8)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .margin({ right: 6, top: 6 })
          }
        }
        .width('100%')
        .margin({ top: 2 })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 14 })

      Column() {
        Text(m.points.toString())
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.clay)
          .fontFamily('monospace')
        Text('积分')
          .fontSize(11)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.End)
    }
    .id(`member-card-${m.id}`)
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 12 })
    .onClick(() => this.onOpenMember(m.id))
  }

  @Builder
  EmptyState(): void {
    Column() {
      Column() {
        SvgIcon({ variant: 'empty-members', iconSize: 64 })
      }
      .width(64)
      .height(64)
      .margin({ bottom: 12 })

      Text('还没有会员')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })

      Text('点击右上角添加第一位会员，开始记录他们的手作印记')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .textAlign(TextAlign.Center)
        .lineHeight(20)
    }
    .id('members-empty-state')
    .width('100%')
    .padding({ top: 48, bottom: 48, left: 20, right: 20 })
    .alignItems(HorizontalAlign.Center)
  }
}
