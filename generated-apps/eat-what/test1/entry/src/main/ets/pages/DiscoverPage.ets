// DiscoverPage — 按心情/时段筛选.
import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import {
  MealType, MoodType, TimeSlot, ALL_MOODS, ALL_TIME_SLOTS,
  moodLabel, timeSlotLabel, mealLabel,
} from '../model/Enums';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';

@Component
export struct DiscoverPage {
  controller: AppController = AppController.getInstance();

  build() {
    Scroll() {
      Column() {
        Text('发现')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ top: 20, bottom: 4 })
        Text('按心情和时段，找到对胃口的菜')
          .fontSize(15)
          .fontColor(Theme.textQuaternary)
          .width('100%')
          .margin({ bottom: 18 })

        // filter card
        Column() {
          // mood filter
          Column() {
            Text('心情')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textQuaternary)
              .width('100%')
              .margin({ bottom: 8 })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(ALL_MOODS, (mood: MoodType) => {
                this.filterChip(mood, this.controller.isMoodSelected(mood),
                  this.moodColor(mood), moodLabel(mood),
                  () => this.controller.toggleMood(mood))
              }, (mood: MoodType) => mood)
            }
            .width('100%')
          }
          .id('discover-mood-filter')
          .alignItems(HorizontalAlign.Start)
          .width('100%')
          .margin({ bottom: 14 })

          // time filter
          Column() {
            Text('时段')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textQuaternary)
              .width('100%')
              .margin({ bottom: 8 })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(ALL_TIME_SLOTS, (slot: TimeSlot) => {
                this.filterChip(slot, this.controller.isTimeSelected(slot),
                  this.timeColor(slot), timeSlotLabel(slot),
                  () => this.controller.toggleTime(slot))
              }, (slot: TimeSlot) => slot)
            }
            .width('100%')
          }
          .id('discover-time-filter')
          .alignItems(HorizontalAlign.Start)
          .width('100%')

          Row() {
            Blank()
            Button('重置')
              .id('discover-reset-button')
              .height(28)
              .borderRadius(Theme.radiusChip)
              .backgroundColor(Color.Transparent)
              .fontColor(Theme.textQuaternary)
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .onClick(() => this.controller.resetFilters())
          }
          .width('100%')
          .margin({ top: 10 })
        }
        .width('100%')
        .padding(18)
        .backgroundColor(Theme.cardBg)
        .borderRadius(24)
        .shadow(ShadowConfig.soft)
        .margin({ bottom: 18 })

        // result grid (2 columns via Flex wrap)
        if (this.controller.results.length > 0) {
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(this.controller.results, (dish: Dish) => {
              this.dishTile(dish)
            }, (dish: Dish) => 'discover-dish-' + dish.id)
          }
          .width('100%')
          .id('discover-result-list')
        } else {
          this.resultsEmpty()
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  filterChip(key: string, selected: boolean, color: ChipColor, label: string, onTap: () => void) {
    Text(label)
      .fontSize(13)
      .fontWeight(FontWeight.Bold)
      .fontColor(selected ? '#FFFFFF' : color.text)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .backgroundColor(selected ? color.solid : color.soft)
      .borderRadius(Theme.radiusChip)
      .margin({ right: 8, bottom: 8 })
      .onClick(() => onTap())
  }

  @Builder
  dishTile(dish: Dish) {
    Column() {
      // cover
      Column() {
        SvgIcon({ variant: this.coverIcon(dish), iconSize: 40, color: '#FFFFFF', strokeWidth: 1.5 })
      }
      .width('100%')
      .height(110)
      .linearGradient(this.coverGradient(dish))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(dish.name)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 6 })
        Row() {
          Text(this.tileTags(dish))
            .fontSize(10)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textQuaternary)
            .padding({ left: 7, right: 7, top: 3, bottom: 3 })
            .backgroundColor(Theme.inputBg)
            .borderRadius(8)
        }
        .margin({ bottom: 8 })
        Text(dish.calories + ' kcal')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textQuaternary)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding(12)
    }
    .id('discover-dish-' + dish.id)
    .width('47%')
    .margin({ right: '4.5%', bottom: 12 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(22)
    .clip(true)
    .shadow(ShadowConfig.card)
    .onClick(() => this.controller.openDishDetail(dish.id))
  }

  @Builder
  resultsEmpty() {
    Column() {
      Text('没有匹配的菜品')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })
      Text('换个组合试试，也许会有惊喜')
        .id('discover-empty-state')
        .fontSize(14)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 40, bottom: 40 })
  }

  private tileTags(dish: Dish): string {
    if (dish.timeSlots.length > 0) {
      return mealLabel(dish.timeSlots[0] as MealType);
    }
    if (dish.tags.length > 0) {
      return dish.tags[0];
    }
    return '推荐';
  }

  private coverIcon(dish: Dish): string {
    if (dish.moods.length > 0) {
      if (dish.moods[0] === 'healthy' || dish.moods[0] === 'light') {
        return 'leaf';
      } else if (dish.moods[0] === 'quick') {
        return 'dish';
      }
    }
    return 'dish';
  }

  private coverGradient(dish: Dish): LinearGradient {
    if (dish.moods.length > 0) {
      const m: string = dish.moods[0];
      if (m === 'healthy' || m === 'light') {
        return BrandGradient.green as LinearGradient;
      } else if (m === 'comfort' || m === 'indulge') {
        return BrandGradient.purple as LinearGradient;
      } else if (m === 'quick') {
        return BrandGradient.yellow as LinearGradient;
      }
    }
    return BrandGradient.primary as LinearGradient;
  }

  private moodColor(mood: MoodType): ChipColor {
    if (mood === 'light' || mood === 'healthy') {
      return this.cc(Theme.greenSoft, Theme.greenDeep, Theme.green);
    } else if (mood === 'heavy' || mood === 'comfort') {
      return this.cc(Theme.redSoft, Theme.redDeep, Theme.red);
    } else if (mood === 'quick') {
      return this.cc(Theme.yellowSoft, Theme.yellowDeep, Theme.yellow);
    }
    return this.cc(Theme.purpleSoft, Theme.purpleDeep, Theme.purple);
  }

  private timeColor(slot: TimeSlot): ChipColor {
    if (slot === 'breakfast') {
      return this.cc(Theme.yellowSoft, Theme.yellowDeep, Theme.yellow);
    } else if (slot === 'lunch') {
      return this.cc(Theme.greenSoft, Theme.greenDeep, Theme.green);
    } else if (slot === 'dinner') {
      return this.cc(Theme.redSoft, Theme.redDeep, Theme.red);
    }
    return this.cc(Theme.purpleSoft, Theme.purpleDeep, Theme.purple);
  }

  private cc(soft: string, text: string, solid: string): ChipColor {
    const c: ChipColor = { soft: soft, text: text, solid: solid };
    return c;
  }
}

interface ChipColor {
  soft: string;
  text: string;
  solid: string;
}
