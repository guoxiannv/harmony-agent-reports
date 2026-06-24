// HomePage.ets
//
// 决策页（home-page）。心情/时间筛选 + 转盘 + 结果区 + 操作按钮。
// 状态通过 AppController 暴露的 AppStorage 键绑定；转盘落点与结果一致。

import { AppController } from '../controller/AppController';
import { WheelSpinner } from '../components/WheelSpinner';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient } from '../common/Theme';
import { Dish, MEAL_OPTIONS, MOOD_OPTIONS, MoodTag, TimeSceneFilter } from '../model/Types';

@Component
export struct HomePage {
  goToPantry: () => void = () => {};
  goToResult: () => void = () => {};
  private controller: AppController = AppController.getInstance();

  @StorageLink('homeMoods') homeMoods: MoodTag[] = [];
  @StorageLink('homeTime') homeTime: TimeSceneFilter = '';
  @StorageLink('wheelResult') wheelResult: Dish | null = null;

  @State rotateAngle: number = 0;
  @State spinning: boolean = false;

  build() {
    Scroll() {
      Column() {
        // Header: 标题 + 日期
        Row() {
          Text('今天吃什么')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Text(this.dateLabel())
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textSecondary)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusTiny)
            .padding({ left: 14, right: 14, top: 8, bottom: 8 })
        }
        .width('100%')
        .margin({ bottom: 18 })

        // 心情筛选
        this.filterLabel('心情')
        this.moodFilter()

        // 时间筛选
        this.filterLabel('时间')
        this.timeFilter()

        // 转盘
        WheelSpinner({
          candidates: this.wheelCandidates(),
          rotateAngle: this.rotateAngle,
          onStart: () => this.onSpin(),
        })

        // 结果区（断言 home-wheel-result）
        Column() {
          if (this.wheelResult === null) {
            Text('点击按钮，让转盘决定今天的美味')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
          } else {
            Text(this.wheelResult.name)
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .margin({ bottom: 10 })
            Row() {
              ForEach(this.wheelResult.moods, (m: MoodTag) => {
                Text(m)
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.moodActiveText)
                  .backgroundColor(Theme.moodActiveBg)
                  .borderRadius(10)
                  .padding({ left: 14, right: 14, top: 6, bottom: 6 })
                  .margin({ right: 8 })
              }, (m: MoodTag) => m)
            }
            .margin({ bottom: 10 })

            // 查看详情
            Row() {
              Text('查看详情')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.tomato)
              SvgIcon({ variant: 'arrow-detail', iconSize: 16 })
            }
            .id('home-result-detail-button')
            .onClick(() => this.onOpenDetail())
          }

