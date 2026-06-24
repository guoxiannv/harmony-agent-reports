// Theme.ets — 平安扣 Pinankou (blue-green safety palette per design-alignment).
export class Theme {
  // Backgrounds
  static readonly pageBg: string = '#F0FDFA';
  static readonly cardBg: string = '#FFFFFF';
  static readonly softSurfaceBg: string = '#F0F9FF';
  static readonly overlayBg: string = 'rgba(15,23,42,0.45)';
  static readonly cardBorder: string = '#E2E8F0';

  // Brand — teal
  static readonly brandPrimary: string = '#0D9488'; // Teal 600
  static readonly brandDeep: string = '#0F766E';
  static readonly brandLight: string = '#14B8A6';
  static readonly brandSoft: string = '#CCFBF1';
  static readonly brandAccent: string = '#3B82F6'; // info blue
  static readonly brandGradientStart: string = '#0F766E';
  static readonly brandGradientMid: string = '#14B8A6';
  static readonly brandGradientEnd: string = '#2DD4BF';

  // Risk / status colors
  static readonly riskLow: string = '#10B981';
  static readonly riskLowBg: string = '#D1FAE5';
  static readonly riskMedium: string = '#F59E0B';
  static readonly riskMediumBg: string = '#FEF3C7';
  static readonly riskHigh: string = '#F97316';
  static readonly riskHighBg: string = '#FFEDD5';
  static readonly riskCritical: string = '#F43F5E';
  static readonly riskCriticalBg: string = '#FFE4E6';

  // Text
  static readonly textPrimary: string = '#0F172A';
  static readonly textSecondary: string = '#334155';
  static readonly textTertiary: string = '#64748B';
  static readonly textQuaternary: string = '#94A3B8';
  static readonly textPlaceholder: string = '#94A3B8';
  static readonly textOnBrand: string = '#FFFFFF';
  static readonly textOnBrandSoft: string = 'rgba(255,255,255,0.78)';

  // Borders / dividers
  static readonly borderDefault: string = '#E2E8F0';
  static readonly borderSoft: string = 'rgba(15,23,42,0.06)';
  static readonly cardDivider: string = '#F1F5F9';

  // Chips / soft fills
  static readonly chipSelectedStart: string = '#CCFBF1';
  static readonly chipSelectedEnd: string = '#99F6E4';
  static readonly chipSoftBg: string = '#F1F5F9';

  // Radii
  static readonly radiusChip: number = 999;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 14;
  static readonly radiusSmall: number = 12;
  static readonly radiusTiny: number = 8;

  // Layout
  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 64;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0F766E', 0.0], ['#14B8A6', 0.5], ['#2DD4BF', 1.0]],
  } as LinearGradient;

  static readonly hero: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightBottom,
    colors: [['#0F766E', 0.0], ['#134E4A', 1.0]],
  } as LinearGradient;

  static readonly pageBg: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#F0F9FF', 0.0], ['#F0FDFA', 0.5], ['#F0F4F8', 1.0]],
  } as LinearGradient;
}

// Risk + status helpers
export type RiskLevel = 'low' | 'medium' | 'high' | 'critical';
export type HazardStatus = 'pending' | 'rectifying' | 'accepting' | 'done';

export function riskLabel(level: RiskLevel): string {
  if (level === 'low') return '低风险';
  if (level === 'medium') return '中风险';
  if (level === 'high') return '高风险';
  return '严重';
}
export function riskColor(level: RiskLevel): string {
  if (level === 'low') return Theme.riskLow;
  if (level === 'medium') return Theme.riskMedium;
  if (level === 'high') return Theme.riskHigh;
  return Theme.riskCritical;
}
export function riskBg(level: RiskLevel): string {
  if (level === 'low') return Theme.riskLowBg;
  if (level === 'medium') return Theme.riskMediumBg;
  if (level === 'high') return Theme.riskHighBg;
  return Theme.riskCriticalBg;
}

export function statusLabel(s: HazardStatus): string {
  if (s === 'pending') return '待整改';
  if (s === 'rectifying') return '整改中';
  if (s === 'accepting') return '待验收';
  return '已完成';
}
export function statusColor(s: HazardStatus): string {
  if (s === 'pending') return Theme.riskHigh;
  if (s === 'rectifying') return Theme.brandPrimary;
  if (s === 'accepting') return Theme.riskMedium;
  return Theme.riskLow;
}
export function statusBg(s: HazardStatus): string {
  if (s === 'pending') return Theme.riskHighBg;
  if (s === 'rectifying') return Theme.brandSoft;
  if (s === 'accepting') return Theme.riskMediumBg;
  return Theme.riskLowBg;
}

