import { Theme } from '../common/Theme';

@Component
export struct EmptyStateView {
  @Prop title: string = '暂无数据';
  @Prop subtitle: string = '';

  build() {
    Column({ space: 8 }) {
      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTertiary)
      if (this.subtitle) {
        Text(this.subtitle)
          .fontSize(14)
          .fontColor(Theme.textQuaternary)
      }
    }
    .width('100%')
    .padding({ top: 32, bottom: 32 })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct SectionTitle {
  @Prop title: string = '';

  build() {
    Text(this.title)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.textPrimary)
      .width('100%')
  }
}

@Component
export struct PrimaryButton {
  @Prop label: string = '保存';
  @Prop isEnabled: boolean = true;
  onTap?: () => void;

  build() {
    Button(this.label)
      .width('100%')
      .height(48)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.textOnBrand)
      .backgroundColor(Theme.brandPrimary)
      .borderRadius(Theme.radiusButton)
      .shadow(this.isEnabled ? Theme.buttonShadow : { radius: 0, color: Color.Transparent, offsetY: 0 })
      .enabled(this.isEnabled)
      .onClick(() => {
        if (this.onTap) {
          this.onTap();
        }
      })
  }
}

@Component
export struct DangerButton {
  @Prop label: string = '删除';
  onTap?: () => void;

  build() {
    Button(this.label)
      .width('100%')
      .height(44)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.danger)
      .backgroundColor(Theme.dangerSoft)
      .borderRadius(Theme.radiusButton)
      .onClick(() => {
        if (this.onTap) {
          this.onTap();
        }
      })
  }
}

@Component
export struct GhostButton {
  @Prop label: string = '';
  @Prop active: boolean = false;
  onTap?: () => void;

  build() {
    Button(this.label)
      .height(32)
      .padding({ left: 14, right: 14 })
      .fontSize(13)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.active ? Theme.brandPrimary : Theme.textTertiary)
      .backgroundColor(this.active ? Theme.brandSoft : Theme.inputBg)
      .border({ width: 1, color: this.active ? Theme.brandPrimary : Theme.borderDefault })
      .borderRadius(Theme.radiusSmall)
      .onClick(() => {
        if (this.onTap) {
          this.onTap();
        }
      })
  }
}

@Component
export struct PageHeader {
  @Prop title: string = '';
  onBack?: () => void;
  @BuilderParam trailing: () => void = this.emptyBuilder;

  @Builder
  emptyBuilder() {}

  build() {
    Row() {
      Button() {
        Text('<')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .width(40)
      .height(40)
      .backgroundColor(Color.Transparent)
      .onClick(() => {
        if (this.onBack) {
          this.onBack();
        }
      })

      Text(this.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      this.trailing()
    }
    .width('100%')
    .height(56)
    .padding({ left: 8, right: 8 })
    .backgroundColor(Theme.pageBg)
    .alignItems(VerticalAlign.Center)
  }
}

@Component
export struct FormField {
  @Prop label: string = '';
  @Prop placeholder: string = '';
  @Prop value: string = '';
  @Prop componentId: string = '';
  @Prop multiline: boolean = false;
  onChange?: (value: string) => void;

  build() {
    Column({ space: 6 }) {
      Text(this.label)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textSecondary)
        .width('100%')
      if (this.multiline) {
        TextArea({ text: this.value, placeholder: this.placeholder })
          .id(this.componentId)
          .width('100%')
          .height(120)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .placeholderColor(Theme.textPlaceholder)
          .backgroundColor(Theme.inputBg)
          .border({ width: 1, color: Theme.borderDefault })
          .borderRadius(Theme.radiusPill)
          .padding(12)
          .onChange((v: string) => {
            if (this.onChange) {
              this.onChange(v);
            }
          })
      } else {
        TextInput({ text: this.value, placeholder: this.placeholder })
          .id(this.componentId)
          .width('100%')
          .height(48)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .placeholderColor(Theme.textPlaceholder)
          .backgroundColor(Theme.inputBg)
          .border({ width: 1, color: Theme.borderDefault })
          .borderRadius(Theme.radiusPill)
          .padding({ left: 14, right: 14 })
          .onChange((v: string) => {
            if (this.onChange) {
              this.onChange(v);
            }
          })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}

export function levelColor(level: string): string {
  if (level === 'high') return Theme.danger;
  if (level === 'medium') return Theme.warning;
  if (level === 'low') return Theme.success;
  return Theme.textTertiary;
}

export function levelSoftColor(level: string): string {
  if (level === 'high') return Theme.dangerSoft;
  if (level === 'medium') return Theme.warningSoft;
  if (level === 'low') return Theme.successSoft;
  return Theme.inputBg;
}

export function levelLabel(level: string): string {
  if (level === 'high') return '高';
  if (level === 'medium') return '中';
  if (level === 'low') return '低';
  return level;
}

export function hazardStatusLabel(status: string): string {
  if (status === 'pending') return '待处理';
  if (status === 'in_progress') return '整改中';
  if (status === 'awaiting_acceptance') return '待验收';
  if (status === 'closed') return '已关闭';
  return status;
}

export function hazardStatusColor(status: string): string {
  if (status === 'pending') return Theme.textQuaternary;
  if (status === 'in_progress') return Theme.info;
  if (status === 'awaiting_acceptance') return Theme.warning;
  if (status === 'closed') return Theme.success;
  return Theme.textTertiary;
}

export function hazardStatusSoftColor(status: string): string {
  if (status === 'pending') return Theme.inputBg;
  if (status === 'in_progress') return Theme.infoSoft;
  if (status === 'awaiting_acceptance') return Theme.warningSoft;
  if (status === 'closed') return Theme.successSoft;
  return Theme.inputBg;
}

export function inspectionStatusLabel(status: string): string {
  if (status === 'pending') return '未开始';
  if (status === 'in_progress') return '进行中';
  if (status === 'completed') return '已完成';
  if (status === 'abnormal') return '异常';
  return status;
}

export function inspectionStatusColor(status: string): string {
  if (status === 'pending') return Theme.textQuaternary;
  if (status === 'in_progress') return Theme.info;
  if (status === 'completed') return Theme.success;
  if (status === 'abnormal') return Theme.danger;
  return Theme.textTertiary;
}

export function inspectionStatusSoftColor(status: string): string {
  if (status === 'pending') return Theme.inputBg;
  if (status === 'in_progress') return Theme.infoSoft;
  if (status === 'completed') return Theme.successSoft;
  if (status === 'abnormal') return Theme.dangerSoft;
  return Theme.inputBg;
}
