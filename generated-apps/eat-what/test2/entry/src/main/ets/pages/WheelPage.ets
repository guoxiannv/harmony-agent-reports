// WheelPage.ets
//
// 随机转盘 (surface: wheel). Faithful to page-wheel.html: dark full-screen
// surface with a top bar (back / title / share), a Canvas wheel that spins on
// tap, and a bottom result sheet with accept / reshuffle actions.

import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Dish, ShareCardData } from '../common/Models';
import { WheelEngine } from '../services/WheelEngine';
import { filterStore } from '../services/AppServices';
import { ShareCardBuilder } from '../services/ShareCardBuilder';
import { DateUtil } from '../common/DateUtil';

const SECTOR_COLORS: string[] = [
  '#FF6B35', '#FFC93D', '#3DD9C0', '#FF4D6D',
  '#9B7EDE', '#4ECDC4', '#F7DC6F', '#BB8FCE',
];
const CANVAS_SIZE: number = 300;
const CANVAS_RADIUS: number = 140;
const SPIN_TURNS: number = 5;

@Component
export struct WheelPage {
  onBack: () => void = () => {};
  onShare: (data: ShareCardData) => void = () => {};

  @State candidates: Dish[] = [];
  @State wheelAngle: number = 0;
  @State resultDish: Dish | null = null;
  @State spinning: boolean = false;

  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  aboutToAppear(): void {
    this.candidates = WheelEngine.buildCandidates(filterStore.get());
  }

