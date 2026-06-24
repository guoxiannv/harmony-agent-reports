// ClassesPage.ets — 课程预约(对齐 page-classes-page.html)
// 月份日历卡(上/下月导航, 有课日期青釉绿小点, 今日窑火橙描边, 选中赤陶棕)
// + 课程卡(左侧时间, 右侧标题/名额/标签/库存不足预警, 预约/取消按钮)

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { DateUtil } from '../services/DateUtil';
import { ClassSlot, OpResult, InventoryItem } from '../model/Models';

@Component
export struct ClassesPage {
  @Prop @Watch('onRefreshTick') refreshTick: number = 0;
  goToTab: (tab: TabId) => void = () => {};
  openDetail: (classId: string) => void = () => {};

  @State cursor: string = '';          // 月份游标 yyyy-MM-01
  @State selectedDate: string = '';
  @State slots: ClassSlot[] = [];
  @State allSlots: ClassSlot[] = [];
  @State inventory: InventoryItem[] = [];
  @State feedback: string = '';

  aboutToAppear(): void {
    const today = DateUtil.todayStr();
    this.selectedDate = today;
    this.cursor = `${today.substring(0, 8)}01`;
    this.allSlots = DataStore.getClasses();
    this.inventory = DataStore.getInventory();
    this.loadSlots();
  }

  onRefreshTick(): void {
    this.allSlots = DataStore.getClasses();
    this.inventory = DataStore.getInventory();
    this.loadSlots();
  }

  private loadSlots(): void {
    this.slots = this.allSlots.filter((c: ClassSlot) => c.date === this.selectedDate);
  }

  private get monthLabel(): string {
    const d = DateUtil.parseStr(this.cursor);
    return `${d.getFullYear()}年${d.getMonth() + 1}月`;
  }

  private shiftMonth(delta: number): void {
    const d = DateUtil.parseStr(this.cursor);
    const n = new Date(d.getFullYear(), d.getMonth() + delta, 1);
    this.cursor = DateUtil.toStr(n);
  }

  private hasClassOn(dateStr: string): boolean {
    return this.allSlots.some((c: ClassSlot) => c.date === dateStr);
  }

  // 当月日期网格(含前后补位)
  private buildDays(): string[] {
    const base = DateUtil.parseStr(this.cursor);
    const year = base.getFullYear();
    const month = base.getMonth();
    const firstDay = new Date(year, month, 1);
    const startWeekday = firstDay.getDay(); // 0 周日
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const daysInPrev = new Date(year, month, 0).getDate();
    const cells: string[] = [];
    for (let i = startWeekday - 1; i >= 0; i--) {
      const d = new Date(year, month - 1, daysInPrev - i);
      cells.push(DateUtil.toStr(d)); // 上月(灰显)
    }
    for (let day = 1; day <= daysInMonth; day++) {
      cells.push(DateUtil.toStr(new Date(year, month, day)));
    }
    while (cells.length % 7 !== 0) {
      const last = DateUtil.parseStr(cells[cells.length - 1]);
      const d = new Date(last.getFullYear(), last.getMonth(), last.getDate() + 1);
      cells.push(DateUtil.toStr(d));
    }
    return cells;
  }

  private isOtherMonth(dateStr: string): boolean {
    return dateStr.substring(0, 7) !== this.cursor.substring(0, 7);
  }

  private invOf(id: string): InventoryItem | null {
    for (const i of this.inventory) {
      if (i.id === id) return i;
    }
    return null;
  }

  private stockWarnText(slot: ClassSlot): string {
    for (const mat of slot.materials) {
      const inv = this.invOf(mat.inventoryItemId);
      if (!inv || inv.quantity < mat.quantityPerSeat) {
        return `${inv ? inv.name : mat.name}库存不足`;
      }
    }
    return '';
  }

  private canBook(slot: ClassSlot): boolean {
    if (slot.booked >= slot.capacity) return false;
    return this.stockWarnText(slot).length === 0;
  }

