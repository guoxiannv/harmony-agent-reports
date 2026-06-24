import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct HomePage {
  @Prop vm: AppViewModel
  onOpenPetPicker: () => void = () => {}
  onOpenPetEditor: () => void = () => {}
  onOpenAddRecord: () => void = () => {}
  onOpenRecordDiet: () => void = () => {}
  onOpenRecordStool: () => void = () => {}
  onOpenRecordWeight: () => void = () => {}
  onOpenRecordMeds: () => void = () => {}

  build() {
    Column() {
      Text('HomePage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
