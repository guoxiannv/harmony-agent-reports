import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct RecordsPage {
  @Prop vm: AppViewModel
  onOpenAddRecord: () => void = () => {}
  onOpenRecordDiet: () => void = () => {}
  onOpenRecordStool: () => void = () => {}
  onOpenRecordWeight: () => void = () => {}
  onOpenRecordMeds: () => void = () => {}

  build() {
    Column() {
      Text('RecordsPage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
