import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { PointsTransaction } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct PointsPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBack: () => void = () => {};

  @State filter: 'all' | 'income' | 'expense' = 'all';

  build() {
    Column() {
      this.BackHeader('积分明细')

      Scroll() {
        Column({ space: 16 }) {
          Row() {
            Column({ space: 6 }) {
              Text('当前积分')
                .fontSize(13)
                .fontColor(Theme.textOnBrand)
                .opacity(0.9)
              Text(`${this.currentPoints()}`)
                .id('points-balance')
                .fontSize(42)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnBrand)
            }
            .alignItems(HorizontalAlign.Start)

            Button('签到', { type: ButtonType.Normal })
              .id('points-checkin-button')
              .height(44)
              .borderRadius(16)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.brandPrimary)
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
              .padding({ left: 20, right: 20 })
              .onClick(() => this.doCheckin())
          }
          .width('100%')
          .padding(24)
          .borderRadius(Theme.radiusCard)
          .linearGradient({
            angle: 135,
            direction: GradientDirection.RightTop,
            colors: [[Theme.brandPrimary, 0.0], [Theme.brandDark, 1.0]]
          })
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Row({ space: 10 }) {
            this.FilterChip('全部', 'all', 'points-filter-all')
            this.FilterChip('收入', 'income', 'points-filter-income')
            this.FilterChip('支出', 'expense', 'points-filter-expense')
          }
          .width('100%')

          Column({ space: 0 }) {
            ForEach(this.filteredTransactions(), (t: PointsTransaction, index: number) => {
              this.PointsItem(t, index)
            }, (t: PointsTransaction) => t.id)
          }
          .id('points-list')
          .width('100%')
          .padding({ top: 8, bottom: 8 })
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.filteredTransactions().length === 0) {
            Column({ space: 12 }) {
              Text('暂无积分记录')
                .id('points-empty-state')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Text('签到或消费后将自动累计积分')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(48)
          }
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  BackHeader(title: string) {
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

      Row() {
        Button({ type: ButtonType.Circle }) {
          Text('<')
            .fontSize(18)
            .fontColor(Theme.textOnBrand)
        }
        .id('back-button')
        .width(40)
        .height(40)
        .backgroundColor('rgba(255,255,255,0.16)')
        .onClick(() => this.onBack())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  FilterChip(label: string, value: 'all' | 'income' | 'expense', targetId: string) {
    Button(label, { type: ButtonType.Normal })
      .id(targetId)
      .height(40)
      .layoutWeight(1)
      .borderRadius(Theme.radiusSmall)
      .backgroundColor(this.filter === value ? Theme.brandPrimary : Theme.cardBg)
      .fontColor(this.filter === value ? Theme.textOnBrand : Theme.textSecondary)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .onClick(() => this.filter = value)
  }

  @Builder
  PointsItem(t: PointsTransaction, index: number) {
    Row() {
      Row({ space: 12 }) {
        Column() {
          CheckinIcon({ iconSize: 22, color: t.type === 'income' ? Theme.brandPrimary : Theme.alert })
        }
        .width(44)
        .height(44)
        .borderRadius(Theme.radiusTiny)
        .backgroundColor(Theme.brandSoft)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Column({ space: 4 }) {
          Text(t.source)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Text(this.formatDate(t.createdAt))
            .fontSize(12)
            .fontColor(Theme.textSecondary)
        }
        .alignItems(HorizontalAlign.Start)
      }

      Column({ space: 2 }) {
        Text(`${t.type === 'income' ? '+' : '-'}${t.amount}`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(t.type === 'income' ? Theme.brandPrimary : Theme.alert)
        Text(this.formatTime(t.createdAt))
          .fontSize(11)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .padding({ top: 16, bottom: 16 })
    .border({ width: { bottom: index < this.filteredTransactions().length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  private currentPoints(): number {
    const m = this.state.currentMember();
    return m ? m.points : 0;
  }

  private filteredTransactions(): PointsTransaction[] {
    if (this.filter === 'all') return this.state.currentPoints;
    return this.state.currentPoints.filter(t => t.type === this.filter);
  }

  private doCheckin(): void {
    this.ctrl.checkinCurrent().then((err) => {
      if (err) {
        promptAction.showToast({ message: err });
      } else {
        promptAction.showToast({ message: '签到成功 +5 积分' });
      }
    });
  }

  private formatDate(ts: number): string {
    const d = new Date(ts);
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${m}月${day}日`;
  }

  private formatTime(ts: number): string {
    const d = new Date(ts);
    const h = String(d.getHours()).padStart(2, '0');
    const mi = String(d.getMinutes()).padStart(2, '0');
    return `${h}:${mi}`;
  }
}

@Component
struct CheckinIcon {
  @Prop iconSize: number = 22;
  @Prop color: string = Theme.brandPrimary;

  build() {
    Path()
      .commands('M12 2v20M2 12h20')
      .stroke(this.color)
      .strokeWidth(2)
      .fill(Color.Transparent)
      .width(this.iconSize)
      .height(this.iconSize)
  }
}
