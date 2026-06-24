import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { HomeController } from '../controllers/HomeController';
import { AppSurface } from '../common/TabTypes';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ProfilePage {
  onOpenDetail?: (target: AppSurface) => void;
  private controller = new HomeController();

  private clearData(): void {
    this.controller.clearAll();
    promptAction.showToast({ message: '本地数据已清除' });
  }

  build() {
    Column({ space: 0 }) {
      Column() {
        Row() {
          Column() {
            SvgIcon({ variant: 'user', iconSize: 28 })
          }
          .width(64)
          .height(64)
          .borderRadius(32)
          .backgroundColor('rgba(255,255,255,0.25)')
          .justifyContent(FlexAlign.Center)

          Column({ space: 4 }) {
            Text('安全员')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnBrand)
            Text('平安扣一线用户')
              .fontSize(12)
              .fontColor('rgba(255,255,255,0.85)')
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          .margin({ left: 16 })
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .padding({ top: 52, left: 20, right: 20, bottom: 24 })
      .linearGradient(BrandGradient.hero)
      .borderRadius({ bottomLeft: 24, bottomRight: 24 })

      Scroll() {
        Column({ space: 12 }) {
          this.MenuRow('设置', () => {
            if (this.onOpenDetail) this.onOpenDetail('profile');
          }, 'profile-settings-button')
          this.MenuRow('关于', () => {
            promptAction.showToast({ message: '平安扣 v1.0.0' });
          }, 'profile-about-button')
          this.MenuRow('导出数据', () => {
            promptAction.showToast({ message: '导出功能预留' });
          }, 'profile-export-button')
          this.MenuRow('清除本地数据', () => {
            this.clearData();
          }, 'profile-clear-data-button')

          Blank().height(24)
        }
        .width('100%')
        .padding(16)
        .padding({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  MenuRow(label: string, onTap: () => void, id: string) {
    Row() {
      Text(label)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
      Text('>')
        .fontSize(16)
        .fontColor(Theme.textQuaternary)
    }
    .id(id)
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
    .alignItems(VerticalAlign.Center)
    .onClick(onTap)
  }
}
