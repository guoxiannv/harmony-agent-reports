// PantryPage.ets
//
// 食材页（pantry-page）。输入/添加食材、标签云、按食材推荐、心情筛选、推荐结果。

import { AppController } from '../controller/AppController';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient, TAG_DOT_COLORS } from '../common/Theme';
import { Dish, MOOD_OPTIONS, MoodTag, PantryItem } from '../model/Types';

@Component
export struct PantryPage {
  goToResult: () => void = () => {};
  private controller: AppController = AppController.getInstance();

  @StorageLink('pantryItems') pantryItems: PantryItem[] = [];
  @StorageLink('pantryInput') pantryInput: string = '';
  @StorageLink('pantryMoods') pantryMoods: MoodTag[] = [];
  @StorageLink('pantryResults') pantryResults: Dish[] = [];

  build() {
    Scroll() {
      Column() {
        // Header
        Column() {
          Text('冰箱有什么')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Text('告诉我还剩什么，我来推荐能做的菜')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .margin({ top: 6 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 18 })

        // 输入卡片
        Column() {
          Row() {
            TextInput({ text: this.pantryInput, placeholder: '输入食材，如：鸡蛋、番茄' })
              .id('pantry-input')
              .layoutWeight(1)
              .height(54)
              .fontSize(16)
              .fontColor(Theme.textPrimary)
              .backgroundColor(Theme.inputBg)
              .borderRadius(Theme.radiusSmall)
              .padding({ left: 18, right: 18 })
              .onChange((v: string) => this.controller.setPantryInput(v))

            // 添加按钮（圆形）
            Column() {
              SvgIcon({ variant: 'add', iconSize: 24 })
            }
            .id('pantry-add-button')
            .width(54)
            .height(54)
            .borderRadius(27)
            .linearGradient(BrandGradient.tomato)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .shadow({ radius: 20, color: 'rgba(232,93,78,0.25)', offsetY: 8 })
            .margin({ left: 10 })
            .onClick(() => this.controller.addPantryItem())
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)

          // 标签云
          if (this.pantryItems.length === 0) {
            Text('还没有添加食材')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .margin({ top: 22 })
          } else {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.pantryItems, (item: PantryItem, index: number) => {
                Row() {
                  Text('')
                    .width(8).height(8).borderRadius(4)
                    .backgroundColor(TAG_DOT_COLORS[index % TAG_DOT_COLORS.length])
                  Text(item.name)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textPrimary)
                    .margin({ left: 8, right: 8 })
                  Column() {
                    SvgIcon({ variant: 'remove-small', iconSize: 16 })
                  }
                  .id(`pantry-remove-button`)
                  .onClick(() => this.controller.removePantryItem(item.id))
                }
                .id(`pantry-item-${item.id}`)
                .height(36)
                .borderRadius(Theme.radiusTiny)
                .backgroundColor(Theme.inputBg)
                .padding({ left: 14, right: 14 })
                .alignItems(VerticalAlign.Center)
                .margin({ right: 10, bottom: 10, top: 10 })
              }, (item: PantryItem) => item.id)
            }
            .width('100%')
            .margin({ top: 6 })
            .id('pantry-item-list')
          }
        }
        .width('100%')
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .padding(20)
        .shadow({ radius: 32, color: Theme.shadowCard, offsetY: 10 })
        .margin({ bottom: 18 })

        // 推荐按钮
        Row() {
          Text('看看能做什么')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnDark)
        }
        .id('pantry-recommend-button')
        .width('100%')
        .height(54)
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.tomato)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .shadow({ radius: 24, color: Theme.shadowTomato, offsetY: 10 })
        .margin({ bottom: 22 })
        .onClick(() => this.controller.recommendByPantry())

        // 心情筛选
        Text('再按心情筛选')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textTertiary)
          .margin({ bottom: 10 })
        Scroll() {
          Row({ space: 10 }) {
            this.moodChip('全部', this.pantryMoods.length === 0)
            ForEach(MOOD_OPTIONS, (m: MoodTag) => {
              this.moodChip(m, this.pantryMoods.includes(m))
            }, (m: MoodTag) => m)
          }
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
        .id('pantry-mood-filter')
        .margin({ bottom: 18 })

        // 推荐结果
        if (this.pantryResults.length === 0) {
          Text(this.pantryItems.length === 0 ? '添加食材后，点击「看看能做什么」' : '没有匹配的菜品，换个心情或加些食材')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(28)
        } else {
          Column({ space: 14 }) {
            ForEach(this.pantryResults, (dish: Dish, index: number) => {
              this.dishCard(dish, index)
            }, (dish: Dish) => dish.id)
          }
          .width('100%')
          .id('pantry-result-list')
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Off)
    .id('pantry-page')
  }

  @Builder
  moodChip(label: string, active: boolean) {
    Text(label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(active ? Theme.avocadoText : Theme.textSecondary)
      .height(38)
      .borderRadius(Theme.radiusChip)
      .backgroundColor(active ? Theme.avocadoSoft : Theme.cardBg)
      .border({ width: active ? 0 : 1, color: Theme.borderSoft })
      .padding({ left: 18, right: 18 })
      .onClick(() => this.toggleMood(label))
  }

  @Builder
  dishCard(dish: Dish, index: number) {
    Row() {
      // 色块缩略图
      Text(dish.name.length > 0 ? dish.name.charAt(0) : '菜')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnDark)
        .textAlign(TextAlign.Center)
        .width(64)
        .height(64)
        .borderRadius(18)
        .backgroundColor(TAG_DOT_COLORS[index % TAG_DOT_COLORS.length])

      Column() {
        Text(dish.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 6 })
        Text(`主要食材：${dish.ingredients.join('、')}`)
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ bottom: 10 })
        Row({ space: 8 }) {
          ForEach(dish.moods, (m: MoodTag) => {
            Text(m)
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.moodActiveText)
              .backgroundColor(Theme.moodActiveBg)
              .borderRadius(8)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          }, (m: MoodTag) => m)
          Text(dish.timeScenes[0])
            .fontSize(11)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textSecondary)
            .backgroundColor(Theme.inputBg)
            .borderRadius(8)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
        }
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 16 })
    }
    .id(`pantry-dish-${dish.id}`)
    .width('100%')
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .padding(18)
    .shadow({ radius: 32, color: Theme.shadowCard, offsetY: 10 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => this.onOpenDish(dish))
  }

  private toggleMood(label: string): void {
    if (label === '全部') {
      this.controller.setPantryMoods([]);
      return;
    }
    const tag: MoodTag = label as MoodTag;
    const set: MoodTag[] = this.pantryMoods.slice();
    const idx: number = set.indexOf(tag);
    if (idx >= 0) {
      set.splice(idx, 1);
    } else {
      set.push(tag);
    }
    this.controller.setPantryMoods(set);
    // 筛选变化后重新推荐（保持结果与筛选一致）
    this.controller.recommendByPantry();
  }

  private onOpenDish(dish: Dish): void {
    this.controller.openResultDetail(dish);
    this.goToResult();
  }
}
