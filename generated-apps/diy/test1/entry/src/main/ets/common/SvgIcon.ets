// 手作·印记 — shared icon wrapper using rawfile SVGs prepared for the app.
// Rules:
// - Keep exported struct name as SvgIcon.
// - Keep public API stable: variant, iconSize, color, strokeWidth.
// - Do not scatter rawfile icon paths across page files.

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#9E9186';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'search';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
      .fillColor(this.color)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    if (v === 'home') {
      return 'icon_home.svg';
    } else if (v === 'members') {
      return 'icon_members.svg';
    } else if (v === 'calendar') {
      return 'icon_calendar.svg';
    } else if (v === 'points') {
      return 'icon_points.svg';
    } else if (v === 'inventory') {
      return 'icon_inventory.svg';
    } else if (v === 'plus' || v === 'add') {
      return 'icon_plus.svg';
    } else if (v === 'search') {
      return 'icon_search.svg';
    } else if (v === 'filter') {
      return 'icon_filter.svg';
    } else if (v === 'back') {
      return 'icon_back.svg';
    } else if (v === 'checkin') {
      return 'icon_checkin.svg';
    } else if (v === 'alert') {
      return 'icon_alert.svg';
    } else if (v === 'camera') {
      return 'icon_camera.svg';
    } else if (v === 'trash') {
      return 'icon_trash.svg';
    } else if (v === 'edit') {
      return 'icon_edit.svg';
    } else if (v === 'clock') {
      return 'icon_clock.svg';
    } else if (v === 'user') {
      return 'icon_user.svg';
    } else if (v === 'star') {
      return 'icon_star.svg';
    } else if (v === 'package') {
      return 'icon_package.svg';
    }
    return 'icon_search.svg';
  }
}
