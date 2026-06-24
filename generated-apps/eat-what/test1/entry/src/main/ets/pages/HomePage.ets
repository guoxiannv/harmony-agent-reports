// HomePage — 转盘首页. Owns the wheel + result card.
import { AppController } from '../controller/AppController';
import { WheelSpinner } from '../components/WheelSpinner';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig } from '../common/Theme';

@Component
export struct HomePage {
  controller: AppController = AppController.getInstance();

  build() {
    Scroll() {
      Column() {
        // header
        Row() {
          Text('今天吃什么')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          this.iconButton('settings', 'home-wheel-settings-button', () => {
            this.controller.openWheelSettings();
          })
        }
        .width('100%')
        .padding({ top: 20, bottom: 8 })

        Text('让转盘替你决定，告别选择困难')
          .fontSize(15)
          .fontColor(Theme.textQuaternary)
          .width('100%')
          .margin({ bottom: 22 })

        // wheel card
        Column() {
          WheelSpinner({ controller: this.controller })
        }
        .width('100%')
        .padding(24)
        .backgroundColor(Theme.cardBg)
        .borderRadius(28)
        .shadow(ShadowConfig.hero)
        .margin({ bottom: 20 })

        if (this.controller.selectedDish !== null) {
          this.resultCard()
        } else {
          this.emptyHint()
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  resultCard() {
    Column() {
      Text('转盘结果')
        .fontSize(12)
        .fontColor(Theme.textQuaternary)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .margin({ bottom: 6 })
      Text(this.controller.selectedDish !== null ? this.controller.selectedDish.name : '')
        .id('home-wheel-result')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')
        .margin({ bottom: 14 })

      Row() {
        Button('再转一次')
          .id('home-spin-again-button')
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.cardBg)
          .fontColor(Theme.brandPrimary)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .border({ width: 1.5, color: Theme.brandPrimary })
          .onClick(() => {
            this.controller.selectedDish = null;
            this.controller.spinWheel();
          })
        Button('查看做法')
          .id('home-result-view-button')
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .backgroundColor(Theme.brandPrimary)
          .fontColor('#FFFFFF')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
          .onClick(() => {
            if (this.controller.selectedDish !== null) {
              this.controller.openDishDetail(this.controller.selectedDish.id);
            }
          })
      }
      .width('100%')

      Button('打卡这顿')
        .id('home-quick-checkin-button')
        .width('100%')
        .height(48)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.brandPrimary)
        .fontColor('#FFFFFF')
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 12 })
        .onClick(() => {
          if (this.controller.selectedDish !== null) {
            this.controller.openCheckinForm('home-quick', this.controller.selectedDish.id, '');
          }
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius(24)
    .border({ width: { left: 5 }, color: { left: Theme.brandPrimary } })
    .shadow(ShadowConfig.hero)
  }

  @Builder
  emptyHint() {
    Column() {
      SvgIcon({ variant: 'sparkle', iconSize: 44, color: Theme.brandPrimary, strokeWidth: 1.5 })
        .margin({ bottom: 10 })
      Text('点击转盘中心，开启今日美食灵感')
        .fontSize(14)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 28, bottom: 28 })
  }

  @Builder
  iconButton(icon: string, id: string, onTap: () => void) {
    Button() {
      SvgIcon({ variant: icon, iconSize: 22, color: Theme.brandPrimary, strokeWidth: 2 })
    }
    .id(id)
    .width(42)
    .height(42)
    .borderRadius(Theme.radiusSmall)
    .backgroundColor(Theme.cardBg)
    .shadow(ShadowConfig.soft)
    .onClick(() => onTap())
  }
}
