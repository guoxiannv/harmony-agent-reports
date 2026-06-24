// SvgIcon.ets — shared icon wrapper drawn with ArkUI shape primitives.
// Public API stable: variant, iconSize, color, strokeWidth.
@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#10303A';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'search';

  build() {
    Stack() {
      if (this.variant === 'search') {
        Circle({ width: this.iconSize * 0.6, height: this.iconSize * 0.6 })
          .fill(Color.Transparent)
          .stroke(this.color)
          .strokeWidth(this.strokeWidth)
          .position({ x: this.iconSize * 0.1, y: this.iconSize * 0.1 })
        Line()
          .width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.55, this.iconSize * 0.55])
          .endPoint([this.iconSize * 0.88, this.iconSize * 0.88])
      } else if (this.variant === 'back' || this.variant === 'chevronLeft') {
        Polyline({ width: this.iconSize, height: this.iconSize })
          .points([[this.iconSize * 0.62, this.iconSize * 0.18],
            [this.iconSize * 0.32, this.iconSize * 0.5], [this.iconSize * 0.62, this.iconSize * 0.82]])
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineJoin(LineJoinStyle.Round).strokeLineCap(LineCapStyle.Round)
      } else if (this.variant === 'plus' || this.variant === 'add') {
        Line().width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.15, this.iconSize * 0.5])
          .endPoint([this.iconSize * 0.85, this.iconSize * 0.5])
        Line().width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.5, this.iconSize * 0.15])
          .endPoint([this.iconSize * 0.5, this.iconSize * 0.85])
      } else if (this.variant === 'phone' || this.variant === 'call') {
        Path()
          .width(this.iconSize).height(this.iconSize)
          .commands(`M${(this.iconSize * 0.22).toFixed(1)},${(this.iconSize * 0.22).toFixed(1)} ` +
            `q${(this.iconSize * 0.0).toFixed(1)},${(this.iconSize * -0.05).toFixed(1)} ${(this.iconSize * 0.05).toFixed(1)},${(this.iconSize * -0.05).toFixed(1)} ` +
            `l${(this.iconSize * 0.15).toFixed(1)},0 q${(this.iconSize * 0.05).toFixed(1)},0 ${(this.iconSize * 0.05).toFixed(1)},${(this.iconSize * 0.05).toFixed(1)} ` +
            `l0,${(this.iconSize * 0.18).toFixed(1)} q0,${(this.iconSize * 0.05).toFixed(1)} ${(this.iconSize * -0.05).toFixed(1)},${(this.iconSize * 0.05).toFixed(1)} ` +
            `l${(this.iconSize * -0.1).toFixed(1)},${(this.iconSize * 0.1).toFixed(1)} q${(this.iconSize * 0.2).toFixed(1)},${(this.iconSize * 0.28).toFixed(1)} ${(this.iconSize * 0.48).toFixed(1)},${(this.iconSize * 0.48).toFixed(1)} ` +
            `l${(this.iconSize * 0.1).toFixed(1)},${(this.iconSize * -0.1).toFixed(1)} q${(this.iconSize * 0.05).toFixed(1)},${(this.iconSize * -0.05).toFixed(1)} ${(this.iconSize * 0.05).toFixed(1)},${(this.iconSize * -0.05).toFixed(1)} ` +
            `l${(this.iconSize * 0.18).toFixed(1)},0 q${(this.iconSize * 0.05).toFixed(1)},0 ${(this.iconSize * 0.05).toFixed(1)},${(this.iconSize * 0.05).toFixed(1)} l0,${(this.iconSize * 0.15).toFixed(1)} z`)
          .fill(this.color)
      } else if (this.variant === 'bell' || this.variant === 'notification') {
        Path().width(this.iconSize).height(this.iconSize)
          .commands(`M${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.16).toFixed(1)} ` +
            `a${(this.iconSize * 0.28).toFixed(1)},${(this.iconSize * 0.28).toFixed(1)} 0 0 0 ${(this.iconSize * -0.28).toFixed(1)},${(this.iconSize * 0.34).toFixed(1)} ` +
            `v${(this.iconSize * 0.16).toFixed(1)} h${(this.iconSize * 0.56).toFixed(1)} v${(this.iconSize * -0.16).toFixed(1)} ` +
            `a${(this.iconSize * 0.28).toFixed(1)},${(this.iconSize * 0.28).toFixed(1)} 0 0 0 ${(this.iconSize * -0.28).toFixed(1)},${(this.iconSize * -0.34).toFixed(1)} z ` +
            `M${(this.iconSize * 0.4).toFixed(1)},${(this.iconSize * 0.8).toFixed(1)} a${(this.iconSize * 0.1).toFixed(1)},${(this.iconSize * 0.1).toFixed(1)} 0 0 0 ${(this.iconSize * 0.2).toFixed(1)},0`)
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineJoin(LineJoinStyle.Round)
      } else if (this.variant === 'settings') {
        Circle({ width: this.iconSize * 0.36, height: this.iconSize * 0.36 })
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .position({ x: this.iconSize * 0.32, y: this.iconSize * 0.32 })
        Circle({ width: this.iconSize * 0.12, height: this.iconSize * 0.12 }).fill(this.color)
          .position({ x: this.iconSize * 0.44, y: this.iconSize * 0.44 })
        Circle({ width: this.iconSize * 0.14, height: this.iconSize * 0.14 }).fill(this.color)
          .position({ x: this.iconSize * 0.43, y: this.iconSize * 0.05 })
        Circle({ width: this.iconSize * 0.14, height: this.iconSize * 0.14 }).fill(this.color)
          .position({ x: this.iconSize * 0.43, y: this.iconSize * 0.81 })
        Circle({ width: this.iconSize * 0.14, height: this.iconSize * 0.14 }).fill(this.color)
          .position({ x: this.iconSize * 0.05, y: this.iconSize * 0.43 })
        Circle({ width: this.iconSize * 0.14, height: this.iconSize * 0.14 }).fill(this.color)
          .position({ x: this.iconSize * 0.81, y: this.iconSize * 0.43 })
      } else if (this.variant === 'close' || this.variant === 'x') {
        Line().width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.15, this.iconSize * 0.15])
          .endPoint([this.iconSize * 0.85, this.iconSize * 0.85])
        Line().width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.85, this.iconSize * 0.15])
          .endPoint([this.iconSize * 0.15, this.iconSize * 0.85])
      } else if (this.variant === 'check' || this.variant === 'done') {
        Polyline({ width: this.iconSize, height: this.iconSize })
          .points([[this.iconSize * 0.2, this.iconSize * 0.5],
            [this.iconSize * 0.42, this.iconSize * 0.72], [this.iconSize * 0.82, this.iconSize * 0.28]])
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineJoin(LineJoinStyle.Round).strokeLineCap(LineCapStyle.Round)
      } else if (this.variant === 'chart' || this.variant === 'stats') {
        Column() {
          Row().width('100%').height(this.iconSize * 0.28).backgroundColor(this.color).borderRadius(2)
          Row().width('70%').height(this.iconSize * 0.28).backgroundColor(this.color).borderRadius(2).margin({ top: 3 })
          Row().width('45%').height(this.iconSize * 0.28).backgroundColor(this.color).borderRadius(2).margin({ top: 3 })
        }.width(this.iconSize).height(this.iconSize).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.End)
      } else if (this.variant === 'alert' || this.variant === 'hazard') {
        Path().width(this.iconSize).height(this.iconSize)
          .commands(`M${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.14).toFixed(1)} ` +
            `L${(this.iconSize * 0.9).toFixed(1)},${(this.iconSize * 0.84).toFixed(1)} ` +
            `H${(this.iconSize * 0.1).toFixed(1)} Z`)
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineJoin(LineJoinStyle.Round)
        Line().width(this.iconSize).height(this.iconSize)
          .stroke(this.color).strokeWidth(this.strokeWidth).strokeLineCap(LineCapStyle.Round)
          .startPoint([this.iconSize * 0.5, this.iconSize * 0.38])
          .endPoint([this.iconSize * 0.5, this.iconSize * 0.62])
        Circle({ width: this.iconSize * 0.1, height: this.iconSize * 0.1 }).fill(this.color)
          .position({ x: this.iconSize * 0.45, y: this.iconSize * 0.68 })
      } else if (this.variant === 'shield' || this.variant === 'patrol' || this.variant === 'safety') {
        Path().width(this.iconSize).height(this.iconSize)
          .commands(`M${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.1).toFixed(1)} ` +
            `L${(this.iconSize * 0.86).toFixed(1)},${(this.iconSize * 0.24).toFixed(1)} ` +
            `V${(this.iconSize * 0.55).toFixed(1)} ` +
            `C${(this.iconSize * 0.86).toFixed(1)},${(this.iconSize * 0.82).toFixed(1)} ${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.9).toFixed(1)} ${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.9).toFixed(1)} ` +
            `C${(this.iconSize * 0.5).toFixed(1)},${(this.iconSize * 0.9).toFixed(1)} ${(this.iconSize * 0.14).toFixed(1)},${(this.iconSize * 0.82).toFixed(1)} ${(this.iconSize * 0.14).toFixed(1)},${(this.iconSize * 0.55).toFixed(1)} ` +
            `V${(this.iconSize * 0.24).toFixed(1)} Z`)
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineJoin(LineJoinStyle.Round)
      } else if (this.variant === 'user' || this.variant === 'profile') {
        Circle({ width: this.iconSize * 0.4, height: this.iconSize * 0.4 })
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .position({ x: this.iconSize * 0.3, y: this.iconSize * 0.12 })
        Path().width(this.iconSize).height(this.iconSize)
          .commands(`M${(this.iconSize * 0.18).toFixed(1)},${(this.iconSize * 0.92).toFixed(1)} ` +
            `a${(this.iconSize * 0.32).toFixed(1)},${(this.iconSize * 0.4).toFixed(1)} 0 0 1 ${(this.iconSize * 0.64).toFixed(1)},0`)
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .strokeLineCap(LineCapStyle.Round)
      } else {
        Circle({ width: this.iconSize * 0.5, height: this.iconSize * 0.5 })
          .fill(Color.Transparent).stroke(this.color).strokeWidth(this.strokeWidth)
          .position({ x: this.iconSize * 0.25, y: this.iconSize * 0.25 })
      }
    }
    .width(this.iconSize)
    .height(this.iconSize)
  }
}
