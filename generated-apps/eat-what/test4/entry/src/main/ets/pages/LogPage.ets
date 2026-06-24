// LogPage.ets
//
// Daily meal log + history. Mirrors logController. Share triggers
// shareCardController.open(entryId) (Index owns the overlay).

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { logController } from '../controller/LogController';
import { shareCardController } from '../controller/ShareCardController';
import { LogEntry, mealTimeLabel } from '../model/Models';

@Component
export struct LogPage {
  @State entries: LogEntry[] = [];
  @State todayCount: number = 0;

  aboutToAppear(): void {
    logController.onChange = () => {
      this.sync();
    };
    logController.refresh();
  }

  private sync(): void {
    this.entries = logController.entries;
    this.todayCount = logController.todayCount;
  }

  build() {
    Scroll() {
      Column() {
        Text('饮食记录')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 8, bottom: 6 })
          .width('100%')
        Text('记录每一顿，见证今天的小确幸')
          .fontSize(15)
          .fontColor(Theme.textTertiary)
          .margin({ bottom: 24 })
          .width('100%')

        // Summary card
        Column() {
          Text('今天已记录')
            .fontSize(13)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
            .opacity(0.9)
            .width('100%')
          Text(`${this.todayCount}`)
            .fontSize(42)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .margin({ top: 6, bottom: 6 })
            .width('100%')
            .id('log-today-count')
          Text('再记录一顿，好好吃饭呀')
            .fontSize(14)
            .fontColor('#FFFFFF')
            .opacity(0.9)
            .width('100%')
        }
        .width('100%')
        .padding(24)
        .borderRadius(Theme.radiusHero)
        .linearGradient(BrandGradient.summaryCard)
        .shadow({ radius: 32, color: 'rgba(255,107,74,0.28)', offsetX: 0, offsetY: 12 })

        Text('今日时间线')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .margin({ top: 24, bottom: 12 })
          .width('100%')

        if (this.entries.length === 0) {
          Column() {
            Text('今天还没有记录')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .margin({ bottom: 16 })
            Row() {
              Text('去选一顿')
                .fontSize(15)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
            }
            .padding({ left: 24, right: 24, top: 12, bottom: 12 })
            .borderRadius(16)
            .linearGradient(BrandGradient.primary)
          }
          .width('100%')
          .padding({ top: 40, bottom: 40 })
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })
          .alignItems(HorizontalAlign.Center)
          .id('log-empty-state')
        } else {
          Column() {
            ForEach(this.entries, (entry: LogEntry) => {
              this.EntryCard(entry)
            }, (entry: LogEntry) => entry.id)
          }
          .width('100%')
          .id('log-entry-list')
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  EntryCard(entry: LogEntry) {
    Row() {
      Text(mealTimeLabel(entry.mealTime))
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.tagText)
        .backgroundColor(Theme.tagBg)
        .borderRadius(Theme.radiusTiny)
        .padding({ left: 10, right: 10, top: 8, bottom: 8 })
        .constraintSize({ minWidth: 44 })
        .textAlign(TextAlign.Center)

      Column() {
        Text(entry.dishName)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        if (entry.note.length > 0) {
          Text(entry.note)
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .margin({ top: 2 })
        }
      }
      .layoutWeight(1)
      .margin({ left: 14, right: 14 })
      .alignItems(HorizontalAlign.Start)

      // Share button
      Row() {
        SvgIcon({ variant: 'share', iconSize: 18 })
      }
      .width(38)
      .height(38)
      .borderRadius(Theme.radiusTiny)
      .backgroundColor(Theme.softButtonBg)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('log-share-button')
      .onClick(() => {
        shareCardController.open(entry.id);
      })
    }
    .width('100%')
    .padding(16)
    .borderRadius(18)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 32, color: 'rgba(61,43,31,0.08)', offsetX: 0, offsetY: 12 })
    .margin({ bottom: 12 })
    .alignItems(VerticalAlign.Center)
    .id(`log-entry-${entry.id}`)
  }
}
