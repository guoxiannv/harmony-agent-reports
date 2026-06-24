// Pinankou theme tokens - blue-green safety palette
export class Theme {
  // Brand
  static readonly brandDeep: string = '#115E59'
  static readonly brandPrimary: string = '#0D9488'
  static readonly brandBright: string = '#14B8A6'
  static readonly brandLight: string = '#5EEAD4'
  static readonly brandMint: string = '#CCFBF1'
  static readonly brandPale: string = '#F0FDFA'

  // Semantic status
  static readonly safe: string = '#059669'
  static readonly safeBg: string = '#D1FAE5'
  static readonly warning: string = '#B45309'
  static readonly warningBg: string = '#FEF3C7'
  static readonly danger: string = '#DC2626'
  static readonly dangerBg: string = '#FEE2E2'
  static readonly critical: string = '#991B1B'
  static readonly criticalBg: string = '#FECACA'
  static readonly info: string = '#1D4ED8'
  static readonly infoBg: string = '#DBEAFE'

  // Surfaces
  static readonly pageBg: string = '#F0FDFA'
  static readonly surfacePrimary: string = '#FFFFFF'
  static readonly surfaceSecondary: string = '#F8FAFC'
  static readonly surfaceTertiary: string = '#E2E8F0'

  // Text
  static readonly textPrimary: string = '#0F172A'
  static readonly textSecondary: string = '#475569'
  static readonly textTertiary: string = '#94A3B8'
  static readonly textQuaternary: string = 'rgba(15,23,42,0.46)'

  // Borders/dividers
  static readonly borderDefault: string = '#E2E8F0'
  static readonly borderSoft: string = 'rgba(226,232,240,0.6)'

  // Layout
  static readonly pageHorizontalPadding: number = 16
  static readonly bottomTabHeight: number = 68
  static readonly contentMaxWidth: number = 420
  static readonly touchTarget: number = 44

  // Radius
  static readonly radiusSmall: number = 8
  static readonly radiusCard: number = 16
  static readonly radiusHero: number = 20
  static readonly radiusButton: number = 23
  static readonly radiusPill: number = 9999
}
