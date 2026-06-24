// TemplateSvgIcon.ets
//
// A model-friendly icon entry template for scaffolded HarmonyOS apps.
//
// Agent rules:
// - Keep the exported struct name as SvgIcon.
// - Keep the public API stable: variant, iconSize, color, and strokeWidth.
// - Prefer updating fileNameForVariant() and the matching rawfile assets instead of
// - hardcoding resource paths in page-level components.
// - Keep variant names generic so scaffold components are not tied to one product domain.
//
// Usage:
// - Replace the default rawfile mappings with your real icon assets.
// - Keep common variants such as home, explore, orders, rewards, search, profile,
// - back, add, remove, and favorite available when practical.
// - If the real project uses a different icon system, adapt this wrapper instead of
// - changing every caller.
//
// Notes:
// - The default rawfile names are placeholders from the bundled template assets.
// - color and strokeWidth are part of the stable template contract even when the
// - current rawfile-backed implementation does not apply tinting dynamically.
@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#0F3329';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'search';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    if (v === 'brand' || v === 'sparkles') {
      return 'icon_童词卡应用标志.svg';
    } else if (v === 'flipHint' || v === 'rotate3d') {
      return 'icon_提示可翻转卡片查看释义.svg';
    } else if (v === 'known' || v === 'check') {
      return 'icon_标记当前单词已认识并移除.svg';
    } else if (v === 'unknown' || v === 'refreshCw') {
      return 'icon_将单词放回队列末尾稍后复习.svg';
    } else if (v === 'restart') {
      return 'icon_重新开始一轮复习.svg';
    } else if (v === 'star') {
      return 'icon_复习完成成就星星.svg';
    } else if (v === 'decoStar1') {
      return 'icon_装饰性星光一.svg';
    } else if (v === 'decoStar2') {
      return 'icon_装饰性星光二.svg';
    } else if (v === 'decoStar3') {
      return 'icon_装饰性星光三.svg';
    } else if (v === 'decoStar4') {
      return 'icon_装饰性星光四.svg';
    } else if (v === 'decoStar5') {
      return 'icon_装饰性星光五.svg';
    }
    return 'icon_童词卡应用标志.svg';
  }
}
