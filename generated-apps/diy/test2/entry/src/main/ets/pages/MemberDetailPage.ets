import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CRAFT_TAG_LABELS, CraftTag, Member, PointsRecord } from '../model/Models';

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

interface GalleryItem {
  id: string;
  label: string;
}

@Component
export struct MemberDetailPage {
  memberId: string = '';
  onBack: () => void = () => {};
  onEdit: () => void = () => {};
  onOpenPoints: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private member: Member | null = null;
  @State private history: PointsRecord[] = [];
  @State private isSleeping: boolean = false;
  @State private sleepingDaysValue: number = 0;
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    await this.refresh();
  }

  private async refresh(): Promise<void> {
    if (!this.controller || !this.memberId) {
      this.isReady = true;
      return;
    }
    const m: Member | undefined = await this.controller.getMember(this.memberId);
    const history: PointsRecord[] = await this.controller.listPointsHistory(this.memberId, 20);
    const sleeping: Member[] = await this.controller.listSleepingMembers();
    const sleepingHit: Member | undefined = sleeping.find((x: Member) => x.id === this.memberId);

    this.member = m ?? null;
    this.history = history;
    this.isSleeping = !!sleepingHit;
    this.sleepingDaysValue = m && m.lastVisitAt
      ? Math.floor((Date.now() - m.lastVisitAt) / (24 * 60 * 60 * 1000))
      : 0;
    this.isReady = true;
  }

  private memberInitial(): string {
    const m = this.member;
    if (!m || !m.name) {
      return '?';
    }
    return m.name.charAt(0);
  }

  private maskedPhone(): string {
    const m = this.member;
    if (!m || !m.phone) {
      return '—';
    }
    const p: string = m.phone;
    if (p.length < 7) {
      return p;
    }
    const head: string = p.substring(0, 3);
    const tail: string = p.substring(p.length - 4);
    return `${head} **** ${tail}`;
  }

  private craftTagLabel(tag: CraftTag): string {
    return craftTagLabelOf(tag);
  }

  private historyLabel(rec: PointsRecord): string {
    if (rec.description && rec.description.length > 0) {
      return rec.description;
    }
    if (rec.type === 'check-in') {
      return '到店签到';
    } else if (rec.type === 'course') {
      return '完成课程';
    } else if (rec.type === 'spend') {
      return '消费积分';
    } else if (rec.type === 'redeem') {
      return '兑换';
    } else if (rec.type === 'wake') {
      return '唤醒礼遇';
    }
    return '积分变动';
  }

  private historyValueText(rec: PointsRecord): string {
    const sign = rec.value >= 0 ? '+' : '';
    return `${sign}${rec.value}`;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const yyyy: number = d.getFullYear();
    const mm: string = (d.getMonth() + 1).toString().padStart(2, '0');
    const dd: string = d.getDate().toString().padStart(2, '0');
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mi: string = d.getMinutes().toString().padStart(2, '0');
    return `${yyyy}-${mm}-${dd} ${hh}:${mi}`;
  }

  private galleryItems(): GalleryItem[] {
    const m = this.member;
    if (!m) {
      return [];
    }
    if (m.gallery && m.gallery.length > 0) {
      const items: GalleryItem[] = [];
      for (let i = 0; i < m.gallery.length; i++) {
        const path: string = m.gallery[i];
        items.push({ id: path.length > 0 ? path : `g${i}`, label: `作品图 ${i + 1}` });
      }
      return items;
    }
    return [];
  }

  private historyIcon(rec: PointsRecord): string {
    if (rec.type === 'check-in') {
      return 'course-pottery';
    } else if (rec.type === 'redeem') {
      return 'course-woodwork';
    }
    return 'course-pottery';
  }

  build(): void {
    Scroll() {
      Column() {
        this.HeaderBar()
        if (!this.isReady) {
          Text('加载中…')
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .padding({ top: 80 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else if (!this.member) {
          Text('会员不存在')
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .padding({ top: 80 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          this.ProfileCard()
          this.CraftTagsSection()
          this.GallerySection()
          this.PointsHistorySection()
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
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
      .id('member-detail-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('会员详情')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .margin({ left: 12 })

      Text('编辑')
        .id('member-detail-edit-button')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.clay)
        .padding({ left: 8, right: 8, top: 8, bottom: 8 })
        .onClick(() => this.onEdit())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  ProfileCard(): void {
    Column() {
      Column() {
        Text(this.memberInitial())
          .fontSize(32)
          .fontWeight(FontWeight.Medium)
          .fontColor('#5D4237')
          .fontFamily('monospace')
      }
      .width(84)
      .height(84)
      .borderRadius(42)
      .backgroundColor(Theme.pageBgEnd)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 14 })

      Text(this.member ? this.member.name : '—')
        .id('member-detail-name')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 4 })

      Text(this.maskedPhone())
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .margin({ bottom: 12 })

      Row() {
        Text(this.member ? this.member.points.toString() : '0')
          .id('member-detail-points')
          .fontSize(24)
          .fontWeight(FontWeight.Medium)
          .fontColor('#8F6A3A')
          .fontFamily('monospace')
        Text('积分')
          .fontSize(13)
          .fontColor('#8F6A3A')
          .margin({ left: 6, bottom: 2 })
      }
      .alignItems(VerticalAlign.Bottom)
      .backgroundColor('rgba(217, 169, 109, 0.18)')
      .borderRadius(Theme.radiusPill)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .margin({ bottom: 12 })

      if (this.isSleeping) {
        Text(`沉睡 ${this.sleepingDaysValue} 天`)
          .id('member-detail-sleeping-badge')
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textLight)
          .backgroundColor(Theme.ochre)
          .borderRadius(8)
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
      }
    }
    .width('100%')
    .padding(22)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .alignItems(HorizontalAlign.Center)
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  SectionTitle(title: string): void {
    Row() {
      Column()
        .width(8)
        .height(8)
        .borderRadius(4)
        .backgroundColor(Theme.clay)
        .margin({ right: 8 })
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
    }
    .alignItems(VerticalAlign.Center)
    .margin({ top: 24, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  CraftTagsSection(): void {
    Column() {
      this.SectionTitle('擅长工艺')

      Flex({ wrap: FlexWrap.Wrap }) {
        if (this.member && this.member.craftTags.length > 0) {
          ForEach(this.member.craftTags, (tag: CraftTag) => {
            Text(this.craftTagLabel(tag))
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor('#5D4237')
              .backgroundColor(Theme.clayLight)
              .borderRadius(Theme.radiusPill)
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .margin({ right: 8, bottom: 8 })
          }, (tag: CraftTag) => tag)
        } else {
          Text('未设置工艺标签')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
        }
      }
      .id('member-detail-craft-tags')
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  GallerySection(): void {
    Column() {
      this.SectionTitle('作品集')

      if (this.galleryItems().length === 0) {
        Text('还没有上传作品，点击编辑添加')
          .id('member-gallery-empty')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .padding({ top: 24, bottom: 24 })
          .width('100%')
          .textAlign(TextAlign.Center)
      } else {
        Grid() {
          ForEach(this.galleryItems(), (item: GalleryItem, idx: number) => {
            GridItem() {
              Column() {
                Text(item.label)
                  .fontSize(13)
                  .fontColor('#B9AEA4')
              }
              .id(`member-gallery-${item.id}`)
              .width('100%')
              .aspectRatio(1)
              .backgroundColor(Theme.pageBgEnd)
              .borderRadius(18)
              .border({ width: 2, color: Theme.cardBg })
              .shadow({ radius: 16, color: 'rgba(58, 45, 40, 0.1)', offsetY: 6 })
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)
              .rotate({ x: 0, y: 0, z: 1, angle: idx % 2 === 0 ? -1.5 : 1.5 })
            }
          }, (item: GalleryItem) => item.id)
        }
        .id('member-detail-gallery-list')
        .columnsTemplate('1fr 1fr')
        .columnsGap(12)
        .rowsGap(12)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  PointsHistorySection(): void {
    Column() {
      this.SectionTitle('积分明细')

      Column() {
        if (this.history.length === 0) {
          Text('暂无积分记录')
            .id('member-points-empty')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .padding({ top: 24, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          ForEach(this.history, (rec: PointsRecord, idx: number) => {
            Row() {
              Row() {
                SvgIcon({ variant: this.historyIcon(rec), iconSize: 18 })
              }
              .width(36)
              .height(36)
              .borderRadius(10)
              .backgroundColor('rgba(184, 131, 99, 0.1)')
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)

              Column() {
                Text(this.historyLabel(rec))
                  .fontSize(14)
                  .fontColor(Theme.textPrimary)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(this.formatTime(rec.createdAt))
                  .fontSize(12)
                  .fontColor(Theme.textSecondary)
                  .margin({ top: 2 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .margin({ left: 10 })

              Text(this.historyValueText(rec))
                .id(`member-points-item-${rec.id}`)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(rec.value >= 0 ? Theme.moss : Theme.ochre)
                .fontFamily('monospace')
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .padding({ top: 12, bottom: 12 })
            .border(idx < this.history.length - 1
              ? { width: { bottom: 1.5 }, color: { bottom: Theme.dashedDivider }, style: { bottom: BorderStyle.Dashed } }
              : { width: 0 })
          }, (rec: PointsRecord) => rec.id)
        }
      }
      .id('member-detail-points-history-list')
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}
