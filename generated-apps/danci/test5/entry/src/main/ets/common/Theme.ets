// TemplateTheme.ets
//
// Theme token layer for 单词翻翻乐 (kids vocabulary review app).
// Tokens mirror the final HTML visual contract (page-review-page.html):
// sky-blue gradient page, white surfaces, yellow brand accents, coral unknown.
//
// Agent rules honored:
// - Kept exported class names: Theme and BrandGradient.
// - Kept layout contract tokens stable: pageHorizontalPadding, bottomTabHeight,
//   contentMaxWidth, touchTarget.

export class Theme {
  // Surfaces (from HTML :root)
  static readonly pageBg: string = '#F0F9FF';
  static readonly skyTop: string = '#E0F2FE';
  static readonly skyBottom: string = '#F0F9FF';
  static readonly cardBg: string = '#FFFFFF';
  static readonly glass: string = '#FFFFFFA8'; // rgba(255,255,255,0.68) approx

  // Brand / accents
  static readonly ink: string = '#1F2937';
  static readonly slate: string = '#64748B';
  static readonly brandPrimary: string = '#6C5CE7';
  static readonly brandDark: string = '#3B2BB0';

  static readonly yellowFrom: string = '#FCD34D';
  static readonly yellowTo: string = '#F59E0B';
  static readonly brandIconFrom: string = '#FDE68A';
  static readonly brandIconTo: string = '#FBBF24';
  static readonly coralFrom: string = '#FCA5A5';
  static readonly coralTo: string = '#EF4444';
  static readonly gold: string = '#FBBF24';

  // Decorative blob colors
  static readonly blobYellow: string = '#FBBF242E'; // rgba(251,191,36,0.18)
  static readonly blobPurple: string = '#A78BFA33'; // rgba(167,139,250,0.20)

  // Text (semantic aliases kept for any retained callers)
  static readonly textPrimary: string = '#1F2937';
  static readonly textSecondary: string = '#64748B';
  static readonly textTertiary: string = '#94A3B8';
  static readonly textQuaternary: string = '#B2B8BC';
  static readonly textPlaceholder: string = '#C8CDD0';
  static readonly textOnBrand: string = '#FFFFFF';
  static readonly textOnCardFront: string = '#1F2937';

  // Legacy aliases (retained so unused scaffold files still compile)
  static readonly cardFrontBg: string = '#FFFFFF';
  static readonly cardBackBg: string = '#FFFFFF';
  static readonly knownGreen: string = '#F59E0B';
  static readonly knownGreenDark: string = '#D97706';
  static readonly unknownRed: string = '#EF4444';
  static readonly unknownRedDark: string = '#DC2626';
  static readonly accentOrange: string = '#F39C12';
  static readonly borderDefault: string = '#E6DCD3';
  static readonly borderSoft: string = 'rgba(31,41,55,0.08)';
  static readonly cardDivider: string = 'rgba(100,116,139,0.12)';
  static readonly softHoverBg: string = '#FFF1D6';
  static readonly chipSoftBg: string = '#F0F9FF';
  static readonly goldSoftBg: string = '#FFF6E6';

  // Radii
  static readonly radiusChip: number = 18;
  static readonly radiusCard: number = 28;
  static readonly radiusHero: number = 28;
  static readonly radiusButton: number = 22;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 12;

  // Layout contract
  static readonly pageHorizontalPadding: number = 18;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;

  // Card stage dimensions (from HTML .scene)
  static readonly cardWidth: number = 306;
  static readonly cardHeight: number = 400;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#6C5CE7', 0.0], ['#3B2BB0', 1.0]],
  } as LinearGradient;

  // Page background: sky-top -> sky-bottom.
  static readonly pageTop: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#E0F2FE', 0.0], ['#F0F9FF', 1.0]],
  } as LinearGradient;

  // Known button + brand icon: yellow gradient.
  static readonly yellow: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FCD34D', 0.0], ['#F59E0B', 1.0]],
  } as LinearGradient;

  // Brand icon uses a slightly different amber pair.
  static readonly amber: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FDE68A', 0.0], ['#FBBF24', 1.0]],
  } as LinearGradient;

  // Unknown button: coral gradient.
  static readonly coral: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FCA5A5', 0.0], ['#EF4444', 1.0]],
  } as LinearGradient;

  static readonly goldText: LinearGradient = {
    angle: 90,
    direction: GradientDirection.Right,
    colors: [['#FCD34D', 0.0], ['#F59E0B', 1.0]],
  } as LinearGradient;
}
