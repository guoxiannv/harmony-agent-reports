// CheckInEditorPage.ets
//
// 打卡编辑页（check-in-editor-page）。日期、餐别、菜品、心情、备注、保存。

import { AppController } from '../controller/AppController';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient } from '../common/Theme';
import { MEAL_OPTIONS, MOOD_OPTIONS, MealType, MoodTag } from '../model/Types';

@Component
export struct CheckInEditorPage {
  onBack: () => void = () => {};
  onSaved: () => void = () => {};
  private controller: AppController = AppController.getInstance();

  @StorageLink('editorDate') editorDate: string = '';
  @StorageLink('editorMeal') editorMeal: MealType = '午餐';
  @StorageLink('editorDish') editorDish: string = '';
  @StorageLink('editorMoods') editorMoods: MoodTag[] = [];
  @StorageLink('editorNote') editorNote: string = '';

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          // Top bar
          Row() {
            Column() {
              SvgIcon({ variant: 'back-dark', iconSize: 20 })
            }
            .id('editor-back-button')
            .width(40).height(40).borderRadius(Theme.radiusTiny)
            .backgroundColor(Theme.inputBg)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(() => this.onBack())

            Text('记录这一餐')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .margin({ left: 14 })
          }
          .width('100%')
          .margin({ bottom: 22 })

          // 日期
          this.formLabel('日期')
          TextInput({ text: this.editorDate, placeholder: 'YYYY-MM-DD' })
            .id('editor-date-picker')
            .width('100%')
            .height(54)
            .fontSize(16)
            .fontColor(Theme.textPrimary)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusSmall)
            .padding({ left: 18, right: 18 })
            .margin({ bottom: 20 })
            .onChange((v: string) => this.controller.setEditorDate(v))

          // 餐别
          this.formLabel('餐别')
          Row({ space: 10 }) {
            ForEach(MEAL_OPTIONS, (m: MealType) => {
              Text(m)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.editorMeal === m ? Theme.textOnDark : Theme.textSecondary)
                .layoutWeight(1)
                .height(44)
                .borderRadius(Theme.radiusChip)
                .backgroundColor(this.editorMeal === m ? Theme.espresso : Theme.cardBg)
                .border({ width: this.editorMeal === m ? 0 : 1, color: Theme.borderSoft })
                .textAlign(TextAlign.Center)
                .onClick(() => this.controller.setEditorMeal(m))
            }, (m: MealType) => m)
          }
          .id('editor-meal-picker')
          .width('100%')
          .margin({ bottom: 20 })

          // 菜品
          this.formLabel('菜品')
          TextInput({ text: this.editorDish, placeholder: '输入菜品名称' })
            .id('editor-dish-input')
            .width('100%')
            .height(54)
            .fontSize(16)
            .fontColor(Theme.textPrimary)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusSmall)
            .padding({ left: 18, right: 18 })
            .margin({ bottom: 20 })
            .onChange((v: string) => this.controller.setEditorDish(v))

          // 心情
          this.formLabel('心情')
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(MOOD_OPTIONS, (m: MoodTag) => {
              Text(m)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.editorMoods.includes(m) ? Theme.moodActiveText : Theme.textSecondary)
                .height(40)
                .borderRadius(Theme.radiusChip)
                .backgroundColor(this.editorMoods.includes(m) ? Theme.moodActiveBg : Theme.cardBg)
                .border({ width: this.editorMoods.includes(m) ? 0 : 1, color: Theme.borderSoft })
                .padding({ left: 18, right: 18 })
                .margin({ right: 10, bottom: 10 })
                .onClick(() => this.toggleMood(m))
            }, (m: MoodTag) => m)
          }
          .id('editor-mood-picker')
          .width('100%')
          .margin({ bottom: 20 })

          // 备注
          this.formLabel('备注')
          TextArea({ text: this.editorNote, placeholder: '记录一下这顿饭的感受...' })
            .id('editor-note-input')
            .width('100%')
            .height(100)
            .fontSize(16)
            .fontColor(Theme.textPrimary)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusSmall)
            .padding({ left: 18, right: 18, top: 14, bottom: 14 })
            .margin({ bottom: 20 })
            .onChange((v: string) => this.controller.setEditorNote(v))
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 120 })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)

      // 保存按钮（底部固定）
      Row() {
        Text('保存打卡')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnDark)
      }
      .id('editor-save-button')
      .width('100%')
      .height(54)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.tomato)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .shadow({ radius: 24, color: Theme.shadowTomato, offsetY: 10 })
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 28 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .id('check-in-editor-page')
  }

  @Builder
  formLabel(text: string) {
    Text(text)
      .fontSize(13)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.textSecondary)
      .margin({ bottom: 10 })
  }

  private toggleMood(m: MoodTag): void {
    const set: MoodTag[] = this.editorMoods.slice();
    const idx: number = set.indexOf(m);
    if (idx >= 0) {
      set.splice(idx, 1);
    } else {
      set.push(m);
    }
    this.controller.setEditorMoods(set);
  }
}
