import { AppViewModel } from '../viewmodels/AppViewModel';

@Component
export struct ProfilePage {
  @Prop vm: AppViewModel
  onOpenPetEditor: () => void = () => {}
  onOpenFamilyInvite: () => void = () => {}

  build() {
    Column() {
      Text('ProfilePage')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
  }
}
