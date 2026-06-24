// 手作·印记 — 课程 / Courses surface (calendar + list + create).
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Course, CourseRow, Booking, KEY_COURSES, KEY_BOOKINGS } from '../common/Models';
import { TimeUtil } from '../common/Util';
import { NavOpen } from './Index';

interface CalCell {
  day: number; // 0 = empty spacer
  ms: number;  // start-of-day ms when day>0
  hasCourse: boolean;
}

@Component
export struct CoursesPage {
  @StorageLink(KEY_COURSES) coursesLink: Course[] = [];
  @StorageLink(KEY_BOOKINGS) bookingsLink: Booking[] = [];
  @State viewMode: string = 'calendar'; // calendar | list
  @State calYear: number = 0;
  @State calMonth: number = 0; // 0-based
  @State selectedDay: number = 0;
  @State showCreate: boolean = false;

  // Create form state.
  @State fTitle: string = '';
  @State fDateMs: number = 0;
  @State fTimeLabel: string = '';
  @State fCapacity: string = '8';
  @State fPrice: string = '0';
  @State fLocation: string = '';

  onOpen: (req: NavOpen) => void = () => {};

  aboutToAppear(): void {
    const now = new Date(TimeUtil.now());
    this.calYear = now.getFullYear();
    this.calMonth = now.getMonth();
    this.selectedDay = now.getDate();
  }

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          Text('课程')
            .fontSize(Theme.fontPageTitle)
            .fontColor(Theme.textTitle)
            .margin({ top: 8, bottom: 4 })
          Text(this.subtitle())
            .fontSize(Theme.fontBody)
            .fontColor(Theme.textMuted)
            .margin({ bottom: 18 })

