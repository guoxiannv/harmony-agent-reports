// CheckinFormSheet — bottom-sheet form for adding/editing a checkin.
import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import { MealType, ALL_MEALS, mealLabel } from '../model/Enums';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig } from '../common/Theme';

@Component
export struct CheckinFormSheet {
  controller: AppController = AppController.getInstance();

  build() {
    Column() {
      // header
      Row() {
        Text(this.controller.formEditingId.length > 0 ? '编辑打卡' : '记一笔')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Blank()
        Button() {
          SvgIcon({ variant: 'close', iconSize: 18, color: Theme.textQuaternary, strokeWidth: 2 })
        }
        .id('checkin-form-cancel-button')
        .width(34)
        .height(34)
        .borderRadius(12)
        .backgroundColor(Theme.inputBg)
        .onClick(() => this.controller.cancelCheckinForm())
      }
      .width('100%')
      .margin({ bottom: 22 })

      // meal picker
      Text('餐别')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textQuaternary)
        .width('100%')
        .margin({ bottom: 8 })
      Row() {
        ForEach(ALL_MEALS, (meal: MealType) => {
          Text(mealLabel(meal))
            .layoutWeight(1)
            .height(46)
            .textAlign(TextAlign.Center)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.controller.formMeal === meal ? Theme.brandPrimary : Theme.textSecondary)
            .backgroundColor(this.controller.formMeal === meal ? Theme.chipSoftBg : Theme.cardBg)
            .border({
              width: this.controller.formMeal === meal ? 1.5 : 0,
              color: this.controller.formMeal === meal ? Theme.brandPrimary : Color.Transparent,
            })
            .borderRadius(Theme.radiusInput)
            .margin({ right: meal === ALL_MEALS[ALL_MEALS.length - 1] ? 0 : 10 })
            .onClick(() => this.controller.selectMeal(meal))
        }, (meal: MealType) => meal)
      }
      .width('100%')
      .id('checkin-form-meal-picker')
      .margin({ bottom: 18 })

      // dish search
      Text('菜品')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textQuaternary)
        .width('100%')
        .margin({ bottom: 8 })
      TextInput({ text: this.controller.formDishQuery, placeholder: '搜索或输入菜品名称' })
        .id('checkin-form-dish-search')
        .width('100%')
        .height(52)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusInput)
        .fontSize(15)
        .onChange((value: string) => this.controller.setDishQuery(value))
      if (this.controller.dishSearchResults.length > 0) {
        Column() {
          ForEach(this.controller.dishSearchResults, (dish: Dish) => {
            Text(dish.name)
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .width('100%')
              .padding({ left: 14, right: 14, top: 12, bottom: 12 })
              .backgroundColor(Theme.cardBg)
              .border({ width: { bottom: 1 }, color: { bottom: Theme.borderDefault } })
              .onClick(() => this.controller.selectDishFromSearch(dish))
          }, (dish: Dish) => 'search-' + dish.id)
        }
        .width('100%')
        .borderRadius(Theme.radiusInput)
        .clip(true)
        .margin({ top: 6, bottom: 6 })
        .shadow(ShadowConfig.soft)
      }

      // note
      Text('备注')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textQuaternary)
        .width('100%')
        .margin({ bottom: 8, top: 8 })
      TextArea({ text: this.controller.formNote, placeholder: '写了什么？味道如何？' })
        .id('checkin-form-note-input')
        .width('100%')
        .height(90)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusInput)
        .fontSize(15)
        .padding(14)
        .onChange((value: string) => this.controller.setNote(value))

      // actions
      Row() {
        Button('取消')
          .id('checkin-form-cancel-button')
          .layoutWeight(1)
          .height(52)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.cardBg)
          .fontColor(Theme.textSecondary)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .shadow(ShadowConfig.soft)
          .onClick(() => this.controller.cancelCheckinForm())
        Button(this.submitLabel())
          .id('checkin-form-submit-button')
          .layoutWeight(1)
          .height(52)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.brandPrimary)
          .fontColor('#FFFFFF')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
          .onClick(() => this.commit())
      }
      .width('100%')
      .margin({ top: 24 })
    }
    .width('100%')
    .padding({ left: 20, right: 20, top: 22, bottom: 34 })
    .backgroundColor(Theme.pageBg)
    .borderRadius({ topLeft: 32, topRight: 32, bottomLeft: 0, bottomRight: 0 })
  }

  private submitLabel(): string {
    if (this.controller.formSelectedDish !== null) {
      return this.controller.formSelectedDish.name;
    }
    return '完成打卡';
  }

  private commit(): void {
    this.controller.submitCheckin().then((ok: boolean) => {
      if (!ok) {
        // keep the form open; nothing matched
      }
    });
  }
}
