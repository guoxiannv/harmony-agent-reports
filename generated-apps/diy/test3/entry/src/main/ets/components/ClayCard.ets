// ClayCard.ets — 陶土风卡片容器(通过 @BuilderParam 传入内容)
import { Theme } from '../common/Theme';

@Component
export struct ClayCard {
  @Prop paddingV: number = 16;
  @Prop bg: string = Theme.cardBg;
  @BuilderParam content: () => void;

  build() {
    Column() {
      this.content()
    }
    .width('100%')
    .padding(this.paddingV)
    .backgroundColor(this.bg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 10, color: 'rgba(138,74,44,0.06)', offsetX: 0, offsetY: 3 })
  }
}
