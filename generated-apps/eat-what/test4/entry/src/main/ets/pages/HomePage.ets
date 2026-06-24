// HomePage.ets
//
// Decision hub: lucky wheel + current recommendation + quick mood/time filters.
// Mirrors homeController state into @State via onChange so the V1 UI re-renders.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { WheelComponent } from '../components/WheelComponent';
import { homeController } from '../controller/HomeController';
import { Dish, MoodTag, MealTime, MoodOption, MealTimeOption, MOOD_OPTIONS, TIME_OPTIONS, moodLabel } from '../model/Models';

@Component
export struct HomePage {
  @State dishName: string = '转一转看看今天吃什么';
  @State dishMinutes: number = 0;
  @State dishTags: string[] = [];
  @State hasResult: boolean = false;
  @State wheelAngle: number = 0;
  @State spinning: boolean = false;
  @State feedback: string = '';
  @State selectedMood: string = '';
  @State selectedTime: string = '';

  aboutToAppear(): void {
    homeController.onChange = () => {
      this.sync();
    };
    this.sync();
  }

  private sync(): void {
    const d: Dish | null = homeController.currentDish;
    this.hasResult = d !== null;
    if (d !== null) {
      this.dishName = d.name;
      this.dishMinutes = d.minutes;
      this.dishTags = this.tagsFor(d);
    } else {
      this.dishName = '转一转看看今天吃什么';
      this.dishMinutes = 0;
      this.dishTags = [];
    }
    this.spinning = homeController.wheelState === 'spinning';
    this.feedback = homeController.lastFeedback;
    this.selectedMood = homeController.selectedMood as string;
    this.selectedTime = homeController.selectedTime as string;
  }

  private tagsFor(d: Dish): string[] {
    const tags: string[] = [];
    tags.push(`${d.minutes} 分钟`);
    for (let i = 0; i < d.moods.length; i++) {
      const label: string = moodLabel(d.moods[i]);
      if (label.length > 0) {
        tags.push(label);
      }
    }
    return tags;
  }

  private doSpin(): void {
    if (this.spinning) {
      return;
    }
    const extra: number = 360 * 5 + Math.floor(Math.random() * 360);
    homeController.spin();
    animateTo({
      duration: 2600,
      curve: Curve.EaseOut,
      onFinish: () => {
        this.sync();
      },
    }, () => {
      this.wheelAngle = this.wheelAngle + extra;
    });
  }

  private pickMood(value: MoodTag | string): void {
    homeController.setMood(this.selectedMood === value ? '' : value);
  }

  private pickTime(value: MealTime | string): void {
    homeController.setTime(this.selectedTime === value ? '' : value);
  }

  build() {
    Scroll() {
      Column() {
        // Title
        Text('今天吃什么？')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 8, bottom: 6 })
          .width('100%')
        Text('转一转，让命运决定下一顿')
          .fontSize(15)
          .fontColor(Theme.textTertiary)
          .margin({ bottom: 24 })
          .width('100%')

        // Wheel card
        Column() {
          Text('幸运转盘')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 18 })

          Stack() {
            WheelComponent({ angle: this.wheelAngle, diameter: 280 })
            // Fixed pointer at top center (triangle via borders, no glyph).
            Column()
              .width(0)
              .height(0)
              .border({
                width: { top: 22, left: 12, right: 12 },
                color: { top: Theme.brandPrimary, left: Color.Transparent, right: Color.Transparent },
              })
              .position({ x: '50%', y: 0 })
              .translate({ x: '-50%' })
          }
          .width(280)
          .height(280)

          // Spin button
          Row() {
            SvgIcon({ variant: 'spin', iconSize: 20 })
              .margin({ right: 8 })
            Text(this.spinning ? '转动中…' : '开始转转')
              .fontColor('#FFFFFF')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(54)
          .justifyContent(FlexAlign.Center)
          .borderRadius(Theme.radiusButton)
          .linearGradient(BrandGradient.primary)
          .shadow({ radius: 24, color: 'rgba(255,107,74,0.32)', offsetX: 0, offsetY: 8 })
          .margin({ top: 22 })
          .id('home-spin-button')
          .onClick(() => this.doSpin())
        }
        .width('100%')
        .padding(24)
        .borderRadius(Theme.radiusHero)
        .backgroundColor(Theme.cardBg)
        .shadow({ radius: 44, color: 'rgba(61,43,31,0.12)', offsetX: 0, offsetY: 18 })
        .id('home-wheel')

        // Result card
        Column() {
          Text('转盘结果')
            .fontSize(13)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textTertiary)
            .margin({ bottom: 6 })
            .width('100%')
          Text(this.dishName)
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 10 })
            .width('100%')
            .id('home-dish-result')
          if (this.hasResult) {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.dishTags, (t: string) => {
                Text(t)
                  .fontSize(12)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.tagText)
                  .backgroundColor(Theme.tagBg)
                  .borderRadius(Theme.radiusPill)
                  .padding({ left: 10, right: 10, top: 6, bottom: 6 })
                  .margin({ right: 8, bottom: 8 })
              }, (t: string) => t)
            }
            .width('100%')
          }
        }
        .width('100%')
        .padding(20)
        .borderRadius(Theme.radiusCard)
        .backgroundColor(Theme.cardBg)
        .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })
        .margin({ top: 24 })
        .id('home-dish-card')

        // Quick filters
        Text('快速筛选')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 24, bottom: 12 })
          .width('100%')

        // Mood chips
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(MOOD_OPTIONS, (opt: MoodOption) => {
            Text(opt.label)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.selectedMood === opt.value ? '#FFFFFF' : Theme.textSecondary)
              .backgroundColor(this.selectedMood === opt.value ? Theme.brandPrimary : Theme.cardBg)
              .border({
                width: 1,
                color: this.selectedMood === opt.value ? Theme.brandPrimary : Theme.chipBorder,
              })
              .borderRadius(Theme.radiusPill)
              .padding({ left: 16, right: 16, top: 10, bottom: 10 })
              .margin({ right: 10, bottom: 10 })
              .onClick(() => this.pickMood(opt.value))
          }, (opt: MoodOption) => opt.value)
        }
        .width('100%')
        .id('home-filter-mood')

        // Time chips
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(TIME_OPTIONS, (opt: MealTimeOption) => {
            Text(opt.label)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.selectedTime === opt.value ? '#FFFFFF' : Theme.textSecondary)
              .backgroundColor(this.selectedTime === opt.value ? Theme.brandPrimary : Theme.cardBg)
              .border({
                width: 1,
                color: this.selectedTime === opt.value ? Theme.brandPrimary : Theme.chipBorder,
              })
              .borderRadius(Theme.radiusPill)
              .padding({ left: 16, right: 16, top: 10, bottom: 10 })
              .margin({ right: 10, bottom: 10 })
              .onClick(() => this.pickTime(opt.value))
          }, (opt: MealTimeOption) => opt.value)
        }
        .width('100%')
        .id('home-filter-time')

        // Log current dish
        Row() {
          Text('记录这顿')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.brandPrimary)
        }
        .width('100%')
        .height(54)
        .justifyContent(FlexAlign.Center)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1.5, color: Theme.brandPrimary })
        .margin({ top: 24 })
        .id('home-log-button')
        .onClick(() => {
          homeController.logCurrent();
        })

        if (this.feedback.length > 0) {
          Text(this.feedback)
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .margin({ top: 12 })
            .width('100%')
            .textAlign(TextAlign.Center)
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }
}
