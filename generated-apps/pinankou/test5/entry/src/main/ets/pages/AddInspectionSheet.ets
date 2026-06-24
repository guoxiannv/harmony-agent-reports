import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'

@Component
export struct AddInspectionSheet {
  onBack: () => void = () => {};
  onSubmit: (title: string, area: string, planDate: string, inspector: string, items: string[]) => void = () => {};

  @State private title: string = ''
  @State private area: string = ''
  @State private planDate: string = ''
  @State private inspector: string = ''
  @State private itemText: string = ''

  build() {
    Scroll() {
      Column({ space: 16 }) {
        PageHeader({ title: '新建巡检任务', showBack: true, onBack: this.onBack })

        this.FieldLabel('任务名称')
        TextInput({ text: this.title, placeholder: '请输入任务名称' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.title = value)

        this.FieldLabel('巡检区域')
        TextInput({ text: this.area, placeholder: '请输入巡检区域' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.area = value)

        this.FieldLabel('计划日期')
        TextInput({ text: this.planDate, placeholder: 'YYYY-MM-DD' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.planDate = value)

        this.FieldLabel('巡检人')
        TextInput({ text: this.inspector, placeholder: '请输入巡检人' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.inspector = value)

        this.FieldLabel('检查项（每行一个）')
        TextArea({ text: this.itemText, placeholder: '例如：\n消防通道是否畅通\n灭火器压力是否正常' })
          .width('100%')
          .height(160)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.itemText = value)

        Button('创建任务')
          .width('100%')
          .height(48)
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .borderRadius(Theme.radiusButton)
          .enabled(this.canSubmit())
          .onClick(() => this.doSubmit())
      }
      .width('100%')
      .padding(Theme.pageHorizontalPadding)
      .padding({ bottom: 100 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  FieldLabel(label: string) {
    Text(label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
  }

  private canSubmit(): boolean {
    return this.title.trim().length > 0 && this.area.trim().length > 0
  }

  private doSubmit(): void {
    let items: string[] = this.itemText.split('\n').map((s: string) => s.trim()).filter((s: string) => s.length > 0)
    if (items.length === 0) {
      items = ['检查项 1']
    }
    this.onSubmit(this.title.trim(), this.area.trim(), this.planDate.trim(), this.inspector.trim(), items)
  }
}
