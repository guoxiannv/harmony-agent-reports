// Theme.ets
//
// Shared semantic theme tokens for the "今天吃什么" decision app.
// Values are aligned to the HTML design artifacts (page-home/ingredients/wheel):
// warm off-white background, orange brand, dark hero surfaces, teal/pink accents.
//
// Agent rules:
// - Keep exported class names Theme and BrandGradient.
// - Keep layout-contract tokens (pageHorizontalPadding, bottomTabHeight,
//   contentMaxWidth, touchTarget) stable unless the app shell changes.

export class Theme {
  // surfaces
  static readonly pageBg: string = '#FAF8F5';
  static readonly cardBg: string = '#FFFFFF';
  static readonly heroDarkStart: string = '#1C1C1E';
  static readonly heroDarkEnd: string = '#0F0F0F';
  static readonly wheelBg: string = '#0F0F0F';
  static readonly resultSheetBg: string = '#1C1C1E';

  // brand
  static readonly brandPrimary: string = '#FF6B35';
  static readonly brandPrimaryEnd: string = '#FF8A5B';
  static readonly brandOrangeSoft: string = 'rgba(255,107,53,0.10)';

  // accents
  static readonly teal: string = '#3DD9C0';
  static readonly tealEnd: string = '#7EE8D8';
  static readonly tealSoft: string = 'rgba(61,217,192,0.12)';
  static readonly pink: string = '#FF4D6D';
  static readonly pinkEnd: string = '#FF7A8F';
  static readonly gold: string = '#FFC93D';
  static readonly goldEnd: string = '#FFE082';
  static readonly purple: string = '#9B7EDE';
  static readonly purpleEnd: string = '#BBA3E8';

  // text
  static readonly textPrimary: string = '#1A1A1A';
  static readonly textSecondary: string = '#4A4A4A';
  static readonly textTertiary: string = '#8A8A8A';
  static readonly textQuaternary: string = '#8A8A8A';
  static readonly textPlaceholder: string = '#BFBFBF';
  static readonly textOnDark: string = '#FFFFFF';
  static readonly textOnDarkSoft: string = 'rgba(255,255,255,0.60)';

  // borders / dividers
  static readonly borderDefault: string = 'rgba(0,0,0,0.08)';
  static readonly borderSoft: string = 'rgba(0,0,0,0.06)';
  static readonly borderCard: string = 'rgba(0,0,0,0.04)';
  static readonly cardDivider: string = '#F0EDE8';

  // tab bar
  static readonly tabBarBg: string = 'rgba(255,248,245,0.86)';
  static readonly chipSoftBg: string = '#FFFFFF';
  static readonly tagSoftBg: string = 'rgba(0,0,0,0.04)';

  // radii
  static readonly radiusChip: number = 18;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 28;
  static readonly radiusButton: number = 24;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 16;

  // layout contract
  static readonly pageHorizontalPadding: number = 20;
  static readonly bottomTabHeight: number = 64;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly brand: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
  } as LinearGradient;

  static readonly hero: LinearGradient = {
    angle: 160,
    direction: GradientDirection.Bottom,
    colors: [['#1C1C1E', 0.0], ['#0F0F0F', 1.0]],
  } as LinearGradient;

  static readonly thumbGold: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FFC93D', 0.0], ['#FF8A5B', 1.0]],
  } as LinearGradient;

  static readonly thumbTeal: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#3DD9C0', 0.0], ['#7EE8D8', 1.0]],
  } as LinearGradient;

  static readonly thumbPink: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FF4D6D', 0.0], ['#FF7A8F', 1.0]],
  } as LinearGradient;
}
