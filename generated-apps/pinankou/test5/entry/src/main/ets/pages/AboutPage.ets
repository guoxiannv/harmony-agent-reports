import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'

@Component
export struct AboutPage {
  onBack: () => void = () => {};

  build() {
    Column({ space: 16 }) {
      PageHeader({ title: '关于', showBack: true, onBack: this.onBack })

      Column({ space: 8 }) {
        Text('平安扣')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.brandPrimary)
        Text('Pinankou')
          .fontSize(14)
          .fontColor(Theme.textSecondary)
        Text('版本 1.0.0')
          .fontSize(14)
          .fontColor(Theme.textTertiary)
      }
      .width('100%')
      .padding(32)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      .alignItems(HorizontalAlign.Center)

      Text('平安扣是一款面向一线安全员与班组负责人的移动端安全管理工具，把“发现—上报—整改—复核”闭环装进手机。')
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }
}
