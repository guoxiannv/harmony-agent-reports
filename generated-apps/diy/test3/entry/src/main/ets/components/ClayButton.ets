// ClayButton.ets — 陶土风按钮(主 CTA 窑火橙)
import { Theme } from '../common/Theme';

@Component
export struct ClayButton {
  @Prop label: string = '';
  @Prop filled: boolean = true;     // true=fire 主按钮, false=泥板灰次按钮
  @Prop disabled: boolean = false;
  @Prop compact: boolean = false;
  onTap: () => void = () => {};

  build() {
    Button({ type: ButtonType.Capsule, stateEffect: !this.disabled }) {
      Text(this.label)
        .fontSize(this.compact ? 14 : 16)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.filled ? Theme.textOnClay : (this.disabled ? Theme.textTertiary : Theme.clay))
    }
    .width('100%')
    .height(this.compact ? 42 : 50)
    .backgroundColor(this.filled
      ? (this.disabled ? Theme.cardBg : Theme.fire)
      : Theme.cardBg)
    .border({ width: 1, color: this.filled ? Color.Transparent : Theme.borderDefault })
    .opacity(this.disabled ? 0.7 : 1.0)
    .enabled(!this.disabled)
    .onClick(() => {
      if (!this.disabled) {
        this.onTap();
      }
    })
  }
}
