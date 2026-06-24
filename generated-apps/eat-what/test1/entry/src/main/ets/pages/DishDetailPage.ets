// DishDetailPage — 菜品详情 (hero + info grid + ingredients + steps).
import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import { MealType, mealLabel } from '../model/Enums';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';

@Component
export struct DishDetailPage {
  controller: AppController = AppController.getInstance();

  build() {
    Column() {
      Scroll() {
        Column() {
          this.hero()
          this.content()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      // floating action bar
      Row() {
        Button('生成卡片')
          .id('dish-detail-share-button')
          .layoutWeight(1)
          .height(52)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.cardBg)
          .fontColor(Theme.brandPrimary)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .border({ width: 1.5, color: Theme.brandPrimary })
          .onClick(() => this.controller.openShareCard('dish-detail', ''))
        Button('打卡这顿')
          .id('dish-detail-checkin-button')
          .layoutWeight(1)
          .height(52)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.brandPrimary)
          .fontColor('#FFFFFF')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
          .onClick(() => this.controller.openCheckinForm('dish-detail', this.controller.pendingDishId, ''))
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 14, bottom: 24 })
      .backgroundColor('rgba(255,255,255,0.94)')
      .border({ width: { top: 1 }, color: { top: '#0D000000' } })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  hero() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Blank().layoutWeight(1)
        Text(this.dishName())
          .id('dish-detail-title')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .margin({ bottom: 10 })
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.dishTags(), (tag: string) => {
            Text(tag)
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .padding({ left: 10, right: 10, top: 5, bottom: 5 })
              .backgroundColor('rgba(255,255,255,0.22)')
              .borderRadius(10)
              .margin({ right: 8, bottom: 4 })
          }, (tag: string, index: number) => tag + index)
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .padding({ left: 20, right: 20, bottom: 24 })

      Button() {
        SvgIcon({ variant: 'back', iconSize: 20, color: '#FFFFFF', strokeWidth: 2 })
      }
      .width(40)
      .height(40)
      .borderRadius(Theme.radiusSmall)
      .backgroundColor('rgba(255,255,255,0.2)')
      .position({ x: 20, y: 56 })
      .onClick(() => this.controller.back())
    }
    .width('100%')
    .height(260)
    .linearGradient(BrandGradient.primary)
  }

  @Builder
  content() {
    Column() {
      // info grid
      Row() {
        this.infoCell(this.dish() !== null ? '' + this.dish()!.calories : '0', 'kcal')
        this.infoCell(this.ingredientCountLabel(), '食材')
        this.infoCell(this.mealCellLabel(), '时段')
      }
      .width('100%')
      .margin({ top: 24, bottom: 26 })

      // ingredients
      Row() {
        SvgIcon({ variant: 'leaf', iconSize: 20, color: Theme.brandPrimary, strokeWidth: 2 })
        Text('食材清单')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ bottom: 14 })
      if (this.ingredientTags().length > 0) {
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.ingredientTags(), (name: string) => {
            Row() {
              SvgIcon({ variant: 'check', iconSize: 14, color: Theme.green, strokeWidth: 2.5 })
              Text(name)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
                .margin({ left: 6 })
            }
            .padding({ left: 14, right: 14, top: 10, bottom: 10 })
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusChip)
            .shadow(ShadowConfig.soft)
            .margin({ right: 8, bottom: 8 })
          }, (name: string, index: number) => name + index)
        }
        .width('100%')
        .margin({ bottom: 26 })
      } else {
        Text('该菜品未录入食材')
          .fontSize(14)
          .fontColor(Theme.textQuaternary)
          .width('100%')
          .margin({ bottom: 26 })
      }

      // steps
      Row() {
        SvgIcon({ variant: 'edit', iconSize: 20, color: Theme.brandPrimary, strokeWidth: 2 })
        Text('做法步骤')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ bottom: 14 })
      if (this.dish() !== null && this.dish()!.steps.length > 0) {
        ForEach(this.dish()!.steps, (step: string, index: number) => {
          Row() {
            Text('' + (index + 1))
              .width(28)
              .height(28)
              .borderRadius(14)
              .backgroundColor(Theme.brandPrimary)
              .fontColor('#FFFFFF')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
            Text(step)
              .fontSize(15)
              .fontColor(Theme.textSecondary)
              .layoutWeight(1)
              .margin({ left: 14 })
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(18)
          .shadow(ShadowConfig.soft)
          .margin({ bottom: 12 })
          .alignItems(VerticalAlign.Top)
        }, (step: string, index: number) => 'step-' + index)
      } else {
        Text('该菜品未录入做法')
          .fontSize(14)
          .fontColor(Theme.textQuaternary)
          .width('100%')
      }
    }
    .width('100%')
    .padding({ left: 20, right: 20, bottom: 30 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  infoCell(value: string, label: string) {
    Column() {
      Text(value)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandPrimary)
      Text(label)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textQuaternary)
        .margin({ top: 4 })
    }
    .layoutWeight(1)
    .padding({ top: 14, bottom: 14 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(16)
    .shadow(ShadowConfig.soft)
    .margin({ right: 10 })
    .alignItems(HorizontalAlign.Center)
  }

  private dish(): Dish | null {
    return this.controller.getPendingDish();
  }

  private dishName(): string {
    const d: Dish | null = this.dish();
    return d !== null ? d.name : '菜品详情';
  }

  private dishTags(): string[] {
    const d: Dish | null = this.dish();
    if (d === null) {
      return [];
    }
    const out: string[] = [];
    for (let i = 0; i < d.tags.length; i++) {
      out.push(d.tags[i]);
    }
    if (d.timeSlots.length > 0) {
      out.push(mealLabel(d.timeSlots[0] as MealType));
    }
    out.push(d.calories + ' kcal');
    return out;
  }

  private ingredientTags(): string[] {
    const d: Dish | null = this.dish();
    return d !== null ? d.ingredients : [];
  }

  private ingredientCountLabel(): string {
    const d: Dish | null = this.dish();
    return d !== null ? '' + d.ingredients.length : '0';
  }

  private mealCellLabel(): string {
    const d: Dish | null = this.dish();
    if (d !== null && d.timeSlots.length > 0) {
      return mealLabel(d.timeSlots[0] as MealType);
    }
    return '任意';
  }
}
