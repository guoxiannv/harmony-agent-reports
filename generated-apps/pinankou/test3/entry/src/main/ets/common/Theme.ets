// Pinankou theme tokens — blue-green safety palette
export interface ShadowSpec {
  radius: number;
  color: string | ResourceColor;
  offsetY: number;
}

export class Theme {
  // Backgrounds
  static readonly pageBg: string = '#F0FDFA';
  static readonly cardBg: string = '#FFFFFF';
  static readonly inputBg: string = '#F8FAFC';
  static readonly secondaryBg: string = '#F1F5F9';

  // Brand
  static readonly brandPrimary: string = '#0D9488';
  static readonly brandHighlight: string = '#14B8A6';
  static readonly brandCyan: string = '#06B6D4';
  static readonly brandDark: string = '#0F766E';
  static readonly brandSoft: string = '#CCFBF1';

  // Semantic
  static readonly danger: string = '#EF4444';
  static readonly dangerSoft: string = '#FEF2F2';
  static readonly warning: string = '#F59E0B';
  static readonly warningSoft: string = '#FFFBEB';
  static readonly success: string = '#10B981';
  static readonly successSoft: string = '#ECFDF5';
  static readonly info: string = '#0EA5E9';
  static readonly infoSoft: string = '#F0F9FF';
  static readonly indigo: string = '#6366F1';
  static readonly indigoSoft: string = '#EEF2FF';

  // Text
  static readonly textPrimary: string = '#0F172A';
  static readonly textSecondary: string = '#334155';
  static readonly textTertiary: string = '#64748B';
  static readonly textQuaternary: string = '#94A3B8';
  static readonly textPlaceholder: string = '#94A3B8';
  static readonly textOnBrand: string = '#FFFFFF';

  // Border
  static readonly borderDefault: string = '#E2E8F0';
  static readonly borderSoft: string = 'rgba(15,23,42,0.06)';
  static readonly cardDivider: string = '#E2E8F0';

  // Radii
  static readonly radiusTiny: number = 6;
  static readonly radiusSmall: number = 8;
  static readonly radiusChip: number = 10;
  static readonly radiusCard: number = 18;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 14;
  static readonly radiusPill: number = 12;

  // Layout
  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;

  // Shadows
  static readonly cardShadow: ShadowSpec = { radius: 12, color: 'rgba(13,148,136,0.10)', offsetY: 4 };
  static readonly cardShadowStrong: ShadowSpec = { radius: 16, color: 'rgba(13,148,136,0.14)', offsetY: 6 };
  static readonly buttonShadow: ShadowSpec = { radius: 12, color: 'rgba(13,148,136,0.30)', offsetY: 4 };
  static readonly tabShadow: ShadowSpec = { radius: 12, color: 'rgba(15,23,42,0.06)', offsetY: -4 };
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0D9488', 0.0], ['#14B8A6', 1.0]]
  } as LinearGradient;

  static readonly hero: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0D9488', 0.0], ['#06B6D4', 1.0]]
  } as LinearGradient;

  static readonly inspect: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0D9488', 0.0], ['#14B8A6', 1.0]]
  } as LinearGradient;

  static readonly hazard: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#14B8A6', 0.0], ['#06B6D4', 1.0]]
  } as LinearGradient;

  static readonly note: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#6366F1', 0.0], ['#0EA5E9', 1.0]]
  } as LinearGradient;

  static readonly contact: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F59E0B', 0.0], ['#EF4444', 1.0]]
  } as LinearGradient;
}
