import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct MedicalCasePage {
  @Prop vm: AppViewModel
  onBack: () => void = () => {}
  onOpenMedicalEditor: () => void = () => {}

  build() {
    Column() {
      Text('MedicalCasePage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
