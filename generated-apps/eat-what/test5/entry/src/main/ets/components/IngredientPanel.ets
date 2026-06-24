// IngredientPanel.ets
// 食材推荐 panel: manage fridge ingredients, recommend dishes by ingredient match.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionTitle, EmptyState, GradientButton } from './UiKit';
import { Store, RankedDish } from '../services/Store';
import { Ingredient } from '../model/Models';
import { toast } from '../common/Feedback';

const DISH_ICONS: string[] = ['dish-orange', 'dish-green', 'dish-olive'];

@Component
export struct IngredientPanel {
  @State ingredients: Ingredient[] = [];
  @State inputText: string = '';
  @State results: RankedDish[] = [];
  @State hasSearched: boolean = false;

  async aboutToAppear() {
    await Store.ensureLoaded();
    this.ingredients = Store.getIngredients();
  }

  build() {
    Column() {
      // Input card
      Column() {
        SectionTitle({ text: '添加食材' })
        Row({ space: 10 }) {
          TextInput({ text: this.inputText, placeholder: '输入食材，如：番茄、鸡蛋' })
            .id('ingredient-input')
            .layoutWeight(1)
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .onChange((v: string) => { this.inputText = v; })

          Row() {
            SvgIcon({ variant: 'add-ingredient', iconSize: 22 })
          }
          .id('ingredient-add-button')
          .width(48)
          .height(48)
          .borderRadius(Theme.radiusSmall)
          .linearGradient(BrandGradient.orange)
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.addIngredient())
        }
        .width('100%')
        .margin({ bottom: 16 })

        if (this.ingredients.length === 0) {
          Text('冰箱还是空的，先添加食材吧')
            .id('ingredient-empty')
            .fontSize(14)
            .fontColor(Theme.warmGray)
            .margin({ bottom: 12 })
        } else {
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(this.ingredients, (i: Ingredient) => {
              Row({ space: 8 }) {
                Text(i.name)
                  .fontSize(14)
                  .fontColor(Theme.greenDeep)
                Row() {
                  SvgIcon({ variant: 'remove-ingredient', iconSize: 12 })
                }
                .width(20)
                .height(20)
                .borderRadius(10)
                .backgroundColor(Theme.tagGreenDel)
                .justifyContent(FlexAlign.Center)
                .onClick(() => this.removeIngredient(i.id))
              }
              .id('ingredient-tag-' + i.id)
              .padding({ left: 14, right: 10, top: 9, bottom: 9 })
              .borderRadius(Theme.radiusChip)
              .backgroundColor(Theme.tagGreenBg)
              .margin({ right: 10, bottom: 10 })
            }, (i: Ingredient) => i.id)
          }
          .id('ingredient-tag-list')
          .width('100%')
          .margin({ bottom: 12 })
        }

        Text('清空全部')
          .id('ingredient-clear-button')
          .fontSize(14)
          .fontColor(Theme.warmGray)
          .alignSelf(ItemAlign.Start)
          .onClick(() => this.clearIngredients())
      }
      .width('100%')
      .padding(20)
      .borderRadius(22)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 20 })

      GradientButton({ label: '开始推荐', onTap: () => this.recommend() })

      SectionTitle({ text: '推荐菜品' })
      if (this.hasSearched && this.results.length === 0) {
        EmptyState({ title: '暂无匹配菜品', desc: '在菜品管理中补充食材信息后再试', iconVariant: 'ingredient' })
          .id('ingredient-result-empty')
      } else if (this.results.length === 0) {
        Text('点击「开始推荐」查看能用这些食材做的菜')
          .fontSize(14)
          .fontColor(Theme.warmGray)
          .width('100%')
          .padding({ top: 16, bottom: 16 })
      } else {
        Column({ space: 12 }) {
          ForEach(this.results, (r: RankedDish, idx: number) => {
            Row({ space: 14 }) {
              Row() {
                SvgIcon({ variant: DISH_ICONS[idx % 3], iconSize: 26 })
              }
              .width(52)
              .height(52)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.tintOrange)
              .justifyContent(FlexAlign.Center)

              Column() {
                Text(r.dish.name)
                  .fontSize(17)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textPrimary)
                  .margin({ bottom: 4 })
                Text('匹配 ' + r.matchCount + ' 种食材')
                  .fontSize(13)
                  .fontColor(Theme.warmGray)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
            }
            .id('ingredient-result-' + r.dish.id)
            .width('100%')
            .padding(18)
            .borderRadius(Theme.radiusCard)
            .backgroundColor(Theme.paper)
            .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
            .alignItems(VerticalAlign.Center)
          }, (r: RankedDish) => r.dish.id)
        }
        .id('ingredient-result-list')
        .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private addIngredient(): void {
    const name = this.inputText.trim();
    if (name.length === 0) {
      toast('请输入食材');
      return;
    }
    Store.addIngredient(name);
    this.inputText = '';
    this.ingredients = Store.getIngredients();
  }

  private removeIngredient(id: string): void {
    Store.removeIngredient(id);
    this.ingredients = Store.getIngredients();
  }

  private clearIngredients(): void {
    Store.clearIngredients();
    this.ingredients = Store.getIngredients();
    this.results = [];
    this.hasSearched = false;
  }

  private recommend(): void {
    if (Store.getIngredients().length === 0) {
      toast('请先添加食材');
      return;
    }
    this.results = Store.recommendByIngredients();
    this.hasSearched = true;
  }
}
