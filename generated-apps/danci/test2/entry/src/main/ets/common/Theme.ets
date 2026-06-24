// TemplateTheme.ets
//
// A model-friendly theme token template for scaffolded HarmonyOS apps.
//
// Agent rules:
// - Keep the exported class names as Theme and BrandGradient.
// - Prefer replacing token values instead of renaming widely used semantic tokens.
// - Keep layout contract tokens such as pageHorizontalPadding, bottomTabHeight,
// - contentMaxWidth, and touchTarget stable unless the app shell changes.
//
// Usage:
// - Replace color, radius, spacing, and gradient values to match the real brand.
// - If the project already has a design system, adapt this file to that system
// - while preserving the common semantic API used by scaffold components.
//
// Notes:
// - This file intentionally uses semantic token names instead of screen-specific names.
// - The default values are placeholders and should not be treated as product requirements.
export class Theme {
  // Backgrounds
  static readonly pageBg: string = '#FAF8FF';
  static readonly cardBg: string = '#FFFFFF';
  static readonly cardBackBg: string = '#FBFAFF';

  // Brand
  static readonly brandPrimary: string = '#6B4EE6';
  static readonly brandDark: string = '#2D2A4A';
  static readonly brandLight: string = '#8568F0';

  // Accents
  static readonly accentGreen: string = '#3DD9A0';
  static readonly accentGreenDark: string = '#2BC88E';
  static readonly accentOrange: string = '#FF8C69';
  static readonly accentOrangeDark: string = '#F57A54';
  static readonly gold: string = '#FFD36E';
  static readonly goldStart: string = '#FFECB3';
  static readonly goldMid: string = '#FFD36E';
  static readonly goldDark: string = '#8A6D1B';

  // Text
  static readonly textPrimary: string = '#2D2A4A';
  static readonly textSecondary: string = '#6B6580';
  static readonly textTertiary: string = '#9B96B0';
  static readonly textQuaternary: string = 'rgba(155,150,176,0.72)';
  static readonly textPlaceholder: string = 'rgba(155,150,176,0.56)';

  // Surfaces
  static readonly borderDefault: string = '#E8E4F3';
  static readonly borderSoft: string = 'rgba(107,78,230,0.10)';
  static readonly cardDivider: string = '#B8B0E6';
  static readonly mist: string = '#B8B0E6';
  static readonly surfaceSoft: string = '#F0EDF8';
  static readonly glassBg: string = 'rgba(255,255,255,0.72)';

  // Legacy aliases (kept for scaffold stability)
  static readonly roseAccent: string = '#FF8C69';
  static readonly chipSelectedStart: string = '#F0EDF8';
  static readonly chipSelectedEnd: string = '#E8E4F3';
  static readonly chipSoftBg: string = '#F0EDF8';
  static readonly calorieTagBg: string = '#F0EDF8';
  static readonly calorieTagText: string = '#6B4EE6';
  static readonly goldSoftBg: string = '#FFF9E6';
  static readonly softHoverBg: string = '#F5F3FA';

  // Radius
  static readonly radiusChip: number = 20;
  static readonly radiusCard: number = 36;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 22;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 980;

  // Layout
  static readonly pageHorizontalPadding: number = 24;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#6B4EE6', 0.0], ['#8568F0', 1.0]],
  } as LinearGradient;

  static readonly knownBtn: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#3DD9A0', 0.0], ['#2BC88E', 1.0]],
  } as LinearGradient;

  static readonly unknownBtn: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FF8C69', 0.0], ['#F57A54', 1.0]],
  } as LinearGradient;

  static readonly progress: LinearGradient = {
    angle: 90,
    direction: GradientDirection.Right,
    colors: [['#6B4EE6', 0.0], ['#3DD9A0', 1.0]],
  } as LinearGradient;

  static readonly goldText: LinearGradient = {
    angle: 90,
    direction: GradientDirection.Right,
    colors: [['#FFECB3', 0.0], ['#FFD36E', 0.5], ['#FFECB3', 1.0]],
  } as LinearGradient;

  static readonly chipSelected: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F0EDF8', 0.0], ['#E8E4F3', 1.0]],
  } as LinearGradient;
}
