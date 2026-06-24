// SvgIcon.ets
//
// Shared icon entry for the 今天吃什么 app. Maps logical variants to the
// prepared rawfile SVG assets extracted from the HTML design. Per the SVG gate,
// rawfile stroke icons are never tinted via .fillColor(); selected/unselected
// states are handled by switching variants or by sibling label color.
//
// Stable public API: variant, iconSize, color, strokeWidth.

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#3D2B1F';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'home';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    // Tab icons (prepared -1 = default state).
    if (v === 'home') {
      return 'icon_Home-Tab-Icon-1.svg';
    } else if (v === 'fridge') {
      return 'icon_Fridge-Tab-Icon-1.svg';
    } else if (v === 'mood') {
      return 'icon_Mood-Tab-Icon-1.svg';
    } else if (v === 'log') {
      return 'icon_Log-Tab-Icon-1.svg';
    }
    // Action icons.
    if (v === 'add' || v === 'plus') {
      return 'icon_Add-Ingredient-Button-Icon.svg';
    } else if (v === 'remove' || v === 'minus') {
      return 'icon_Remove-Egg-Ingredient.svg';
    } else if (v === 'close') {
      return 'icon_Close-Share-Card-Sheet.svg';
    } else if (v === 'share') {
      return 'icon_Open-Share-Card-for-This-Entry.svg';
    } else if (v === 'export') {
      return 'icon_Export-Share-Card-Image.svg';
    } else if (v === 'spin') {
      return 'icon_Start-Wheel-Spin-Icon.svg';
    } else if (v === 'sparkle') {
      return 'icon_Share-Card-Decorative-Sparkle.svg';
    } else if (v === 'wheelCenter') {
      return 'icon_Spin-Wheel-Center-Decoration.svg';
    }
    return 'icon_Home-Tab-Icon-1.svg';
  }
}
