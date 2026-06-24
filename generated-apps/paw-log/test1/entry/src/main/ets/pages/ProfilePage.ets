import { AppState } from '../viewmodel/AppViewModel'
import { Theme } from '../common/Theme'
import { SvgIcon } from '../common/SvgIcon'

interface ProfilePageProps {
  state: AppState
  onNavigatePets: () => void
  onNavigateReminders: () => void
  onNavigateMedical: () => void
  onNavigateFamily: () => void
  onNavigateSettings: () => void
}

@Component
export struct ProfilePage {
  @ObjectLink state: AppState
  onNavigatePets: () => void = () => {}
  onNavigateReminders: () => void = () => {}
  onNavigateMedical: () => void = () => {}
  onNavigateFamily: () => void = () => {}
  onNavigateSettings: () => void = () => {}

  build() {
    Column({ space: 0 }) {
      Text('我的')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')
        .margin({ top: 24, bottom: 24 })

      Column() {
        SvgIcon({ variant: 'open-profile', iconSize: 40 })
      }
      .width(80)
      .height(80)
      .borderRadius(40)
      .backgroundColor(Theme.brandSoft)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .alignSelf(ItemAlign.Center)
      .margin({ bottom: 12 })

      Text('铲屎官')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .alignSelf(ItemAlign.Center)
        .margin({ bottom: 24 })

      this.MenuRow('宠物档案', 'profile-pets-row', 'avatar-1', () => this.onNavigatePets())
      this.MenuRow('提醒管理', 'profile-reminders-row', 'reminder-vaccine', () => this.onNavigateReminders())
      this.MenuRow('病历归档', 'profile-medical-row', 'record-medicine', () => this.onNavigateMedical())
      this.MenuRow('家庭成员', 'profile-family-row', 'avatar-2', () => this.onNavigateFamily())
      this.MenuRow('设置', 'profile-settings-row', 'open-profile', () => this.onNavigateSettings())
    }
    .id('profile-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  MenuRow(label: string, id: string, icon: string, onTap: () => void) {
    Row({ space: 12 }) {
      SvgIcon({ variant: icon, iconSize: 22 })
      Text(label)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textSecondary)
        .layoutWeight(1)
      Text('>')
        .fontSize(14)
        .fontColor(Theme.textQuaternary)
    }
    .id(id)
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(16)
    .margin({ bottom: 12 })
    .alignItems(VerticalAlign.Center)
    .onClick(onTap)
  }
}
