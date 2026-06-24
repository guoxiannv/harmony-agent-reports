// SvgIcon.ets
// Shared icon wrapper backed by prepared rawfile SVGs (svg-style-manifest.json).
// All prepared icons are paint_mode "stroke" (or fill with baked color) -> the SVG gate
// forbids chaining .fillColor() on Image($rawfile(...)). We NEVER call fillColor here.
// For active/inactive tab states we switch between prepared variants (e.g. Home-Tab-1 / -2).
@Component
export struct SvgIcon {
  @Prop variant: string = 'spin';
  @Prop iconSize: number = 24;

  build() {
    Image($rawfile(this.fileName()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileName(): string {
    const v: string = this.variant;
    if (v === 'home-active') {
      return 'icon_Home-Tab-2.svg';
    } else if (v === 'home') {
      return 'icon_Home-Tab-1.svg';
    } else if (v === 'recommend-active') {
      return 'icon_Recommend-Tab-2.svg';
    } else if (v === 'recommend') {
      return 'icon_Recommend-Tab-1.svg';
    } else if (v === 'checkin-active') {
      return 'icon_Check-in-Tab-1.svg';
    } else if (v === 'checkin') {
      return 'icon_Check-in-Tab-2.svg';
    } else if (v === 'profile' || v === 'profile-active') {
      return 'icon_Profile-Tab.svg';
    } else if (v === 'spin') {
      return 'icon_Spin-Wheel.svg';
    } else if (v === 'ingredient') {
      return 'icon_Ingredient-Recommendation.svg';
    } else if (v === 'filter') {
      return 'icon_Filter-Dishes.svg';
    } else if (v === 'daily') {
      return 'icon_Daily-Check-in.svg';
    } else if (v === 'chef') {
      return 'icon_Chef-Hat-Decoration.svg';
    } else if (v === 'add') {
      return 'icon_Add-Candidate-Dish.svg';
    } else if (v === 'add-ingredient') {
      return 'icon_Add-Ingredient.svg';
    } else if (v === 'remove') {
      return 'icon_Remove-Candidate.svg';
    } else if (v === 'remove-ingredient') {
      return 'icon_Remove-Ingredient.svg';
    } else if (v === 'back') {
      return 'icon_Go-Back.svg';
    } else if (v === 'settings') {
      return 'icon_Open-Settings.svg';
    } else if (v === 'dish-library') {
      return 'icon_Dish-Library.svg';
    } else if (v === 'calendar') {
      return 'icon_Calendar-Navigation.svg';
    } else if (v === 'share-checkin') {
      return 'icon_Share-Check-in.svg';
    } else if (v === 'share-card') {
      return 'icon_Share-Card.svg';
    } else if (v === 'save-image') {
      return 'icon_Save-Image.svg';
    } else if (v === 'dish-orange') {
      return 'icon_Recommended-Dish-1.svg';
    } else if (v === 'dish-green') {
      return 'icon_Recommended-Dish-2.svg';
    } else if (v === 'dish-olive') {
      return 'icon_Recommended-Dish-3.svg';
    } else if (v === 'wheel-face') {
      return 'icon_Spinning-Wheel.svg';
    } else if (v === 'wheel-pointer') {
      return 'icon_Wheel-Pointer.svg';
    } else if (v === 'mood-happy') {
      return 'icon_Happy-Mood.svg';
    } else if (v === 'mood-spicy') {
      return 'icon_Spicy-Mood.svg';
    } else if (v === 'mood-light') {
      return 'icon_Light-Mood.svg';
    } else if (v === 'mood-comfort') {
      return 'icon_Comfort-Mood.svg';
    } else if (v === 'mood-indulgent') {
      return 'icon_Indulgent-Mood.svg';
    } else if (v === 'mood-whatever') {
      return 'icon_Whatever-Mood.svg';
    } else if (v === 'time-breakfast') {
      return 'icon_Breakfast-Time.svg';
    } else if (v === 'time-lunch') {
      return 'icon_Lunch-Time.svg';
    } else if (v === 'time-dinner') {
      return 'icon_Dinner-Time.svg';
    } else if (v === 'time-late') {
      return 'icon_Late-Night-Time.svg';
    }
    return 'icon_Spin-Wheel.svg';
  }
}
