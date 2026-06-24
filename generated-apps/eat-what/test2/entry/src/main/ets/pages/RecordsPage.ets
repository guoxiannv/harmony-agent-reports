// RecordsPage.ets
//
// 饮食打卡 (surface: records, tab). No HTML artifact yet; implemented in the
// established visual language. Month calendar with record dots + a records
// list with per-record share + a floating add button.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { DishRecord, MealType, ShareCardData, mealLabelOf } from '../common/Models';
import { recordStore } from '../services/AppServices';
import { ShareCardBuilder } from '../services/ShareCardBuilder';
import { DateUtil } from '../common/DateUtil';

const WEEKDAY_HEADERS: string[] = ['日', '一', '二', '三', '四', '五', '六'];

function mealThumbGradient(meal: MealType): LinearGradient {
  if (meal === 'breakfast') {
    return BrandGradient.thumbGold;
  } else if (meal === 'dinner' || meal === 'lateNight') {
    return BrandGradient.thumbPink;
  }
  return BrandGradient.thumbTeal;
}

@Component
export struct RecordsPage {
  openAddRecord: () => void = () => {};
  openShare: (data: ShareCardData) => void = () => {};

  @State viewYear: number = 2026;
  @State viewMonth: number = 0; // 0-based
  @State records: DishRecord[] = [];
  @State dayCounts: Map<string, number> = new Map<string, number>();
  @State selectedDay: string = '';

  aboutToAppear(): void {
    const now = new Date();
    this.viewYear = now.getFullYear();
    this.viewMonth = now.getMonth();
    this.refresh();
  }

