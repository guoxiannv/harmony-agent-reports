// CheckinPage.ets
// 每日打卡: streak/total stats, month calendar, meal+form, recent history.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionTitle, GradientButton } from '../components/UiKit';
import { Store } from '../services/Store';
import { Checkin } from '../model/Models';
import { MealType, mealLabel } from '../model/Enums';
import { toast } from '../common/Feedback';

interface CalendarCell {
  kind: string; // 'weekday' | 'blank' | 'day'
  label: string;
  day: number;
  dateKey: string;
  checked: boolean;
  isToday: boolean;
}

@Component
export struct CheckinPage {
  pendingDish: string = '';
  onConsumePending: () => void = () => {};
  goShare: (title: string, subtitle: string) => void = () => {};

  @State streak: number = 0;
  @State total: number = 0;
  @State selectedMeal: MealType = 'lunch';
  @State dishName: string = '';
  @State note: string = '';
  @State history: Checkin[] = [];
  @State cells: CalendarCell[] = [];
  @State monthLabel: string = '';

  async aboutToAppear() {
    await Store.ensureLoaded();
    if (this.pendingDish.length > 0) {
      this.dishName = this.pendingDish;
      this.onConsumePending();
    }
    this.refresh();
  }

  private refresh(): void {
    this.streak = Store.streak();
    this.total = Store.totalCheckinDays();
    this.history = Store.recentCheckins(20);
    this.buildCalendar();
  }

  private buildCalendar(): void {
    const now = new Date();
    const year = now.getFullYear();
    const month0 = now.getMonth();
    const today = now.getDate();
    this.monthLabel = year + '年' + (month0 + 1) + '月';
    const checkedKeys = Store.calendarKeys(year, month0);
    const firstDay = new Date(year, month0, 1);
    const firstWeekday = firstDay.getDay(); // 0=Sun
    const daysInMonth = new Date(year, month0 + 1, 0).getDate();
    const weekdays = ['日', '一', '二', '三', '四', '五', '六'];
    const list: CalendarCell[] = [];
    for (let i = 0; i < 7; i++) {
      list.push({ kind: 'weekday', label: weekdays[i], day: 0, dateKey: '', checked: false, isToday: false });
    }
    for (let i = 0; i < firstWeekday; i++) {
      list.push({ kind: 'blank', label: '', day: 0, dateKey: '', checked: false, isToday: false });
    }
    for (let d = 1; d <= daysInMonth; d++) {
      const mm = (month0 + 1) < 10 ? '0' + (month0 + 1) : '' + (month0 + 1);
      const dd = d < 10 ? '0' + d : '' + d;
      const key = '' + year + '-' + mm + '-' + dd;
      list.push({
        kind: 'day', label: '' + d, day: d, dateKey: key,
        checked: checkedKeys.has(key), isToday: d === today,
      });
    }
    this.cells = list;
  }

