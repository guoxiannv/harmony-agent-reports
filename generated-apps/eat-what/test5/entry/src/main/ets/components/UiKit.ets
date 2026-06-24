// UiKit.ets
// Reusable presentational components shared across pages.
// GradientButton, SelectableChip (text-only; chip icons are stroke-mode rawfile SVGs whose
// colors are baked and must not be tinted per the SVG gate, so chips use the design's
// dark-active text style), EmptyState.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';

@Component
export struct GradientButton {
  @Prop label: string = '';
  @Prop fullWidth: boolean = true;
  onTap: () => void = () => {};

  build() {
    Text(this.label)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.white)
      .textAlign(TextAlign.Center)
      .padding({ left: 24, right: 24, top: 15, bottom: 15 })
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.orange)
      .width(this.fullWidth ? '100%' : undefined)
      .onClick(() => this.onTap())
  }
}

@Component
export struct SecondaryButton {
  @Prop label: string = '';
  onTap: () => void = () => {};

  build() {
    Text(this.label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .textAlign(TextAlign.Center)
      .padding({ left: 20, right: 20, top: 15, bottom: 15 })
      .borderRadius(Theme.radiusButton)
      .backgroundColor(Theme.paper)
      .border({ width: 1.5, color: Theme.border })
      .onClick(() => this.onTap())
  }
}

@Component
export struct SelectableChip {
  @Prop label: string = '';
  @Prop selected: boolean = false;
  onTap: () => void = () => {};

  build() {
    Text(this.label)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.selected ? Theme.white : Theme.warmGray)
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })
      .borderRadius(Theme.radiusChip)
      .backgroundColor(this.selected ? Theme.dark : Theme.lightGray)
      .onClick(() => this.onTap())
  }
}

@Component
export struct EmptyState {
  @Prop title: string = '';
  @Prop desc: string = '';
  @Prop iconVariant: string = 'filter';

  build() {
    Column() {
      Row() {
        SvgIcon({ variant: this.iconVariant, iconSize: 36 })
      }
      .width(80)
      .height(80)
      .borderRadius(40)
      .backgroundColor(Theme.lightGray)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 16 })

      Text(this.title)
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })
      Text(this.desc)
        .fontSize(14)
        .fontColor(Theme.warmGray)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .padding({ top: 40, bottom: 40, left: 20, right: 20 })
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct SectionTitle {
  @Prop text: string = '';

  build() {
    Text(this.text)
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.textPrimary)
      .margin({ top: 4, bottom: 14 })
  }
}

// White rounded card with the design's soft shadow.
@Component
export struct CardBox {
  build() {
    Column() {
    }
    .width('100%')
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.paper)
    .shadow({ radius: 20, color: 'rgba(46,42,37,0.05)', offsetX: 0, offsetY: 6 })
  }
}

// Home quick-action feature card.
@Component
export struct FeatureCard {
  @Prop icon: string = 'spin';
  @Prop tint: string = '#FFF0E6';
  @Prop title: string = '';
  @Prop desc: string = '';
  @Prop cardId: string = '';
  onTap: () => void = () => {};

  build() {
    Column() {
      Row() {
        SvgIcon({ variant: this.icon, iconSize: 24 })
      }
      .width(48)
      .height(48)
      .borderRadius(Theme.radiusTiny)
      .backgroundColor(this.tint)
      .justifyContent(FlexAlign.Center)

      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ top: 10 })
      Text(this.desc)
        .fontSize(12)
        .fontColor(Theme.warmGray)
        .margin({ top: 4 })
    }
    .id(this.cardId)
    .layoutWeight(1)
    .padding(18)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.paper)
    .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
    .alignItems(HorizontalAlign.Start)
    .margin({ right: 12 })
    .onClick(() => this.onTap())
  }
}
