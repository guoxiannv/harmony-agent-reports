import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct PetEditorPage {
  @Prop vm: AppViewModel
  onBack: () => void = () => {}

  build() {
    Column() {
      Text('PetEditorPage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