  build() {
    Scroll() {
      Column() {
        // Header
        Row() {
          Text('每日打卡')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
          Row() {
            SvgIcon({ variant: 'share-checkin', iconSize: 22 })
          }
          .id('checkin-share-button')
          .width(44)
          .height(44)
          .borderRadius(Theme.radiusTiny)
          .backgroundColor(Theme.lightGray)
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.goShare(this.dishName.length > 0 ? this.dishName : '今日打卡', '记录美好一餐'))
        }
        .width('100%')
        .margin({ bottom: 24 })

        // Stats card
        Row() {
          Column() {
            Text('' + this.streak)
              .id('checkin-streak-count')
              .fontSize(42)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.white)
              .margin({ bottom: 6 })
            Text('连续打卡')
              .fontSize(13)
              .fontColor(Theme.white)
              .opacity(0.9)
          }
          .layoutWeight(1)
          Column() {
            Text('' + this.total)
              .id('checkin-total-count')
              .fontSize(42)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.white)
              .margin({ bottom: 6 })
            Text('累计打卡')
              .fontSize(13)
              .fontColor(Theme.white)
              .opacity(0.9)
          }
          .layoutWeight(1)
        }
        .width('100%')
        .padding(24)
        .borderRadius(Theme.radiusHero)
        .linearGradient(this.greenGradient())
        .shadow({ radius: 20, color: 'rgba(78,203,156,0.28)' })
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 24 })

        // Calendar card
        Column() {
          Row() {
            Text(this.monthLabel)
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .layoutWeight(1)
            SvgIcon({ variant: 'calendar', iconSize: 20 })
          }
          .width('100%')
          .margin({ bottom: 16 })

          Grid() {
            ForEach(this.cells, (cell: CalendarCell, idx: number) => {
              GridItem() {
                this.CalendarCellView(cell)
              }
            }, (cell: CalendarCell, idx: number) => cell.kind + idx)
          }
          .id('checkin-calendar')
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
          .columnsGap(4)
          .rowsGap(8)
          .width('100%')
        }
        .width('100%')
        .padding(20)
        .borderRadius(22)
        .backgroundColor(Theme.paper)
        .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
        .margin({ bottom: 24 })

        // Form card
        Column() {
          SectionTitle({ text: '记录这一餐' })
          Row({ space: 10 }) {
            this.MealBtn('breakfast', '早餐')
            this.MealBtn('lunch', '午餐')
            this.MealBtn('dinner', '晚餐')
          }
          .width('100%')
          .margin({ bottom: 14 })

          TextInput({ text: this.dishName, placeholder: '今天吃了什么？' })
            .id('checkin-dish-input')
            .width('100%')
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .margin({ bottom: 14 })
            .onChange((v: string) => { this.dishName = v; })

          TextInput({ text: this.note, placeholder: '写点什么...' })
            .id('checkin-note-input')
            .width('100%')
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .margin({ bottom: 14 })
            .onChange((v: string) => { this.note = v; })

          GradientButton({
            label: '保存打卡',
            onTap: () => this.save(),
          })
            .id('checkin-save-button')
            .margin({ bottom: 12 })

          Row({ space: 12 }) {
            Row({ space: 6 }) {
              SvgIcon({ variant: 'save-image', iconSize: 18 })
              Text('保存图片')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textPrimary)
            }
            .layoutWeight(1)
            .justifyContent(FlexAlign.Center)
            .padding({ top: 14, bottom: 14 })
            .borderRadius(Theme.radiusButton)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })

            Row({ space: 6 }) {
              SvgIcon({ variant: 'share-card', iconSize: 18 })
              Text('生成卡片')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textPrimary)
            }
            .layoutWeight(1)
            .justifyContent(FlexAlign.Center)
            .padding({ top: 14, bottom: 14 })
            .borderRadius(Theme.radiusButton)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .onClick(() => this.goShare(this.dishName.length > 0 ? this.dishName : '今日打卡', '记录美好一餐'))
          }
          .width('100%')
        }
        .width('100%')
        .padding(20)
        .borderRadius(22)
        .backgroundColor(Theme.paper)
        .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 24 })

        // History
        SectionTitle({ text: '最近记录' })
        if (this.history.length === 0) {
          Text('还没有记录，快来打卡第一餐')
            .id('checkin-history-empty')
            .fontSize(14)
            .fontColor(Theme.warmGray)
            .width('100%')
            .padding({ top: 16, bottom: 16 })
        } else {
          Column({ space: 12 }) {
            ForEach(this.history, (c: Checkin) => {
              Row() {
                Column() {
                  Text(c.dishName)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.textPrimary)
                    .margin({ bottom: 4 })
                  Text(this.historyMeta(c))
                    .fontSize(13)
                    .fontColor(Theme.warmGray)
                  if (c.note.length > 0) {
                    Text(c.note)
                      .fontSize(13)
                      .fontColor(Theme.sage)
                      .margin({ top: 4 })
                  }
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)

                Text('删除')
                  .fontSize(13)
                  .fontColor(Theme.warmGray)
                  .onClick(() => this.removeHistory(c.id))
              }
              .id('checkin-history-' + c.id)
              .width('100%')
              .padding(16)
              .borderRadius(Theme.radiusCard)
              .backgroundColor(Theme.paper)
              .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
              .alignItems(VerticalAlign.Center)
            }, (c: Checkin) => c.id)
          }
          .id('checkin-history-list')
          .width('100%')
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  private greenGradient(): LinearGradient {
    return {
      angle: 135,
      direction: GradientDirection.RightTop,
      colors: [['#4ECB9C', 0.0], ['#5A6B58', 1.0]],
    } as LinearGradient;
  }

  private historyMeta(c: Checkin): string {
    return c.dateKey.slice(5).replace('-', '/') + ' · ' + mealLabel(c.meal);
  }

  private save(): void {
    const name = this.dishName.trim();
    if (name.length === 0) {
      toast('请输入今天吃了什么');
      return;
    }
    const key = this.todayKey();
    Store.addCheckin(key, this.selectedMeal, name, this.note.trim());
    this.dishName = '';
    this.note = '';
    this.refresh();
    toast('打卡成功');
  }

  private removeHistory(id: string): void {
    Store.removeCheckin(id);
    this.refresh();
  }

  private todayKey(): string {
    const d = new Date();
    const y = d.getFullYear();
    const m = d.getMonth() + 1;
    const day = d.getDate();
    const mm = m < 10 ? '0' + m : '' + m;
    const dd = day < 10 ? '0' + day : '' + day;
    return '' + y + '-' + mm + '-' + dd;
  }

  @Builder
  MealBtn(meal: MealType, label: string) {
    Text(label)
      .id('checkin-meal-' + meal)
      .layoutWeight(1)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.selectedMeal === meal ? Theme.white : Theme.warmGray)
      .textAlign(TextAlign.Center)
      .padding({ top: 14, bottom: 14 })
      .borderRadius(Theme.radiusSmall)
      .backgroundColor(this.selectedMeal === meal ? Theme.dark : Theme.lightGray)
      .onClick(() => { this.selectedMeal = meal; })
  }

  @Builder
  CalendarCellView(cell: CalendarCell) {
    if (cell.kind === 'weekday') {
      Text(cell.label)
        .fontSize(12)
        .fontColor(Theme.warmGray)
        .textAlign(TextAlign.Center)
        .width('100%')
        .padding({ top: 4, bottom: 4 })
    } else if (cell.kind === 'blank') {
      Text('')
        .width(34)
        .height(34)
    } else {
      Text(cell.label)
        .width(34)
        .height(34)
        .borderRadius(17)
        .fontSize(14)
        .fontWeight(cell.isToday ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(cell.checked ? Theme.white : (cell.isToday ? Theme.green : Theme.textPrimary))
        .textAlign(TextAlign.Center)
        .backgroundColor(cell.checked ? Theme.green : 'rgba(0,0,0,0)')
        .border({ width: cell.isToday && !cell.checked ? 2 : 0, color: Theme.green })
    }
  }
}
