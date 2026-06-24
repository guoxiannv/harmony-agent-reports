// Pinankou theme tokens — blue-green safety palette
export class Theme {
  static readonly pageBg: string = '#F0F7F6';
  static readonly cardBg: string = '#FFFFFF';
  static readonly brandPrimary: string = '#0D9488';
  static readonly brandDark: string = '#0F5C55';
  static readonly brandLight: string = '#CCFBF1';
  static readonly safeBlue: string = '#0EA5E9';
  static readonly warnOrange: string = '#F59E0B';
  static readonly dangerRed: string = '#EF4444';
  static readonly criticalPurple: string = '#8B5CF6';

  static readonly textPrimary: string = '#111827';
  static readonly textSecondary: string = '#4B5563';
  static readonly textTertiary: string = '#9CA3AF';
  static readonly textQuaternary: string = '#9CA3AF';
  static readonly textPlaceholder: string = '#9CA3AF';
  static readonly borderDefault: string = '#E5E7EB';
  static readonly borderSoft: string = 'rgba(0,0,0,0.06)';
  static readonly cardDivider: string = '#F3F4F6';
  static readonly chipSelectedStart: string = '#CCFBF1';
  static readonly chipSelectedEnd: string = '#99F6E4';
  static readonly chipSoftBg: string = '#F0F7F6';
  static readonly goldSoftBg: string = '#FEF9C3';
  static readonly softHoverBg: string = '#F3F4F6';

  static readonly radiusChip: number = 20;
  static readonly radiusCard: number = 16;
  static readonly radiusHero: number = 20;
  static readonly radiusButton: number = 24;
  static readonly radiusSmall: number = 12;
  static readonly radiusTiny: number = 8;
  static readonly radiusPill: number = 999;

  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0D9488', 0.0], ['#0F5C55', 1.0]]
  } as LinearGradient;

  static readonly chipSelected: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#CCFBF1', 0.0], ['#99F6E4', 1.0]]
  } as LinearGradient;
}
