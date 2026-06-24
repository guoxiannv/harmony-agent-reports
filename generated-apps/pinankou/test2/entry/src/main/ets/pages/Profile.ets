// Profile.ets — 我的
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { SvgIcon } from '../common/SvgIcon';
import { SectionCard } from '../components/CommonUi';

@Component
export struct ProfilePage {
  @StorageLink('dataStore') store: DataStore = new DataStore();

  build() {
    Column() {
      Column() {
        Stack({ alignContent: Alignment.Center }) {
          Text(this.store.profileName.substring(0, 1))
            .id('profile-avatar')
            .fontSize(34).fontWeight(FontWeight.Bold).fontColor(Theme.textOnBrand)
        }
        .width(80).height(80).borderRadius(40)
        .backgroundColor(Theme.brandPrimary)
        Text(this.store.profileName)
          .id('profile-name')
          .fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textOnBrand).margin({ top: 12 })
        Text(this.store.profileRole === 'admin' ? '管理员' : '普通用户')
          .fontSize(12).fontColor('rgba(255,255,255,0.85)').margin({ top: 4 })
      }
      .width('100%')
      .padding({ top: 60, bottom: 28 })
      .linearGradient({
        angle: 135, direction: GradientDirection.RightTop,
        colors: [['#0E7C86', 0.0], ['#0A4F57', 1.0]],
      } as LinearGradient)

      Column() {
        SectionCard() {
          Column() {
            this.Row('shield', '隐患总数', `${this.store.hazards.length}`)
            this.Divider()
            this.Row('check', '巡检记录', `${this.store.patrolRecords.length}`)
            this.Divider()
            this.Row('phone', '应急联系人', `${this.store.contacts.length}`)
          }.width('100%')
        }

        SectionCard({ marginTop: 12 }) {
          Column() {
            this.Row('settings', '角色权限', this.store.profileRole === 'admin' ? '管理员（点击切换）' : '普通用户（点击切换）', 'profile-settings-button', () => {
              this.store.profileRole = this.store.profileRole === 'admin' ? 'user' : 'admin';
              promptAction.showToast({ message: this.store.profileRole === 'admin' ? '已切换为管理员' : '已切换为普通用户' });
            })
            this.Divider()
            this.Row('chart', '同步数据', '本地已保存', 'profile-sync-button', () => {
              promptAction.showToast({ message: '数据已同步（本地）' });
            })
            this.Divider()
            this.Row('info', '关于平安扣', 'v1.0.0', 'profile-about-button', () => {
              promptAction.showDialog({
                title: '关于平安扣',
                message: '平安扣 Pinankou v1.0.0\n企业现场安全管理移动工具\n隐患上报 · 巡检打卡 · 整改闭环',
                buttons: [{ text: '知道了', color: Theme.brandPrimary }],
              });
            })
          }.width('100%')
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 16 })
      .layoutWeight(1)
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder Row(icon: string, label: string, value: string, rowId?: string, action?: () => void) {
    Row() {
      SvgIcon({ variant: icon, iconSize: 20, color: Theme.brandPrimary, strokeWidth: 1.8 })
      Text(label).fontSize(14).fontColor(Theme.textPrimary).margin({ left: 12 }).layoutWeight(1)
      Text(value).fontSize(13).fontColor(Theme.textTertiary)
    }
    .id(rowId && rowId.length > 0 ? rowId : '')
    .width('100%')
    .padding({ top: 14, bottom: 14 })
    .onClick(() => { if (action) action(); })
  }

  @Builder Divider() {
    Row().width('100%').height(1).backgroundColor(Theme.cardDivider)
  }
}
