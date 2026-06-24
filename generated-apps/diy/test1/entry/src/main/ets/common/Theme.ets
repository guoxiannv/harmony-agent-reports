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
// 手作·印记 — clay + handwritten craft theme tokens
export class Theme {
  // Primary clay palette
  static readonly terracotta: string = '#C67B5C';
  static readonly terracottaDark: string = '#B56A4B';
  static readonly caramel: string = '#B87D4B';
  static readonly clayWhite: string = '#FAF6F0';
  static readonly ricePaper: string = '#F5EDE4';
  static readonly darkUmber: string = '#3D2B1F';

  // Secondary glaze palette
  static readonly celadon: string = '#A8B5A0';
  static readonly cobalt: string = '#5A6F7C';
  static readonly rust: string = '#A0522D';
  static readonly clayGray: string = '#9E9186';
  static readonly sand: string = '#D9CFC2';
  static readonly clayDeep: string = '#8B5A45';

  // Surfaces
  static readonly pageBg: string = '#FAF6F0';
  static readonly cardBg: string = '#FFFDF9';
  static readonly pressedClay: string = '#EDE5DA';
  static readonly inputBg: string = '#F5EDE4';
  static readonly tabBarBg: string = 'rgba(255,253,249,0.94)';

  // Text
  static readonly textPrimary: string = '#3D2B1F';
  static readonly textSecondary: string = '#5A4A3F';
  static readonly textTertiary: string = '#8C7D70';
  static readonly textQuaternary: string = '#9E9186';
  static readonly textPlaceholder: string = '#9E9186';
  static readonly textOnAccent: string = '#FFFFFF';
  static readonly link: string = '#5A6F7C';

  // Accents (legacy aliases kept for shell compatibility)
  static readonly brandPrimary: string = '#C67B5C';
  static readonly brandDark: string = '#8B5A45';
  static readonly gold: string = '#B87D4B';
  static readonly goldStart: string = '#B87D4B';
  static readonly goldMid: string = '#D4A56A';
  static readonly roseAccent: string = '#A0522D';

  // Borders & dividers
  static readonly borderDefault: string = '#F0E6DA';
  static readonly borderSoft: string = '#EFE6DA';
  static readonly cardDivider: string = '#EFE6DA';
  static readonly chipSoftBg: string = '#F5EDE4';
  static readonly softHoverBg: string = 'rgba(198,123,92,0.03)';
  static readonly goldSoftBg: string = '#FBF6E9';
  static readonly calorieTagBg: string = '#F5EDE4';
  static readonly calorieTagText: string = '#5A4A3F';

  // Radius
  static readonly radiusTiny: number = 8;
  static readonly radiusSmall: number = 12;
  static readonly radiusChip: number = 999;
  static readonly radiusCard: number = 20;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 999;
  static readonly radiusPill: number = 999;

  // Layout
  static readonly pageHorizontalPadding: number = 20;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;

  // Typography sizes (vp)
  static readonly heroSize: number = 44;
  static readonly pageTitleSize: number = 30;
  static readonly sectionTitleSize: number = 20;
  static readonly cardTitleSize: number = 17;
  static readonly bodySize: number = 15;
  static readonly captionSize: number = 13;
  static readonly microSize: number = 11;
  static readonly statSize: number = 34;

  // Shadows
  static readonly shadowNear: string = 'rgba(99,72,54,0.06)';
  static readonly shadowFar: string = 'rgba(99,72,54,0.12)';
  static readonly shadowDeep: string = 'rgba(61,43,31,0.16)';
}

export class BrandGradient {
  static readonly featureCard: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightBottom,
    colors: [['#FFFDF9', 0.0], ['#F8F1E9', 0.55], ['#F0E6DA', 1.0]],
  } as LinearGradient;

  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#C67B5C', 0.0], ['#8B5A45', 1.0]],
  } as LinearGradient;

  static readonly goldText: LinearGradient = {
    angle: 90,
    direction: GradientDirection.Right,
    colors: [['#B87D4B', 0.0], ['#D4A56A', 0.5], ['#B87D4B', 1.0]],
  } as LinearGradient;

  static readonly chipSelected: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#C67B5C', 0.0], ['#B56A4B', 1.0]],
  } as LinearGradient;
}
