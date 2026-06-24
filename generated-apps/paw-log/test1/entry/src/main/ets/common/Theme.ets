// PawLog theme tokens: mint green + paw pink, rounded healing style.

export class Theme {
  // Backgrounds
  static readonly pageBg: string = '#F8FAFC'
  static readonly pageGradientStart: string = '#F0FDF9'
  static readonly pageGradientEnd: string = '#FFF6F7'
  static readonly cardBg: string = '#FFFFFF'
  static readonly cardWarmBg: string = '#FFF1F2'

  // Brand
  static readonly brandPrimary: string = '#14B8A6'
  static readonly brandDark: string = '#0F766E'
  static readonly brandLight: string = '#CCFBEF'
  static readonly brandSoft: string = '#F0FDF9'

  // Accent (paw pink)
  static readonly pawPink: string = '#FB7185'
  static readonly pawPinkSoft: string = '#FFE4E6'
  static readonly pawPinkDark: string = '#BE123C'

  // Semantic status
  static readonly statusOverdue: string = '#EF4444'
  static readonly statusOverdueBg: string = '#FFF1F2'
  static readonly statusOverdueText: string = '#BE123C'
  static readonly statusSoon: string = '#F59E0B'
  static readonly statusSoonBg: string = '#FFFBEB'
  static readonly statusSoonText: string = '#B45309'
  static readonly statusOk: string = '#14B8A6'
  static readonly statusOkBg: string = '#F0FDF9'
  static readonly statusOkText: string = '#0F766E'

  // Text
  static readonly textPrimary: string = '#0F172A'
  static readonly textSecondary: string = '#334155'
  static readonly textTertiary: string = '#64748B'
  static readonly textQuaternary: string = '#94A3B8'
  static readonly textPlaceholder: string = '#CBD5E1'
  static readonly textOnPrimary: string = '#FFFFFF'

  // Borders
  static readonly borderDefault: string = '#E2E8F0'
  static readonly borderSoft: string = 'rgba(15,23,42,0.06)'
  static readonly borderDashed: string = '#CBD5E1'

  // Type accents
  static readonly foodAccent: string = '#14B8A6'
  static readonly foodBg: string = '#F0FDF9'
  static readonly wasteAccent: string = '#C2410C'
  static readonly wasteBg: string = '#FFEDD5'
  static readonly weightAccent: string = '#2563EB'
  static readonly weightBg: string = '#EFF6FF'
  static readonly medicineAccent: string = '#7C3AED'
  static readonly medicineBg: string = '#F3E8FF'

  // Radius
  static readonly radiusChip: number = 16
  static readonly radiusCard: number = 22
  static readonly radiusHero: number = 24
  static readonly radiusButton: number = 28
  static readonly radiusSmall: number = 14
  static readonly radiusTiny: number = 10
  static readonly radiusPill: number = 12

  // Layout
  static readonly pageHorizontalPadding: number = 20
  static readonly bottomTabHeight: number = 72
  static readonly contentMaxWidth: number = 390
  static readonly touchTarget: number = 44
}

export class BrandGradient {
  static readonly fab: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#14B8A6', 0.0], ['#FB7185', 1.0]],
  } as LinearGradient

  static readonly avatar: LinearGradient = {
    angle: 135,
    direction: GradientDirection.RightTop,
    colors: [['#CCFBEF', 0.0], ['#FFE4E6', 1.0]],
  } as LinearGradient

  static readonly page: LinearGradient = {
    angle: 180,
    direction: GradientDirection.Bottom,
    colors: [['#F0FDF9', 0.0], ['#F8FAFC', 0.4], ['#FFF6F7', 1.0]],
  } as LinearGradient
}
