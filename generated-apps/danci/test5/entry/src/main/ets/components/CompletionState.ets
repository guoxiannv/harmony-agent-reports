// CompletionState.ets
//
// Completion panel shown when the review queue is exhausted.
// Matches page-review-page.html: white card 300px, yellow medal circle icon,
// title, body with known count, full-width yellow restart button.
//
// Icons are stroke-painted rawfile SVGs with baked colors; loaded via
// Image($rawfile(...)) with NO fillColor (SVG gate respected).
//
// Semantic targets: review-empty-state, review-restart-button.

import { Theme, BrandGradient } from '../common/Theme';

@Component
export struct CompletionState {
  @Prop knownCount: number = 0;
  @Prop totalCount: number = 0;
  onRestart: () => void = () => {};

  build() {
    Column() {
      // Medal icon circle
      Column() {
        Image($rawfile('icon_Medal-awarded-for-completing-all-review-words.svg'))
          .width(44)
          .height(44)
          .draggable(false)
      }
      .width(84)
      .height(84)
      .borderRadius(42)
      .linearGradient(BrandGradient.amber)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow({ radius: 24, color: '#FBBF2447', offsetX: 0, offsetY: 10 })
      .margin({ bottom: 18 })

      Text('太棒了！全部复习完成')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.ink)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      Text() {
        Span('本次已掌握 ')
          .fontSize(15)
          .fontColor(Theme.slate)
        Span(this.knownCount.toString())
          .fontSize(15)
          .fontColor(Theme.ink)
          .fontWeight(FontWeight.Bold)
        Span(' 个单词')
          .fontSize(15)
          .fontColor(Theme.slate)
      }
      .margin({ bottom: 24 })

      Button('再复习一次')
        .id('review-restart-button')
        .type(ButtonType.Capsule)
        .width('100%')
        .height(58)
        .borderRadius(Theme.radiusButton)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.ink)
        .linearGradient(BrandGradient.yellow)
        .shadow({ radius: 28, color: '#F59E0B52', offsetX: 0, offsetY: 12 })
        .onClick(() => this.onRestart())
    }
    .id('review-empty-state')
    .width(300)
    .padding({ left: 28, right: 28, top: 34, bottom: 28 })
    .borderRadius(Theme.radiusHero)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 56, color: '#1F293721', offsetX: 0, offsetY: 28 })
    .alignItems(HorizontalAlign.Center)
  }
}
