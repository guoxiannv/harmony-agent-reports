// Review.ets
//
// WordFlip Kids — single review surface (route pages/Review).
//
// Visual source: .arkpilot/designs/page-review-page.html + design-alignment.md.
// Behavior source: ReviewController (FIFO queue) + WordBankService (rawfile bank).
//
// Spec requires NO bottom tab and direct boot into the review page, so this is
// the @Entry page. The glass header, 3D flashcard, action bar, empty state, and
// completion overlay are all rendered here. Semantic IDs match ui-tree.json.

import { common } from '@kit.AbilityKit';
import { ReviewController } from '../controller/ReviewController';
import { Flashcard } from '../components/Flashcard';

@Entry
@Component
struct Review {
  private controller: ReviewController = new ReviewController();
  private context: common.Context | null = null;

  // State mirrors of the controller (ui-tree bindings).
  @State remainingCount: number = 0;
  @State correctCount: number = 0;
  @State totalCount: number = 0;
  @State flipped: boolean = false;
  @State currentEnglish: string = '';
  @State currentMeaning: string = '';
  @State currentPhonetic: string = '';
  @State isQueueEmpty: boolean = true;
  @State isComplete: boolean = false;

  aboutToAppear(): void {
    this.context = getContext(this) as common.Context;
    this.startRound();
  }

  private startRound(): void {
    if (this.context === null) {
      return;
    }
    this.controller.startRound(this.context);
    this.syncFromController();
  }

  private syncFromController(): void {
    this.remainingCount = this.controller.remainingCount;
    this.correctCount = this.controller.correctCountValue;
    this.totalCount = this.controller.totalCountValue;
    this.flipped = this.controller.isFlipped;
    const word = this.controller.currentWord;
    if (word !== null) {
      this.currentEnglish = word.english;
      this.currentMeaning = word.meaning;
      this.currentPhonetic = word.phonetic;
    } else {
      this.currentEnglish = '';
      this.currentMeaning = '';
      this.currentPhonetic = '';
    }
    this.isQueueEmpty = this.controller.isQueueEmpty;
    this.isComplete = this.controller.isRoundComplete;
  }

  // ---- Events (ui-tree) -------------------------------------------------

  private onFlip(): void {
    this.controller.toggleFlip();
    this.flipped = this.controller.isFlipped;
  }

  private onKnown(): void {
    this.controller.markKnown();
    this.syncFromController();
  }

  private onUnknown(): void {
    this.controller.markUnknown();
    this.syncFromController();
  }

  private onRestart(): void {
    if (this.context === null) {
      return;
    }
    this.controller.restart(this.context);
    this.syncFromController();
  }

  build() {
    Stack() {
      // Page content (centered, max-width 390 per spec).
      Column() {
        this.Header()

        if (this.isQueueEmpty) {
          this.EmptyState()
        } else {
          this.CardScene()
        }
      }
      .width('100%')
      .height('100%')
      .constraintSize({ maxWidth: 390 })
      .backgroundColor('#F5F0EA')
      .padding({ top: 20, left: 20, right: 20, bottom: 28 })

      if (this.isComplete) {
        this.CompletionOverlay()
      }
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.Center)
  }

  // ---- Header (title + remaining/correct stats) ------------------------

