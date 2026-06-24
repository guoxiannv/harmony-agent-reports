// SvgIcon — shared stroke-icon wrapper for the 今天吃什么 app.
//
// Icons are loaded from rawfile SVG assets (Image($rawfile(...))) per the
// project icon-loading contract. Inline drawing with Shape/Path/Circle/Rect
// is forbidden. fileNameForVariant() is the single source of truth for
// variant -> rawfile file mapping and returns explicit string literals only
// (no dynamic concatenation) so DevEco static asset analysis stays reliable.
// fillColor() re-tints the asset at runtime for selected/unselected tab
// states and themed tints. Public API (variant, iconSize, color, strokeWidth)
// is unchanged from the scaffold contract.

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#1A1A1A';
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
      return 'icon_home.svg';
    } else if (v === 'fridge' || v === 'ingredients') {
      return 'icon_fridge.svg';
    } else if (v === 'search' || v === 'discover') {
      return 'icon_search.svg';
    } else if (v === 'checkin' || v === 'calendar') {
      return 'icon_calendar.svg';
    } else if (v === 'user' || v === 'profile') {
      return 'icon_profile.svg';
    } else if (v === 'settings' || v === 'gear') {
      return 'icon_settings.svg';
    } else if (v === 'refresh' || v === 'rotate' || v === 'reset') {
      return 'icon_refresh.svg';
    } else if (v === 'dish' || v === 'chef') {
      return 'icon_dish.svg';
    } else if (v === 'leaf') {
      return 'icon_leaf.svg';
    } else if (v === 'flame' || v === 'fire') {
      return 'icon_flame.svg';
    } else if (v === 'plus' || v === 'add') {
      return 'icon_plus.svg';
    } else if (v === 'close' || v === 'x') {
      return 'icon_close.svg';
    } else if (v === 'edit' || v === 'pencil') {
      return 'icon_edit.svg';
    } else if (v === 'trash' || v === 'delete') {
      return 'icon_trash.svg';
    } else if (v === 'share') {
      return 'icon_share.svg';
    } else if (v === 'save' || v === 'download') {
      return 'icon_save.svg';
    } else if (v === 'back' || v === 'chevronLeft') {
      return 'icon_back.svg';
    } else if (v === 'chevronRight') {
      return 'icon_chevron_right.svg';
    } else if (v === 'check') {
      return 'icon_check.svg';
    } else if (v === 'clock') {
      return 'icon_clock.svg';
    } else if (v === 'sparkle') {
      return 'icon_sparkle.svg';
    }
    return 'icon_search.svg';
  }
}
