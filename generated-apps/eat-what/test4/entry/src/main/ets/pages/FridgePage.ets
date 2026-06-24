// FridgePage.ets
//
// Ingredient inventory + recommend-by-ingredients. Mirrors fridgeController.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { fridgeController } from '../controller/FridgeController';
import { Ingredient, Recommendation, moodLabel, mealTimeLabel } from '../model/Models';

@Component
export struct FridgePage {
  @State inputText: string = '';
  @State ingredients: Ingredient[] = [];
  @State recommendations: Recommendation[] = [];
  @State feedback: string = '';
  @State hasSearched: boolean = false;

  aboutToAppear(): void {
    fridgeController.onChange = () => {
      this.sync();
    };
    this.sync();
  }

  private sync(): void {
    this.inputText = fridgeController.inputText;
    this.ingredients = fridgeController.ingredients;
    this.recommendations = fridgeController.recommendations;
    this.feedback = fridgeController.lastFeedback;
  }

  build() {
    Scroll() {
      Column() {
        Text('我的冰箱')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 8, bottom: 6 })
          .width('100%')
        Text('告诉它你有的食材，让它帮你搭配')
          .fontSize(15)
          .fontColor(Theme.textTertiary)
          .margin({ bottom: 24 })
          .width('100%')

        // Input card
        Column() {
          Row() {
            TextInput({ placeholder: '输入食材，如鸡蛋、番茄…', text: this.inputText })
              .layoutWeight(1)
              .height(48)
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .backgroundColor(Theme.inputFieldBg)
              .borderRadius(Theme.radiusSmall)
              .onChange((v: string) => {
                fridgeController.setInput(v);
              })
              .id('fridge-ingredient-input')

            // Add button
            Row() {
              SvgIcon({ variant: 'add', iconSize: 22 })
            }
              .width(48)
              .height(48)
              .borderRadius(Theme.radiusSmall)
              .linearGradient(BrandGradient.primary)
              .shadow({ radius: 16, color: 'rgba(255,107,74,0.28)', offsetX: 0, offsetY: 6 })
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
              .margin({ left: 10 })
              .id('fridge-add-button')
              .onClick(() => fridgeController.addIngredient())
          }
          .width('100%')

          // Selected ingredients
          Text('已选食材')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ top: 18, bottom: 12 })
            .width('100%')

          if (this.ingredients.length === 0) {
            Text('还没有添加食材')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 18, bottom: 18 })
              .id('fridge-empty-state')
          } else {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.ingredients, (ing: Ingredient) => {
                Row() {
                  Text(ing.name)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.ingredientChipText)
                  SvgIcon({ variant: 'remove', iconSize: 14 })
                    .margin({ left: 6 })
                }
                .padding({ left: 14, right: 14, top: 9, bottom: 9 })
                .borderRadius(Theme.radiusPill)
                .backgroundColor(Theme.ingredientChipBg)
                .margin({ right: 10, bottom: 10 })
                .id(`fridge-ingredient-${ing.id}`)
                .onClick(() => fridgeController.removeIngredient(ing.id))
              }, (ing: Ingredient) => ing.id)
            }
            .width('100%')
            .id('fridge-ingredient-list')
          }
        }
        .width('100%')
        .padding(18)
        .borderRadius(Theme.radiusCard)
        .backgroundColor(Theme.cardBg)
        .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })

        // Recommend CTA
        Row() {
          Text('推荐菜品')
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
        .margin({ top: 22 })
        .id('fridge-recommend-button')
        .onClick(() => {
          this.hasSearched = true;
          fridgeController.recommend();
        })

        if (this.feedback.length > 0) {
          Text(this.feedback)
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .margin({ top: 12 })
            .width('100%')
            .textAlign(TextAlign.Center)
        }

        // Recommendation list
        Text('为你推荐')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 26, bottom: 12 })
          .width('100%')

        if (this.recommendations.length === 0) {
          Text(this.hasSearched ? '没有匹配的菜品' : '添加食材后点击推荐')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding({ top: 28, bottom: 28 })
            .id('fridge-no-match-state')
        } else {
          Column() {
            ForEach(this.recommendations, (rec: Recommendation) => {
              this.RecommendationCard(rec)
            }, (rec: Recommendation) => rec.dish.id)
          }
          .width('100%')
          .id('fridge-recommendation-list')
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

  @Builder
  RecommendationCard(rec: Recommendation) {
    Column() {
      Row() {
        Text(rec.dish.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text(`${Math.round(rec.score * 100)}% 匹配`)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .padding({ left: 10, right: 10, top: 5, bottom: 5 })
          .borderRadius(Theme.radiusPill)
          .linearGradient(BrandGradient.primary)
      }
      .width('100%')

      Flex({ wrap: FlexWrap.Wrap }) {
        Text(`${rec.dish.minutes} 分钟`)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.tagText)
          .backgroundColor(Theme.tagBg)
          .borderRadius(Theme.radiusPill)
          .padding({ left: 9, right: 9, top: 5, bottom: 5 })
          .margin({ right: 8, top: 10 })
        ForEach(this.dishTagLabels(rec), (t: string) => {
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
    .border({ width: { left: 4 }, color: { left: Theme.brandPrimary } })
    .margin({ bottom: 14 })
    .id(`fridge-recommendation-${rec.dish.id}`)
  }

  private dishTagLabels(rec: Recommendation): string[] {
    const labels: string[] = [];
    for (let i = 0; i < rec.dish.moods.length; i++) {
      const l: string = moodLabel(rec.dish.moods[i]);
      if (l.length > 0) {
        labels.push(l);
      }
    }
    for (let i = 0; i < rec.dish.times.length; i++) {
      labels.push(mealTimeLabel(rec.dish.times[i]));
    }
    return labels;
  }
}