  @Builder
  Header() {
    Row() {
      // Title wrap: status dot + page title.
      Row() {
        Row()
          .width(8)
          .height(8)
          .borderRadius(4)
          .backgroundColor('#0D9488')

        Text('今日复习')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1E293B')
          .margin({ left: 10 })
      }
      .alignItems(VerticalAlign.Center)

      // Stats.
      Row() {
        Column() {
          Text(`${this.remainingCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#1E293B')
            .id('review-remaining-count')
          Text('剩余')
            .fontSize(11)
            .fontWeight(FontWeight.Bold)
            .fontColor('#94A3B8')
            .margin({ top: 3 })
        }
        .backgroundColor('#FFFFFF')
        .borderRadius(14)
        .padding({ top: 8, bottom: 8, left: 12, right: 12 })
        .margin({ right: 10 })

        Column() {
          Text(`${this.correctCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#1E293B')
            .id('review-correct-count')
          Text('答对')
            .fontSize(11)
            .fontWeight(FontWeight.Bold)
            .fontColor('#94A3B8')
            .margin({ top: 3 })
        }
        .backgroundColor('#FFFFFF')
        .borderRadius(14)
        .padding({ top: 8, bottom: 8, left: 12, right: 12 })
      }
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .padding({ top: 18, bottom: 18, left: 22, right: 22 })
    .borderRadius(22)
    .backgroundColor('rgba(255,255,255,0.82)')
    .border({ width: 1, color: 'rgba(255,255,255,0.7)' })
    .backdropBlur(24)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .id('review-title')
  }

  // ---- Card scene + action bar -----------------------------------------

  @Builder
  CardScene() {
    Column() {
      Blank()

      Flashcard({
        english: this.currentEnglish,
        meaning: this.currentMeaning,
        phonetic: this.currentPhonetic,
        flipped: this.flipped,
        onFlip: (): void => this.onFlip(),
      })

      this.ActionBar()
    }
    .layoutWeight(1)
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  ActionBar() {
    Row() {
      // 不认识 (mark-unknown) — order matches the HTML.
      Column() {
        Image($rawfile('icon_将当前单词放回队列底部稍后复习.svg'))
          .width(20)
          .height(20)
          .draggable(false)
        Text('不认识')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ left: 8 })
      }
      .layoutWeight(1)
      .height(60)
      .borderRadius(20)
      .linearGradient({ angle: 135, colors: [['#FB923C', 0.0], ['#F97316', 1.0]] })
      .shadow({ radius: 28, color: 'rgba(249,115,22,0.35)', offsetX: 0, offsetY: 10 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ right: 8 })
      .onClick(() => this.onUnknown())
      .id('review-unknown-button')

      // 认识 (mark-known).
      Column() {
        Image($rawfile('icon_标记当前单词为已认识并移出卡片堆.svg'))
          .width(20)
          .height(20)
          .draggable(false)
        Text('认识')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .margin({ left: 8 })
      }
      .layoutWeight(1)
      .height(60)
      .borderRadius(20)
      .linearGradient({ angle: 135, colors: [['#22C55E', 0.0], ['#0D9488', 1.0]] })
      .shadow({ radius: 28, color: 'rgba(13,148,136,0.35)', offsetX: 0, offsetY: 10 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ left: 8 })
      .onClick(() => this.onKnown())
      .id('review-known-button')
    }
    .width('100%')
    .margin({ top: 32 })
  }

  // ---- Empty state ------------------------------------------------------

  @Builder
  EmptyState() {
    Column() {
      Column() {
        Image($rawfile('icon_还没有可复习的单词.svg'))
          .width(56)
          .height(56)
          .draggable(false)
      }
      .width(120)
      .height(120)
      .borderRadius(60)
      .backgroundColor('#EDE9FE')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 24 })

      Text('还没有可复习的单词哦')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1E293B')
        .margin({ bottom: 8 })

      Text('先去学习新单词，再来这里复习吧～')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor('#475569')
        .textAlign(TextAlign.Center)
    }
    .layoutWeight(1)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .id('review-empty-state')
  }

  // ---- Completion overlay ----------------------------------------------

  @Builder
  CompletionOverlay() {
    Stack() {
      Column() {
        // Badge with completion check icon.
        Column() {
          Image($rawfile('icon_本轮复习完成.svg'))
            .width(40)
            .height(40)
            .draggable(false)
        }
        .width(80)
        .height(80)
        .borderRadius(40)
        .linearGradient({ angle: 135, colors: [['#0D9488', 0.0], ['#0EA5E9', 0.55], ['#8B5CF6', 1.0]] })
        .shadow({ radius: 48, color: 'rgba(139,92,246,0.32)', offsetX: 0, offsetY: 18 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 20 })

        Text('太棒了！')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1E293B')
          .margin({ bottom: 24 })

        // Correct count.
        Text(`${this.correctCount}`)
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0D9488')
          .margin({ bottom: 6 })

        Text('答对单词')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#94A3B8')
          .margin({ bottom: 24 })

        // Restart button.
        Text('再学一次')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .height(56)
          .borderRadius(18)
          .linearGradient({ angle: 135, colors: [['#0D9488', 0.0], ['#0EA5E9', 0.55], ['#8B5CF6', 1.0]] })
          .shadow({ radius: 28, color: 'rgba(139,92,246,0.32)', offsetX: 0, offsetY: 10 })
          .textAlign(TextAlign.Center)
          .onClick(() => this.onRestart())
          .id('review-restart-button')
      }
      .width('100%')
      .constraintSize({ maxWidth: 330 })
      .padding(32)
      .borderRadius(32)
      .backgroundColor('#FFFFFF')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('rgba(40,36,32,0.50)')
    .backdropBlur(5)
    .alignContent(Alignment.Center)
    .id('review-completion-overlay')
  }
}
