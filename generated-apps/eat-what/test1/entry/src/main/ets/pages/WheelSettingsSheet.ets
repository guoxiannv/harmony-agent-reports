// WheelSettingsSheet — bottom-sheet for managing the wheel dish pool.
import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig } from '../common/Theme';
import { promptAction } from '@kit.ArkUI';

@Component
export struct WheelSettingsSheet {
  controller: AppController = AppController.getInstance();

  build() {
    Column() {
      // header
      Row() {
        Text('转盘设置')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Blank()
        Button() {
          SvgIcon({ variant: 'close', iconSize: 18, color: Theme.textQuaternary, strokeWidth: 2 })
        }
        .width(34)
        .height(34)
        .borderRadius(12)
        .backgroundColor(Theme.inputBg)
        .onClick(() => this.controller.closeWheelSettings())
      }
      .width('100%')
      .margin({ bottom: 22 })

      // input row
      Row() {
        TextInput({ text: this.controller.wheelNewDishName, placeholder: '输入自定义菜品' })
          .id('wheel-settings-input')
          .layoutWeight(1)
          .height(52)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusInput)
          .fontSize(15)
          .onChange((value: string) => this.controller.setWheelNewDishName(value))
        Button() {
          SvgIcon({ variant: 'plus', iconSize: 22, color: '#FFFFFF', strokeWidth: 2.5 })
        }
        .id('wheel-settings-add-button')
        .width(52)
        .height(52)
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.brandPrimary)
        .margin({ left: 10 })
        .onClick(() => this.commitAdd())
      }
      .width('100%')
      .margin({ bottom: 18 })

      // list
      if (this.controller.wheelCustomDishes.length > 0) {
        Column() {
          ForEach(this.controller.wheelCustomDishes, (dish: Dish, index: number) => {
            Row() {
              Text(dish.name)
                .fontSize(15)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Blank()
              Button() {
                SvgIcon({ variant: 'trash', iconSize: 16, color: Theme.red, strokeWidth: 2 })
              }
              .width(32)
              .height(32)
              .borderRadius(10)
              .backgroundColor(Theme.redSoft)
              .onClick(() => this.controller.removeWheelDish(dish.id))
            }
            .id('wheel-settings-dish-' + dish.id)
            .width('100%')
            .padding({ left: 18, right: 18, top: 16, bottom: 16 })
            .border(index < this.controller.wheelCustomDishes.length - 1 ? { width: { bottom: 1 }, color: { bottom: Theme.borderDefault } } : { width: 0 })
          }, (dish: Dish) => dish.id)
        }
        .width('100%')
        .id('wheel-settings-list')
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .clip(true)
        .shadow(ShadowConfig.card)
        .margin({ bottom: 14 })
      } else {
        Text('还没有自定义菜品，将使用内置默认菜品')
          .id('wheel-settings-empty-state')
          .fontSize(14)
          .fontColor(Theme.textQuaternary)
          .padding(28)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ bottom: 14 })
      }

      // reset link
      Button('恢复默认')
        .id('wheel-settings-reset-button')
        .height(36)
        .borderRadius(Theme.radiusChip)
        .backgroundColor(Color.Transparent)
        .fontColor(Theme.textQuaternary)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .onClick(() => this.controller.resetWheelDishes())
    }
    .width('100%')
    .padding({ left: 20, right: 20, top: 22, bottom: 34 })
    .backgroundColor(Theme.pageBg)
    .borderRadius({ topLeft: 32, topRight: 32, bottomLeft: 0, bottomRight: 0 })
  }

  private commitAdd(): void {
    this.controller.addWheelDish().then((ok: boolean) => {
      if (!ok) {
        promptAction.showToast({ message: '菜品名为空或已存在' });
      }
    });
  }
}
