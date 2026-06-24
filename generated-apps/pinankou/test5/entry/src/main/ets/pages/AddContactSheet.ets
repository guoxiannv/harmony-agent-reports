import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'

@Component
export struct AddContactSheet {
  onBack: () => void = () => {};
  onSubmit: (name: string, role: string, duty: string, phone: string) => void = () => {};

  @State private name: string = ''
  @State private role: string = ''
  @State private duty: string = ''
  @State private phone: string = ''

  build() {
    Scroll() {
      Column({ space: 16 }) {
        PageHeader({ title: '添加联系人', showBack: true, onBack: this.onBack })

        this.FieldLabel('姓名')
        TextInput({ text: this.name, placeholder: '请输入姓名' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.name = value)

        this.FieldLabel('职务')
        TextInput({ text: this.role, placeholder: '请输入职务' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.role = value)

        this.FieldLabel('职责')
        TextInput({ text: this.duty, placeholder: '请输入职责' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.duty = value)

        this.FieldLabel('电话')
        TextInput({ text: this.phone, placeholder: '请输入电话' })
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.phone = value)

        Button('保存')
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
    return this.name.trim().length > 0 && this.phone.trim().length > 0
  }

  private doSubmit(): void {
    this.onSubmit(this.name.trim(), this.role.trim(), this.duty.trim(), this.phone.trim())
  }
}
