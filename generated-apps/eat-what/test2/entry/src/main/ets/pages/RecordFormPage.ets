// RecordFormPage.ets
//
// 打卡表单 (surface: record-form). No HTML artifact yet; implemented in the
// established visual language. Date picker + meal chips + dish name + rating +
// note, wired to RecordStore.

import { Theme } from '../common/Theme';
import { MealType, mealLabelOf } from '../common/Models';
import { recordStore } from '../services/AppServices';
import { RecordInput } from '../services/RecordStore';
import { DateUtil } from '../common/DateUtil';

@Component
export struct RecordFormPage {
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  @State date: string = '';
  @State meal: MealType = 'lunch';
  @State dishName: string = '';
  @State rating: number = 3;
  @State note: string = '';
  @State errorMsg: string = '';

  aboutToAppear(): void {
    this.date = DateUtil.today();
    this.meal = DateUtil.currentMealNow();
  }

  build() {
    Column() {
      // header
      Row() {
        Text('取消')
          .id('record-form-cancel-button')
          .fontSize(15)
          .fontColor(Theme.textTertiary)
          .padding({ top: 8, bottom: 8, left: 4, right: 4 })
          .onClick(() => this.onCancel())

        Text('新增打卡')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text('保存')
          .id('record-form-save-button')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.brandPrimary)
          .padding({ top: 8, bottom: 8, left: 4, right: 4 })
          .onClick(() => this.save())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 12 })

      Scroll() {
        Column() {
          // date
          this.FieldLabel('日期')
          Row() {
            Text(DateUtil.formatChinese(this.date))
              .id('record-form-date-picker')
              .fontSize(16)
              .fontColor(Theme.textPrimary)
              .layoutWeight(1)
            Text('选择 ›')
              .fontSize(14)
              .fontColor(Theme.brandPrimary)
              .onClick(() => this.openDatePicker())
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .border({ width: 1, color: Theme.borderDefault })
          .margin({ bottom: 20 })

          // meal
          this.FieldLabel('餐别')
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(this.mealValues(), (m: MealType) => {
              Text(mealLabelOf(m))
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.meal === m ? Theme.brandPrimary : Theme.textSecondary)
                .padding({ left: 16, right: 16, top: 9, bottom: 9 })
                .borderRadius(18)
                .backgroundColor(this.meal === m ? Theme.brandOrangeSoft : Theme.cardBg)
                .border({ width: 1, color: this.meal === m ? Theme.brandPrimary : Theme.borderSoft })
                .margin({ right: 10, bottom: 10 })
                .onClick(() => { this.meal = m; })
            }, (m: MealType) => `meal-${m}`)
          }
          .id('record-form-meal-group')
          .width('100%')
          .margin({ bottom: 20 })

          // dish name
          this.FieldLabel('菜名')
          TextInput({ text: this.dishName, placeholder: '今天吃了什么？' })
            .id('record-form-dish-input')
            .width('100%')
            .height(48)
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.cardBg)
            .border({ width: 1, color: Theme.borderDefault })
            .onChange((val: string) => { this.dishName = val; this.errorMsg = ''; })
            .margin({ bottom: 20 })

          // rating
          this.FieldLabel('满意度')
          Row() {
            ForEach([1, 2, 3, 4, 5], (n: number) => {
              Circle()
                .id(n === 1 ? 'record-form-rating' : `record-form-rating-${n}`)
                .width(28)
                .height(28)
                .fill(n <= this.rating ? Theme.gold : Theme.cardBg)
                .border({ width: 1, color: n <= this.rating ? Theme.gold : Theme.borderDefault })
                .margin({ right: 12 })
                .onClick(() => { this.rating = n; })
            }, (n: number) => `rate-${n}`)
          }
          .width('100%')
          .margin({ bottom: 20 })

          // note
          this.FieldLabel('备注')
          TextArea({ text: this.note, placeholder: '记下今天的感受（可选）' })
            .id('record-form-note-input')
            .width('100%')
            .height(96)
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.cardBg)
            .border({ width: 1, color: Theme.borderDefault })
            .onChange((val: string) => { this.note = val; })
            .margin({ bottom: 16 })

          if (this.errorMsg.length > 0) {
            Text(this.errorMsg)
              .fontSize(13)
              .fontColor(Theme.pink)
              .margin({ bottom: 12 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  FieldLabel(label: string) {
    Text(label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textSecondary)
      .margin({ bottom: 8 })
  }

  private mealValues(): MealType[] {
    return ['breakfast', 'lunch', 'dinner', 'lateNight'];
  }

  private openDatePicker(): void {
    DatePickerDialog.show({
      start: new Date('2024-01-01'),
      end: new Date(),
      selected: this.dateToDate(),
      onAccept: (value: DatePickerResult) => {
        const y: number = value.year === undefined ? new Date().getFullYear() : value.year;
        const mo: number = value.month === undefined ? 0 : value.month;
        const d: number = value.day === undefined ? 1 : value.day;
        this.date = `${y}${DateUtil.pad2(mo + 1)}${DateUtil.pad2(d)}`;
      },
    });
  }

  private dateToDate(): Date {
    if (this.date.length !== 8) {
      return new Date();
    }
    const y = parseInt(this.date.substring(0, 4), 10);
    const m = parseInt(this.date.substring(4, 6), 10) - 1;
    const d = parseInt(this.date.substring(6, 8), 10);
    return new Date(y, m, d);
  }

  private async save(): Promise<void> {
    const name = this.dishName.trim();
    if (name.length === 0) {
      this.errorMsg = '请填写今天吃的菜名';
      return;
    }
    if (this.rating < 1 || this.rating > 5) {
      this.rating = 3;
    }
    try {
      const input: RecordInput = {
        date: this.date,
        meal: this.meal,
        dishName: name,
        rating: this.rating,
        note: this.note,
      };
      await recordStore.add(input);
    } catch (e) {
      this.errorMsg = '保存失败，请重试';
      return;
    }
    this.onDone();
  }
}
