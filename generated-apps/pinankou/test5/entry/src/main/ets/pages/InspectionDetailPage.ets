import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { InspectionTask, CheckItem } from '../models/Models';
import { Formatters } from '../common/Formatters';

@Component
export struct InspectionDetailPage {
  @Prop task: InspectionTask = new InspectionTask();
  onBack: () => void = () => {};
  onMarkPass: (checkItemId: string) => void = () => {};
  onMarkFail: (checkItemId: string) => void = () => {};
  onNoteChange: (checkItemId: string, note: string) => void = () => {};
  onSubmit: () => void = () => {};

  build() {
    Column({ space: 12 }) {
      PageHeader({ title: '巡检详情', showBack: true, onBack: this.onBack })

      Text(this.task.title)
        .id('inspection-detail-title')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      Text(`${this.task.area} · ${this.task.planDate}`)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      List({ space: 8 }) {
        ForEach(this.task.checkItems, (item: CheckItem) => {
          ListItem() {
            this.CheckItemRow(item)
          }
          .id(`inspection-checkitem-${item.id}`)
        }, (item: CheckItem) => item.id)
      }
      .id('inspection-detail-checklist')
      .width('100%')
      .layoutWeight(1)
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      Button('提交巡检结果')
        .id('inspection-submit-result')
        .width('90%')
        .height(48)
        .fontSize(16)
        .fontColor('#FFFFFF')
        .backgroundColor(Theme.brandPrimary)
        .borderRadius(Theme.radiusButton)
        .margin({ bottom: 24 })
        .enabled(this.canSubmit())
        .onClick(() => this.onSubmit())
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CheckItemRow(item: CheckItem) {
    Column({ space: 8 }) {
      Row() {
        Text(item.label)
          .fontSize(15)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)

        Row({ space: 8 }) {
          Button('正常')
            .id(`inspection-checkitem-pass-${item.id}`)
            .fontSize(12)
            .fontColor(item.result === 'pass' ? '#FFFFFF' : Theme.textSecondary)
            .backgroundColor(item.result === 'pass' ? Theme.brandPrimary : Theme.chipSoftBg)
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.onMarkPass(item.id))

          Button('异常')
            .id(`inspection-checkitem-fail-${item.id}`)
            .fontSize(12)
            .fontColor(item.result === 'fail' ? '#FFFFFF' : Theme.textSecondary)
            .backgroundColor(item.result === 'fail' ? Theme.dangerRed : Theme.chipSoftBg)
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.onMarkFail(item.id))
        }
      }
      .width('100%')

      TextInput({ text: item.note, placeholder: '备注（可选）' })
        .id(`inspection-checkitem-note-${item.id}`)
        .width('100%')
        .height(40)
        .fontSize(14)
        .backgroundColor(Theme.pageBg)
        .borderRadius(Theme.radiusSmall)
        .onChange((value: string) => this.onNoteChange(item.id, value))
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(HorizontalAlign.Start)
  }

  private canSubmit(): boolean {
    return this.task.checkItems.length > 0 && !this.task.checkItems.some((it: CheckItem) => it.result === 'unchecked')
  }
}
