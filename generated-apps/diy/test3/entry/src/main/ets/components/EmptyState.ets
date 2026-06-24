// EmptyState.ets — 空态引导(rawfile 空态图标)
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct EmptyState {
  @Prop icon: string = 'empty-activity';
  @Prop title: string = '暂无内容';
  @Prop hint: string = '';

  build() {
    Column() {
      SvgIcon({ variant: this.icon, iconSize: 64 })
      Text(this.title)
        .fontSize(14)
        .fontColor(Theme.textTertiary)
        .margin({ top: 12 })
      if (this.hint.length > 0) {
        Text(this.hint)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
          .margin({ top: 4 })
          .textAlign(TextAlign.Center)
      }
    }
    .width('100%')
    .padding({ top: 40, bottom: 40 })
    .alignItems(HorizontalAlign.Center)
  }
}
