import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { RiskType, RiskLevel } from '../models/Models';
import { Formatters } from '../common/Formatters';

@Component
export struct ReportRiskPage {
  onBack: () => void = () => {};
  onSubmit: (title: string, type: RiskType, level: RiskLevel, location: string, description: string, deadline: string, handler: string) => void = () => {};

  @State private title: string = ''
  @State private typeIndex: number = 0
  @State private levelIndex: number = 1
  @State private location: string = ''
  @State private description: string = ''
  @State private deadline: string = ''
  @State private handler: string = ''

  private types: RiskType[] = [RiskType.FIRE, RiskType.ELECTRICAL, RiskType.MECHANICAL, RiskType.ENVIRONMENT, RiskType.PERSONNEL, RiskType.OTHER]
  private levels: RiskLevel[] = [RiskLevel.LOW, RiskLevel.MEDIUM, RiskLevel.HIGH, RiskLevel.CRITICAL]

  build() {
    Scroll() {
      Column({ space: 16 }) {
        PageHeader({ title: '上报隐患', showBack: true, onBack: this.onBack })

        this.FieldLabel('隐患标题')
        TextInput({ text: this.title, placeholder: '请输入隐患标题' })
          .id('report-risk-title-input')
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.title = value)

        this.FieldLabel('隐患类型')
        Select(this.typeOptions())
          .id('report-risk-type-picker')
          .width('100%')
          .height(44)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .selected(this.typeIndex)
          .onSelect((index: number) => this.typeIndex = index)

        this.FieldLabel('隐患等级')
        Select(this.levelOptions())
          .id('report-risk-level-picker')
          .width('100%')
          .height(44)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .selected(this.levelIndex)
          .onSelect((index: number) => this.levelIndex = index)

        this.FieldLabel('地点')
        TextInput({ text: this.location, placeholder: '请输入地点' })
          .id('report-risk-location-input')
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.location = value)

        this.FieldLabel('详细描述')
        TextArea({ text: this.description, placeholder: '请输入详细描述' })
          .id('report-risk-desc-input')
          .width('100%')
          .height(120)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.description = value)

        this.FieldLabel('截止日期')
        TextInput({ text: this.deadline, placeholder: 'YYYY-MM-DD' })
          .id('report-risk-deadline-picker')
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.deadline = value)

        this.FieldLabel('整改责任人')
        TextInput({ text: this.handler, placeholder: '请输入责任人姓名' })
          .id('report-risk-handler-picker')
          .width('100%')
          .height(44)
          .fontSize(14)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.handler = value)

        Button('提交')
          .id('report-risk-submit')
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

  private typeOptions(): Array<SelectOption> {
    return this.types.map((type: RiskType) => {
      return { value: Formatters.riskTypeLabel(type) } as SelectOption
    })
  }

  private levelOptions(): Array<SelectOption> {
    return this.levels.map((level: RiskLevel) => {
      return { value: Formatters.riskLevelLabel(level) } as SelectOption
    })
  }

  private canSubmit(): boolean {
    return this.title.trim().length > 0 && this.location.trim().length > 0
  }

  private doSubmit(): void {
    this.onSubmit(
      this.title.trim(),
      this.types[this.typeIndex],
      this.levels[this.levelIndex],
      this.location.trim(),
      this.description.trim(),
      this.deadline.trim(),
      this.handler.trim()
    )
  }
}
