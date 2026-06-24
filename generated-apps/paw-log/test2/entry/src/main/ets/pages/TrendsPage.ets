import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct TrendsPage {
  @Prop vm: AppViewModel

  build() {
    Column() {
      Text('TrendsPage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
