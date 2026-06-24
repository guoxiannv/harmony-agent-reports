// ProgressHeader.ets
//
// White header panel with bottom-only rounded corners and a soft shadow.
// Left: yellow-gradient brand icon (open book) + title "单词翻翻乐".
// Right: glass pill "剩余 {rem} / {total}" + yellow badge with trophy "已会 {known}".
//
// Semantic assertion targets bound:
//   review-progress-remaining, review-progress-total, review-progress-known.

import { Theme, BrandGradient } from '../common/Theme';

@Component
export struct ProgressHeader {
  @Prop totalCount: number = 0;
  @Prop remainingCount: number = 0;
  @Prop knownCount: number = 0;

  build() {
    Row() {
      // Brand: book icon + title
      Row() {
        Column() {
          Image($rawfile('icon_App-logo-showing-an-open-book.svg'))
            .width(24)
            .height(24)
            .draggable(false)
        }
        .width(44)
        .height(44)
        .borderRadius(14)
        .linearGradient(BrandGradient.amber)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .shadow({ radius: 14, color: '#FBBF2440', offsetX: 0, offsetY: 6 })

        Text('单词翻翻乐')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.ink)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ left: 12 })
      }
      .layoutWeight(1)

      // Progress cluster
      Row() {
        // Glass pill: 剩余 {rem} / {total}
        Row() {
          Text('剩余')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.slate)
          Text(this.remainingCount.toString())
            .id('review-progress-remaining')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.ink)
            .margin({ left: 4 })
          Text(`/ ${this.totalCount.toString()}`)
            .id('review-progress-total')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.slate)
            .margin({ left: 4 })
        }
        .borderRadius(18)
        .padding({ left: 16, right: 16, top: 10, bottom: 10 })
        .backgroundColor(Theme.glass)

        // Known badge with trophy
        Row() {
          Image($rawfile('icon_Trophy-icon-showing-words-learned-this-session.svg'))
            .width(18)
            .height(18)
            .draggable(false)
            .margin({ right: 5 })
          Text(`已会 ${this.knownCount.toString()}`)
            .id('review-progress-known')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.ink)
        }
        .borderRadius(18)
        .padding({ left: 14, right: 14, top: 9, bottom: 9 })
        .linearGradient(BrandGradient.amber)
        .shadow({ radius: 12, color: '#FBBF2438', offsetX: 0, offsetY: 4 })
        .margin({ left: 10 })
      }
      .alignItems(VerticalAlign.Center)
    }
    .id('review-progress-header')
    .width('100%')
    .padding({ left: 22, right: 22, top: 24, bottom: 24 })
    .borderRadius({ bottomLeft: 28, bottomRight: 28, topLeft: 0, topRight: 0 })
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 24, color: '#1F29370F', offsetX: 0, offsetY: 6 })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }
}
