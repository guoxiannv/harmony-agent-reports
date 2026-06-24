// Pinankou icon wrapper - uses text fallbacks when SVG rawfiles are not prepared.
// Add rawfile SVG assets and update fileNameForVariant to switch to vector icons.
@Component
export struct SvgIcon {
  @Prop iconSize: number = 24
  @Prop color: string = '#115E59'
  @Prop strokeWidth: number = 2
  @Prop variant: string = 'home'

  build() {
    Text(this.iconLabel())
      .fontSize(this.iconSize * 0.6)
      .fontWeight(FontWeight.Bold)
      .fontColor(this.color)
      .width(this.iconSize)
      .height(this.iconSize)
      .textAlign(TextAlign.Center)
  }

  private iconLabel(): string {
    switch (this.variant) {
      case 'home':
        return 'H'
      case 'patrol':
        return 'P'
      case 'issues':
        return '!'
      case 'contacts':
        return 'C'
      case 'stats':
        return 'S'
      case 'add':
        return '+'
      case 'back':
        return '←'
      default:
        return '•'
    }
  }
}
