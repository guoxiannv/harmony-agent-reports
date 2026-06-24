// Theme.ets
//
// Shared semantic design tokens for '今天吃什么' (DESIGN2 food palette).
// Layout contract tokens (pageHorizontalPadding, bottomTabHeight,
// contentMaxWidth, touchTarget) stay stable; only values are replaced.

export class Theme {
  // 背景与表面
  static readonly pageBg: string = '#FFF8F0'; // Cream
  static readonly espresso: string = '#2E2B28'; // 深色主题
  static readonly cardBg: string = '#FFFFFF';
  static readonly inputBg: string = '#F3ECE1'; // 沙色输入/分组底
  static readonly softChipBg: string = '#F3ECE1';

  // 食物色谱
  static readonly tomato: string = '#E85D4E';
  static readonly tomatoDark: string = '#D64F42';
  static readonly avocado: string = '#7CAE7A';
  static readonly avocadoText: string = '#4D7A4B';
  static readonly avocadoSoft: string = '#E2F0E1';
  static readonly yolk: string = '#F2B134';
  static readonly caramel: string = '#C47D4C';
  static readonly taro: string = '#A68CC6';
  static readonly mint: string = '#7DD3C0';
  static readonly berry: string = '#D67A94';
  static readonly sand: string = '#D6C6B3';

  // 文本
  static readonly textPrimary: string = '#2E2B28';
  static readonly textSecondary: string = '#6D6761';
  static readonly textTertiary: string = '#A9A29B';
  static readonly textOnDark: string = '#FFF8F0';

  // 标签/筛选
  static readonly moodActiveBg: string = '#FFE8D6';
  static readonly moodActiveText: string = '#9C5A36';
  static readonly borderSoft: string = '#E8DDD1';
  static readonly cardDivider: string = '#F3ECE1';
  static readonly shadowCard: string = 'rgba(46,43,40,0.08)';
  static readonly shadowTomato: string = 'rgba(232,93,78,0.28)';

  // 圆角
  static readonly radiusChip: number = 14;
  static readonly radiusCard: number = 24;
  static readonly radiusHero: number = 28;
  static readonly radiusButton: number = 18;
  static readonly radiusSmall: number = 16;
  static readonly radiusTiny: number = 12;
  static readonly radiusPill: number = 999;

  // 布局契约
  static readonly pageHorizontalPadding: number = 22;
  static readonly pageBottomPaddingTab: number = 120;
  static readonly bottomTabHeight: number = 80;
  static readonly contentMaxWidth: number = 390;
  static readonly touchTarget: number = 44;
}

// 转盘 8 分区食物色谱（HTML conic-gradient 顺序）
export const WHEEL_COLORS: string[] = [
  Theme.tomato, Theme.avocado, Theme.yolk, Theme.caramel,
  Theme.taro, Theme.mint, Theme.berry, Theme.sand,
];

// 食材小圆点配色（食材页标签云）
export const TAG_DOT_COLORS: string[] = [
  Theme.avocado, Theme.tomato, Theme.yolk, Theme.caramel,
  Theme.taro, Theme.mint, Theme.berry, Theme.sand,
];

export class BrandGradient {
  static readonly tomato: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [[Theme.tomato, 0.0], [Theme.tomatoDark, 1.0]],
  } as LinearGradient;

  static readonly shareCard: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [[Theme.tomato, 0.0], [Theme.tomatoDark, 1.0]],
  } as LinearGradient;

  static readonly heroEspresso: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#3A3632', 0.0], [Theme.espresso, 1.0]],
  } as LinearGradient;
}
