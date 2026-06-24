// Reusable UI widgets for 手作·印记. Plain @Component structs (safe to chain
// universal attributes on, no @BuilderParam). Names avoid reserved attrs.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct PrimaryButton {
  @Prop label: string = '';
  @Prop iconVariant: string = '';
  @Prop isEnabled: boolean = true;
  onTap: () => void = () => {};

  build() {
    Row() {
      if (this.iconVariant.length > 0) {
        SvgIcon({ variant: this.iconVariant, iconSize: 18 })
          .margin({ right: 6 })
      }
      Text(this.label)
        .fontSize(Theme.fontBody)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textOnBrand)
    }
    .padding({ left: 28, right: 28, top: 14, bottom: 14 })
    .borderRadius(Theme.radiusButton)
    .linearGradient(BrandGradient.primary)
    .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
    .opacity(this.isEnabled ? 1 : 0.5)
    .onClick(() => { if (this.isEnabled) { this.onTap(); } })
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}

@Component
export struct SecondaryButton {
  @Prop label: string = '';
  @Prop iconVariant: string = '';
  onTap: () => void = () => {};

  build() {
    Row() {
      if (this.iconVariant.length > 0) {
        SvgIcon({ variant: this.iconVariant, iconSize: 18 })
          .margin({ right: 6 })
      }
      Text(this.label)
        .fontSize(Theme.fontBody)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.brandPrimary)
    }
    .padding({ left: 28, right: 28, top: 13, bottom: 13 })
    .borderRadius(Theme.radiusButton)
    .backgroundColor(Color.Transparent)
    .border({ width: 1.5, color: Theme.brandSecondary })
    .onClick(() => this.onTap())
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}

@Component
export struct GhostIconButton {
  @Prop iconVariant: string = '';
  @Prop tint: string = Theme.brandPrimary;
  onTap: () => void = () => {};

  build() {
    Row() {
      SvgIcon({ variant: this.iconVariant, iconSize: 20 })
    }
    .width(40)
    .height(40)
    .borderRadius(Theme.radiusPill)
    .backgroundColor(Theme.pageBg)
    .border({ width: 1, color: Theme.borderSoft })
    .onClick(() => this.onTap())
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
  }
}

@Component
export struct Chip {
  @Prop label: string = '';
  @Prop kind: string = 'soft'; // soft | sleeping | low | green | blue

  build() {
    Text(this.label)
      .fontSize(Theme.fontCaption)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.textColor())
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .borderRadius(Theme.radiusChip)
      .backgroundColor(this.bgColor())
  }

  private textColor(): string {
    if (this.kind === 'sleeping' || this.kind === 'low') {
      return Theme.tagLowStockText;
    }
    if (this.kind === 'green') {
      return Theme.tagGreenText;
    }
    if (this.kind === 'blue') {
      return Theme.tagBlueText;
    }
    return Theme.brandDark;
  }

  private bgColor(): string {
    if (this.kind === 'sleeping' || this.kind === 'low') {
      return Theme.tagLowStockBg;
    }
    if (this.kind === 'green') {
      return Theme.tagGreenBg;
    }
    if (this.kind === 'blue') {
      return Theme.tagBlueBg;
    }
    return Theme.chipSoftBg;
  }
}

@Component
export struct SectionHeader {
  @Prop text: string = '';
  @Prop iconVariant: string = '';

  build() {
    Row() {
      if (this.iconVariant.length > 0) {
        SvgIcon({ variant: this.iconVariant, iconSize: 22 })
          .margin({ right: 8 })
      }
      Text(this.text)
        .fontSize(Theme.fontSection)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textTitle)
    }
    .alignItems(VerticalAlign.Center)
    .margin({ top: 28, bottom: 14 })
  }
}

@Component
export struct EmptyHint {
  @Prop title: string = '暂无数据';
  @Prop caption: string = '';
  @Prop iconVariant: string = '';

  build() {
    Column() {
      if (this.iconVariant.length > 0) {
        SvgIcon({ variant: this.iconVariant, iconSize: 96 })
          .margin({ bottom: 16 })
      }
      Text(this.title)
        .fontSize(Theme.fontSection)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 8 })
      if (this.caption.length > 0) {
        Text(this.caption)
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
      }
    }
    .width('100%')
    .padding({ top: 40, bottom: 40 })
    .alignItems(HorizontalAlign.Center)
  }
}
