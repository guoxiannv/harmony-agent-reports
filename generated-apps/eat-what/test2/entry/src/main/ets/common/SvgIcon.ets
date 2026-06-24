// SvgIcon.ets
//
// Shared icon wrapper. Maps semantic variant names to the prepared rawfile
// SVG assets (synced from the HTML design artifacts, see
// entry/src/main/resources/rawfile/svg-style-manifest.json).
//
// SVG gate: every icon here is a paint_mode stroke/fill SVG with its color
// baked into the rawfile. We do NOT chain .fillColor() on these Images.
// For selected/unselected tab states we switch between the prepared -1/-2
// rawfile variants instead of tinting.

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#1A1A1A';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'tab-home';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    // bottom-tab navigation: active (orange) / idle (gray) variants
    if (v === 'tab-home') {
      return 'icon_今日首页导航-2.svg';
    } else if (v === 'tab-home-active') {
      return 'icon_今日首页导航-1.svg';
    } else if (v === 'tab-ingredients') {
      return 'icon_冰箱食材导航-1.svg';
    } else if (v === 'tab-ingredients-active') {
      return 'icon_冰箱食材导航-2.svg';
    } else if (v === 'tab-records' || v === 'tab-records-active') {
      // only one prepared variant for the records tab; active state is
      // expressed via label color, not icon tint (SVG gate).
      return 'icon_饮食打卡导航.svg';
    } else if (v === 'back') {
      return 'icon_返回上一页-1.svg';
    } else if (v === 'back-light') {
      return 'icon_返回上一页-2.svg';
    } else if (v === 'wheel' || v === 'spin') {
      return 'icon_开始随机转盘抽取菜品.svg';
    } else if (v === 'filter') {
      return 'icon_打开心情时间餐别筛选.svg';
    } else if (v === 'share') {
      return 'icon_打开分享卡片页面.svg';
    } else if (v === 'add-record') {
      return 'icon_新增今日饮食打卡.svg';
    } else if (v === 'add-ingredient') {
      return 'icon_添加食材到冰箱清单.svg';
    } else if (v === 'delete') {
      return 'icon_删除该食材.svg';
    } else if (v === 'empty-fridge') {
      return 'icon_冰箱为空状态.svg';
    } else if (v === 'empty-no-match') {
      return 'icon_无匹配菜谱空状态.svg';
    } else if (v === 'empty-no-recommend') {
      return 'icon_无推荐结果空状态.svg';
    } else if (v === 'dish-tomato-egg') {
      return 'icon_番茄鸡蛋菜品图标-1.svg';
    } else if (v === 'dish-fish') {
      return 'icon_清蒸鱼菜品图标.svg';
    } else if (v === 'dish-mapo') {
      return 'icon_麻婆豆腐菜品图标-1.svg';
    } else if (v === 'dish-result') {
      return 'icon_抽中菜品图标.svg';
    } else if (v === 'wheel-candidate') {
      return 'icon_随机转盘候选菜品.svg';
    } else if (v === 'wheel-pointer') {
      return 'icon_转盘结果指针.svg';
    }
    return 'icon_番茄鸡蛋菜品图标-1.svg';
  }
}
