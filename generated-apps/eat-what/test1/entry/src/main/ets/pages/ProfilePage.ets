// ProfilePage — 我的 (custom dishes + clear data).
import { AppController } from '../controller/AppController';
import { Dish } from '../model/Dish';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ProfilePage {
  controller: AppController = AppController.getInstance();
  @State private newDishName: string = '';

  build() {
    Scroll() {
      Column() {
        Text('我的')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ top: 20, bottom: 20 })

        // profile card
        Row() {
          Column() {
            SvgIcon({ variant: 'user', iconSize: 32, color: '#FFFFFF', strokeWidth: 2 })
          }
          .width(64)
          .height(64)
          .borderRadius(22)
          .backgroundColor('rgba(255,255,255,0.25)')
          .justifyContent(FlexAlign.Center)

          Column() {
            Text('美食探险家')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .margin({ bottom: 4 })
            Text('已坚持打卡 ' + this.controller.streakDays + ' 天')
              .fontSize(13)
              .fontColor('#FFFFFF')
              .opacity(0.9)
          }
          .margin({ left: 16 })
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .padding(24)
        .borderRadius(Theme.radiusHero)
        .linearGradient(BrandGradient.summary)
        .shadow({ radius: 36, color: 'rgba(217,119,54,0.28)', offsetX: 0, offsetY: 14 })
        .margin({ bottom: 24 })

        // section header
        Row() {
          Text('全局自定义菜品')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Text(this.controller.profileCustomDishes.length + ' 道')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textQuaternary)
        }
        .width('100%')
        .margin({ bottom: 12 })

        // add row
        Row() {
          TextInput({ text: this.newDishName, placeholder: '输入菜品名称' })
            .layoutWeight(1)
            .height(48)
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusInput)
            .fontSize(15)
            .onChange((value: string) => {
              this.newDishName = value;
            })
          Button() {
            SvgIcon({ variant: 'plus', iconSize: 22, color: '#FFFFFF', strokeWidth: 2.5 })
          }
          .id('profile-add-custom-dish-button')
          .width(48)
          .height(48)
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.brandPrimary)
          .margin({ left: 10 })
          .onClick(() => this.commitAdd())
        }
        .width('100%')
        .margin({ bottom: 14 })

        // list
        if (this.controller.profileCustomDishes.length > 0) {
          Column() {
            ForEach(this.controller.profileCustomDishes, (dish: Dish, index: number) => {
              this.dishRow(dish, index)
            }, (dish: Dish) => 'profile-custom-dish-' + dish.id)
          }
          .width('100%')
          .id('profile-custom-dishes-list')
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .clip(true)
          .shadow(ShadowConfig.card)
        } else {
          Text('还没有自定义菜品，在上方输入后添加')
            .id('profile-custom-dishes-empty-state')
            .fontSize(14)
            .fontColor(Theme.textQuaternary)
            .padding(24)
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusCard)
            .width('100%')
            .textAlign(TextAlign.Center)
        }

        // danger zone
        Row() {
          Text('清空所有数据')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.red)
          Blank()
          SvgIcon({ variant: 'chevronRight', iconSize: 18, color: Theme.textQuaternary, strokeWidth: 2 })
        }
        .id('profile-clear-data-button')
        .width('100%')
        .padding(18)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .shadow(ShadowConfig.card)
        .margin({ top: 24 })
        .onClick(() => this.confirmClear())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      .alignItems(HorizontalAlign.Start)
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  private commitAdd(): void {
    const name: string = this.newDishName.trim();
    if (name.length === 0) {
      return;
    }
    this.controller.addCustomDish(name).then((ok: boolean) => {
      if (ok) {
        this.newDishName = '';
      } else {
        promptAction.showToast({ message: '该菜品已存在' });
      }
    });
  }

  @Builder
  dishRow(dish: Dish, index: number) {
    Row() {
      Text(dish.name)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
      Blank()
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 16, bottom: 16 })
    .border(index < this.controller.profileCustomDishes.length - 1 ? { width: { bottom: 1 }, color: { bottom: Theme.borderDefault } } : { width: 0 })
  }

  private confirmClear(): void {
    promptAction.showDialog({
      title: '清空所有数据',
      message: '将删除全部食材、打卡记录与自定义菜品，且不可恢复。',
      buttons: [
        { text: '取消', color: Theme.textQuaternary },
        { text: '清空', color: Theme.red },
      ],
    }).then((res: promptAction.ShowDialogSuccessResponse) => {
      if (res.index === 1) {
        this.controller.clearAllData();
        promptAction.showToast({ message: '已清空所有数据' });
      }
    });
  }
}
