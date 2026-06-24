import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct CarePage {
  @Prop vm: AppViewModel
  onOpenMedicalEditor: () => void = () => {}
  onOpenReminderEditor: (reminderId?: string) => void = () => {}

  build() {
    Column() {
      Text('CarePage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
