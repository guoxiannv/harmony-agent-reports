// WheelSpinner.ets
//
// 菜品转盘（FR-1）。Canvas 绘制 8 分区食物色 + 标签；指针与中心「开始」按钮
// 固定在顶层不旋转；转盘本体由父组件通过 @Prop rotateAngle 控制旋转角度。
// 旋转角度由父组件用 animateTo 动画驱动，落点与父组件选取的结果一致。

import { Dish } from '../model/Types';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, WHEEL_COLORS } from '../common/Theme';

const SIZE: number = 300;
const RADIUS: number = SIZE / 2;

@Component
export struct WheelSpinner {
  @Prop candidates: Dish[] = [];
  @Prop rotateAngle: number = 0;
  onStart: () => void = () => {};
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Stack() {
      // 旋转的转盘本体
      Canvas(this.context)
        .width(SIZE)
        .height(SIZE)
        .onReady(() => this.drawWheel())
        .rotate({ angle: this.rotateAngle })

      // 固定指针（顶部，朝下）
      Column() {
        SvgIcon({ variant: 'wheel-pointer', iconSize: 28 })
      }
      .position({ x: SIZE / 2 - 14, y: -10 })
      .zIndex(10)

      // 中心「开始」按钮（固定，触发旋转）
      Column() {
        Text('开始')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.tomato)
      }
      .width(80)
      .height(80)
      .borderRadius(40)
      .backgroundColor(Theme.cardBg)
      .border({ width: 3, color: Theme.tomato })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow({ radius: 20, color: 'rgba(46,43,40,0.1)', offsetY: 6 })
      .zIndex(5)
      .onClick(() => this.onStart())
    }
    .width(SIZE)
    .height(SIZE)
    .margin({ top: 16 })
  }

  private drawWheel(): void {
    const ctx: CanvasRenderingContext2D = this.context;
    ctx.clearRect(0, 0, SIZE, SIZE);
    const count: number = this.candidates.length;
    if (count === 0) {
      // 空状态：灰色整圆
      ctx.beginPath();
      ctx.arc(RADIUS, RADIUS, RADIUS - 2, 0, Math.PI * 2);
      ctx.fillStyle = Theme.inputBg;
      ctx.fill();
      ctx.fillStyle = Theme.textTertiary;
      ctx.font = '14px sans-serif';
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';
      ctx.fillText('暂无候选菜品', RADIUS, RADIUS);
      return;
    }
    const seg: number = (Math.PI * 2) / count;
    const cx: number = RADIUS;
    const cy: number = RADIUS;
    for (let i = 0; i < count; i++) {
      const start: number = i * seg - Math.PI / 2;
      const end: number = (i + 1) * seg - Math.PI / 2;
      ctx.beginPath();
      ctx.moveTo(cx, cy);
      ctx.arc(cx, cy, RADIUS - 2, start, end);
      ctx.closePath();
      ctx.fillStyle = WHEEL_COLORS[i % WHEEL_COLORS.length];
      ctx.fill();

      // 标签：径向中点处，直立绘制
      const mid: number = (start + end) / 2;
      const labelR: number = RADIUS - 56;
      const lx: number = cx + labelR * Math.cos(mid);
      const ly: number = cy + labelR * Math.sin(mid);
      ctx.fillStyle = '#FFFFFF';
      ctx.font = '600 13px sans-serif';
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';
      ctx.fillText(this.shortName(this.candidates[i].name), lx, ly);
    }
  }

  private shortName(name: string): string {
    return name.length > 4 ? name.substring(0, 4) : name;
  }
}
