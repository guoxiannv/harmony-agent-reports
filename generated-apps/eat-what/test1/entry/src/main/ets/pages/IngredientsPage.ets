// IngredientsPage — 冰箱食材推荐.
import { AppController } from '../controller/AppController';
import { Recommendation } from '../services/RecommendEngine';
import { Ingredient } from '../model/Ingredient';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';

@Component
export struct IngredientsPage {
  controller: AppController = AppController.getInstance();
  @State private inputText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('冰箱食材')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ top: 20, bottom: 4 })
        Text('添加现有食材，获得今日推荐')
          .fontSize(15)
          .fontColor(Theme.textQuaternary)
          .width('100%')
          .margin({ bottom: 18 })

        // input card
        Column() {
          Row() {
            TextInput({ text: this.inputText, placeholder: '输入食材，如：鸡蛋、番茄' })
              .id('ingredients-input')
              .layoutWeight(1)
              .height(48)
              .backgroundColor(Theme.inputBg)
              .borderRadius(Theme.radiusInput)
              .fontSize(15)
              .onChange((value: string) => {
                this.inputText = value;
              })
            Button() {
              SvgIcon({ variant: 'plus', iconSize: 22, color: '#FFFFFF', strokeWidth: 2.5 })
            }
            .id('ingredients-add-button')
            .width(48)
            .height(48)
            .borderRadius(Theme.radiusInput)
            .backgroundColor(Theme.brandPrimary)
            .margin({ left: 10 })
            .onClick(() => this.commitAdd())

            // keep add button tappable via key submit too
          }
          .width('100%')

          // ingredients bar
          if (this.controller.ingredients.length > 0) {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.controller.ingredients, (item: Ingredient) => {
                this.ingredientTag(item)
              }, (item: Ingredient) => item.id)
              Button('清空')
                .id('ingredients-clear-button')
                .height(30)
                .borderRadius(Theme.radiusChip)
                .backgroundColor(Color.Transparent)
                .fontColor(Theme.textQuaternary)
                .fontSize(13)
                .margin({ left: 6 })
                .onClick(() => this.controller.clearIngredients())
            }
            .width('100%')
            .margin({ top: 14 })
          } else {
            Column() {
              Text('还没有添加食材')
                .id('ingredients-empty-state')
                .fontSize(13)
                .fontColor(Theme.textQuaternary)
            }
            .width('100%')
            .margin({ top: 14 })
          }
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.cardBg)
        .borderRadius(24)
        .shadow(ShadowConfig.soft)

        // section header
        Row() {
          Text('推荐菜品')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Text(this.controller.recommendations.length + ' 道匹配')
            .fontSize(12)
            .fontColor(Theme.textQuaternary)
            .fontWeight(FontWeight.Bold)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusTiny)
        }
        .width('100%')
        .margin({ top: 24, bottom: 14 })

        // recommend list
        if (this.controller.recommendations.length > 0) {
          Column() {
            ForEach(this.controller.recommendations, (rec: Recommendation) => {
              this.dishCard(rec)
            }, (rec: Recommendation) => 'ingredients-dish-' + rec.dish.id)
          }
          .width('100%')
          .id('ingredients-recommend-list')
        } else {
          this.recommendEmpty()
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  private commitAdd(): void {
    const name: string = this.inputText.trim();
    if (name.length === 0) {
      return;
    }
    this.inputText = '';
    this.controller.addIngredient(name);
  }

  @Builder
  ingredientTag(item: Ingredient) {
    Row() {
      Text(item.name)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.chipSoftText)
      SvgIcon({ variant: 'close', iconSize: 14, color: Theme.chipSoftText, strokeWidth: 2 })
        .margin({ left: 6 })
    }
    .id('ingredient-item-' + item.id)
    .padding({ left: 12, right: 12, top: 7, bottom: 7 })
    .backgroundColor(Theme.chipSoftBg)
    .borderRadius(Theme.radiusChip)
    .margin({ right: 8, bottom: 8 })
    .onClick(() => this.controller.removeIngredient(item.id))
  }

  @Builder
  dishCard(rec: Recommendation) {
    Row() {
      // dish icon
      Column() {
        SvgIcon({ variant: 'dish', iconSize: 28, color: '#FFFFFF', strokeWidth: 2 })
      }
      .width(56)
      .height(56)
      .borderRadius(18)
      .linearGradient(BrandGradient.primary)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(rec.dish.name)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 4 })
        Row() {
          Text('匹配')
            .fontSize(12)
            .fontColor(Theme.textQuaternary)
          // match bar
          Stack({ alignContent: Alignment.Start }) {
            Column()
              .width(80)
              .height(6)
              .backgroundColor(Theme.inputBg)
              .borderRadius(3)
            Column()
              .width(80 * rec.matchRatio)
              .height(6)
              .backgroundColor(Theme.brandPrimary)
              .borderRadius(3)
          }
          .width(80)
          .height(6)
          .margin({ left: 8, right: 8 })
          Text(rec.dish.calories + ' kcal')
            .fontSize(12)
            .fontColor(Theme.textQuaternary)
        }
        .alignItems(VerticalAlign.Center)
      }
      .layoutWeight(1)
      .margin({ left: 14 })
      .alignItems(HorizontalAlign.Start)

      Button() {
        SvgIcon({ variant: 'checkin', iconSize: 18, color: Theme.brandPrimary, strokeWidth: 2.5 })
      }
      .width(36)
      .height(36)
      .borderRadius(12)
      .backgroundColor(Theme.chipSoftBg)
      .onClick(() => this.controller.openCheckinForm('ingredients-recommend', rec.dish.id, ''))
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(22)
    .shadow(ShadowConfig.card)
    .margin({ bottom: 12 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  recommendEmpty() {
    Column() {
      SvgIcon({ variant: 'fridge', iconSize: 56, color: Theme.brandPrimary, strokeWidth: 1.5 })
        .margin({ bottom: 14 })
      Text('暂无推荐')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })
      Text('多添加几种食材，会有更多惊喜')
        .id('ingredients-recommend-empty-state')
        .fontSize(14)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 40, bottom: 40 })
  }
}