  private async refresh(): Promise<void> {
    try {
      this.records = await recordStore.list();
      const ym = `${this.viewYear}${DateUtil.pad2(this.viewMonth + 1)}`;
      this.dayCounts = await recordStore.calendarForMonth(ym);
    } catch (e) {
      this.records = [];
      this.dayCounts = new Map<string, number>();
    }
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // header
        Column() {
          Text('饮食打卡')
            .id('records-title')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 6 })
          Text('记录每一餐，看见自己的饮食习惯')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 16 })

        Scroll() {
          Column() {
            this.CalendarCard()

            // records list
            Row() {
              Text('打卡记录')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Blank()
              Text(this.selectedDay !== ''
                ? `${DateUtil.formatChinese(this.selectedDayKey())}`
                : `共 ${this.records.length} 条`)
                .fontSize(13)
                .fontColor(Theme.textTertiary)
            }
            .width('100%')
            .margin({ top: 8, bottom: 12 })

            if (this.visibleRecords().length === 0) {
              this.EmptyState()
            } else {
              Column() {
                ForEach(this.visibleRecords(), (rec: DishRecord) => {
                  this.RecordItem(rec)
                }, (rec: DishRecord) => rec.id)
              }
              .id('records-list')
              .width('100%')
              .padding(18)
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusCard)
              .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
            }
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 16 })
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)
      }
      .width('100%')
      .height('100%')

      // floating add
      Column() {
        SvgIcon({ variant: 'add-record', iconSize: 24, strokeWidth: 2.5 })
      }
      .id('records-add-button')
      .width(52)
      .height(52)
      .borderRadius(26)
      .linearGradient(BrandGradient.brand)
      .shadow({ radius: 24, color: 'rgba(255,107,53,0.32)', offsetY: 8 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .position({ x: '78%', y: '82%' })
      .onClick(() => this.openAddRecord())
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  CalendarCard() {
    Column() {
      Row() {
        Text('‹')
          .fontSize(22)
          .fontColor(Theme.textSecondary)
          .padding(8)
          .onClick(() => this.shiftMonth(-1))
        Text(`${this.viewYear}年${this.viewMonth + 1}月`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('›')
          .fontSize(22)
          .fontColor(Theme.textSecondary)
          .padding(8)
          .onClick(() => this.shiftMonth(1))
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Grid() {
        ForEach(WEEKDAY_HEADERS, (h: string) => {
          GridItem() {
            Text(h)
              .fontSize(12)
              .fontColor(Theme.textTertiary)
              .textAlign(TextAlign.Center)
              .width('100%')
          }
        }, (h: string) => `hd-${h}`)
        ForEach(this.calendarCells(), (cell: string) => {
          GridItem() {
            this.DayCell(cell)
          }
        }, (cell: string, idx: number) => `cell-${idx}-${cell}`)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .columnsGap(0)
      .rowsGap(4)
      .width('100%')
      .height(220)
      .margin({ bottom: 4 })
    }
    .id('records-calendar')
    .width('100%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
  }

  @Builder
  DayCell(cell: string) {
    Column() {
      Text(cell)
        .fontSize(14)
        .fontColor(this.isToday(cell) ? Theme.brandPrimary : Theme.textPrimary)
        .fontWeight(this.isToday(cell) ? FontWeight.Bold : FontWeight.Normal)
      if (this.dayHasRecords(cell)) {
        Circle()
          .width(5)
          .height(5)
          .fill(Theme.brandPrimary)
          .margin({ top: 3 })
      } else {
        Column().width(5).height(5).margin({ top: 3 })
      }
    }
    .width('100%')
    .height(34)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .borderRadius(8)
    .backgroundColor(this.selectedDay === cell ? Theme.brandOrangeSoft : 'rgba(0,0,0,0)')
    .onClick(() => {
      if (cell.length === 0) {
        return;
      }
      this.selectedDay = this.selectedDay === cell ? '' : cell;
    })
  }

  @Builder
  RecordItem(rec: DishRecord) {
    Row() {
      Column() {
        Text(mealLabelOf(rec.meal).substring(0, 1))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnDark)
      }
      .width(48)
      .height(48)
      .borderRadius(Theme.radiusSmall)
      .linearGradient(mealThumbGradient(rec.meal))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(rec.dishName)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 4 })
        Row() {
          Text(`${DateUtil.formatChinese(rec.date)} · ${mealLabelOf(rec.meal)}`)
            .fontSize(12)
            .fontColor(Theme.textTertiary)
          this.RatingDots(rec.rating)
        }
        .alignItems(VerticalAlign.Center)
        if (rec.note.length > 0) {
          Text(rec.note)
            .fontSize(12)
            .fontColor(Theme.textSecondary)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ top: 2 })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 14 })
      .layoutWeight(1)

      Column() {
        SvgIcon({ variant: 'share', iconSize: 18, strokeWidth: 2 })
      }
      .id('record-share-button')
      .width(36)
      .height(36)
      .borderRadius(18)
      .backgroundColor(Theme.tagSoftBg)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.openShare(ShareCardBuilder.fromRecord(rec)))
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(12)
    .margin({ bottom: 12 })
    .borderRadius(16)
    .border({ width: 1, color: Theme.borderCard })
  }

  @Builder
  RatingDots(rating: number) {
    Row() {
      ForEach([1, 2, 3, 4, 5], (n: number) => {
        Circle()
          .width(7)
          .height(7)
          .fill(n <= rating ? Theme.gold : Theme.borderDefault)
          .margin({ left: n === 1 ? 8 : 3 })
      }, (n: number) => `dot-${n}`)
    }
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  EmptyState() {
    Column() {
      SvgIcon({ variant: 'empty-no-recommend', iconSize: 48, strokeWidth: 1.5 })
      Text('还没有打卡记录')
        .fontSize(15)
        .fontColor(Theme.textSecondary)
        .margin({ top: 12, bottom: 6 })
      Text('点击右下角按钮，记录今天的第一餐')
        .fontSize(13)
        .fontColor(Theme.textTertiary)
    }
    .id('records-empty-state')
    .width('100%')
    .padding({ top: 32, bottom: 32, left: 20, right: 20 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
    .alignItems(HorizontalAlign.Center)
  }

  private calendarCells(): string[] {
    const days = new Date(this.viewYear, this.viewMonth + 1, 0).getDate();
    const firstWeekday = new Date(this.viewYear, this.viewMonth, 1).getDay();
    const cells: string[] = [];
    for (let i = 0; i < firstWeekday; i++) {
      cells.push('');
    }
    for (let d = 1; d <= days; d++) {
      cells.push(`${d}`);
    }
    return cells;
  }

  private isToday(cell: string): boolean {
    if (cell.length === 0) {
      return false;
    }
    const today = new Date();
    return this.viewYear === today.getFullYear()
      && this.viewMonth === today.getMonth()
      && cell === `${today.getDate()}`;
  }

  private dayKey(cell: string): string {
    return `${this.viewYear}${DateUtil.pad2(this.viewMonth + 1)}${DateUtil.pad2(parseInt(cell, 10))}`;
  }

  private dayHasRecords(cell: string): boolean {
    if (cell.length === 0) {
      return false;
    }
    const count = this.dayCounts.get(this.dayKey(cell));
    return count !== undefined && count > 0;
  }

  private selectedDayKey(): string {
    if (this.selectedDay.length === 0) {
      return '';
    }
    return this.dayKey(this.selectedDay);
  }

  private visibleRecords(): DishRecord[] {
    if (this.selectedDay.length === 0) {
      return this.records;
    }
    const key = this.selectedDayKey();
    const out: DishRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].date === key) {
        out.push(this.records[i]);
      }
    }
    return out;
  }

  private shiftMonth(delta: number): void {
    let m = this.viewMonth + delta;
    let y = this.viewYear;
    if (m < 0) {
      m = 11;
      y -= 1;
    } else if (m > 11) {
      m = 0;
      y += 1;
    }
    this.viewYear = y;
    this.viewMonth = m;
    this.refresh();
  }
}
