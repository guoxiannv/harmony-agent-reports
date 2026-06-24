// WheelComponent.ets
//
// The lucky wheel for the Home page. Renders six colored sectors on a Canvas
// and is rotated by its parent ( HomePage animates the `angle` prop on spin ).
// The pointer stays fixed at the top center; the resolved dish comes from the
// controller, so the result is always deterministic after a spin.

@Component
export struct WheelComponent {
  @Prop angle: number = 0;
  @Prop diameter: number = 280;

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  private readonly colors: string[] = ['#FFCC5C', '#3DD9C7', '#FFE9DE', '#FF6B8B', '#C4A8FF', '#FF6B4A'];

  build() {
    Canvas(this.context)
      .width(this.diameter)
      .height(this.diameter)
      .onReady(() => {
        this.drawWheel();
      })
      .rotate({
        angle: this.angle,
        centerX: this.diameter / 2,
        centerY: this.diameter / 2,
      })
  }

  private drawWheel(): void {
    const ctx: CanvasRenderingContext2D = this.context;
    const cx: number = this.diameter / 2;
    const cy: number = this.diameter / 2;
    const r: number = this.diameter / 2 - 6;
    const n: number = this.colors.length;
    const sweep: number = Math.PI * 2 / n;
    for (let i = 0; i < n; i++) {
      const start: number = i * sweep - Math.PI / 2;
      const end: number = start + sweep;
      ctx.beginPath();
      ctx.moveTo(cx, cy);
      ctx.arc(cx, cy, r, start, end);
      ctx.closePath();
      ctx.fillStyle = this.colors[i];
      ctx.fill();
    }
    // White center cap.
    ctx.beginPath();
    ctx.arc(cx, cy, 28, 0, Math.PI * 2);
    ctx.fillStyle = '#FFFFFF';
    ctx.fill();
  }
}
