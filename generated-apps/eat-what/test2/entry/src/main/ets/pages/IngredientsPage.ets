// IngredientsPage.ets
//
// 冰箱食材 (surface: ingredients). Faithful to page-ingredients.html:
// add-ingredient input, a chip cloud of owned ingredients (with delete),
// and a recommendation list ranked by ingredient match with a match bar.

import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Ingredient, ScoredDish } from '../common/Models';
import { ingredientStore } from '../services/AppServices';
import { RecommendService } from '../services/RecommendService';
import { dishThumbGradient, dishIconVariant } from './HomePage';

@Component
export struct IngredientsPage {
  goToFilter: () => void = () => {};

  @State inputText: string = '';
  @State ingredients: Ingredient[] = [];
  @State recommendations: ScoredDish[] = [];

  aboutToAppear(): void {
    this.refresh();
  }

  private async refresh(): Promise<void> {
    try {
      this.ingredients = await ingredientStore.list();
    } catch (e) {
      this.ingredients = [];
    }
    this.recommendations = RecommendService.recommendByIngredients(this.ingredients);
  }

  build() {
    Column() {
      // header
      Column() {
        Text('冰箱食材')
          .id('ingredients-title')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 6 })
        Text('添加现有食材，发现今晚能做什么')
          .fontSize(14)
          .fontColor(Theme.textTertiary)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 20 })

      // input card
      Row() {
        TextInput({ text: this.inputText, placeholder: '例如：番茄、鸡蛋、豆腐' })
          .id('ingredients-input')
          .layoutWeight(1)
          .height(46)
          .fontSize(15)
          .fontColor(Theme.textPrimary)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderDefault })
          .onChange((val: string) => { this.inputText = val; })

        Column() {
          SvgIcon({ variant: 'add-ingredient', iconSize: 20, strokeWidth: 2.5 })
        }
        .id('ingredients-add-button')
        .width(46)
        .height(46)
        .borderRadius(Theme.radiusSmall)
        .linearGradient({
          angle: 135,
          direction: GradientDirection.RightTop,
          colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
        } as LinearGradient)
        .shadow({ radius: 16, color: 'rgba(255,107,53,0.24)', offsetY: 4 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .margin({ left: 10 })
        .onClick(() => this.addIngredient())
      }
      .width('92%')
      .alignItems(VerticalAlign.Center)
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
      .margin({ bottom: 20 })

      Scroll() {
        Column() {
          // my ingredients
          Row() {
            Text('我的食材')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Blank()
            Text('看看能做什么')
              .id('ingredients-recommend-button')
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textOnDark)
              .padding({ left: 16, right: 16, top: 10, bottom: 10 })
              .borderRadius(18)
              .linearGradient({
                angle: 135,
                direction: GradientDirection.RightTop,
                colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
              } as LinearGradient)
              .onClick(() => this.refresh())
          }
          .width('100%')
          .margin({ bottom: 12 })

          if (this.ingredients.length === 0) {
            this.EmptyFridge()
          } else {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.ingredients, (ing: Ingredient) => {
                Row() {
                  Text(ing.name)
                    .fontSize(13)
                    .fontColor(Theme.textPrimary)
                  Column() {
                    SvgIcon({ variant: 'delete', iconSize: 12, strokeWidth: 2.5 })
                  }
                  .id('ingredient-delete-button')
                  .width(18)
                  .height(18)
                  .borderRadius(9)
                  .backgroundColor('rgba(0,0,0,0.05)')
                  .justifyContent(FlexAlign.Center)
                  .alignItems(HorizontalAlign.Center)
                  .margin({ left: 6 })
                  .onClick(() => this.deleteIngredient(ing.id))
                }
                .padding({ left: 12, right: 12, top: 8, bottom: 8 })
                .borderRadius(18)
                .backgroundColor(Theme.cardBg)
                .border({ width: 1, color: Theme.borderSoft })
                .margin({ right: 10, bottom: 10 })
                .alignItems(VerticalAlign.Center)
              }, (ing: Ingredient) => ing.id)
            }
            .id('ingredients-list')
            .width('100%')
          }

          // recommendations
          Row() {
            Text('推荐菜谱')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Blank()
            Text(`匹配 ${this.recommendations.length} 道`)
              .fontSize(13)
              .fontColor(Theme.textTertiary)
          }
          .width('100%')
          .margin({ top: 8, bottom: 12 })

          if (this.recommendations.length === 0) {
            this.EmptyRecommendations()
          } else {
            Column() {
              ForEach(this.recommendations, (sd: ScoredDish) => {
                this.RecommendItem(sd)
              }, (sd: ScoredDish) => sd.dish.id)
            }
            .id('ingredients-dish-list')
            .width('100%')
            .padding(18)
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusCard)
            .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  RecommendItem(sd: ScoredDish) {
    Row() {
      Column() {
        SvgIcon({ variant: dishIconVariant(sd.dish), iconSize: 28, strokeWidth: 2 })
      }
      .width(56)
      .height(56)
      .borderRadius(Theme.radiusSmall)
      .linearGradient(dishThumbGradient(sd.dish))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(sd.dish.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 6 })
        Row() {
          Text(sd.matched === sd.total ? '食材全匹配' : `缺 ${sd.total - sd.matched} 样`)
            .fontSize(11)
            .fontColor(sd.matched === sd.total ? Theme.teal : Theme.textSecondary)
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .borderRadius(Theme.radiusTiny)
            .backgroundColor(sd.matched === sd.total ? Theme.tealSoft : Theme.tagSoftBg)
          Text(`${sd.dish.cookMinutes} 分钟`)
            .fontSize(12)
            .fontColor(Theme.textTertiary)
            .margin({ left: 8 })
          // match bar
          Stack({ alignContent: Alignment.Start }) {
            Column()
              .width('100%')
              .height(6)
              .borderRadius(3)
              .backgroundColor('rgba(0,0,0,0.05)')
            Column()
              .width(`${Math.round(sd.score * 100)}%`)
              .height(6)
              .borderRadius(3)
              .linearGradient({
                angle: 90,
                direction: GradientDirection.Right,
                colors: [['#FF6B35', 0.0], ['#FF8A5B', 1.0]],
              } as LinearGradient)
          }
          .width(80)
          .height(6)
          .margin({ left: 8 })
        }
        .alignItems(VerticalAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 14 })
      .layoutWeight(1)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(12)
    .margin({ bottom: 12 })
    .borderRadius(16)
    .border({ width: 1, color: Theme.borderCard })
  }

  @Builder
  EmptyFridge() {
    Column() {
      SvgIcon({ variant: 'empty-fridge', iconSize: 48, strokeWidth: 1.5 })
      Text('冰箱空空如也')
        .fontSize(15)
        .fontColor(Theme.textSecondary)
        .margin({ top: 12, bottom: 6 })
      Text('添加食材后才能推荐菜谱哦')
        .fontSize(13)
        .fontColor(Theme.textTertiary)
    }
    .id('ingredients-empty-state')
    .width('100%')
    .padding({ top: 32, bottom: 32 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  EmptyRecommendations() {
    Column() {
      SvgIcon({ variant: 'empty-no-match', iconSize: 48, strokeWidth: 1.5 })
      Text('暂时没匹配到菜谱')
        .fontSize(15)
        .fontColor(Theme.textSecondary)
        .margin({ top: 12, bottom: 6 })
      Text('试试添加更多常见食材')
        .fontSize(13)
        .fontColor(Theme.textTertiary)
    }
    .id('ingredients-empty-recommendations')
    .width('100%')
    .padding({ top: 32, bottom: 32, left: 20, right: 20 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
    .alignItems(HorizontalAlign.Center)
  }

  private async addIngredient(): Promise<void> {
    const name = this.inputText.trim();
    if (name.length === 0) {
      return;
    }
    for (let i = 0; i < this.ingredients.length; i++) {
      if (this.ingredients[i].name === name) {
        this.inputText = '';
        return;
      }
    }
    try {
      await ingredientStore.add(name, '');
    } catch (e) {
      // ignore add failure; refresh keeps list consistent
    }
    this.inputText = '';
    this.refresh();
  }

  private async deleteIngredient(id: string): Promise<void> {
    try {
      await ingredientStore.remove(id);
    } catch (e) {
      // ignore
    }
    this.refresh();
  }
}
