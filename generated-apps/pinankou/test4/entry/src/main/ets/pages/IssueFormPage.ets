import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { IssueType, RiskLevel } from '../models/SafetyTypes'

@Component
export struct IssueFormPage {
  @ObjectLink state: SafetyAppState
  mode: 'create' | 'edit' = 'create'
  editIssueId: string = ''
  onBack: () => void = () => {}

  build() {
    Column({ space: 0 }) {
      this.Header()
      Scroll() {
        Column({ space: 14 }) {
          this.TextField('标题', this.state.issueForm.title, Ids.issueFormTitleInput, (v: string) => this.state.issueForm.title = v)
          this.PickerRow('类型', Ids.issueFormTypePicker, ['隐患', '日常事项', '整改督办'], this.typeIndex(), (i: number) => {
            let map: IssueType[] = [IssueType.HAZARD, IssueType.ROUTINE, IssueType.RECTIFICATION]
            this.state.issueForm.type = map[i] ?? IssueType.HAZARD
          })
          this.PickerRow('风险等级', Ids.issueFormRiskPicker, ['低', '中', '高', '重大'], this.riskIndex(), (i: number) => {
            let map: RiskLevel[] = [RiskLevel.LOW, RiskLevel.MEDIUM, RiskLevel.HIGH, RiskLevel.CRITICAL]
            this.state.issueForm.riskLevel = map[i] ?? RiskLevel.LOW
          })
          this.TextField('位置', this.state.issueForm.location, Ids.issueFormLocationInput, (v: string) => this.state.issueForm.location = v)
          this.TextField('负责人', this.state.issueForm.assignee, Ids.issueFormAssigneeInput, (v: string) => this.state.issueForm.assignee = v)
          this.TextField('截止日期 (毫秒时间戳)', this.state.issueForm.dueDate === 0 ? '' : String(this.state.issueForm.dueDate), Ids.issueFormDueDatePicker, (v: string) => {
            let n: number = Number(v)
            this.state.issueForm.dueDate = isNaN(n) ? 0 : n
          })
          this.TextAreaField('描述', this.state.issueForm.description, Ids.issueFormDescriptionInput, (v: string) => this.state.issueForm.description = v)
          this.PhotoSection()
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
        .id(Ids.issueFormCancelButton)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.onBack())
      Text(this.mode === 'create' ? '上报隐患' : '编辑隐患')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Button('提交')
        .id(Ids.issueFormSubmitButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.brandPrimary)
        .backgroundColor(Color.Transparent)
        .onClick(() => this.submit())
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
  TextAreaField(label: string, value: string, targetId: string, onChange: (v: string) => void) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .width('100%')
      TextArea({ text: value })
        .id(targetId)
        .width('100%')
        .height(100)
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
  PhotoSection() {
    Column({ space: 8 }) {
      Text('照片')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .width('100%')
      Row({ space: 8 }) {
        Button('+')
          .id(Ids.issueFormAddPhotoButton)
          .width(64)
          .height(64)
          .borderRadius(12)
          .fontSize(24)
          .fontColor(Theme.brandPrimary)
          .backgroundColor(Theme.surfacePrimary)
          .onClick(() => this.state.capturePhotoForIssueForm())
        ForEach(this.state.issueForm.photos, (uri: string, index: number) => {
          Image(uri)
            .id(`issue-form-photo-${index}`)
            .width(64)
            .height(64)
            .borderRadius(12)
            .objectFit(ImageFit.Cover)
        }, (uri: string, index: number) => `${uri}-${index}`)
      }
      .id(Ids.issueFormPhotoGrid)
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  Actions() {
    Row({ space: 10 }) {
      Button('取消')
        .id(Ids.issueFormCancelButton)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .layoutWeight(1)
        .height(46)
        .borderRadius(23)
        .backgroundColor(Theme.surfaceSecondary)
        .onClick(() => this.onBack())
      Button('提交')
        .id(Ids.issueFormSubmitButton)
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
    .margin({ top: 8 })
  }

  private typeIndex(): number {
    let map: IssueType[] = [IssueType.HAZARD, IssueType.ROUTINE, IssueType.RECTIFICATION]
    return map.indexOf(this.state.issueForm.type)
  }

  private riskIndex(): number {
    let map: RiskLevel[] = [RiskLevel.LOW, RiskLevel.MEDIUM, RiskLevel.HIGH, RiskLevel.CRITICAL]
    return map.indexOf(this.state.issueForm.riskLevel)
  }

  private submit(): void {
    let ok: boolean = this.mode === 'edit' ? this.state.updateIssueForm(this.editIssueId) : this.state.submitIssueForm()
    if (ok) {
      this.onBack()
    }
  }
}
