import { SafetyAppState } from '../../viewmodels/SafetyAppState'
import { Ids } from '../../common/Ids'
import { Theme } from '../../common/Theme'

@Component
export struct PatrolCheckinSheet {
  @ObjectLink state: SafetyAppState
  onCancel: () => void = () => {}
  onReport: (pointId: string) => void = () => {}

  build() {
    Column({ space: 14 }) {
      Text('巡检打卡')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
        .width('100%')

      TextArea({ text: this.state.patrolCheckin.notes, placeholder: '记录现场情况' })
        .id(Ids.patrolCheckinNotesInput)
        .width('100%')
        .height(100)
        .borderRadius(12)
        .backgroundColor(Theme.surfaceSecondary)
        .onChange((v: string) => this.state.patrolCheckin.notes = v)

      Row() {
        Text('发现异常')
          .fontSize(14)
          .fontColor(Theme.textPrimary)
        Toggle({ type: ToggleType.Switch, isOn: this.state.patrolCheckin.isAbnormal })
          .id(Ids.patrolCheckinAbnormalToggle)
          .selectedColor(Theme.danger)
          .onChange((v: boolean) => this.state.patrolCheckin.isAbnormal = v)
      }
      .width('100%')
      .height(48)
      .justifyContent(FlexAlign.SpaceBetween)

      Button('拍照')
        .id(Ids.patrolCheckinPhotoButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.brandPrimary)
        .width('100%')
        .height(40)
        .borderRadius(12)
        .backgroundColor(Theme.surfaceSecondary)
        .onClick(() => this.state.capturePhotoForCheckin())

      if (this.state.patrolCheckin.photos.length > 0) {
        Row({ space: 8 }) {
          ForEach(this.state.patrolCheckin.photos, (uri: string, index: number) => {
            Image(uri)
              .width(64)
              .height(64)
              .borderRadius(12)
              .objectFit(ImageFit.Cover)
          }, (uri: string, index: number) => `${uri}-${index}`)
        }
        .width('100%')
      }

      Row({ space: 10 }) {
        Button('取消')
          .id(Ids.patrolCheckinCancelButton)
          .fontSize(14)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
          .height(46)
          .borderRadius(23)
          .backgroundColor(Theme.surfaceSecondary)
          .onClick(() => this.onCancel())
        Button('提交')
          .id(Ids.patrolCheckinSubmitButton)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .layoutWeight(1)
          .height(46)
          .borderRadius(23)
          .backgroundColor(Theme.brandPrimary)
          .onClick(() => this.submit())
      }
      .width('100%')
    }
    .id(Ids.patrolCheckinModal)
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.surfacePrimary)
    .borderRadius({ topLeft: 20, topRight: 20 })
  }

  private submit(): void {
    this.state.submitPatrolCheckin()
    if (this.state.patrolCheckin.isAbnormal) {
      this.onReport(this.state.patrolCheckin.pointId)
    }
    this.onCancel()
  }
}
