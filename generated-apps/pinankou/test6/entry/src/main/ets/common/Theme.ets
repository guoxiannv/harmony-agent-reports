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
  static readonly pageBg: string = '#F6F1EA';
  static readonly cardBg: string = '#FFFFFF';
  static readonly brandPrimary: string = '#006F45';
  static readonly brandDark: string = '#0F3329';
  static readonly gold: string = '#D4AF37';
  static readonly goldStart: string = '#CBA258';
  static readonly goldMid: string = '#E8C96A';
  static readonly roseAccent: string = '#C04455';
  static readonly textPrimary: string = '#0F3329';
  static readonly textSecondary: string = 'rgba(15,51,41,0.82)';
  static readonly textTertiary: string = 'rgba(15,51,41,0.56)';
  static readonly textQuaternary: string = 'rgba(15,51,41,0.46)';
  static readonly textPlaceholder: string = 'rgba(15,51,41,0.38)';
  static readonly borderDefault: string = '#D9CFC4';
  static readonly borderSoft: string = 'rgba(15,51,41,0.08)';
  static readonly cardDivider: string = '#E6DCD3';
  static readonly chipSelectedStart: string = '#E8F3F0';
  static readonly chipSelectedEnd: string = '#D4E9E2';
  static readonly chipSoftBg: string = '#F6F1EA';
  static readonly calorieTagBg: string = '#F6F1EA';
  static readonly calorieTagText: string = '#5C4033';
  static readonly goldSoftBg: string = '#FBF6E9';
  static readonly softHoverBg: string = '#FAF7F2';

  static readonly radiusChip: number = 20;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 28;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 12;

  static readonly pageHorizontalPadding: number = 16;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#006F45', 0.0], ['#0F3329', 1.0]],
  } as LinearGradient;

  static readonly goldText: LinearGradient = {
    angle: 90,
    direction: GradientDirection.Right,
    colors: [['#CBA258', 0.0], ['#E8C96A', 0.5], ['#CBA258', 1.0]],
  } as LinearGradient;

  static readonly chipSelected: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#E8F3F0', 0.0], ['#D4E9E2', 1.0]],
  } as LinearGradient;
}
