// Theme.ets — 手作·印记 陶土色 + 手写感 主题令牌(对齐 design-alignment 色彩规范)
//
// 共享语义主题层。保留导出名 Theme / BrandGradient 与布局契约令牌
// (pageHorizontalPadding / bottomTabHeight / contentMaxWidth / touchTarget)。

export class Theme {
  // 背景 / 卡片
  static readonly pageBg: string = '#FAF6F1';        // 素坯白
  static readonly cardBg: string = '#EDE6DC';        // 泥板灰
  static readonly cardLight: string = '#FAF6F1';     // 卡片亮底
  static readonly paperBg: string = '#FFFCF6';
  static readonly sand: string = '#EBDBC2';          // 砂金米

  // 品牌主色
  static readonly clay: string = '#A65D48';          // 赤陶棕
  static readonly clayMid: string = '#C06B50';       // 渐变中段
  static readonly clayDeep: string = '#8A4A2C';
  static readonly brandPrimary: string = Theme.clay;
  static readonly brandDark: string = Theme.clay;

  // 功能色
  static readonly fire: string = '#E57A39';          // 窑火橙(主 CTA)
  static readonly fireDeep: string = '#D06A2E';
  static readonly ctaPrimary: string = Theme.fire;
  static readonly green: string = '#4D8A72';         // 青釉绿(成功/已约)
  static readonly yellow: string = '#C99E3A';        // 藤金黄(警告/签到)
  static readonly yellowDeep: string = '#D4A843';
  static readonly red: string = '#B84A3D';           // 窑变红(错误/库存不足)
  static readonly ochre: string = '#C98A3A';

  // 文字
  static readonly textPrimary: string = '#3A2E29';   // 深褐
  static readonly textSecondary: string = '#6B5A4F'; // 中褐
  static readonly textTertiary: string = '#A89A8E';  // 浅褐(占位/禁用)
  static readonly textQuaternary: string = '#A89A8E';
  static readonly textPlaceholder: string = '#A89A8E';
  static readonly textOnClay: string = '#FFFBF6';

  // 描边 / 阴影
  static readonly borderDefault: string = '#DCC8B0';
  static readonly borderSoft: string = 'rgba(111,69,59,0.08)';
  static readonly cardDivider: string = 'rgba(111,69,59,0.08)';
  static readonly shadowColor: string = 'rgba(111,69,59,0.10)';

  // 状态底色
  static readonly successBg: string = '#E2EEE8';
  static readonly successText: string = Theme.green;
  static readonly warningBg: string = '#F6E6C9';
  static readonly warningText: string = Theme.yellow;
  static readonly dangerBg: string = '#F4E4E2';
  static readonly dangerText: string = Theme.red;
  static readonly fireSoftBg: string = '#FCE8D9';
  static readonly chipSoftBg: string = Theme.sand;

  // 圆角
  static readonly radiusChip: number = 999;
  static readonly radiusCard: number = 22;
  static readonly radiusHero: number = 24;
  static readonly radiusButton: number = 999;
  static readonly radiusSmall: number = 16;
  static readonly radiusTiny: number = 10;
  static readonly radiusPill: number = 14;

  // 间距 / 布局契约
  static readonly pageHorizontalPadding: number = 20;
  static readonly bottomTabHeight: number = 76;
  static readonly contentMaxWidth: number = 420;
  static readonly touchTarget: number = 44;

  // 字号
  static readonly fontDisplay: number = 30;
  static readonly fontTitle: number = 22;
  static readonly fontBody: number = 15;
  static readonly fontCaption: number = 12;
}

export class BrandGradient {
  // hero 渐变(赤陶棕)
  static readonly clay: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#A65D48', 0.0], ['#C06B50', 1.0]],
  } as LinearGradient;

  // 窑火橙渐变(签到 / 主 CTA)
  static readonly fire: LinearGradient = {
    angle: 145,
    direction: GradientDirection.RightTop,
    colors: [['#E57A39', 0.0], ['#D06A2E', 1.0]],
  } as LinearGradient;

  // 藤金黄渐变(沉睡汇总卡)
  static readonly yellow: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#C99E3A', 0.0], ['#D4A843', 1.0]],
  } as LinearGradient;

  // 砂金米渐变(积分卡)
  static readonly paper: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#F3E6CB', 0.0], ['#E7D2AC', 1.0]],
  } as LinearGradient;
}
