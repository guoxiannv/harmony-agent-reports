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
      .fillColor(this.color)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    if (v === 'home') {
      return 'icon_切换到首页-2.svg';
    } else if (v === 'explore' || v === 'menu') {
      return 'icon_关于入口.svg';
    } else if (v === 'store' || v === 'stores') {
      return 'icon_库存管理入口.svg';
    } else if (v === 'rewards') {
      return 'icon_签到积分图标.svg';
    } else if (v === 'orders' || v === 'history') {
      return 'icon_扣减记录.svg';
    } else if (v === 'profile' || v === 'user') {
      return 'icon_切换到我的-2.svg';
    } else if (v === 'cart') {
      return 'icon_物料库存.svg';
    } else if (v === 'search') {
      return 'icon_搜索会员.svg';
    } else if (v === 'trending' || v === 'reorder' || v === 'trendingUp') {
      return 'icon_预约新课程.svg';
    } else if (v === 'add' || v === 'plus') {
      return 'icon_新增物料.svg';
    } else if (v === 'remove' || v === 'minus') {
      return 'icon_减少数量.svg';
    } else if (v === 'back') {
      return 'icon_返回上一页.svg';
    } else if (v === 'favorite' || v === 'heart') {
      return 'icon_收藏该饮品.svg';
    } else if (v === 'trash') {
      return 'icon_从购物车移除该商品.svg';
    } else if (v === 'info') {
      return 'icon_关于入口.svg';
    } else if (v === 'settings') {
      return 'icon_设置入口.svg';
    } else if (v === 'arrowRight' || v === 'chevronRight') {
      return 'icon_进入设置.svg';
    } else if (v === 'card') {
      return 'icon_支付方式图标.svg';
    } else if (v === 'placeholder' || v === 'cup') {
      return 'icon_拿铁饮品占位图.svg';
    }
    return 'icon_搜索会员.svg';
  }
}
