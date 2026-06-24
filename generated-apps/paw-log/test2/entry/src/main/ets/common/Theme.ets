// PawLog Theme Tokens
// Palette: mint green + paw pink, rounded healing style.

export class Theme {
  // Primary mint
  static readonly mint50: string = '#F4FDFA'
  static readonly mint100: string = '#E5FAF4'
  static readonly mint200: string = '#C9F4E8'
  static readonly mint300: string = '#9CEBD4'
  static readonly mint500: string = '#5ED7B6'
  static readonly mint600: string = '#3FC0A0'
  static readonly mint700: string = '#2DB08E'

  // Secondary paw pink
  static readonly pink100: string = '#FFF0F3'
  static readonly pink500: string = '#FFB3C1'
  static readonly pink600: string = '#FF9AAE'

  // Accents
  static readonly yellow100: string = '#FFF9E6'
  static readonly yellow500: string = '#FFD166'
  static readonly blue100: string = '#E6F5FB'
  static readonly blue500: string = '#87CEEB'
  static readonly lavender100: string = '#F2F1FA'
  static readonly lavender500: string = '#B8B8E0'
  static readonly apricot100: string = '#FDF5EA'
  static readonly apricot500: string = '#F4D0A4'
  static readonly apricotIconStart: string = '#FFD8A8'
  static readonly apricotIconEnd: string = '#F4C288'

  // Forest neutrals
  static readonly forest900: string = '#163832'
  static readonly forest700: string = '#3D5A52'
  static readonly forest500: string = '#6F8983'
  static readonly forest200: string = '#C9D8D4'
  static readonly forest100: string = '#E3EDEA'

  // Semantic
  static readonly success: string = '#4CC89A'
  static readonly warning: string = '#FFAA5C'
  static readonly error: string = '#FF7474'
  static readonly info: string = '#5FC7E8'

  // Page
  static readonly pageBg: string = '#FAFDFC'
  static readonly cardBg: string = '#FFFFFF'
  static readonly glassBg: string = 'rgba(255,255,255,0.76)'
  static readonly glassBorder: string = 'rgba(255,255,255,0.65)'

  // Text
  static readonly textPrimary: string = '#163832'
  static readonly textSecondary: string = '#3D5A52'
  static readonly textTertiary: string = '#6F8983'
  static readonly textWhite: string = '#FFFFFF'

  // Radius
  static readonly radiusTiny: number = 10
  static readonly radiusSmall: number = 12
  static readonly radiusChip: number = 20
  static readonly radiusCard: number = 24
  static readonly radiusHero: number = 28
  static readonly radiusButton: number = 28
  static readonly radiusQuick: number = 24
  static readonly radiusPill: number = 200

  // Layout
  static readonly pageHorizontalPadding: number = 16
  static readonly bottomTabHeight: number = 68
  static readonly contentMaxWidth: number = 390
  static readonly touchTarget: number = 44
  static readonly headerHeight: number = 52
  static readonly petSwitcherHeight: number = 84
  static readonly quickButtonSize: number = 72
}

export class BrandGradient {
  static readonly primary: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#5ED7B6', 0.0], ['#3FC0A0', 0.5], ['#2DB08E', 1.0]],
  } as LinearGradient

  static readonly mintToPink: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#5ED7B6', 0.0], ['#FFB3C1', 1.0]],
  } as LinearGradient

  static readonly mintIcon: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#9CEBD4', 0.0], ['#5ED7B6', 1.0]],
  } as LinearGradient

  static readonly apricotIcon: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#FFD8A8', 0.0], ['#F4C288', 1.0]],
  } as LinearGradient

  static readonly blueIcon: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#B2E3F5', 0.0], ['#87CEEB', 1.0]],
  } as LinearGradient

  static readonly lavenderIcon: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#D4D4F0', 0.0], ['#B8B8E0', 1.0]],
  } as LinearGradient
}
