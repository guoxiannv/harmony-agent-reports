// PageHeader.ets — 二级页面顶部栏(返回 + 标题)
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct PageHeader {
  @Prop title: string = '';
  onBack: () => void = () => {};

  build() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 20 })
      }
      .width(40)
      .height(40)
      .borderRadius(20)
      .backgroundColor(Theme.cardLight)
      .border({ width: 1, color: Theme.borderDefault })
      .justifyContent(FlexAlign.Center)
      .onClick(() => this.onBack())

      Text(this.title)
        .fontSize(Theme.fontDisplay)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.clay)
        .margin({ left: 12 })
        .layoutWeight(1)

      Blank()
    }
    .width('100%')
    .padding({ left: 20, right: 20, top: 16, bottom: 12 })
    .alignItems(VerticalAlign.Center)
  }
}
