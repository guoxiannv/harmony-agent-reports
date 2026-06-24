import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Member, PointsRecord } from '../model/Models';

@Component
export struct PointsPage {
  onBack: () => void = () => {};
  onRedeem: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private history: PointsRecord[] = [];
  @State private memberCache: Record<string, Member> = {};
  @State private totalBalance: number = 0;
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
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
    const history: PointsRecord[] = await this.controller.listPointsHistory(undefined, 100);
    const cache: Record<string, Member> = {};
    let balance: number = 0;
    const seenIds: Set<string> = new Set<string>();
    for (const rec of history) {
      const mid: string = rec.memberId ?? '';
      if (mid.length > 0) {
        if (!cache[mid]) {
          const m: Member | undefined = await this.controller.getMember(mid);
          if (m) {
            cache[mid] = m;
          }
        }
        if (!seenIds.has(mid)) {
          seenIds.add(mid);
          balance += rec.balanceAfter;
        }
      }
    }
    this.history = history;
    this.memberCache = cache;
    this.totalBalance = balance;
    this.isReady = true;
  }

  private checkInPoints(): number {
    return this.controller && this.controller.settings ? this.controller.settings.checkInPoints : 5;
  }

  private spendRatio(): number {
    return this.controller && this.controller.settings ? this.controller.settings.spendRatio : 1;
  }

  private historyLabel(rec: PointsRecord): string {
    const mid: string = rec.memberId ?? '';
    const member: Member | undefined = mid ? this.memberCache[mid] : undefined;
    const name: string = member && member.name ? member.name : '会员';
    let action: string = '';
    if (rec.type === 'check-in') {
      action = '签到';
    } else if (rec.type === 'course') {
      action = '完成课程';
    } else if (rec.type === 'spend') {
      action = '消费';
    } else if (rec.type === 'redeem') {
      action = '兑换';
    } else if (rec.type === 'wake') {
      action = '唤醒礼遇';
    } else {
      action = rec.description ?? '积分变动';
    }
    return `${name} · ${action}`;
  }

  private historyValueText(rec: PointsRecord): string {
    const sign: string = rec.value >= 0 ? '+' : '';
    return `${sign}${rec.value}`;
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const mm: string = (d.getMonth() + 1).toString().padStart(2, '0');
    const dd: string = d.getDate().toString().padStart(2, '0');
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mi: string = d.getMinutes().toString().padStart(2, '0');
    return `${mm}-${dd} ${hh}:${mi}`;
  }

  build(): void {
    Column() {
      this.HeaderBar()
      Scroll() {
        Column() {
          this.BalanceCard()
          this.RulesCard()
          this.HistorySection()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ bottom: 40 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
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
      .id('points-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text('积分')
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
  BalanceCard(): void {
    Column() {
      Text('会员积分总额')
        .fontSize(13)
        .fontColor(Theme.textLightSecondary)

      Text(this.isReady ? this.totalBalance.toString() : '–')
        .id('points-balance')
        .fontSize(48)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .fontFamily('monospace')
        .margin({ top: 8, bottom: 4 })

      Text('所有会员当前可用积分合计')
        .fontSize(12)
        .fontColor(Theme.textLightSecondary)

      Text('兑换')
        .id('points-redeem-button')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(Theme.ochre)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 22, right: 22, top: 10, bottom: 10 })
        .margin({ top: 14 })
        .onClick(() => this.onRedeem())
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding(22)
    .backgroundColor(Theme.darkCardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowDarkCard())
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 16 })
  }

  @Builder
  RulesCard(): void {
    Row() {
      Column() {
        Text('签到')
          .fontSize(12)
          .fontColor(Theme.textSecondary)
        Row() {
          Text('+')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.moss)
            .fontFamily('monospace')
          Text(this.checkInPoints().toString())
            .id('points-rule-check-in')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .fontFamily('monospace')
        }
        .alignItems(VerticalAlign.Bottom)
        .margin({ top: 4 })
        Text('每次到店')
          .fontSize(11)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text('消费积分比')
          .fontSize(12)
          .fontColor(Theme.textSecondary)
        Row() {
          Text(this.spendRatio().toString())
            .id('points-rule-spend-ratio')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .fontFamily('monospace')
          Text(':1')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textSecondary)
            .fontFamily('monospace')
            .margin({ bottom: 2 })
        }
        .alignItems(VerticalAlign.Bottom)
        .margin({ top: 4 })
        Text('每元换算积分')
          .fontSize(11)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 16 })
  }

  @Builder
  HistorySection(): void {
    Column() {
      Row() {
        Column()
          .width(8)
          .height(8)
          .borderRadius(4)
          .backgroundColor(Theme.clay)
          .margin({ right: 8 })
        Text('积分明细')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Column() {
        if (this.isReady && this.history.length === 0) {
          Text('暂无积分记录')
            .id('points-history-empty')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .padding({ top: 24, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          ForEach(this.history, (rec: PointsRecord, idx: number) => {
            Row() {
              Column() {
                Text(this.historyLabel(rec))
                  .fontSize(14)
                  .fontColor(Theme.textPrimary)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Row() {
                  Text(this.formatTime(rec.createdAt))
                    .fontSize(11)
                    .fontColor(Theme.textSecondary)
                  Text(`余额 ${rec.balanceAfter}`)
                    .fontSize(11)
                    .fontColor(Theme.textSecondary)
                    .margin({ left: 8 })
                }
                .alignItems(VerticalAlign.Center)
                .margin({ top: 2 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)

              Text(this.historyValueText(rec))
                .id(`points-history-${rec.id}`)
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
      .id('points-history-list')
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }
}
