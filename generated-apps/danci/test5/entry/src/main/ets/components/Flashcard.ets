// Flashcard.ets
//
// 3D flip flashcard matching page-review-page.html.
//  - 306 x 400 white card, 28px radius, layered shadow.
//  - Front: yellow sparkle (top-right), large English word (center), hint (bottom).
//  - Back: Chinese meaning, thin divider, phonetic, faint "ABC" watermark.
//
// Flip: animateTo drives `angle` 0<->180 around the Y axis with spring easing.
// One face renders at a time; we swap the rendered face at the midpoint (when
// the card is edge-on) so the swap is never visible. The back face uses
// `angle - 180` so it ends readable (not mirrored).
//
// Icons are stroke-painted rawfile SVGs with baked colors; loaded via
// Image($rawfile(...)) with NO fillColor (SVG gate respected).
//
// Semantic targets: review-flashcard, review-card-front-word,
// review-card-back-meaning, review-card-back-phonetic.

import { Theme } from '../common/Theme';

@Component
export struct Flashcard {
  @Prop word: string = '';
  @Prop meaning: string = '';
  @Prop phonetic: string = '';
  @Prop @Watch('onFlipChanged') isFlipped: boolean = false;
  onTap: () => void = () => {};

  @State private angle: number = 0;
  @State private showFront: boolean = true;
  private animating: boolean = false;

  aboutToAppear(): void {
    this.angle = this.isFlipped ? 180 : 0;
    this.showFront = !this.isFlipped;
  }

  onFlipChanged(): void {
    this.runFlip();
  }

  private runFlip(): void {
    if (this.animating) {
      return;
    }
    const target: number = this.isFlipped ? 180 : 0;
    this.animating = true;
    animateTo({ duration: 700, curve: Curve.EaseInOut, onFinish: () => {
      this.animating = false;
    } }, () => {
      this.angle = target;
    });
    // Swap rendered face at the midpoint (card edge-on, content invisible).
    setTimeout(() => {
      this.showFront = !this.isFlipped;
    }, 350);
  }

  build() {
    Stack() {
      if (this.showFront) {
        this.FrontFace()
      } else {
        this.BackFace()
      }
    }
    .id('review-flashcard')
    .width(Theme.cardWidth)
    .height(Theme.cardHeight)
    .onClick(() => {
      if (!this.animating) {
        this.onTap();
      }
    })
  }

  @Builder
  FrontFace() {
    Stack({ alignContent: Alignment.Center }) {
      // Main word, centered
      Text(this.word)
        .id('review-card-front-word')
        .fontSize(54)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.ink)
        .textAlign(TextAlign.Center)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      // Sparkle decoration, top-right
      Stack({ alignContent: Alignment.TopEnd }) {
        Image($rawfile('icon_Sparkle-decoration-on-flashcard-front.svg'))
          .width(28)
          .height(28)
          .draggable(false)
          .margin({ top: 18, right: 18 })
      }
      .width('100%')
      .height('100%')

      // Hint label, bottom center
      Stack({ alignContent: Alignment.Bottom }) {
        Text('点我查看释义')
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.slate)
          .opacity(0.85)
          .margin({ bottom: 24 })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding(28)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 56, color: '#1F293721', offsetX: 0, offsetY: 28 })
    .rotate({ x: 0, y: 1, z: 0, angle: this.angle, centerX: '50%', centerY: '50%' })
  }

  @Builder
  BackFace() {
    Stack({ alignContent: Alignment.Center }) {
      Column() {
        Text(this.meaning)
          .id('review-card-back-meaning')
          .fontSize(36)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.ink)
          .textAlign(TextAlign.Center)
          .maxLines(4)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Divider()
          .color(Theme.cardDivider)
          .strokeWidth(1)
          .width(56)
          .margin({ top: 10, bottom: 10 })

        Text(this.phonetic)
          .id('review-card-back-phonetic')
          .fontSize(20)
          .fontWeight(FontWeight.Regular)
          .fontColor(Theme.slate)
          .textAlign(TextAlign.Center)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      // Faint "ABC" watermark, bottom-right
      Stack({ alignContent: Alignment.BottomEnd }) {
        Text('ABC')
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1F293709')
          .margin({ bottom: 18, right: 20 })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding(28)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 56, color: '#1F293721', offsetX: 0, offsetY: 28 })
    .rotate({ x: 0, y: 1, z: 0, angle: this.angle - 180, centerX: '50%', centerY: '50%' })
  }
}
