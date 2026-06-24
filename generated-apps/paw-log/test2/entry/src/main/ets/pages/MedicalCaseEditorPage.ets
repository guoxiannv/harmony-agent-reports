import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct MedicalCaseEditorPage {
  @Prop vm: AppViewModel
  onBack: () => void = () => {}

  build() {
    Column() {
      Text('MedicalCaseEditorPage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
