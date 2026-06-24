// Theme.ets
// Semantic design tokens for 今天吃什么 (warm "food/appetite" palette extracted from
// page-*.html design artifacts). Keep exported names Theme + BrandGradient stable.
export class Theme {
  // Backgrounds
  static readonly paper: string = '#FFFCFA';
  static readonly pageBg: string = '#FFFCFA';
  static readonly cardBg: string = '#FFFCFA';
  static readonly cream: string = '#FFF5ED';
  static readonly vanilla: string = '#F8EFE6';
  static readonly lightGray: string = '#F5F0EB';
  static readonly creamDeep: string = '#FFE8D6';

  // Brand
  static readonly brandPrimary: string = '#FF8C42';
  static readonly orange: string = '#FF8C42';
  static readonly orangeDeep: string = '#FF7043';
  static readonly orangeDark: string = '#E86A2E';
  static readonly green: string = '#4ECB9C';
  static readonly greenDeep: string = '#1E7A63';
  static readonly olive: string = '#5A6B58';
  static readonly sage: string = '#8FA897';

  // Text
  static readonly textPrimary: string = '#2E2A25';
  static readonly dark: string = '#2E2A25';
  static readonly textSecondary: string = '#7A746E';
  static readonly warmGray: string = '#7A746E';
  static readonly textTertiary: string = 'rgba(46,42,37,0.56)';
  static readonly textQuaternary: string = '#A8A29C';
  static readonly textPlaceholder: string = '#A8A29C';

  // Borders / dividers
  static readonly borderDefault: string = '#E9E3DD';
  static readonly border: string = '#E9E3DD';
  static readonly borderSoft: string = 'rgba(233,227,221,0.6)';
  static readonly cardDivider: string = '#E9E3DD';

  // Soft tinted icon backgrounds (feature-icon swatches)
  static readonly tintOrange: string = '#FFF0E6';
  static readonly tintGreen: string = '#E8F5F1';
  static readonly tintSage: string = '#F0F4F2';
  static readonly tintOlive: string = '#E8EEE6';
  static readonly tagGreenBg: string = '#E8F5F1';
  static readonly tagGreenDel: string = '#D1E8E1';

  static readonly white: string = '#FFFFFF';

  // Radii
  static readonly radiusChip: number = 20;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 26;
  static readonly radiusButton: number = 18;
  static readonly radiusSmall: number = 16;
  static readonly radiusTiny: number = 14;
  static readonly radiusPill: number = 14;

  // Layout contract
  static readonly pageHorizontalPadding: number = 22;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly orange: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FF8C42', 0.0], ['#FF7043', 0.55], ['#E86A2E', 1.0]],
  } as LinearGradient;

  static readonly todayCard: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FFF5ED', 0.0], ['#FFE8D6', 1.0]],
  } as LinearGradient;

  static readonly primary: LinearGradient = BrandGradient.orange;
}
