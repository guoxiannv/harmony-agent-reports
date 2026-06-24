// TemplateTheme.ets
//
// 手作·印记 theme tokens — terracotta + handwritten warm style.

export class Theme {
  // Page / background
  static readonly pageBg: string = '#F8F3EE';
  static readonly cardBg: string = '#FFFFFF';
  static readonly headerGradientStart: string = '#C17A53';
  static readonly headerGradientEnd: string = '#A85D3C';

  // Brand / primary
  static readonly brandPrimary: string = '#C17A53';
  static readonly brandDark: string = '#A85D3C';
  static readonly brandLight: string = '#D48C65';
  static readonly brandSoft: string = '#F0E8E0';

  // Text
  static readonly textPrimary: string = '#3D2E26';
  static readonly textSecondary: string = '#7A665B';
  static readonly textTertiary: string = '#9E8B7E';
  static readonly textOnBrand: string = '#FFFFFF';

  // Accent
  static readonly alert: string = '#C45A4B';
  static readonly alertSoft: string = '#F7E3E1';
  static readonly success: string = '#8A9A8C';

  // Border / divider
  static readonly borderDefault: string = '#E6D5C7';
  static readonly borderSoft: string = '#F0E8E0';
  static readonly cardDivider: string = '#F0E8E0';

  // Shadows
  static readonly cardShadow: string = 'rgba(61,46,38,0.08)';
  static readonly brandShadow: string = 'rgba(193,122,83,0.28)';

  // Radius
  static readonly radiusChip: number = 14;
  static readonly radiusCard: number = 24;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 18;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 12;
  static readonly radiusPill: number = 12;

  // Layout
  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly header: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#C17A53', 0.0], ['#A85D3C', 1.0]],
  } as LinearGradient;

  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#C17A53', 0.0], ['#A85D3C', 1.0]],
  } as LinearGradient;

  static readonly primaryLight: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#D48C65', 0.0], ['#C17A53', 1.0]],
  } as LinearGradient;
}
