// CommonUi.ets — reusable atomic UI components (blue-green safety theme).
import { Theme, RiskLevel, HazardStatus, riskColor, riskBg, riskLabel,
  statusColor, statusBg, statusLabel } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { TrendPoint } from '../model/Types';

@Component
export struct SectionCard {
  @BuilderParam content: () => void;
  @Prop paddingValue: number = 16;
  @Prop bg: string = Theme.cardBg;
  @Prop marginTop: number = 0;
  @Prop marginBottom: number = 0;

  build() {
    Column() {
      this.content()
    }
    .width('100%')
    .backgroundColor(this.bg)
    .borderRadius(Theme.radiusCard)
    .padding(this.paddingValue)
    .border({ width: 1, color: Theme.cardBorder })
    .shadow({ radius: 12, color: 'rgba(15,23,42,0.05)', offsetX: 0, offsetY: 4 })
    .margin({ top: this.marginTop, bottom: this.marginBottom })
  }
}

@Component
export struct EmptyState {
  @Prop icon: string = 'shield';
  @Prop title: string = '暂无数据';
  @Prop hint: string = '';
  @Prop actionLabel: string = '';
  onAction: () => void = () => {};

  build() {
    Column() {
      SvgIcon({ variant: this.icon, iconSize: 44, color: Theme.textQuaternary, strokeWidth: 1.6 })
      Text(this.title)
        .fontSize(15).fontWeight(FontWeight.Medium)
        .fontColor(Theme.textSecondary).margin({ top: 12 })
      if (this.hint.length > 0) {
        Text(this.hint)
          .fontSize(13).fontColor(Theme.textTertiary).margin({ top: 4 })
          .textAlign(TextAlign.Center)
      }
      if (this.actionLabel.length > 0) {
        Button(this.actionLabel)
          .type(ButtonType.Capsule)
          .backgroundColor(Theme.brandPrimary).fontColor(Theme.textOnBrand)
          .fontSize(14).height(40).padding({ left: 22, right: 22 })
          .margin({ top: 16 })
          .onClick(() => this.onAction())
      }
    }
    .width('100%')
    .padding({ top: 40, bottom: 40, left: 24, right: 24 })
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct StatTile {
  @Prop label: string;
  @Prop value: string;
  @Prop sub: string = '';
  @Prop accent: string = Theme.brandPrimary;

  build() {
    Column() {
      Text(this.value)
        .fontSize(28).fontWeight(FontWeight.Bold).fontColor(this.accent)
        .maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
      Text(this.label)
        .fontSize(12).fontColor(Theme.textTertiary).margin({ top: 4 })
      if (this.sub.length > 0) {
        Text(this.sub).fontSize(11).fontColor(Theme.textQuaternary).margin({ top: 2 })
      }
    }
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .padding({ top: 14, bottom: 14 })
  }
}

@Component
export struct RiskBadge {
  @Prop level: RiskLevel;

  build() {
    Text(riskLabel(this.level))
      .fontSize(12).fontWeight(FontWeight.Medium)
      .fontColor(riskColor(this.level))
      .backgroundColor(riskBg(this.level))
      .borderRadius(Theme.radiusChip)
      .padding({ left: 10, right: 10, top: 3, bottom: 3 })
  }
}

@Component
export struct StatusBadge {
  @Prop status: HazardStatus;

  build() {
    Text(statusLabel(this.status))
      .fontSize(12).fontWeight(FontWeight.Medium)
      .fontColor(statusColor(this.status))
      .backgroundColor(statusBg(this.status))
      .borderRadius(Theme.radiusChip)
      .padding({ left: 10, right: 10, top: 3, bottom: 3 })
  }
}

@Component
export struct PrimaryButton {
  @Prop label: string;
  @Prop isEnabled: boolean = true;
  @Prop bg: string = Theme.brandPrimary;
  onTap: () => void = () => {};

  build() {
    Button(this.label)
      .type(ButtonType.Capsule)
      .backgroundColor(this.isEnabled ? this.bg : Theme.textQuaternary)
      .fontColor(Theme.textOnBrand)
      .fontSize(15).fontWeight(FontWeight.Medium)
      .width('100%').height(48)
      .enabled(this.isEnabled)
      .onClick(() => this.onTap())
  }
}

@Component
export struct GhostButton {
  @Prop label: string;
  onTap: () => void = () => {};

  build() {
    Button(this.label)
      .type(ButtonType.Capsule)
      .backgroundColor(Theme.brandSoft)
      .fontColor(Theme.brandDeep)
      .fontSize(14).height(40)
      .onClick(() => this.onTap())
  }
}

@Component
export struct ChipBar {
  @Prop options: string[];
  @Prop selected: string;
  onSelect: (opt: string) => void = () => {};

  build() {
    Scroll() {
      Row() {
        ForEach(this.options, (opt: string) => {
          Text(opt)
            .fontSize(13).fontWeight(FontWeight.Medium)
            .fontColor(this.selected === opt ? Theme.textOnBrand : Theme.textSecondary)
            .backgroundColor(this.selected === opt ? Theme.brandPrimary : Theme.chipSoftBg)
            .borderRadius(Theme.radiusChip)
            .padding({ left: 14, right: 14, top: 7, bottom: 7 })
            .margin({ right: 8 })
            .onClick(() => this.onSelect(opt))
        }, (opt: string) => opt)
      }
      .padding({ left: 0, right: 8 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
  }
}

@Component
export struct SearchField {
  @Prop value: string;
  @Prop placeholder: string = '搜索';
  onTextChange: (v: string) => void = () => {};

  build() {
    Row() {
      SvgIcon({ variant: 'search', iconSize: 18, color: Theme.textTertiary, strokeWidth: 2 })
      TextInput({ text: this.value, placeholder: this.placeholder })
        .backgroundColor(Color.Transparent)
        .layoutWeight(1)
        .fontSize(14)
        .placeholderColor(Theme.textPlaceholder)
        .placeholderFont({ size: 14 })
        .onChange((v: string) => this.onTextChange(v))
    }
    .backgroundColor(Theme.chipSoftBg)
    .borderRadius(Theme.radiusSmall)
    .padding({ left: 12, right: 12 })
    .height(40)
    .alignItems(VerticalAlign.Center)
  }
}

@Component
export struct ProgressRing {
  @Prop percent: number;
  @Prop label: string = '';
  @Prop color: string = Theme.brandPrimary;
  @Prop ringSize: number = 72;

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Progress({ value: this.percent, total: 100, type: ProgressType.Ring })
        .width(this.ringSize).height(this.ringSize)
        .style({ strokeWidth: 8 })
        .color(this.color)
        .backgroundColor(Theme.chipSoftBg)
      Column() {
        Text(`${Math.round(this.percent)}%`)
          .fontSize(15).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        if (this.label.length > 0) {
          Text(this.label).fontSize(10).fontColor(Theme.textTertiary).margin({ top: 1 })
        }
      }
    }
    .width(this.ringSize).height(this.ringSize)
  }
}

@Component
export struct MiniBarChart {
  @Prop points: TrendPoint[] = [];
  @Prop heightValue: number = 130;

  build() {
    if (this.points.length === 0) {
      Column() {
        Text('暂无趋势数据').fontSize(13).fontColor(Theme.textTertiary)
      }.width('100%').height(this.heightValue).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
    } else {
      Row() {
        ForEach(this.points, (p: TrendPoint, idx: number) => {
          Column() {
            Stack({ alignContent: Alignment.Bottom }) {
              Column()
                .width(14)
                .height(this.barHeight(p.value))
                .backgroundColor(Theme.brandPrimary)
                .borderRadius(4)
            }
            .height(this.heightValue - 24)
            .width(14)
            .alignContent(Alignment.Bottom)
            Text(p.label)
              .fontSize(9).fontColor(Theme.textTertiary).margin({ top: 4 })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.End)
        }, (p: TrendPoint, idx: number) => `${p.label}-${idx}`)
      }
      .width('100%')
      .height(this.heightValue)
      .alignItems(VerticalAlign.Bottom)
    }
  }

  private barHeight(value: number): number {
    let max = 1;
    for (const p of this.points) {
      if (p.value > max) {
        max = p.value;
      }
    }
    const track = this.heightValue - 24;
    return Math.max(value === 0 ? 2 : 6, (value / max) * track);
  }
}
