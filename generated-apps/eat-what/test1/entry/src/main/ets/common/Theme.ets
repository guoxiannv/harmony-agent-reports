// Theme — shared semantic design tokens for the 今天吃什么 app.
//
// Warm caramel-on-cream palette per .arkpilot/plans/design-alignment.md.
// The exported class names (Theme, BrandGradient) and layout-contract tokens
// (pageHorizontalPadding, bottomTabHeight, contentMaxWidth, touchTarget) stay
// stable for the scaffold shell; color/radius/gradient values match the design.
export class Theme {
  // backgrounds
  static readonly pageBg: string = '#FDF8F3';
  static readonly cardBg: string = '#FFFFFF';
  static readonly inputBg: string = '#F5EFE9';
  static readonly chipSoftBg: string = '#FFF5ED';
  static readonly chipSoftText: string = '#B85C25';

  // brand (caramel/orange)
  static readonly brandPrimary: string = '#D97736';
  static readonly brandLight: string = '#F2A864';
  static readonly brandDeep: string = '#B85C25';

  // green family
  static readonly green: string = '#4A9B8E';
  static readonly greenSoft: string = '#E3F3F0';
  static readonly greenDeep: string = '#147A6B';

  // yellow family
  static readonly yellow: string = '#E4B84A';
  static readonly yellowSoft: string = '#FFF6D6';
  static readonly yellowDeep: string = '#A67C1A';

  // purple family
  static readonly purple: string = '#8B7EC8';
  static readonly purpleSoft: string = '#F0EBFF';
  static readonly purpleDeep: string = '#6B5BAB';

  // red family
  static readonly red: string = '#C65D4F';
  static readonly redSoft: string = '#FBE8E6';
  static readonly redDeep: string = '#A8483C';

  // text
  static readonly textPrimary: string = '#1A1A1A';
  static readonly textSecondary: string = '#4A4A4A';
  static readonly textTertiary: string = '#6B6B6B';
  static readonly textQuaternary: string = '#A8A29E';
  static readonly textPlaceholder: string = '#A8A29E';

  // borders / dividers
  static readonly borderDefault: string = '#F5EFE9';
  static readonly borderSoft: string = '#F5EFE9';

  // radii
  static readonly radiusChip: number = 14;
  static readonly radiusCard: number = 22;
  static readonly radiusHero: number = 26;
  static readonly radiusButton: number = 18;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusInput: number = 16;
  static readonly radiusSheet: number = 32;

  // layout contract (kept stable)
  static readonly pageHorizontalPadding: number = 20;
  static readonly bottomTabHeight: number = 72;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightTop,
    colors: [['#F2A864', 0.0], ['#D97736', 1.0]],
  } as LinearGradient;

  static readonly summary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#F2A864', 0.0], ['#D97736', 1.0]],
  } as LinearGradient;

  static readonly green: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightTop,
    colors: [['#5EB69D', 0.0], ['#4A9B8E', 1.0]],
  } as LinearGradient;

  static readonly purple: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightTop,
    colors: [['#A89BD8', 0.0], ['#8B7EC8', 1.0]],
  } as LinearGradient;

  static readonly yellow: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightTop,
    colors: [['#E4B84A', 0.0], ['#C99A2E', 1.0]],
  } as LinearGradient;
}

// Shadow configs used across cards/buttons.
export class ShadowConfig {
  static readonly card: ShadowOptions = { radius: 24, color: 'rgba(0,0,0,0.05)', offsetX: 0, offsetY: 8 };
  static readonly hero: ShadowOptions = { radius: 36, color: 'rgba(217,119,54,0.12)', offsetX: 0, offsetY: 14 };
  static readonly button: ShadowOptions = { radius: 20, color: 'rgba(217,119,54,0.32)', offsetX: 0, offsetY: 8 };
  static readonly soft: ShadowOptions = { radius: 12, color: 'rgba(0,0,0,0.06)', offsetX: 0, offsetY: 4 };
}
