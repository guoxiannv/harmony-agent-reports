// ShareCardPage.ets
//
// 分享卡片 (surface: share-card). Aligned to page-share-card.html:
// dark immersive background, a 3:4 dark gradient preview card with a
// hero icon block + dish name + QR placeholder, and a single save action.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { ShareCardData } from '../common/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ShareCardPage {
  onClose: () => void = () => {};
  data: ShareCardData | null = null;
  @State saved: boolean = false;

  build() {
    Column() {
      // top bar (dark)
      Row() {
        Column() {
          SvgIcon({ variant: 'delete', iconSize: 22, strokeWidth: 2 })
        }
        .id('share-card-close-button')
        .width(40)
        .height(40)
        .borderRadius(12)
        .backgroundColor('rgba(255,255,255,0.08)')
        .border({ width: 1, color: 'rgba(255,255,255,0.10)' })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.onClose())

        Text('分享卡片')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Column().width(40)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 48, bottom: 16 })

      // preview area
      Column() {
        this.PreviewCard()
      }
      .layoutWeight(1)
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ left: 20, right: 20 })

      // save action
      Row() {
        Text(this.saved ? '已保存' : '保存到相册')
          .id('share-card-save-button')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .textAlign(TextAlign.Center)
          .width('100%')
          .padding({ top: 14, bottom: 14 })
          .borderRadius(Theme.radiusButton)
          .linearGradient(this.saved ? BrandGradient.thumbTeal : BrandGradient.brand)
          .shadow({ radius: 24, color: 'rgba(255,107,53,0.32)', offsetY: 8 })
          .onClick(() => this.save())
      }
      .width('100%')
      .padding({ left: 20, right: 20, bottom: 32 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.wheelBg)
  }

  @Builder
  PreviewCard() {
    Column() {
      // header
      Column() {
        Text(this.headerDateLabel())
          .fontSize(13)
          .fontColor('rgba(255,255,255,0.56)')
        Text('今天吃什么？就是它了')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textOnDark)
          .margin({ top: 4 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 24 })

      // hero
      Column() {
        Column() {
          SvgIcon({ variant: 'dish-result', iconSize: 48, strokeWidth: 2 })
        }
        .width(96)
        .height(96)
        .borderRadius(Theme.radiusHero)
        .linearGradient(BrandGradient.brand)
        .shadow({ radius: 32, color: 'rgba(255,107,53,0.28)', offsetY: 12 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 18 })

        Text(this.data !== null ? this.data.dishName : '今天吃什么')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnDark)
          .textAlign(TextAlign.Center)

        Text(this.heroDesc())
          .fontSize(14)
          .fontColor('rgba(255,255,255,0.6)')
          .textAlign(TextAlign.Center)
          .margin({ top: 6 })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .backgroundColor('rgba(255,255,255,0.04)')
      .borderRadius(Theme.radiusCard)
      .margin({ bottom: 24 })

      // footer
      Row() {
        Text('今天吃什么')
          .fontSize(13)
          .fontColor('rgba(255,255,255,0.56)')
        // QR placeholder
        Column() {
          Row() {
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
          }
          Row() {
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
            Column().width(5).height(5).backgroundColor('#1A1A1A').margin(2)
          }
        }
        .width(40)
        .height(40)
        .borderRadius(8)
        .backgroundColor('#FFFFFF')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
    }
    .id('share-card-preview')
    .width('82%')
    .aspectRatio(3 / 4)
    .padding(28)
    .linearGradient(BrandGradient.hero)
    .borderRadius(Theme.radiusHero)
    .shadow({ radius: 64, color: 'rgba(0,0,0,0.4)', offsetY: 24 })
  }

  private headerDateLabel(): string {
    if (this.data !== null && this.data.dateLabel.length > 0) {
      const meal = this.data.mealLabel.length > 0 ? ` · ${this.data.mealLabel}` : '';
      return `${this.data.dateLabel}${meal}`;
    }
    return '';
  }

  private heroDesc(): string {
    if (this.data === null) {
      return '随机决定';
    }
    const tag = this.data.tags.length > 0 ? this.data.tags[0] : '推荐';
    return `${tag} · ${this.data.reason}`;
  }

  private save(): void {
    if (this.saved) {
      return;
    }
    this.saved = true;
    try {
      promptAction.showToast({ message: '已保存到相册', duration: 2000 });
    } catch (e) {
      // toast is best-effort feedback for the MVP save flow
    }
  }
}
