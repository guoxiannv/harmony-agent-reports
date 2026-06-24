// MoodPage.ets
//
// Mood + meal-time filtering with a matching dish list. Mirrors moodController.

import { Theme, BrandGradient } from '../common/Theme';
import { moodController } from '../controller/MoodController';
import { Dish, MoodTag, MealTime, MoodOption, MealTimeOption, MOOD_OPTIONS, TIME_OPTIONS, moodLabel, mealTimeLabel } from '../model/Models';

@Component
export struct MoodPage {
  @State selectedMood: string = '';
  @State selectedTime: string = '';
  @State results: Dish[] = [];
  @State feedback: string = '';
  @State hasApplied: boolean = false;

  aboutToAppear(): void {
    moodController.onChange = () => {
      this.sync();
    };
    this.sync();
  }

  private sync(): void {
    this.selectedMood = moodController.selectedMood as string;
    this.selectedTime = moodController.selectedTime as string;
    this.results = moodController.results;
    this.feedback = moodController.lastFeedback;
  }

  private pickMood(value: MoodTag | string): void {
    moodController.setMood(value);
  }

  private pickTime(value: MealTime | string): void {
    moodController.setTime(value);
  }

  build() {
    Scroll() {
      Column() {
        // Hero header
        Column() {
          Text('心情厨房')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .width('100%')
          Text('今天想怎么吃，按心情来选')
            .fontSize(15)
            .fontColor(Theme.textTertiary)
            .margin({ top: 6 })
            .width('100%')
        }
        .width('100%')
        .padding({ top: 32, bottom: 28, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
        .linearGradient(BrandGradient.hero)
        .borderRadius({ bottomLeft: 28, bottomRight: 28 })

        Column() {
          // Mood chips
          Text('现在的心情')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 12 })
            .width('100%')
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
          .id('mood-mood-selector')

          // Time segment
          Text('用餐时间')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ top: 22, bottom: 12 })
            .width('100%')
          Row() {
            ForEach(TIME_OPTIONS, (opt: MealTimeOption) => {
              Text(opt.label)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.selectedTime === opt.value ? Theme.brandPrimary : Theme.textSecondary)
                .backgroundColor(this.selectedTime === opt.value ? Theme.cardBg : 'transparent')
                .borderRadius(Theme.radiusSmall - 3)
                .padding({ top: 10, bottom: 10 })
                .layoutWeight(1)
                .textAlign(TextAlign.Center)
                .onClick(() => this.pickTime(opt.value))
            }, (opt: MealTimeOption) => opt.value)
          }
          .width('100%')
          .padding(4)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.inputFieldBg)
          .id('mood-time-selector')

          // Apply button
          Row() {
            Text('应用筛选')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }
          .width('100%')
          .height(54)
          .justifyContent(FlexAlign.Center)
          .borderRadius(Theme.radiusButton)
          .linearGradient(BrandGradient.primary)
          .shadow({ radius: 24, color: 'rgba(255,107,74,0.32)', offsetX: 0, offsetY: 8 })
          .margin({ top: 18 })
          .id('mood-apply-button')
          .onClick(() => {
            this.hasApplied = true;
            moodController.apply();
          })
        }
        .width('100%')
        .padding(20)
        .borderRadius(Theme.radiusCard)
        .backgroundColor(Theme.cardBg)
        .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })
        .margin({ top: 22 })

        if (this.feedback.length > 0) {
          Text(this.feedback)
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .margin({ top: 12 })
            .width('100%')
            .textAlign(TextAlign.Center)
        }

        // Results
        Text('匹配结果')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 26, bottom: 12 })
          .width('100%')

        if (this.results.length === 0) {
          Text(this.hasApplied ? '没有匹配的菜品' : '选择心情与时间后应用筛选')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding({ top: 36, bottom: 36 })
            .id('mood-empty-state')
        } else {
          Column() {
            ForEach(this.results, (dish: Dish) => {
              this.DishCard(dish)
            }, (dish: Dish) => dish.id)
          }
          .width('100%')
          .id('mood-dish-list')
        }
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  DishCard(dish: Dish) {
    Column() {
      Row() {
        Text(dish.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text('记录')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandPrimary)
          .backgroundColor(Theme.softButtonBg)
          .borderRadius(Theme.radiusTiny)
          .padding({ left: 12, right: 12, top: 7, bottom: 7 })
          .id('mood-log-button')
          .onClick(() => {
            moodController.logDish(dish.id);
          })
      }
      .width('100%')

      Flex({ wrap: FlexWrap.Wrap }) {
        Text(`${dish.minutes} 分钟`)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.tagText)
          .backgroundColor(Theme.tagBg)
          .borderRadius(Theme.radiusPill)
          .padding({ left: 9, right: 9, top: 5, bottom: 5 })
          .margin({ right: 8, top: 10 })
        ForEach(this.tagLabels(dish), (t: string) => {
          Text(t)
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.tagText)
            .backgroundColor(Theme.tagBg)
            .borderRadius(Theme.radiusPill)
            .padding({ left: 9, right: 9, top: 5, bottom: 5 })
            .margin({ right: 8, top: 10 })
        }, (t: string) => t)
      }
      .width('100%')
    }
    .width('100%')
    .padding(18)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })
    .border({ width: { left: 4 }, color: { left: Theme.teal } })
    .margin({ bottom: 14 })
    .id(`mood-dish-${dish.id}`)
  }

  private tagLabels(dish: Dish): string[] {
    const labels: string[] = [];
    for (let i = 0; i < dish.moods.length; i++) {
      const l: string = moodLabel(dish.moods[i]);
      if (l.length > 0) {
        labels.push(l);
      }
    }
    for (let i = 0; i < dish.times.length; i++) {
      labels.push(mealTimeLabel(dish.times[i]));
    }
    return labels;
  }
}
