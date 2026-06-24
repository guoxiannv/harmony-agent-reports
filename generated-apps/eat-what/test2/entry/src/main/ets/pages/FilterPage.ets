// FilterPage.ets
//
// 筛选条件 (surface: filter). No HTML artifact yet; implemented in the
// established visual language (light card surface, orange brand chips).
// Three single-select groups (mood / time / meal) wired to FilterStore.

import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import {
  MoodType, CookTimeType, MealType, FilterCriteria,
  moodLabelOf, cookTimeLabelOf, mealLabelOf,
} from '../common/Models';
import { filterStore } from '../services/AppServices';

@Component
export struct FilterPage {
  onBack: () => void = () => {};

  @State mood: MoodType | '' = '';
  @State time: CookTimeType | '' = '';
  @State meal: MealType | '' = '';

  aboutToAppear(): void {
    const cur = filterStore.get();
    this.mood = cur.mood;
    this.time = cur.time;
    this.meal = cur.meal;
  }

  build() {
    Column() {
      // header
      Row() {
        Column() {
          SvgIcon({ variant: 'back', iconSize: 22, strokeWidth: 2 })
        }
        .id('filter-back-button')
        .width(40)
        .height(40)
        .borderRadius(12)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderSoft })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.onBack())

        Text('筛选条件')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ left: 12 })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 16 })

      Scroll() {
        Column() {
          this.MoodGroup()
          this.TimeGroup()
          this.MealGroup()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 120 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // bottom actions
      Row() {
        Text('重置')
          .id('filter-reset-button')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textSecondary)
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .padding({ top: 14, bottom: 14 })
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderDefault })
          .onClick(() => this.reset())

        Text('应用筛选')
          .id('filter-apply-button')
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
          .margin({ left: 12 })
          .onClick(() => this.apply())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 12, bottom: 24 })
      .backgroundColor(Theme.pageBg)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  MoodGroup() {
    Column() {
      Text('心情').fontSize(18).fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary).margin({ bottom: 12 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.moodChipLabels(), (label: string, idx: number) => {
          Text(label)
            .fontSize(13).fontWeight(FontWeight.Medium)
            .fontColor(this.mood === this.moodChipValues()[idx] ? Theme.brandPrimary : Theme.textSecondary)
            .padding({ left: 16, right: 16, top: 9, bottom: 9 })
            .borderRadius(18)
            .backgroundColor(this.mood === this.moodChipValues()[idx] ? Theme.brandOrangeSoft : Theme.cardBg)
            .border({
              width: 1,
              color: this.mood === this.moodChipValues()[idx] ? Theme.brandPrimary : Theme.borderSoft,
            })
            .margin({ right: 10, bottom: 10 })
            .onClick(() => {
              const v = this.moodChipValues()[idx];
              this.mood = this.mood === v ? '' : v;
            })
        }, (label: string, idx: number) => `mood-${label}-${idx}`)
      }
      .id('filter-mood-group')
      .width('100%')
    }
    .width('100%').alignItems(HorizontalAlign.Start).margin({ bottom: 24 })
  }

  @Builder
  TimeGroup() {
    Column() {
      Text('可用时间').fontSize(18).fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary).margin({ bottom: 12 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.timeChipLabels(), (label: string, idx: number) => {
          Text(label)
            .fontSize(13).fontWeight(FontWeight.Medium)
            .fontColor(this.time === this.timeChipValues()[idx] ? Theme.brandPrimary : Theme.textSecondary)
            .padding({ left: 16, right: 16, top: 9, bottom: 9 })
            .borderRadius(18)
            .backgroundColor(this.time === this.timeChipValues()[idx] ? Theme.brandOrangeSoft : Theme.cardBg)
            .border({
              width: 1,
              color: this.time === this.timeChipValues()[idx] ? Theme.brandPrimary : Theme.borderSoft,
            })
            .margin({ right: 10, bottom: 10 })
            .onClick(() => {
              const v = this.timeChipValues()[idx];
              this.time = this.time === v ? '' : v;
            })
        }, (label: string, idx: number) => `time-${label}-${idx}`)
      }
      .id('filter-time-group')
      .width('100%')
    }
    .width('100%').alignItems(HorizontalAlign.Start).margin({ bottom: 24 })
  }

  @Builder
  MealGroup() {
    Column() {
      Text('餐别').fontSize(18).fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary).margin({ bottom: 12 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.mealChipLabels(), (label: string, idx: number) => {
          Text(label)
            .fontSize(13).fontWeight(FontWeight.Medium)
            .fontColor(this.meal === this.mealChipValues()[idx] ? Theme.brandPrimary : Theme.textSecondary)
            .padding({ left: 16, right: 16, top: 9, bottom: 9 })
            .borderRadius(18)
            .backgroundColor(this.meal === this.mealChipValues()[idx] ? Theme.brandOrangeSoft : Theme.cardBg)
            .border({
              width: 1,
              color: this.meal === this.mealChipValues()[idx] ? Theme.brandPrimary : Theme.borderSoft,
            })
            .margin({ right: 10, bottom: 10 })
            .onClick(() => {
              const v = this.mealChipValues()[idx];
              this.meal = this.meal === v ? '' : v;
            })
        }, (label: string, idx: number) => `meal-${label}-${idx}`)
      }
      .id('filter-meal-group')
      .width('100%')
    }
    .width('100%').alignItems(HorizontalAlign.Start).margin({ bottom: 24 })
  }

  private moodChipValues(): MoodType[] {
    return ['happy', 'tired', 'spicy', 'light', 'comfort', 'adventurous'];
  }

  private moodChipLabels(): string[] {
    return this.moodChipValues().map((m: MoodType) => moodLabelOf(m));
  }

  private timeChipValues(): CookTimeType[] {
    return ['quick', 'normal', 'weekend'];
  }

  private timeChipLabels(): string[] {
    return this.timeChipValues().map((t: CookTimeType) => cookTimeLabelOf(t));
  }

  private mealChipValues(): MealType[] {
    return ['breakfast', 'lunch', 'dinner', 'lateNight'];
  }

  private mealChipLabels(): string[] {
    return this.mealChipValues().map((m: MealType) => mealLabelOf(m));
  }

  private apply(): void {
    const c: FilterCriteria = { mood: this.mood, time: this.time, meal: this.meal };
    filterStore.set(c);
    this.onBack();
  }

  private reset(): void {
    this.mood = '';
    this.time = '';
    this.meal = '';
    filterStore.reset();
  }
}
