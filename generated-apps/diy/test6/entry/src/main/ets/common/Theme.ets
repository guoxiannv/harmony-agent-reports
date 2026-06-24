// Theme tokens for 手作·印记 — terracotta clay palette.
// Source of truth: .arkpilot/plans/design-alignment.md color tokens.
// Layout contract tokens (pageHorizontalPadding, bottomTabHeight, contentMaxWidth,
// touchTarget) stay stable per the scaffold shell contract.

export class Theme {
  // Surfaces.
  static readonly pageBg: string = '#F7F3ED';        // 米浆白
  static readonly appBg: string = '#E5E1DA';          // outer frame
  static readonly cardBg: string = '#FFFFFF';         // 白瓷白
  static readonly cardBgSoft: string = '#FBF6EF';
  static readonly chipSoftBg: string = '#F3EBE3';

  // Brand ramp.
  static readonly brandPrimary: string = '#9E4F2C';   // 窑红陶土
  static readonly brandSecondary: string = '#C98B6C'; // 赤陶浅褐
  static readonly brandDark: string = '#4A3024';
  static readonly ochre: string = '#B87D4B';

  // Text.
  static readonly textTitle: string = '#3B2820';      // 墨褐
  static readonly textBody: string = '#6E5D53';       // 浅墨褐
  static readonly textMuted: string = '#9E8E84';      // 淡墨褐
  static readonly textPlaceholder: string = '#9E8E84';
  static readonly textOnBrand: string = '#FFFFFF';

  // Semantic.
  static readonly success: string = '#7D9472';        // 草木灰绿
  static readonly successDark: string = '#4F6644';
  static readonly sleeping: string = '#D9A89B';       // 落霞柔粉
  static readonly danger: string = '#B85448';         // 坯裂红
  static readonly accent: string = '#8BAAB8';         // 天青釉

  // Aliases kept for any scaffold code expecting older token names.
  static readonly brandSoft: string = '#C98B6C';
  static readonly ink: string = '#3B2820';
  static readonly textPrimary: string = '#3B2820';
  static readonly textSecondary: string = '#6E5D53';
  static readonly textTertiary: string = '#9E8E84';
  static readonly textQuaternary: string = '#9E8E84';
  static readonly borderDefault: string = '#E3D6C8';
  static readonly borderSoft: string = 'rgba(158,79,44,0.10)';
  static readonly cardDivider: string = 'rgba(158,79,44,0.08)';

  // Tag chips.
  static readonly tagSleepingBg: string = '#F5DDD6';
  static readonly tagSleepingText: string = '#A64B3C';
  static readonly tagLowStockBg: string = '#F5DDD6';
  static readonly tagLowStockText: string = '#B85448';
  static readonly tagGreenBg: string = '#DFE8D6';
  static readonly tagGreenText: string = '#4F6644';
  static readonly tagBlueBg: string = '#E3EBEF';
  static readonly tagBlueText: string = '#4A6070';
  static readonly tagBookingBg: string = '#E3EBEF';
  static readonly tagBookingText: string = '#4A6070';

  // Radii.
  static readonly radiusChip: number = 12;
  static readonly radiusCard: number = 20;
  static readonly radiusReminder: number = 18;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 16;
  static readonly radiusSmall: number = 14;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 12;
  static readonly radiusInput: number = 14;

  // Layout contract (stable).
  static readonly pageHorizontalPadding: number = 22;
  static readonly bottomTabHeight: number = 68;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;

  // Typography.
  static readonly fontPageTitle: number = 44;   // handwritten big title
  static readonly fontTopNav: number = 18;
  static readonly fontSection: number = 20;
  static readonly fontCardTitle: number = 17;
  static readonly fontBody: number = 15;
  static readonly fontCaption: number = 13;
  static readonly fontTiny: number = 12;
  static readonly fontTab: number = 11;
  static readonly fontBigNumber: number = 36;
  static readonly fontBigNumberSmall: number = 28;
}

export class BrandGradient {
  // primary card / button: #9E4F2C -> #C98B6C
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#9E4F2C', 0.0], ['#C98B6C', 1.0]],
  } as LinearGradient;

  // sleeping reminder: #D9A89B -> #F0DFD8
  static readonly sleeping: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#D9A89B', 0.0], ['#F0DFD8', 1.0]],
  } as LinearGradient;

  // low-stock alert: #B85448 -> #D9A89B
  static readonly alert: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#B85448', 0.0], ['#D9A89B', 1.0]],
  } as LinearGradient;

  // points hero: warm gold-clay
  static readonly points: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#9E4F2C', 0.0], ['#B87D4B', 1.0]],
  } as LinearGradient;

  static readonly chipSelected: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F3DCC8', 0.0], ['#E8C5A8', 1.0]],
  } as LinearGradient;
}
