// Theme.ets
//
// Semantic theme tokens for the 今天吃什么 app (coral / warm-cream palette from
// the visual design contract). Layout-contract token NAMES stay stable so the
// fixed bottom-tab shell keeps working; only values change.

export class Theme {
  // Surfaces
  static readonly pageBg: string = '#FFF8F0';
  static readonly cardBg: string = '#FFFFFF';
  static readonly inputFieldBg: string = '#F5EEE6';
  static readonly tagBg: string = '#F5EEE6';
  static readonly tagText: string = '#6B5E52';
  static readonly chipBorder: string = '#E8E0D6';

  // Brand
  static readonly brandPrimary: string = '#FF6B4A';
  static readonly brandPrimaryEnd: string = '#FF8A6D';
  static readonly brandPink: string = '#FF6B8B';
  static readonly teal: string = '#3DD9C7';
  static readonly heroStart: string = '#FFE9DE';
  static readonly heroEnd: string = '#FFF8F0';

  // Text
  static readonly textPrimary: string = '#3D2B1F';
  static readonly textSecondary: string = '#6B5E52';
  static readonly textTertiary: string = '#9E9185';
  static readonly textQuaternary: string = '#9E9185';

  // Borders
  static readonly borderSoft: string = 'rgba(61,43,31,0.06)';

  // Ingredient chip
  static readonly ingredientChipBg: string = '#E5F9F6';
  static readonly ingredientChipText: string = '#1F7A71';

  // Share card
  static readonly shareCardStart: string = '#FFE9DE';
  static readonly shareCardEnd: string = '#FF6B8B';

  // Misc
  static readonly scrimBg: string = 'rgba(61,43,31,0.35)';
  static readonly softButtonBg: string = '#FFF0EC';

  // Radii
  static readonly radiusPill: number = 999;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 18;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 12;

  // Layout contract (names stable)
  static readonly pageHorizontalPadding: number = 22;
  static readonly bottomTabHeight: number = 80;
  static readonly contentMaxWidth: number = 400;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#FF6B4A', 0.0], ['#FF8A6D', 1.0]],
  } as LinearGradient;

  static readonly coralToBerry: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#FF6B4A', 0.0], ['#FF6B8B', 1.0]],
  } as LinearGradient;

  static readonly hero: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#FFE9DE', 0.0], ['#FFF8F0', 1.0]],
  } as LinearGradient;

  static readonly shareCard: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#FFE9DE', 0.0], ['#FF6B8B', 1.0]],
  } as LinearGradient;

  static readonly summaryCard: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#FF6B4A', 0.0], ['#FF8A6D', 1.0]],
  } as LinearGradient;
}