  private bookBtnText(slot: ClassSlot): string {
    if (slot.booked >= slot.capacity) return '已约满';
    if (this.stockWarnText(slot).length > 0) return '库存不足';
    return '预约';
  }

  private book(slot: ClassSlot): void {
    const r: OpResult = DataStore.bookSlot(slot.id);
    this.feedback = r.message;
    this.allSlots = DataStore.getClasses();
    this.inventory = DataStore.getInventory();
    this.loadSlots();
    setTimeout(() => { this.feedback = ''; }, 2600);
  }

  private cancel(slot: ClassSlot): void {
    const r: OpResult = DataStore.cancelSlot(slot.id);
    this.feedback = r.message;
    this.allSlots = DataStore.getClasses();
    this.inventory = DataStore.getInventory();
    this.loadSlots();
    setTimeout(() => { this.feedback = ''; }, 2600);
  }

  build() {
    Column() {
      Text('课程预约')
        .fontSize(Theme.fontDisplay)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.clay)
        .fontFamily('MaShan')
        .width('100%')
        .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      Scroll() {
        Column() {
          // 日历卡
          Column() {
            Row() {
              Text(this.monthLabel)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
                .layoutWeight(1)
              Row() {
                Row() { SvgIcon({ variant: 'prev-month', iconSize: 16 }) }
                .width(32).height(32).borderRadius(16)
                .backgroundColor(Theme.cardLight).border({ width: 1, color: Theme.borderDefault })
                .justifyContent(FlexAlign.Center)
                .onClick(() => this.shiftMonth(-1))
                Row() { SvgIcon({ variant: 'next-month', iconSize: 16 }) }
                .width(32).height(32).borderRadius(16)
                .backgroundColor(Theme.cardLight).border({ width: 1, color: Theme.borderDefault })
                .justifyContent(FlexAlign.Center)
                .margin({ left: 8 })
                .onClick(() => this.shiftMonth(1))
              }
            }
            .width('100%')
            .margin({ bottom: 14 })

            // 星期表头
            Row() {
              ForEach(['日', '一', '二', '三', '四', '五', '六'], (w: string) => {
                Text(w)
                  .fontSize(12)
                  .fontColor(Theme.textTertiary)
                  .layoutWeight(1)
                  .textAlign(TextAlign.Center)
              }, (w: string) => w)
            }
            .width('100%')
            .margin({ bottom: 8 })

            // 日期网格
            Grid() {
              ForEach(this.buildDays(), (d: string) => {
                GridItem() {
                  this.DayCell(d)
                }
              }, (d: string) => d)
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
            .columnsGap(6)
            .rowsGap(6)
            .height(46 * 6)
          }
          .width('100%')
          .padding(18)
          .backgroundColor(Theme.cardLight)
          .borderRadius(Theme.radiusCard)
          .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
          .margin({ left: 20, right: 20 })
          .id('classes-calendar')

          if (this.feedback.length > 0) {
            Text(this.feedback)
              .fontSize(13)
              .fontColor(this.feedback.indexOf('成功') >= 0 ? Theme.green : Theme.red)
              .width('100%')
              .padding({ left: 20, right: 20, top: 10 })
          }

          Text(`${DateUtil.shortDate(this.selectedDate)} 课程`)
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 20, bottom: 12 })

          if (this.slots.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-classes', title: '当天暂无课程', hint: '换一天看看其他手作体验吧' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('classes-empty-state')
          } else {
            ForEach(this.slots, (slot: ClassSlot) => {
              this.SlotCard(slot)
            }, (slot: ClassSlot) => slot.id)
          }
          Blank().height(12)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  DayCell(d: string) {
    Stack({ alignContent: Alignment.Bottom }) {
      Text(`${DateUtil.parseStr(d).getDate()}`)
        .fontSize(14)
        .fontColor(this.isOtherMonth(d) ? Theme.textTertiary
          : (this.selectedDate === d ? Theme.textOnClay : Theme.textSecondary))
        .textAlign(TextAlign.Center)
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(this.selectedDate === d ? Theme.clay : Color.Transparent)
        .border({
          width: d === DateUtil.todayStr() && this.selectedDate !== d ? 2 : 0,
          color: Theme.fire
        })
        .onClick(() => {
          if (!this.isOtherMonth(d)) {
            this.selectedDate = d;
            this.loadSlots();
          }
        })
      if (this.hasClassOn(d)) {
        Circle({ width: 4, height: 4 })
          .fill(Theme.green)
          .margin({ bottom: 2 })
      }
    }
    .width(40)
    .height(46)
  }

  @Builder
  SlotCard(slot: ClassSlot) {
    Row() {
      // 时间列
      Column() {
        Text(slot.time.split('-')[0])
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.clay)
        Text(this.ampm(slot.time))
          .fontSize(11)
          .fontColor(Theme.textTertiary)
      }
      .width(64)
      .alignItems(HorizontalAlign.Center)

      // 内容列
      Column() {
        Text(slot.title)
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Row() {
          Text(`名额剩余 `)
            .fontSize(13)
            .fontColor(Theme.textSecondary)
          Text(`${slot.booked}/${slot.capacity}`)
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(slot.booked >= slot.capacity ? Theme.red : Theme.textSecondary)
            .id(`classes-slot-${slot.id}-capacity`)
        }
        .margin({ top: 4 })

        // 标签行
        Row() {
          if (this.stockWarnText(slot).length > 0) {
            Row() {
              SvgIcon({ variant: 'stock-warn-tag', iconSize: 12 })
              Text(this.stockWarnText(slot))
                .fontSize(11)
                .fontColor(Theme.red)
                .margin({ left: 4 })
            }
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .backgroundColor(Theme.dangerBg)
            .borderRadius(Theme.radiusChip)
            .id(`classes-slot-${slot.id}-stock-warning`)
          }
          Text(slot.tagLabel)
            .fontSize(11)
            .fontColor(Theme.clay)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .backgroundColor(Theme.sand)
            .borderRadius(Theme.radiusChip)
            .margin({ left: 6 })
        }
        .margin({ top: 10 })
        .alignItems(VerticalAlign.Center)

        Text('查看详情')
          .fontSize(13)
          .fontColor(Theme.clay)
          .margin({ top: 10 })
          .onClick(() => this.openDetail(slot.id))

        // 操作按钮
        Row() {
          Button() {
            Text(this.bookBtnText(slot))
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.canBook(slot) ? Theme.textOnClay : Theme.textTertiary)
          }
          .type(ButtonType.Capsule)
          .height(40)
          .padding({ left: 24, right: 24 })
          .backgroundColor(this.canBook(slot) ? Theme.fire : Theme.cardBg)
          .border({ width: 1, color: this.canBook(slot) ? Color.Transparent : Theme.borderDefault })
          .shadow(this.canBook(slot) ? { radius: 12, color: 'rgba(229,122,57,0.28)', offsetY: 4 } : { radius: 0, color: Color.Transparent })
          .enabled(this.canBook(slot))
          .id(`classes-slot-${slot.id}-book`)
          .onClick(() => this.book(slot))

          Button() {
            Text('取消预约')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.clay)
          }
          .type(ButtonType.Capsule)
          .height(40)
          .padding({ left: 20, right: 20 })
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderDefault })
          .margin({ left: 10 })
          .id(`classes-slot-${slot.id}-cancel`)
          .onClick(() => this.cancel(slot))
        }
        .margin({ top: 12 })
        .alignItems(VerticalAlign.Center)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 14 })
    }
    .width('100%')
    .padding(18)
    .backgroundColor(Theme.cardLight)
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
    .margin({ left: 20, right: 20, bottom: 16 })
    .alignItems(VerticalAlign.Top)
    .id(`classes-slot-${slot.id}`)
  }

  private ampm(time: string): string {
    const h = parseInt(time.split(':')[0], 10);
    return h < 12 ? '上午' : '下午';
  }
}
