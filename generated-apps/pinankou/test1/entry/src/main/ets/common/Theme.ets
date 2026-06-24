// Theme.ets - 平安扣 Pinankou blue-green safety palette.
//
// Agent rules honored:
// - Keep exported class names: Theme and BrandGradient.
// - Keep layout contract tokens stable: pageHorizontalPadding, bottomTabHeight,
//   contentMaxWidth, touchTarget, plus radius tokens.
// - Only token VALUES were rewritten from the green/gold placeholder palette to
//   the blue-green safety palette from design-alignment.md / DESIGN2.
export class Theme {
  // Page background gradient (linear-gradient 180deg).
  static readonly pageBgStart: string = '#E0F2FE';
  static readonly pageBg32: string = '#D1FAE5';
  static readonly pageBg68: string = '#F0FDFA';
  static readonly pageBgEnd: string = '#F8FAFC';
  static readonly pageBg: string = '#F0FDFA'; // fallback solid

  // Brand / surfaces.
  static readonly cardBg: string = 'rgba(255,255,255,0.88)';
  static readonly cardBgSolid: string = '#FFFFFF';

  // Brand colors.
  static readonly sky: string = '#38BDF8';
  static readonly sky600: string = '#0EA5E9';
  static readonly mint: string = '#34D399';
  static readonly teal: string = '#0F766E';
  static readonly teal500: string = '#14B8A6';

  static readonly brandPrimary: string = '#0F766E';
  static readonly brandDark: string = '#0F172A';

  // Slate text scale.
  static readonly slate900: string = '#0F172A';
  static readonly slate600: string = '#475569';
  static readonly slate400: string = '#94A3B8';
  static readonly slate200: string = '#E2E8F0';

  static readonly textPrimary: string = '#0F172A';
  static readonly textSecondary: string = '#475569';
  static readonly textTertiary: string = '#94A3B8';
  static readonly textQuaternary: string = '#94A3B8';
  static readonly textPlaceholder: string = '#94A3B8';

  // Status / risk colors.
  static readonly riskHigh: string = '#EF4444';
  static readonly riskHighStart: string = '#F87171';
  static readonly riskMid: string = '#F59E0B';
  static readonly riskMidStart: string = '#FBBF24';
  static readonly riskLow: string = '#3B82F6';
  static readonly doneGreen: string = '#10B981';
  static readonly dangerRed: string = '#DC2626';

  // Accents for quick grid icons.
  static readonly accentPurple: string = '#8B5CF6';
  static readonly accentPurpleStart: string = '#A78BFA';

  // Borders / dividers.
  static readonly borderDefault: string = '#E2E8F0';
  static readonly borderSoft: string = 'rgba(15,23,42,0.06)';
  static readonly borderHairline: string = 'rgba(255,255,255,0.65)';
  static readonly cardDivider: string = '#E2E8F0';

  // Chips / soft backgrounds.
  static readonly chipSelectedStart: string = '#E0F2FE';
  static readonly chipSelectedEnd: string = '#CCFBF1';
  static readonly chipSoftBg: string = '#F1F5F9';

  // Radii (kept stable contract + extended).
  static readonly radiusChip: number = 20;
  static readonly radiusCard: number = 22;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 16;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 999;

  // Layout contract tokens (stable).
  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  // Primary blue-green gradient (sky -> mint).
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#38BDF8', 0.0], ['#34D399', 1.0]],
  } as LinearGradient;

  // Teal deep gradient (teal-500 -> teal-700).
  static readonly tealDeep: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#14B8A6', 0.0], ['#0F766E', 1.0]],
  } as LinearGradient;

  // Risk high red gradient.
  static readonly riskHigh: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F87171', 0.0], ['#EF4444', 1.0]],
  } as LinearGradient;

  // Risk mid orange gradient.
  static readonly riskMid: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FBBF24', 0.0], ['#F59E0B', 1.0]],
  } as LinearGradient;

  // Risk low blue gradient.
  static readonly riskLow: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#60A5FA', 0.0], ['#3B82F6', 1.0]],
  } as LinearGradient;

  // Done green gradient.
  static readonly doneGreen: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#34D399', 0.0], ['#10B981', 1.0]],
  } as LinearGradient;

  // Page background vertical gradient.
  static readonly pageBg: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [
      ['#E0F2FE', 0.0],
      ['#D1FAE5', 0.32],
      ['#F0FDFA', 0.68],
      ['#F8FAFC', 1.0],
    ],
  } as LinearGradient;

  // Dashboard value text gradient (teal -> sky).
  static readonly dashValue: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#0F766E', 0.0], ['#38BDF8', 1.0]],
  } as LinearGradient;

  // Dashboard alert value gradient (red).
  static readonly dashAlert: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F87171', 0.0], ['#DC2626', 1.0]],
  } as LinearGradient;

  // Quick-icon backgrounds.
  static readonly quickBlue: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#38BDF8', 0.0], ['#0EA5E9', 1.0]],
  } as LinearGradient;

  static readonly quickGreen: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#34D399', 0.0], ['#10B981', 1.0]],
  } as LinearGradient;

  static readonly quickTeal: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#14B8A6', 0.0], ['#0F766E', 1.0]],
  } as LinearGradient;

  static readonly quickOrange: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FBBF24', 0.0], ['#F59E0B', 1.0]],
  } as LinearGradient;

  static readonly quickRed: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F87171', 0.0], ['#EF4444', 1.0]],
  } as LinearGradient;

  static readonly quickPurple: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#A78BFA', 0.0], ['#8B5CF6', 1.0]],
  } as LinearGradient;
}
