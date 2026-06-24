// ClayTag.ets — 陶土风标签 chip
import { Theme } from '../common/Theme';

@Component
export struct ClayTag {
  @Prop label: string = '';
  @Prop selected: boolean = false;
  @Prop removable: boolean = false;
  onRemove: () => void = () => {};

  build() {
    Row() {
      Text(this.label)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(this.selected ? Theme.textOnClay : Theme.textSecondary)
      if (this.removable) {
        Text('×')
          .fontSize(15)
          .fontColor(this.selected ? Theme.textOnClay : Theme.textTertiary)
          .margin({ left: 6 })
          .onClick(() => this.onRemove())
      }
    }
    .padding({ left: 12, right: 12, top: 6, bottom: 6 })
    .backgroundColor(this.selected ? Theme.brandPrimary : Theme.chipSoftBg)
    .borderRadius(Theme.radiusChip)
    .border({ width: 1, color: this.selected ? Theme.brandPrimary : Theme.borderDefault })
  }
}
