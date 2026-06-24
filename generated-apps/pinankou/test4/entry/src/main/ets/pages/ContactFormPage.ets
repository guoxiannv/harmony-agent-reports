import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { ContactGroup } from '../models/SafetyTypes'

@Component
export struct ContactFormPage {
  @ObjectLink state: SafetyAppState
  mode: 'create' | 'edit' = 'create'
  onBack: () => void = () => {}

  build() {
    Column({ space: 0 }) {
      this.Header()
      Scroll() {
        Column({ space: 14 }) {
          this.TextField('姓名', this.state.contactForm.name, Ids.contactFormNameInput, (v: string) => this.state.contactForm.name = v)
          this.TextField('职务', this.state.contactForm.role, Ids.contactFormRoleInput, (v: string) => this.state.contactForm.role = v)
          this.PickerRow('分组', Ids.contactFormGroupPicker, ['消防', '安保', '医疗', '主管', '其他'], this.groupIndex(), (i: number) => {
            let map: ContactGroup[] = [ContactGroup.FIRE, ContactGroup.SECURITY, ContactGroup.MEDICAL, ContactGroup.MANAGER, ContactGroup.OTHER]
            this.state.contactForm.group = map[i] ?? ContactGroup.OTHER
          })
          this.TextField('电话', this.state.contactForm.phone, Ids.contactFormPhoneInput, (v: string) => this.state.contactForm.phone = v)
          Row() {
            Text('优先显示')
              .fontSize(14)
              .fontColor(Theme.textPrimary)
            Toggle({ type: ToggleType.Switch, isOn: this.state.contactForm.priority })
              .id(Ids.contactFormPriorityToggle)
              .selectedColor(Theme.brandPrimary)
              .onChange((v: boolean) => this.state.contactForm.priority = v)
          }
          .width('100%')
          .height(48)
          .justifyContent(FlexAlign.SpaceBetween)

          this.Actions()
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 16, bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header() {
    Row() {
      Button('返回')
        .id(Ids.contactFormCancelButton)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.onBack())
      Text(this.mode === 'create' ? '新增联系人' : '编辑联系人')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Button('保存')
        .id(Ids.contactFormSaveButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.brandPrimary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.save())
    }
    .width('100%')
    .height(56)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  TextField(label: string, value: string, targetId: string, onChange: (v: string) => void) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .width('100%')
      TextInput({ text: value })
        .id(targetId)
        .width('100%')
        .height(44)
        .borderRadius(12)
        .backgroundColor(Theme.surfacePrimary)
        .onChange(onChange)
    }
    .width('100%')
  }

  @Builder
  PickerRow(label: string, targetId: string, options: string[], selected: number, onSelect: (i: number) => void) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .width('100%')
      Select(this.selectOptions(options))
        .id(targetId)
        .selected(selected)
        .value(options[selected])
        .width('100%')
        .height(44)
        .borderRadius(12)
        .backgroundColor(Theme.surfacePrimary)
        .onSelect((index: number) => onSelect(index))
    }
    .width('100%')
  }

  private selectOptions(options: string[]): SelectOption[] {
    return options.map((o: string) => {
      let item: SelectOption = { value: o }
      return item
    })
  }

  @Builder
  Actions() {
    Row({ space: 10 }) {
      Button('取消')
        .id(Ids.contactFormCancelButton)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .layoutWeight(1)
        .height(46)
        .borderRadius(23)
        .backgroundColor(Theme.surfaceSecondary)
        .onClick(() => this.onBack())
      Button('保存')
        .id(Ids.contactFormSaveButton)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .layoutWeight(1)
        .height(46)
        .borderRadius(23)
        .backgroundColor(Theme.brandPrimary)
        .onClick(() => this.save())
    }
    .width('100%')
    .margin({ top: 8 })
  }

  private groupIndex(): number {
    let map: ContactGroup[] = [ContactGroup.FIRE, ContactGroup.SECURITY, ContactGroup.MEDICAL, ContactGroup.MANAGER, ContactGroup.OTHER]
    return map.indexOf(this.state.contactForm.group)
  }

  private save(): void {
    if (this.state.submitContactForm()) {
      this.onBack()
    }
  }
}
