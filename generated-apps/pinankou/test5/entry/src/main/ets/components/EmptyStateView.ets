import { Theme } from '../common/Theme';

@Component
export struct EmptyStateView {
  @Prop message: string = '暂无数据';
  @Prop testId: string = '';

  build() {
    Column({ space: 8 }) {
      Image($rawfile('icon_暂无动态图标.svg'))
        .width(48)
        .height(48)
        .fillColor(Theme.textTertiary)
      Text(this.message)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
    }
    .id(this.testId)
    .width('100%')
    .padding({ top: 48, bottom: 48 })
    .alignItems(HorizontalAlign.Center)
  }
}
