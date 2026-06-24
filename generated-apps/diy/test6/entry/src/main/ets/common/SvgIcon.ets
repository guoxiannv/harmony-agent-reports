// Shared icon wrapper for 手作·印记.
// All icons are stroke-mode SVG rawfiles with baked-in colors (see
// svg-style-manifest.json). Per the SVG gate we NEVER call .fillColor() on
// Image($rawfile(...)) for these stroke icons; color/state differences are
// handled by selecting the correct rawfile variant below.
//
// Public API (kept stable from scaffold): variant, iconSize, color, strokeWidth.
// `color`/`strokeWidth` are accepted for contract compatibility but intentionally
// not applied to stroke rawfile icons.
@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#9E4F2C';
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

    // Bottom-tab icons (active = #9E4F2C, inactive = #9E8E84).
    if (v === 'tab-home' || v === 'home-inactive') {
      return 'icon_Navigate-to-Home-Overview-1.svg';
    }
    if (v === 'tab-home-active') {
      return 'icon_Navigate-to-Home-Overview-2.svg';
    }
    if (v === 'tab-members' || v === 'members-inactive') {
      return 'icon_Navigate-to-Members-List-2.svg';
    }
    if (v === 'tab-members-active') {
      return 'icon_Navigate-to-Members-List-3.svg';
    }
    if (v === 'tab-courses' || v === 'courses-inactive') {
      return 'icon_Navigate-to-Courses-Calendar-3.svg';
    }
    if (v === 'tab-courses-active') {
      return 'icon_Navigate-to-Courses-Calendar-1.svg';
    }
    if (v === 'tab-points' || v === 'points-inactive') {
      return 'icon_Navigate-to-Points-Center-1.svg';
    }
    if (v === 'tab-points-active') {
      return 'icon_Navigate-to-Points-Center-5.svg';
    }
    if (v === 'tab-inventory' || v === 'inventory-inactive') {
      return 'icon_Navigate-to-Inventory-1.svg';
    }
    if (v === 'tab-inventory-active') {
      return 'icon_Navigate-to-Inventory-2.svg';
    }

    // Action / utility icons.
    if (v === 'add-white' || v === 'add-fab') {
      return 'icon_Add-New-Item-3.svg';
    }
    if (v === 'add-primary') {
      return 'icon_Add-New-Item-1.svg';
    }
    if (v === 'add-ghost') {
      return 'icon_Add-New-Item-2.svg';
    }
    if (v === 'back') {
      return 'icon_Go-Back.svg';
    }
    if (v === 'edit') {
      return 'icon_Edit-Item-1.svg';
    }
    if (v === 'delete') {
      return 'icon_Delete-Item.svg';
    }
    if (v === 'search') {
      return 'icon_Search-Members.svg';
    }
    if (v === 'filter') {
      return 'icon_Filter-List-3.svg';
    }
    if (v === 'filter-primary') {
      return 'icon_Filter-List-1.svg';
    }
    if (v === 'checkin-white') {
      return 'icon_Member-Check-in-2.svg';
    }
    if (v === 'checkin-fab') {
      return 'icon_Member-Check-in-1.svg';
    }
    if (v === 'checkin-primary') {
      return 'icon_Member-Check-in-3.svg';
    }
    if (v === 'warning') {
      return 'icon_Warning-Alert.svg';
    }
    if (v === 'location') {
      return 'icon_Course-Location.svg';
    }
    if (v === 'upload') {
      return 'icon_Upload-Work-Image.svg';
    }
    if (v === 'open-detail') {
      return 'icon_Open-Detail.svg';
    }
    if (v === 'expand') {
      return 'icon_Expand-Options.svg';
    }
    if (v === 'decrease') {
      return 'icon_Decrease-Value.svg';
    }
    if (v === 'section-courses') {
      return 'icon_Navigate-to-Courses-Calendar-2.svg';
    }
    if (v === 'section-points') {
      return 'icon_Navigate-to-Points-Center-2.svg';
    }
    if (v === 'empty-pottery') {
      return 'icon_Empty-Members-Pottery-Wheel.svg';
    }

    return 'icon_Search-Members.svg';
  }
}
