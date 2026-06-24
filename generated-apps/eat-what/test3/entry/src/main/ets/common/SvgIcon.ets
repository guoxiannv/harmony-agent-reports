// SvgIcon.ets
//
// Shared icon wrapper. Maps logical variant names to the prepared rawfile SVG
// assets (svg-style-manifest.json). All design icons are rawfile SVGs.
//
// SVG gate (svg-icon-rules): these assets are paint_mode stroke (pointer is fill).
// Never chain .fillColor() on Image($rawfile(...)). For active/inactive or
// contextual color, switch to the prepared rawfile variant instead of tinting.

@Component
export struct SvgIcon {
  @Prop variant: string = 'spin';
  @Prop iconSize: number = 24;
  // 保留在公共 API 中；对 rawfile stroke 图标无效（按 SVG gate 不做着色）。
  @Prop color: string = '#2E2B28';
  @Prop strokeWidth: number = 2;

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;

    // 底部 Tab（选中=红 / 未选中=灰）
    if (v === 'tab-home') {
      return 'icon_决策标签页图标-1.svg';
    } else if (v === 'tab-home-active') {
      return 'icon_决策标签页图标-2.svg';
    } else if (v === 'tab-pantry') {
      return 'icon_食材标签页图标-1.svg';
    } else if (v === 'tab-pantry-active') {
      return 'icon_食材标签页图标-2.svg';
    } else if (v === 'tab-check-in') {
      return 'icon_打卡标签页图标-2.svg'; // 该文件为选中红
    } else if (v === 'tab-check-in-inactive') {
      return 'icon_打卡标签页图标-1.svg';
    } else if (v === 'tab-profile') {
      return 'icon_我的标签页图标-1.svg';
    } else if (v === 'tab-profile-active') {
      return 'icon_我的标签页图标-2.svg';
    }

    // 页面级图标
    if (v === 'spin') {
      return 'icon_开始转盘图标.svg';
    } else if (v === 'fridge') {
      return 'icon_冰箱食材推荐图标.svg';
    } else if (v === 'arrow-detail') {
      return 'icon_查看菜品详情箭头.svg';
    } else if (v === 'wheel-pointer') {
      return 'icon_转盘指针.svg';
    } else if (v === 'add') {
      return 'icon_添加冰箱食材图标.svg';
    } else if (v === 'remove-small') {
      return 'icon_删除该食材图标.svg';
    } else if (v === 'share-gray') {
      return 'icon_生成分享卡片图标-1.svg';
    } else if (v === 'share-dark') {
      return 'icon_生成分享卡片图标-2.svg';
    } else if (v === 'trash') {
      return 'icon_删除该打卡记录图标.svg';
    } else if (v === 'plus-fab') {
      return 'icon_补录打卡图标.svg';
    } else if (v === 'avatar') {
      return 'icon_用户头像占位图标.svg';
    } else if (v === 'streak-badge') {
      return 'icon_连续打卡徽章图标.svg';
    } else if (v === 'settings') {
      return 'icon_设置菜单图标.svg';
    } else if (v === 'about') {
      return 'icon_关于菜单图标.svg';
    } else if (v === 'arrow-setting') {
      return 'icon_进入设置箭头.svg';
    } else if (v === 'arrow-about') {
      return 'icon_进入关于箭头.svg';
    } else if (v === 'back-dark') {
      return 'icon_返回上一页图标-1.svg';
    } else if (v === 'back-light') {
      return 'icon_返回上一页图标-2.svg';
    } else if (v === 'check-in') {
      return 'icon_记录打卡图标.svg';
    } else if (v === 'ingredient') {
      return 'icon_食材清单图标.svg';
    } else if (v === 'save-album') {
      return 'icon_保存到相册图标.svg';
    } else if (v === 'system-share') {
      return 'icon_系统分享图标.svg';
    } else if (v === 'app-logo') {
      return 'icon_应用-Logo-小图标.svg';
    } else if (v === 'utensils') {
      return 'icon_装饰餐具图标.svg';
    } else if (v === 'bolt') {
      return 'icon_快手标签图标.svg';
    }
    return 'icon_开始转盘图标.svg';
  }
}
