// ActionBar.ets
//
// Two side-by-side action buttons matching page-review-page.html.
//  - 认识 (known): yellow gradient, dark ink text + checkmark icon.
//  - 不认识 (unknown): coral gradient, white text + rotate-ccw icon.
// Equal flex, 16px gap, 22px radius, min 60px height, press scale 0.96.
//
// Icons are stroke-painted rawfile SVGs with baked colors; loaded via
// Image($rawfile(...)) with NO fillColor (SVG gate respected).
//
// Semantic targets: review-known-button, review-unknown-button.

import { Theme, BrandGradient } from '../common/Theme';

@Component
export struct ActionBar {
  onKnown: () => void = () => {};
  onUnknown: () => void = () => {};

  @State private knownScale: number = 1;
  @State private unknownScale: number = 1;

  build() {
    Row() {
      // 不认识 (left) — coral
      Button() {
        Row() {
          Image($rawfile('icon_Rotate-arrow-indicating-put-this-word-back-for-review.svg'))
            .width(22)
            .height(22)
            .draggable(false)
            .margin({ right: 8 })
          Text('不认识')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnBrand)
        }
      }
      .id('review-unknown-button')
      .type(ButtonType.Capsule)
      .layoutWeight(1)
      .height(64)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.coral)
      .shadow({ radius: 28, color: '#EF444442', offsetX: 0, offsetY: 12 })
      .scale({ x: this.unknownScale, y: this.unknownScale })
      .onClick(() => this.onUnknown())
      .onTouch((event: TouchEvent) => this.handlePress(event, 'unknown'))

      Blank().width(16)

      // 认识 (right) — yellow
      Button() {
        Row() {
          Image($rawfile('icon_Checkmark-indicating-I-know-this-word.svg'))
            .width(22)
            .height(22)
            .draggable(false)
            .margin({ right: 8 })
          Text('认识')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.ink)
        }
      }
      .id('review-known-button')
      .type(ButtonType.Capsule)
      .layoutWeight(1)
      .height(64)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.yellow)
      .shadow({ radius: 28, color: '#F59E0B52', offsetX: 0, offsetY: 12 })
      .scale({ x: this.knownScale, y: this.knownScale })
      .onClick(() => this.onKnown())
      .onTouch((event: TouchEvent) => this.handlePress(event, 'known'))
    }
    .width(Theme.cardWidth)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  private handlePress(event: TouchEvent, which: string): void {
    if (event.type === TouchType.Down) {
      animateTo({ duration: 120, curve: Curve.EaseInOut }, () => {
        if (which === 'known') {
          this.knownScale = 0.96;
        } else {
          this.unknownScale = 0.96;
        }
      });
    } else if (event.type === TouchType.Up || event.type === TouchType.Cancel) {
      animateTo({ duration: 120, curve: Curve.EaseInOut }, () => {
        if (which === 'known') {
          this.knownScale = 1;
        } else {
          this.unknownScale = 1;
        }
      });
    }
  }
}