          // 候选为空断言
          if (this.wheelCandidates().length === 0) {
            Text('当前筛选下没有候选菜品，换个心情或时间吧')
              .id('home-empty-candidates')
              .fontSize(13)
              .fontColor(Theme.textTertiary)
              .margin({ top: 8 })
          }
        }
        .id('home-wheel-result')
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .margin({ top: 22, bottom: 22 })

        // 操作按钮
        Column({ space: 12 }) {
          // 开始转盘
          Row() {
            SvgIcon({ variant: 'spin', iconSize: 20 })
            Text('开始转盘')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnDark)
              .margin({ left: 8 })
          }
          .id('home-spin-button')
          .width('100%')
          .height(54)
          .borderRadius(Theme.radiusButton)
          .linearGradient(BrandGradient.tomato)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .shadow({ radius: 24, color: Theme.shadowTomato, offsetY: 10 })
          .opacity(this.wheelCandidates().length === 0 || this.spinning ? 0.5 : 1)
          .onClick(() => this.onSpin())

          // 冰箱食材推荐
          Row() {
            SvgIcon({ variant: 'fridge', iconSize: 18 })
            Text('冰箱食材推荐')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textPrimary)
              .margin({ left: 8 })
          }
          .id('home-quick-pantry-button')
          .width('100%')
          .height(50)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1.5, color: Theme.borderSoft })
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .onClick(() => this.goToPantry())
        }
        .width('100%')
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Off)
    .id('home-page')
  }

  @Builder
  filterLabel(text: string) {
    Text(text)
      .fontSize(12)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.textTertiary)
      .margin({ bottom: 10, top: 6 })
  }

  @Builder
  moodFilter() {
    Scroll() {
      Row({ space: 10 }) {
        // 全部
        this.moodChip('全部', this.homeMoods.length === 0)
        ForEach(MOOD_OPTIONS, (m: MoodTag) => {
          this.moodChip(m, this.homeMoods.includes(m))
        }, (m: MoodTag) => m)
      }
      .padding({ bottom: 4 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .id('home-mood-filter')
    .margin({ bottom: 16 })
  }

  @Builder
  moodChip(label: string, active: boolean) {
    Text(label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(active ? Theme.moodActiveText : Theme.textSecondary)
      .height(38)
      .borderRadius(Theme.radiusChip)
      .backgroundColor(active ? Theme.moodActiveBg : Theme.cardBg)
      .border({ width: active ? 0 : 1, color: Theme.borderSoft })
      .padding({ left: 18, right: 18 })
      .onClick(() => this.toggleMood(label))
  }

  @Builder
  timeFilter() {
    Scroll() {
      Row({ space: 10 }) {
        this.timeChip('全部', this.homeTime === '')
        ForEach(MEAL_OPTIONS, (m: string) => {
          this.timeChip(m, this.homeTime === m)
        }, (m: string) => m)
      }
      .padding({ bottom: 4 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .id('home-time-filter')
    .margin({ bottom: 10 })
  }

  @Builder
  timeChip(label: string, active: boolean) {
    Text(label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(active ? Theme.textOnDark : Theme.textSecondary)
      .height(38)
      .borderRadius(Theme.radiusPill)
      .backgroundColor(active ? Theme.espresso : Theme.cardBg)
      .border({ width: active ? 0 : 1, color: Theme.borderSoft })
      .padding({ left: 20, right: 20 })
      .onClick(() => this.toggleTime(label))
  }

  private wheelCandidates(): Dish[] {
    return this.controller.homeCandidates().slice(0, 8);
  }

  private toggleMood(label: string): void {
    if (label === '全部') {
      this.controller.setHomeMoods([]);
      return;
    }
    const tag: MoodTag = label as MoodTag;
    const set: MoodTag[] = this.homeMoods.slice();
    const idx: number = set.indexOf(tag);
    if (idx >= 0) {
      set.splice(idx, 1);
    } else {
      set.push(tag);
    }
    this.controller.setHomeMoods(set);
  }

  private toggleTime(label: string): void {
    if (label === '全部') {
      this.controller.setHomeTime('');
      return;
    }
    const current: TimeSceneFilter = this.homeTime;
    this.controller.setHomeTime(current === label ? '' : (label as TimeSceneFilter));
  }

  private onSpin(): void {
    if (this.spinning) {
      return;
    }
    const pool: Dish[] = this.wheelCandidates();
    if (pool.length === 0) {
      return;
    }
    const idx: number = Math.floor(Math.random() * pool.length);
    const seg: number = 360 / pool.length;
    const target: number = (360 - (idx * seg + seg / 2)) % 360;
    const current: number = this.rotateAngle;
    const delta: number = 360 * 5 + (((target - (current % 360)) + 360) % 360);
    this.spinning = true;
    animateTo({
      duration: 3200,
      curve: Curve.EaseOut,
      onFinish: () => {
        this.spinning = false;
        this.controller.setWheelResult(pool[idx]);
      },
    }, () => {
      this.rotateAngle = current + delta;
    });
  }

  private onOpenDetail(): void {
    if (this.wheelResult === null) {
      return;
    }
    this.controller.openResultDetail(this.wheelResult);
    this.goToResult();
  }

  private dateLabel(): string {
    const d: Date = new Date();
    const weekdays: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return `${d.getMonth() + 1}月${d.getDate()}日 ${weekdays[d.getDay()]}`;
  }
}
