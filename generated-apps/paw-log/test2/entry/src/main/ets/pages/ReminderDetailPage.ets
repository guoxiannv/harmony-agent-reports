import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct ReminderDetailPage {
  @Prop vm: AppViewModel
  onBack: () => void = () => {}

  build() {
    Column() {
      Text('ReminderDetailPage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