          Row() {
            this.TogglePill()
            Row() {
              Text('新建')
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.brandPrimary)
                .margin({ left: 4 })
            }
            .id('courses-add-button')
            .onClick(() => this.openCreate())
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)
          .margin({ bottom: 18 })

          if (this.viewMode === 'calendar') {
            this.CalendarCard()
          }
          this.CourseList()
          Column().height(120)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 8 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      Row() {
        SvgIcon({ variant: 'add-fab', iconSize: 26 })
      }
      .width(58)
      .height(58)
      .borderRadius(29)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .margin({ right: Theme.pageHorizontalPadding, bottom: Theme.bottomTabHeight + 26 })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('courses-add-fab')
      .onClick(() => this.openCreate())

      if (this.showCreate) {
        this.CreateOverlay()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  TogglePill() {
    Row() {
      Text('日历')
        .fontSize(Theme.fontBody)
        .fontColor(this.viewMode === 'calendar' ? Theme.brandPrimary : Theme.textMuted)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .borderRadius(Theme.radiusPill)
        .backgroundColor(this.viewMode === 'calendar' ? Theme.cardBg : Color.Transparent)
      Text('列表')
        .fontSize(Theme.fontBody)
        .fontColor(this.viewMode === 'list' ? Theme.brandPrimary : Theme.textMuted)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .borderRadius(Theme.radiusPill)
        .backgroundColor(this.viewMode === 'list' ? Theme.cardBg : Color.Transparent)
    }
    .padding(4)
    .borderRadius(Theme.radiusSmall)
    .backgroundColor(Theme.pageBg)
    .border({ width: 1, color: Theme.borderSoft })
    .id('courses-view-toggle')
    .onClick(() => { this.viewMode = this.viewMode === 'calendar' ? 'list' : 'calendar'; })
  }

  @Builder
  CalendarCard() {
    Column() {
      Row() {
        Text(`${this.calYear}年${this.calMonth + 1}月`)
          .fontSize(Theme.fontCardTitle)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .layoutWeight(1)
        Row() {
          Text('‹')
            .fontSize(20)
            .fontColor(Theme.brandPrimary)
            .padding(6)
            .onClick(() => this.shiftMonth(-1))
          Text('›')
            .fontSize(20)
            .fontColor(Theme.brandPrimary)
            .padding(6)
            .onClick(() => this.shiftMonth(1))
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Grid() {
        ForEach(this.weekHeader(), (w: string) => {
          GridItem() {
            Text(w)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textMuted)
          }
        }, (w: string) => w)
        ForEach(this.calCells(), (cell: CalCell, idx: number) => {
          GridItem() {
            this.CellContent(cell)
          }
          .id(cell.day > 0 ? `courses-cal-day-${cell.day}` : `courses-cal-blank-${idx}`)
        }, (cell: CalCell, idx: number) => `${idx}`)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsGap(6)
      .columnsGap(6)
      .width('100%')
    }
    .width('100%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .margin({ bottom: 14 })
    .id('courses-calendar')
  }

  @Builder
  CellContent(cell: CalCell) {
    if (cell.day > 0) {
      Column() {
        Text(`${cell.day}`)
          .fontSize(Theme.fontCaption)
          .fontColor(this.selectedDay === cell.day ? Theme.textOnBrand : Theme.textTitle)
        if (cell.hasCourse) {
          Circle({ width: 4, height: 4 })
            .fill(this.selectedDay === cell.day ? Theme.textOnBrand : Theme.brandSecondary)
            .margin({ top: 4 })
        }
      }
      .width(40)
      .height(40)
      .borderRadius(Theme.radiusSmall)
      .backgroundColor(this.selectedDay === cell.day ? Theme.brandPrimary : Theme.pageBg)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => { this.selectedDay = cell.day; })
    } else {
      Column().width(40).height(40)
    }
  }

  @Builder
  CourseList() {
    Column() {
      if (this.rows().length === 0) {
        Text(this.viewMode === 'calendar' ? '该日期暂无课程' : '暂无课程')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 22, bottom: 22 })
          .id('courses-empty-state')
      } else {
        ForEach(this.rows(), (c: CourseRow) => {
          Row() {
            Text(c.title.length > 0 ? c.title.charAt(0) : '课')
              .width(36)
              .height(36)
              .borderRadius(18)
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textOnBrand)
              .linearGradient(BrandGradient.primary)
              .textAlign(TextAlign.Center)
            Column() {
              Text(c.title)
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
              Text(`${c.startLabel} ${c.timeLabel} · 余 ${Math.max(c.capacity - c.booked, 0)} 席`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .margin({ left: 14 })
            .alignItems(HorizontalAlign.Start)

            Text(c.isFull ? '已满' : '可预约')
              .fontSize(Theme.fontCaption)
              .fontWeight(FontWeight.Medium)
              .fontColor(c.isFull ? Theme.tagLowStockText : Theme.tagGreenText)
              .backgroundColor(c.isFull ? Theme.tagLowStockBg : Theme.tagGreenBg)
              .padding({ left: 10, right: 10, top: 5, bottom: 5 })
              .borderRadius(Theme.radiusChip)
          }
          .width('100%')
          .padding({ top: 14, bottom: 14 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`courses-item-${c.id}`)
          .onClick(() => this.onOpen({ target: 'course-detail', courseId: c.id }))
        }, (c: CourseRow) => c.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('courses-list')
  }

  @Builder
  CreateOverlay() {
    Column() {
      Scroll() {
        Column() {
          Row() {
            Text('新建课程')
              .fontSize(Theme.fontTopNav)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textTitle)
              .layoutWeight(1)
            Text('关闭')
              .fontSize(Theme.fontBody)
              .fontColor(Theme.brandPrimary)
              .onClick(() => { this.showCreate = false; })
          }
          .width('100%')
          .margin({ bottom: 18 })

          this.FormField('课程名称 *', this.fTitle, '如：陶艺拉坯入门', (v: string) => { this.fTitle = v; })
          this.DateField()
          this.TimeField()
          this.FormField('容量', this.fCapacity, '人数', (v: string) => { this.fCapacity = v; })
          this.FormField('价格（元）', this.fPrice, '0', (v: string) => { this.fPrice = v; })
          this.FormField('地点', this.fLocation, '教室 / 工作台', (v: string) => { this.fLocation = v; })

          Row() {
            Column() {
              Text('取消')
                .fontSize(Theme.fontBody)
                .fontColor(Theme.brandPrimary)
            }
            .layoutWeight(1)
            .height(50)
            .borderRadius(Theme.radiusButton)
            .border({ width: 1.5, color: Theme.brandSecondary })
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .margin({ right: 6 })
            .onClick(() => { this.showCreate = false; })

            Column() {
              Text('创建')
                .fontSize(Theme.fontBody)
                .fontColor(Theme.textOnBrand)
            }
            .layoutWeight(1)
            .height(50)
            .borderRadius(Theme.radiusButton)
            .linearGradient(BrandGradient.primary)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .margin({ left: 6 })
            .onClick(() => this.submitCreate())
          }
          .width('100%')
          .margin({ top: 12 })
          Column().height(40)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  FormField(label: string, value: string, placeholder: string, onChange: (v: string) => void) {
    Column() {
      Text(label)
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      TextInput({ text: value, placeholder: placeholder })
        .width('100%')
        .height(50)
        .padding({ left: 15, right: 15 })
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textTitle)
        .placeholderColor(Theme.textMuted)
        .onChange((v: string) => { onChange(v); })
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  DateField() {
    Column() {
      Text('日期 *')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      Row() {
        Text(this.fDateMs > 0 ? TimeUtil.dateLabel(this.fDateMs) : '选择日期')
          .fontSize(Theme.fontBody)
          .fontColor(this.fDateMs > 0 ? Theme.textTitle : Theme.textMuted)
          .layoutWeight(1)
        SvgIcon({ variant: 'expand', iconSize: 18 })
      }
      .width('100%')
      .height(50)
      .padding({ left: 15, right: 15 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 14 })
      .onClick(() => {
        try {
          DatePickerDialog.show({
            onDateAccept: (date: Date) => {
              const dt = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 14, 0, 0, 0);
              this.fDateMs = dt.getTime();
            },
          });
        } catch (e) {
          Ui.toast('日期选择不可用');
        }
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  TimeField() {
    Column() {
      Text('时间')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      Row() {
        Text(this.fTimeLabel.length > 0 ? this.fTimeLabel : '选择时间')
          .fontSize(Theme.fontBody)
          .fontColor(this.fTimeLabel.length > 0 ? Theme.textTitle : Theme.textMuted)
          .layoutWeight(1)
        SvgIcon({ variant: 'expand', iconSize: 18 })
      }
      .width('100%')
      .height(50)
      .padding({ left: 15, right: 15 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 14 })
      .onClick(() => {
        try {
          TimePickerDialog.show({
            onAccept: (value: TimePickerResult) => {
              const h: number = value.hour;
              const m: number = value.minute;
              this.fTimeLabel = `${h < 10 ? '0' + h : h}:${m < 10 ? '0' + m : m}`;
            },
          });
        } catch (e) {
          Ui.toast('时间选择不可用');
        }
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private subtitle(): string {
    const total = AppStore.get().getCourses().length;
    return `${this.calMonth + 1}月 · 共 ${total} 门课程`;
  }

  private rows(): CourseRow[] {
    if (this.viewMode === 'list') {
      return AppStore.get().courseRows(0);
    }
    // calendar: courses on selected day.
    const d = new Date(this.calYear, this.calMonth, this.selectedDay, 0, 0, 0, 0);
    return AppStore.get().courseRows(d.getTime());
  }

  private weekHeader(): string[] {
    return ['日', '一', '二', '三', '四', '五', '六'];
  }

  private calCells(): CalCell[] {
    const first = new Date(this.calYear, this.calMonth, 1, 0, 0, 0, 0);
    const lead = first.getDay();
    const daysInMonth = new Date(this.calYear, this.calMonth + 1, 0, 0, 0, 0, 0).getDate();
    const courseDays = this.courseDaysInMonth();
    const cells: CalCell[] = [];
    for (let i = 0; i < lead; i++) {
      cells.push({ day: 0, ms: 0, hasCourse: false });
    }
    for (let d = 1; d <= daysInMonth; d++) {
      const ms = new Date(this.calYear, this.calMonth, d, 0, 0, 0, 0).getTime();
      cells.push({ day: d, ms: ms, hasCourse: courseDays.has(ms) });
    }
    return cells;
  }

  private courseDaysInMonth(): Set<number> {
    const set = new Set<number>();
    const list = AppStore.get().getCourses();
    const monthStart = new Date(this.calYear, this.calMonth, 1, 0, 0, 0, 0).getTime();
    const monthEnd = new Date(this.calYear, this.calMonth + 1, 1, 0, 0, 0, 0).getTime();
    for (let i = 0; i < list.length; i++) {
      const s = TimeUtil.startOfDay(list[i].startAt);
      if (s >= monthStart && s < monthEnd) {
        set.add(s);
      }
    }
    return set;
  }

  private shiftMonth(delta: number): void {
    let m = this.calMonth + delta;
    let y = this.calYear;
    if (m < 0) { m = 11; y -= 1; }
    if (m > 11) { m = 0; y += 1; }
    this.calMonth = m;
    this.calYear = y;
  }

  private openCreate(): void {
    this.fTitle = '';
    this.fDateMs = 0;
    this.fTimeLabel = '';
    this.fCapacity = '8';
    this.fPrice = '0';
    this.fLocation = '';
    this.showCreate = true;
  }

  private submitCreate(): void {
    if (this.fTitle.trim().length === 0) {
      Ui.toast('请填写课程名称');
      return;
    }
    if (this.fDateMs <= 0) {
      Ui.toast('请选择日期');
      return;
    }
    const cap = parseInt(this.fCapacity, 10);
    const price = parseFloat(this.fPrice);
    let startAt = this.fDateMs;
    if (this.fTimeLabel.length > 0) {
      const parts = this.fTimeLabel.split(':');
      const hh = parseInt(parts[0], 10);
      const mm = parseInt(parts[1], 10);
      const dt = new Date(this.fDateMs);
      dt.setHours(hh, mm, 0, 0);
      startAt = dt.getTime();
    }
    const res = AppStore.get().saveCourse({
      id: '', title: this.fTitle.trim(), startAt: startAt, durationMin: 90,
      capacity: cap > 0 ? cap : 8, price: isNaN(price) ? 0 : price,
      location: this.fLocation, materials: [], notes: '', createdAt: 0,
    }, '');
    if (res.ok) {
      Ui.toast('已创建课程');
      this.showCreate = false;
    } else {
      Ui.toast(res.message);
    }
  }
}
