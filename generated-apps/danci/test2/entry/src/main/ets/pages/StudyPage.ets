import { curves } from '@kit.ArkUI';
import { Theme, BrandGradient } from '../common/Theme';
import { WordItem } from '../model/WordItem';
import { loadStage } from '../services/WordBankService';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct StudyPage {
  @State queue: WordItem[] = [];
  @State knownCount: number = 0;
  @State remainingCount: number = 0;
  @State totalCount: number = 0;
  @State currentWord: WordItem | undefined = undefined;
  @State isComplete: boolean = false;
  @State isFlipped: boolean = false;
  @State cardRotation: number = 0;
  @State slideOffsetX: number = 0;
  @State slideOpacity: number = 1;

  private readonly cardWidth: number = 360;
  private readonly cardHeight: number = 460;

  aboutToAppear(): void {
    const words: WordItem[] = loadStage();
    this.queue = words;
    this.knownCount = 0;
    this.syncFromQueue();
  }

  private syncFromQueue(): void {
    this.remainingCount = this.queue.length;
    this.totalCount = this.queue.length + this.knownCount;
    this.currentWord = this.queue.length > 0 ? this.queue[0] : undefined;
    this.isComplete = this.totalCount > 0 && this.queue.length === 0;
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Column() {
        this.Header()
        this.CardStage()
      }
      .width('100%')
      .height('100%')
      .padding({
        left: Theme.pageHorizontalPadding,
        right: Theme.pageHorizontalPadding,
        bottom: 112
      })

      this.ActionBar()

      if (this.isComplete) {
        this.CompletionOverlay()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header() {
    Column() {
      Row() {
        Row({ space: 10 }) {
          SvgIcon({ variant: 'brand', iconSize: 26, color: Theme.brandPrimary, strokeWidth: 2 })
          Text('今日复习')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.brandPrimary)
            .letterSpacing(-0.2)
        }

        Row({ space: 20 }) {
          Column() {
            Text(`${this.remainingCount}`)
              .id('study-remaining-count')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .letterSpacing(-0.3)

            Text('剩余')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textTertiary)
              .letterSpacing(0.4)
              .margin({ top: 2 })
          }
          .alignItems(HorizontalAlign.End)

          Column() {
            Text(`${this.knownCount}`)
              .id('study-known-count')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .letterSpacing(-0.3)

            Text('已认识')
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textTertiary)
              .letterSpacing(0.4)
              .margin({ top: 2 })
          }
          .alignItems(HorizontalAlign.End)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      Stack() {
        Row()
          .width('100%')
          .height(10)
          .borderRadius(5)
          .backgroundColor(Theme.borderDefault)

        Row()
          .width(this.totalCount === 0 ? '0%' : `${(this.knownCount / this.totalCount) * 100}%`)
          .height(10)
          .borderRadius(5)
          .linearGradient(BrandGradient.progress)
          .animation({ duration: 350, curve: Curve.EaseOut })
      }
      .width('100%')
      .margin({ top: 16 })
    }
    .id('study-progress-header')
    .width('100%')
    .padding({ top: 56, bottom: 16 })
    .backgroundColor(Theme.glassBg)
    .backdropBlur(20)
    .borderRadius({ bottomLeft: 24, bottomRight: 24 })
  }

  @Builder
  CardStage() {
    Column() {
      if (this.currentWord !== undefined) {
        Stack() {
          // Front face: english word.
          Column() {
            this.CardBadge('flipHint', '点我翻面')
            Text(this.currentWord.english)
              .id('study-word-front')
              .fontSize(54)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .letterSpacing(-0.6)
              .lineHeight(54)
              .textAlign(TextAlign.Center)

            Text('点击卡片查看释义')
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textTertiary)
              .position({ y: 180 })
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .border({ width: 1, color: Theme.borderSoft })
          .shadow({ radius: 60, color: 'rgba(107,78,230,0.18)', offsetY: 20 })
          .shadow({ radius: 24, color: 'rgba(45,42,74,0.08)', offsetY: 8 })
          .rotate({ x: 0, y: 1, z: 0, angle: this.cardRotation })
          .opacity(this.cardRotation <= 90 ? 1 : 0)
          .animation({ duration: 400, curve: Curve.EaseInOut })

          // Back face: meaning + phonetic, pre-rotated to face the user at 180.
          Column() {
            Text('释义')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.brandPrimary)
              .letterSpacing(0.5)
              .padding({ left: 16, right: 16, top: 8, bottom: 8 })
              .backgroundColor('rgba(184,176,230,0.22)')
              .borderRadius(Theme.radiusPill)
              .margin({ bottom: 28 })

            Text(this.currentWord.phonetic)
              .id('study-word-back-phonetic')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textTertiary)
              .letterSpacing(0.2)
              .lineHeight(27)

            Row()
              .width(60)
              .height(1)
              .border({ width: { top: 1 }, color: Theme.cardDivider, style: { top: BorderStyle.Dashed } })
              .margin({ top: 18, bottom: 22 })

            Text(this.currentWord.meaning)
              .id('study-word-back-meaning')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .lineHeight(40.5)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor(Theme.cardBackBg)
          .borderRadius(Theme.radiusCard)
          .border({ width: 1, color: Theme.borderSoft })
          .shadow({ radius: 60, color: 'rgba(107,78,230,0.18)', offsetY: 20 })
          .shadow({ radius: 24, color: 'rgba(45,42,74,0.08)', offsetY: 8 })
          .rotate({ x: 0, y: 1, z: 0, angle: this.cardRotation - 180 })
          .opacity(this.cardRotation > 90 ? 1 : 0)
          .animation({ duration: 400, curve: Curve.EaseInOut })
        }
        .id('study-flashcard')
        .width('100%')
        .constraintSize({ maxWidth: this.cardWidth })
        .height(this.cardHeight)
        .margin({ top: 48 })
        .onClick(() => this.onFlip())
        .translate({ x: this.slideOffsetX })
        .opacity(this.slideOpacity)
        .animation({ duration: 350, curve: Curve.EaseOut })
      } else {
        this.EmptyState()
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  CardBadge(iconVariant: string, label: string) {
    Row({ space: 6 }) {
      SvgIcon({ variant: iconVariant, iconSize: 16, color: Theme.brandPrimary, strokeWidth: 2 })
      Text(label)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandPrimary)
    }
    .padding({ left: 14, right: 14, top: 8, bottom: 8 })
    .backgroundColor('rgba(255,255,255,0.85)')
    .borderRadius(Theme.radiusPill)
    .border({ width: 1, color: Theme.borderSoft })
    .position({ y: -160 })
  }

  @Builder
  EmptyState() {
    Column() {
      Text('还没有单词哦')
        .id('study-empty-state')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 8 })

      Text('当前阶段词库为空，请联系家长添加单词。')
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(this.cardHeight)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ top: 48 })
  }

  @Builder
  ActionBar() {
    Row({ space: 14 }) {
      this.ActionButton(
        '不认识',
        'unknown',
        'study-unknown-button',
        BrandGradient.unknownBtn,
        Theme.accentOrange,
        () => this.onMarkUnknown()
      )
      this.ActionButton(
        '认识',
        'known',
        'study-known-button',
        BrandGradient.knownBtn,
        Theme.accentGreen,
        () => this.onMarkKnown()
      )
    }
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 28 })
    .backgroundColor(Theme.glassBg)
    .backdropBlur(20)
    .borderRadius({ topLeft: 24, topRight: 24 })
    .position({ y: '100%' })
    .translate({ y: -108 })
  }

  @Builder
  ActionButton(label: string, iconVariant: string, idValue: string, gradient: LinearGradient,
    shadowColor: string, onClick: () => void) {
    Button() {
      Row({ space: 8 }) {
        SvgIcon({ variant: iconVariant, iconSize: 20, color: '#FFFFFF', strokeWidth: 2.5 })
        Text(label)
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
    }
    .id(idValue)
    .type(ButtonType.Normal)
    .borderRadius(Theme.radiusButton)
    .backgroundColor(Color.Transparent)
    .linearGradient(gradient)
    .height(60)
    .layoutWeight(1)
    .shadow({ radius: 32, color: `${shadowColor}73`, offsetY: 12 })
    .onClick(onClick)
  }

  @Builder
  CompletionOverlay() {
    Stack() {
      // Decorative floating stars (no semantic IDs).
      SvgIcon({ variant: 'decoStar1', iconSize: 18 })
        .position({ x: '12%', y: '10%' })
        .opacity(0.35)
      SvgIcon({ variant: 'decoStar2', iconSize: 14 })
        .position({ x: '78%', y: '16%' })
        .opacity(0.35)
      SvgIcon({ variant: 'decoStar3', iconSize: 12 })
        .position({ x: '10%', y: '40%' })
        .opacity(0.35)
      SvgIcon({ variant: 'decoStar4', iconSize: 20 })
        .position({ x: '82%', y: '72%' })
        .opacity(0.35)
      SvgIcon({ variant: 'decoStar5', iconSize: 10 })
        .position({ x: '18%', y: '84%' })
        .opacity(0.35)

      Column() {
        Stack() {
          Column()
            .width(120)
            .height(120)
            .borderRadius(60)
            .linearGradient({
              angle: 135,
              direction: GradientDirection.RightTop,
              colors: [[Theme.goldStart, 0.0], [Theme.gold, 1.0]]
            })
            .shadow({ radius: 40, color: 'rgba(255,211,110,0.45)', offsetY: 16 })

          SvgIcon({ variant: 'star', iconSize: 64, color: Theme.goldDark, strokeWidth: 1.5 })
        }
        .margin({ bottom: 28 })

        Text('太棒了！')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandPrimary)
          .letterSpacing(-0.4)
          .lineHeight(44)
          .margin({ bottom: 10 })

        Text(`已认识 ${this.knownCount} / ${this.totalCount} 个单词`)
          .id('study-completion-desc')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textSecondary)
          .margin({ bottom: 36 })

        Button() {
          Row({ space: 8 }) {
            SvgIcon({ variant: 'restart', iconSize: 20, color: '#FFFFFF', strokeWidth: 2.5 })
            Text('再复习一次')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }
        }
        .id('study-restart-button')
        .type(ButtonType.Normal)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Color.Transparent)
        .linearGradient(BrandGradient.primary)
        .width('100%')
        .constraintSize({ maxWidth: 320 })
        .height(60)
        .shadow({ radius: 32, color: 'rgba(107,78,230,0.40)', offsetY: 12 })
        .onClick(() => this.onRestart())
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ left: 24, right: 24 })
    }
    .id('study-completion-panel')
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Transparent)
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Bottom,
      colors: [['#F0E9FF', 0.0], ['#FAF8FF', 0.55], ['#FAF8FF', 1.0]]
    })
  }

  // toggle-flip-card: card flip driven by animateTo (800ms overshoot).
  private onFlip(): void {
    this.isFlipped = !this.isFlipped;
    const target: number = this.isFlipped ? 180 : 0;
    animateTo({ duration: 800, curve: curves.cubicBezierCurve(0.34, 1.56, 0.64, 1) }, () => {
      this.cardRotation = target;
    });
  }

  private onMarkKnown(): void {
    if (this.currentWord === undefined) {
      return;
    }
    this.animateCardOut(1, () => {
      this.queue = this.queue.slice(1);
      this.knownCount += 1;
      this.isFlipped = false;
      this.cardRotation = 0;
      this.syncFromQueue();
      this.resetCardAnimation();
    });
  }

  private onMarkUnknown(): void {
    if (this.currentWord === undefined) {
      return;
    }
    this.animateCardOut(-1, () => {
      const head: WordItem = this.queue[0];
      this.queue = this.queue.slice(1).concat([head]);
      this.isFlipped = false;
      this.cardRotation = 0;
      this.syncFromQueue();
      this.resetCardAnimation();
    });
  }

  private onRestart(): void {
    this.queue = loadStage();
    this.knownCount = 0;
    this.isFlipped = false;
    this.cardRotation = 0;
    this.syncFromQueue();
  }

  private animateCardOut(direction: number, onDone: () => void): void {
    this.slideOffsetX = direction * 400;
    this.slideOpacity = 0;
    setTimeout(onDone, 360);
  }

  private resetCardAnimation(): void {
    this.slideOffsetX = 0;
    this.slideOpacity = 1;
  }
}
