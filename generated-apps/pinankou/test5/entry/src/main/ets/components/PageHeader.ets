import { Theme } from '../common/Theme';

@Component
export struct PageHeader {
  @Prop title: string = '';
  @Prop showBack: boolean = false;
  onBack?: () => void;

  build() {
    Row() {
      if (this.showBack) {
        Image($rawfile('icon_取消并返回上一页.svg'))
          .width(24)
          .height(24)
          .onClick(() => {
            if (this.onBack) {
              this.onBack()
            }
          })
      } else {
        Blank().width(24)
      }

      Text(this.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Blank().width(24)
    }
    .width('100%')
    .height(56)
    .padding({ left: 16, right: 16 })
    .alignItems(VerticalAlign.Center)
  }
}
