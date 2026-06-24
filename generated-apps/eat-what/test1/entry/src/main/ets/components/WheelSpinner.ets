// WheelSpinner — the home-page spinning wheel.
//
// Canvas draws n colored pie sectors from the current wheel pool. The Canvas
// rotates via animateTo on tap; a fixed caramel pointer sits at the top and the
// center "开始" button triggers the spin. On animation completion the
// controller selects the dish.

import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import { Theme, ShadowConfig } from '../common/Theme';

@Component
export struct WheelSpinner {
  controller: AppController = AppController.getInstance();
  private wheelSize: number = 280;
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State private rotation: number = 0;
  @State private spinning: boolean = false;

  private palette: string[] = ['#F2A864', '#E4B84A', '#4A9B8E', '#8B7EC8', '#C65D4F', '#D97736'];

  build() {
    Stack({ alignContent: Alignment.Center }) {
      // Rotating wheel face.
      Canvas(this.ctx)
        .width(this.wheelSize)
        .height(this.wheelSize)
        .rotate({ angle: this.rotation })
        .onReady(() => {
          this.drawWheel();
        })

      // Fixed pointer (downward triangle) at the top center.
      Path()
        .commands('M2 0 L14 22 L26 0 Z')
        .width(28)
        .height(24)
        .fill(Theme.brandPrimary)
        .stroke('#FFFFFF')
        .strokeWidth(2)
        .position({ x: this.wheelSize / 2 - 14, y: -6 })

      // Center start button.
      Button('开始')
        .id('home-spin-button')
        .width(84)
        .height(84)
        .borderRadius(42)
        .backgroundColor(Theme.brandPrimary)
        .fontColor('#FFFFFF')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .border({ width: 4, color: '#FFFFFF' })
        .shadow(ShadowConfig.button)
        .onClick(() => this.spin())
    }
    .width(this.wheelSize)
    .height(this.wheelSize)
    .alignContent(Alignment.Center)
  }

  private pool(): Dish[] {
    return this.controller.getDishRepo().wheelPool();
  }

  private drawWheel(): void {
    const c: CanvasRenderingContext2D = this.ctx;
    const dishes: Dish[] = this.pool();
    const n: number = dishes.length;
    const r: number = this.wheelSize / 2;
    c.clearRect(0, 0, this.wheelSize, this.wheelSize);
    if (n === 0) {
      c.beginPath();
      c.arc(r, r, r - 2, 0, Math.PI * 2);
      c.fillStyle = Theme.inputBg;
      c.fill();
      return;
    }
    const step: number = (Math.PI * 2) / n;
    for (let i = 0; i < n; i++) {
      const start: number = i * step - Math.PI / 2;
      const end: number = start + step;
      c.beginPath();
      c.moveTo(r, r);
      c.arc(r, r, r - 2, start, end);
      c.closePath();
      c.fillStyle = this.palette[i % this.palette.length];
      c.fill();
      c.lineWidth = 2;
      c.strokeStyle = '#FFFFFF';
      c.stroke();
    }
    // inner white ring
    c.beginPath();
    c.arc(r, r, r - 14, 0, Math.PI * 2);
    c.lineWidth = 4;
    c.strokeStyle = 'rgba(255,255,255,0.7)';
    c.stroke();
  }

  private spin(): void {
    if (this.spinning) {
      return;
    }
    const dishes: Dish[] = this.pool();
    if (dishes.length === 0) {
      this.controller.spinWheel();
      return;
    }
    this.spinning = true;
    this.controller.isSpinning = true;
    const spins: number = 4 + (Math.floor(Math.random() * 3));
    const extra: number = Math.random() * 360;
    const target: number = this.rotation + spins * 360 + extra;
    animateTo({
      duration: 2200,
      tempo: 1.0,
      curve: Curve.EaseOut,
      delay: 0,
      iterations: 1,
      playMode: PlayMode.Normal,
    }, () => {
      this.rotation = target;
    });
    // Resolve the result when the animation visually settles.
    setTimeout(() => {
      this.spinning = false;
      this.controller.isSpinning = false;
      this.controller.spinWheel();
    }, 2200);
  }
}
