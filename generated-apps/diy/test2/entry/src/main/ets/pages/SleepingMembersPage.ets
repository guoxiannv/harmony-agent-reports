import { Theme } from '../common/Theme';
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

@Component
export struct SleepingMembersPage {
  onBack: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private members: Member[] = [];
  @State private selectedIds: Set<string> = new Set<string>();
  @State private thresholdDays: number = 45;
  @State private isReady: boolean = false;
  @State private waking: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    this.thresholdDays = controller.settings.sleepThresholdDays;
    await this.refresh();
  }

  private async refresh(): Promise<void> {
    if (!this.controller) {
      return;
    }
    const list: Member[] = await this.controller.listSleepingMembers();
    this.members = list;
    this.isReady = true;
  }

  private isSelected(id: string): boolean {
    return this.selectedIds.has(id);
  }

  private toggleSelected(id: string): void {
    const next: Set<string> = new Set<string>(this.selectedIds);
    if (next.has(id)) {
      next.delete(id);
    } else {
      next.add(id);
    }
    this.selectedIds = next;
  }

  private allSelected(): boolean {
    return this.members.length > 0 && this.selectedIds.size === this.members.length;
  }

  private selectAll(): void {
    if (this.allSelected()) {
      this.selectedIds = new Set<string>();
    } else {
      const next: Set<string> = new Set<string>();
      for (const m of this.members) {
        next.add(m.id);
      }
      this.selectedIds = next;
    }
  }

  private sleepingDays(m: Member): number {
    if (!m.lastVisitAt) {
      return 0;
    }
    return Math.floor((Date.now() - m.lastVisitAt) / (24 * 60 * 60 * 1000));
  }

  private craftTagLabel(tag: CraftTag): string {
    return craftTagLabelOf(tag);
  }

  private async onWake(): Promise<void> {
    if (this.waking || this.selectedIds.size === 0 || !this.controller) {
      return;
    }
    this.waking = true;
    const ids: string[] = [];
    this.selectedIds.forEach((id: string) => ids.push(id));
    await this.controller.wakeMembers(ids, 50);
    this.selectedIds = new Set<string>();
    this.waking = false;
    await this.refresh();
  }

  build(): void {
    Column() {
      this.HeaderBar()
      this.SummaryCard()
      this.ActionBar()
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
      Column() {
        Text('‹')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .id('sleeping-members-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('沉睡会员')
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
  SummaryCard(): void {
    Column() {
      Row() {
        Text('超过')
          .fontSize(14)
          .fontColor(Theme.textLightSecondary)
        Text(this.thresholdDays.toString())
          .id('sleeping-members-threshold')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.ochre)
          .fontFamily('monospace')
          .margin({ left: 6, right: 6 })
        Text('天未到店的会员')
          .fontSize(14)
          .fontColor(Theme.textLightSecondary)
      }
      .alignItems(VerticalAlign.Bottom)

      Text(this.isReady ? `${this.members.length} 位待唤醒` : '加载中…')
        .fontSize(13)
        .fontColor(Theme.textLight)
        .margin({ top: 8 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(18)
    .backgroundColor(Theme.darkCardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowDarkCard())
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 12 })
  }

  @Builder
  ActionBar(): void {
    Row() {
      Text(this.allSelected() ? '取消全选' : '全选')
        .id('sleeping-members-select-all-button')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.clay)
        .padding({ left: 12, right: 12, top: 8, bottom: 8 })
        .backgroundColor(Theme.clayLight)
        .borderRadius(Theme.radiusPill)
        .onClick(() => this.selectAll())

      Row() {
        Text(this.selectedIds.size > 0 ? `唤醒 +50 积分（${this.selectedIds.size}）` : '唤醒 +50 积分')
          .id('sleeping-members-wake-button')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textLight)
          .backgroundColor(this.selectedIds.size === 0 || this.waking ? Theme.disabledBg : Theme.ochre)
          .borderRadius(Theme.radiusButton)
          .padding({ left: 18, right: 18, top: 10, bottom: 10 })
          .onClick(() => this.onWake())
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 12 })
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
          .id('sleeping-members-list')
          .width('100%')
          .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
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
        if (this.isSelected(m.id)) {
          Text('✓')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textLight)
        }
      }
      .width(28)
      .height(28)
      .borderRadius(14)
      .border({ width: 2, color: this.isSelected(m.id) ? Theme.clay : Theme.borderDefault })
      .backgroundColor(this.isSelected(m.id) ? Theme.clay : Theme.cardBg)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(m.name || '未命名会员')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`已 ${this.sleepingDays(m)} 天未到店`)
          .fontSize(12)
          .fontColor(Theme.ochre)
          .margin({ top: 2 })

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
        }
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 12 })
    }
    .id(`sleeping-member-${m.id}`)
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 12 })
    .onClick(() => this.toggleSelected(m.id))
  }

  @Builder
  EmptyState(): void {
    Column() {
      Column() {
        Text('z')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.clay)
          .fontFamily('cursive')
      }
      .width(64)
      .height(64)
      .borderRadius(32)
      .backgroundColor(Theme.pageBgEnd)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 12 })

      Text('没有沉睡会员')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })

      Text('所有会员都在近期到店，继续保持温度')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .textAlign(TextAlign.Center)
        .lineHeight(20)
    }
    .id('sleeping-members-empty')
    .width('100%')
    .padding({ top: 48, bottom: 48, left: 20, right: 20 })
    .alignItems(HorizontalAlign.Center)
  }
}