  build() {
    Column() {
      // top bar
      Row() {
        Column() {
          SvgIcon({ variant: 'back-light', iconSize: 22, strokeWidth: 2 })
        }
        .id('wheel-back-button')
        .width(40)
        .height(40)
        .borderRadius(12)
        .backgroundColor('rgba(255,255,255,0.08)')
        .border({ width: 1, color: 'rgba(255,255,255,0.10)' })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.onBack())

        Text('今天吃什么')
          .id('wheel-title')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Column() {
          SvgIcon({ variant: 'share', iconSize: 20, strokeWidth: 2 })
        }
        .id('wheel-share-button')
        .width(40)
        .height(40)
        .borderRadius(12)
        .backgroundColor('rgba(255,255,255,0.08)')
        .border({ width: 1, color: 'rgba(255,255,255,0.10)' })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.shareCurrent())
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 48, bottom: 16 })

      // wheel area
      Column() {
        Stack() {
          Canvas(this.ctx)
            .width(CANVAS_SIZE)
            .height(CANVAS_SIZE)
            .onReady(() => { this.drawWheel(); })
            .rotate({ angle: this.wheelAngle })

          // pointer at top
          Image($rawfile('icon_转盘结果指针.svg'))
            .width(28)
            .height(36)
            .objectFit(ImageFit.Contain)
            .position({ x: (CANVAS_SIZE - 28) / 2, y: -14 })

          // spin center button
          Text(this.spinning ? '旋转中' : '开始')
            .id('wheel-spin-button')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnDark)
            .textAlign(TextAlign.Center)
            .width(88)
            .height(88)
            .borderRadius(44)
            .linearGradient({
              angle: 135,
              direction: GradientDirection.RightTop,
              colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
            } as LinearGradient)
            .border({ width: 4, color: Theme.wheelBg })
            .shadow({ radius: 16, color: 'rgba(255,107,53,0.16)' })
            .onClick(() => this.spin())
        }
        .width(CANVAS_SIZE)
        .height(CANVAS_SIZE)
        .margin({ top: 24 })

        Text('点击「开始」让命运决定今晚的菜单')
          .fontSize(14)
          .fontColor('rgba(255,255,255,0.56)')
          .textAlign(TextAlign.Center)
          .margin({ top: 32 })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      // result sheet
      if (this.resultDish !== null) {
        this.ResultSheet(this.resultDish as Dish)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.wheelBg)
  }

  @Builder
  ResultSheet(dish: Dish) {
    Column() {
      Column() {
        SvgIcon({ variant: 'dish-result', iconSize: 40, strokeWidth: 2 })
      }
      .width(80)
      .height(80)
      .borderRadius(Theme.radiusCard)
      .linearGradient({
        angle: 135,
        direction: GradientDirection.RightTop,
        colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
      } as LinearGradient)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 16 })

      Text(dish.name)
        .id('wheel-result-name')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnDark)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 8 })

      Text(`${dish.cuisine} · ${dish.cookMinutes} 分钟 · ${dish.tags.length > 0 ? dish.tags[0] : '推荐'}`)
        .fontSize(14)
        .fontColor('rgba(255,255,255,0.6)')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 24 })

      Row() {
        Text('就吃这个')
          .id('wheel-result-accept-button')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .padding({ top: 14, bottom: 14 })
          .borderRadius(Theme.radiusButton)
          .linearGradient({
            angle: 135,
            direction: GradientDirection.RightTop,
            colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
          } as LinearGradient)
          .onClick(() => { this.resultDish = null; })

        Text('再转一次')
          .id('wheel-result-reshuffle-button')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .padding({ top: 14, bottom: 14 })
          .borderRadius(Theme.radiusButton)
          .backgroundColor('rgba(255,255,255,0.10)')
          .border({ width: 1, color: 'rgba(255,255,255,0.14)' })
          .margin({ left: 12 })
          .onClick(() => { this.resultDish = null; this.spin(); })
      }
      .width('100%')
    }
    .width('100%')
    .padding({ left: 24, right: 24, top: 24, bottom: 32 })
    .backgroundColor(Theme.resultSheetBg)
    .borderRadius({ topLeft: Theme.radiusHero, topRight: Theme.radiusHero })
  }

  private drawWheel(): void {
    const ctx = this.ctx;
    const cx = CANVAS_SIZE / 2;
    const cy = CANVAS_SIZE / 2;
    const n = this.candidates.length;
    if (n === 0) {
      return;
    }
    const step = (Math.PI * 2) / n;
    ctx.clearRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
    for (let i = 0; i < n; i++) {
      const startA = -Math.PI / 2 + i * step;
      const endA = startA + step;
      ctx.beginPath();
      ctx.moveTo(cx, cy);
      ctx.arc(cx, cy, CANVAS_RADIUS, startA, endA);
      ctx.closePath();
      ctx.fillStyle = SECTOR_COLORS[i % SECTOR_COLORS.length];
      ctx.fill();

      const midA = startA + step / 2;
      const lx = cx + CANVAS_RADIUS * 0.62 * Math.cos(midA);
      const ly = cy + CANVAS_RADIUS * 0.62 * Math.sin(midA);
      ctx.save();
      ctx.translate(lx, ly);
      ctx.rotate(midA + Math.PI / 2);
      ctx.fillStyle = '#FFFFFF';
      ctx.font = '14px HarmonyOS Sans SC';
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';
      const dish = this.candidates[i];
      ctx.fillText(dish.name, 0, 0);
      ctx.restore();
    }
  }

  private spin(): void {
    if (this.spinning) {
      return;
    }
    const result = WheelEngine.spin(this.candidates);
    if (result === null) {
      return;
    }
    this.spinning = true;
    this.resultDish = null;

    const n = this.candidates.length;
    const stepDeg = 360 / n;
    const center = result.selectedIndex * stepDeg + stepDeg / 2;
    const base = Math.ceil(this.wheelAngle / 360) * 360;
    const target = base + SPIN_TURNS * 360 + (360 - center);

    animateTo({
      duration: 3000,
      curve: Curve.EaseOut,
      onFinish: () => {
        this.spinning = false;
        this.resultDish = result.dish;
      },
    }, () => {
      this.wheelAngle = target;
    });
  }

  private shareCurrent(): void {
    if (this.resultDish === null) {
      return;
    }
    const data = ShareCardBuilder.fromDecision(
      this.resultDish as Dish,
      'wheel',
      '随机转盘抽中',
      DateUtil.formatChinese(DateUtil.today()),
    );
    this.onShare(data);
  }
}
