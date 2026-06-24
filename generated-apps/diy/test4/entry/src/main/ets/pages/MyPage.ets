import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { Member } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct MyPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;

  build() {
    Column() {
      this.Header('我的')

      Scroll() {
        Column({ space: 16 }) {
          this.ProfileCard(this.state.currentMember())

          Column({ space: 12 }) {
            this.MenuRow('my-settings-button', '设置', () => {
              promptAction.showToast({ message: '设置功能开发中' });
            })
            this.MenuRow('my-about-button', '关于', () => {
              promptAction.showToast({ message: '手作·印记 v1.0.0' });
            })
            this.MenuRow('my-logout-button', '退出登录', () => {
              promptAction.showToast({ message: '已退出' });
            })
          }
          .width('100%')
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
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
  Header(title: string) {
    Stack({ alignContent: Alignment.Center }) {
      Column()
        .width('100%')
        .height(56)
        .linearGradient({
          angle: 180,
          direction: GradientDirection.Bottom,
          colors: [[Theme.headerGradientStart, 0.0], [Theme.headerGradientEnd, 1.0]]
        })
        .borderRadius({ bottomLeft: 28, bottomRight: 28 })

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  ProfileCard(m: Member | null) {
    Row({ space: 16 }) {
      Column() {
        Text(m ? m.name.slice(0, 1) : '我')
          .id('my-avatar')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnBrand)
      }
      .width(72)
      .height(72)
      .borderRadius(36)
      .backgroundColor(Theme.brandPrimary)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column({ space: 6 }) {
        Text(m ? m.name : '未选择会员')
          .id('my-name')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(m ? `等级：${this.ctrl.state.levelName(m.id)}` : '请先到会员列表选择')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(20)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  MenuRow(targetId: string, title: string, onTap: () => void) {
    Row() {
      Text(title)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
      Text('>')
        .fontSize(16)
        .fontColor(Theme.textSecondary)
    }
    .id(targetId)
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .borderRadius(18)
    .backgroundColor(Theme.cardBg)
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .onClick(() => onTap())
  }
}
