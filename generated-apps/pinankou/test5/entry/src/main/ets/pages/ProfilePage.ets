import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { Profile } from '../models/Models';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct ProfilePage {
  @Prop profile: Profile = new Profile();
  onExport: () => void = () => {};
  onAbout: () => void = () => {};

  build() {
    Scroll() {
      Column({ space: 16 }) {
        PageHeader({ title: '我的' })

        Row({ space: 16 }) {
          Column() {
            Text(this.profile.name[0])
              .id('profile-avatar')
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }
          .width(64)
          .height(64)
          .backgroundColor(Theme.brandPrimary)
          .borderRadius(32)
          .justifyContent(FlexAlign.Center)

          Column({ space: 4 }) {
            Text(this.profile.name)
              .id('profile-name')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Text(this.profile.role)
              .id('profile-role')
              .fontSize(14)
              .fontColor(Theme.textSecondary)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

        Column() {
          this.SettingRow('导出数据', 'export', () => this.onExport(), 'profile-setting-export')
          this.SettingRow('关于', 'more', () => this.onAbout(), 'profile-setting-about')
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      }
      .width('100%')
      .padding({ bottom: 100 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  SettingRow(label: string, icon: string, onTap: () => void, componentId: string) {
    Row({ space: 12 }) {
      SvgIcon({ variant: icon, iconSize: 20, color: Theme.textSecondary })
      Text(label)
        .fontSize(15)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
      Image($rawfile('icon_进入关于页面.svg'))
        .width(16)
        .height(16)
        .fillColor(Theme.textTertiary)
    }
    .id(componentId)
    .width('100%')
    .height(56)
    .alignItems(VerticalAlign.Center)
    .border({ width: { bottom: 1 }, color: Theme.borderSoft })
    .onClick(onTap)
  }
}
