// ShareCardSheet.ets
//
// Bottom-sheet overlay for the share card. Reads shareCardController state
// (preview / feedback) and exposes close + export actions.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { shareCardController } from '../controller/ShareCardController';
import { ShareCardPreview } from '../model/Models';

@Component
export struct ShareCardSheet {
  @State dishName: string = '';
  @State date: string = '';
  @State mealTimeLabel: string = '';
  @State moodLabel: string = '';
  @State note: string = '';
  @State feedback: string = '';

  aboutToAppear(): void {
    shareCardController.onChange = () => {
      this.sync();
    };
    this.sync();
  }

  private sync(): void {
    const p: ShareCardPreview | null = shareCardController.preview;
    if (p !== null) {
      this.dishName = p.dishName;
      this.date = p.date;
      this.mealTimeLabel = p.mealTimeLabel;
      this.moodLabel = p.moodLabel;
      this.note = p.note;
    }
    this.feedback = shareCardController.lastFeedback;
  }

  build() {
    Stack() {
      // Scrim
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor(Theme.scrimBg)
        .onClick(() => shareCardController.close())

      // Sheet
      Column() {
        // Header
        Row() {
          Text('分享卡片')
            .fontSize(21)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
          Row() {
            SvgIcon({ variant: 'close', iconSize: 20 })
          }
          .width(36)
          .height(36)
          .borderRadius(Theme.radiusTiny)
          .backgroundColor(Theme.inputFieldBg)
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .id('share-card-close-button')
          .onClick(() => shareCardController.close())
        }
        .width('100%')
        .margin({ bottom: 20 })

        // Preview card
        Column() {
          Row() {
            Text('今天吃什么')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
              .opacity(0.9)
              .layoutWeight(1)
            SvgIcon({ variant: 'sparkle', iconSize: 28 })
          }
          .width('100%')

          Column() {
            Text('今日美味')
              .fontSize(14)
              .fontColor('#FFFFFF')
              .opacity(0.9)
              .margin({ bottom: 8 })
            Text(this.dishName)
              .fontSize(36)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FFFFFF')
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Start)

          Text(this.footerText())
            .fontSize(13)
            .fontColor('#FFFFFF')
            .opacity(0.85)
            .width('100%')
        }
        .width(280)
        .height(380)
        .padding(28)
        .borderRadius(Theme.radiusHero)
        .linearGradient(BrandGradient.shareCard)
        .shadow({ radius: 44, color: 'rgba(61,43,31,0.18)', offsetX: 0, offsetY: 18 })
        .justifyContent(FlexAlign.SpaceBetween)
        .id('share-card-preview')

        if (this.feedback.length > 0) {
          Text(this.feedback)
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .margin({ top: 16 })
        }

        // Export button
        Row() {
          SvgIcon({ variant: 'export', iconSize: 20 })
            .margin({ right: 8 })
          Text('保存并分享')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .width('100%')
        .height(54)
        .justifyContent(FlexAlign.Center)
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.primary)
        .shadow({ radius: 24, color: 'rgba(255,107,74,0.32)', offsetX: 0, offsetY: 8 })
        .margin({ top: 24 })
        .id('share-card-export-button')
        .onClick(() => {
          shareCardController.export();
        })
      }
      .width('100%')
      .height('92%')
      .padding(22)
      .borderRadius({ topLeft: 28, topRight: 28 })
      .backgroundColor('rgba(255,255,255,0.96)')
      .shadow({ radius: 40, color: 'rgba(61,43,31,0.12)', offsetX: 0, offsetY: -8 })
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Start)
      .position({ x: 0, y: '8%' })
    }
    .width('100%')
    .height('100%')
  }

  private footerText(): string {
    let base: string = `${this.date} · ${this.mealTimeLabel}`;
    if (this.moodLabel.length > 0) {
      base = `${base} · ${this.moodLabel}`;
    }
    return base;
  }
}
