import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Course, Material } from '../model/Models';

interface DateChip {
  ts: number;
  dayLabel: string;
  weekdayLabel: string;
  iso: string;
}

@Component
export struct CoursesPage {
  onAddCourse: () => void = () => {};
  onOpenCourse: (id: string) => void = (_id: string) => {};

  @State private controller: AppController | null = null;
  @State private chips: DateChip[] = [];
  @State private selectedTs: number = 0;
  @State private courses: Course[] = [];
  @State private materialsCache: Record<string, Material> = {};
  @State private bookedCountCache: Record<string, number> = {};
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    const todayStart: number = this.startOfDay(Date.now());
    this.chips = this.buildChips(todayStart);
    this.selectedTs = todayStart;
    await this.refresh();
  }

  private startOfDay(ts: number): number {
    const d: Date = new Date(ts);
    d.setHours(0, 0, 0, 0);
    return d.getTime();
  }

  private buildChips(baseStart: number): DateChip[] {
    const weekdayNames: string[] = ['日', '一', '二', '三', '四', '五', '六'];
    const list: DateChip[] = [];
    for (let i = 0; i < 7; i++) {
      const d: Date = new Date(baseStart + i * 24 * 60 * 60 * 1000);
      const mm: string = (d.getMonth() + 1).toString().padStart(2, '0');
      const dd: string = d.getDate().toString().padStart(2, '0');
      list.push({
        ts: this.startOfDay(d.getTime()),
        dayLabel: `${mm}.${dd}`,
        weekdayLabel: weekdayNames[d.getDay()],
        iso: `${d.getFullYear()}-${mm}-${dd}`,
      });
    }
    return list;
  }

  private async refresh(): Promise<void> {
    if (!this.controller) {
      this.isReady = true;
      return;
    }
    const list: Course[] = await this.controller.listCourses(this.selectedTs);
    const materialsCache: Record<string, Material> = this.materialsCache;
    const bookedCache: Record<string, number> = {};
    for (const c of list) {
      for (const ref of c.materials) {
        if (ref.materialId && !materialsCache[ref.materialId]) {
          const m: Material | undefined = await this.controller.getMaterial(ref.materialId);
          if (m) {
            materialsCache[ref.materialId] = m;
          }
        }
      }
      const reservations = await this.controller.listReservationsByCourse(c.id);
      let active = 0;
      for (const r of reservations) {
        if (r.status === 'booked') {
          active += 1;
        }
      }
      bookedCache[c.id] = active;
    }
    this.courses = list;
    this.materialsCache = materialsCache;
    this.bookedCountCache = bookedCache;
    this.isReady = true;
  }

  private onSelectChip(ts: number): void {
    if (ts === this.selectedTs) {
      return;
    }
    this.selectedTs = ts;
    this.refresh();
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mm: string = d.getMinutes().toString().padStart(2, '0');
    return `${hh}:${mm}`;
  }

  private bookedCount(c: Course): number {
    return this.bookedCountCache[c.id] ?? 0;
  }

  private materialSummary(c: Course): string {
    if (!c.materials || c.materials.length === 0) {
      return '无需耗材';
    }
    const names: string[] = [];
    for (const ref of c.materials) {
      const m: Material | undefined = this.materialsCache[ref.materialId];
      const name: string = m && m.name ? m.name : '材料';
      names.push(`${name} ×${ref.quantity}`);
    }
    return names.join('、');
  }

  private isTodayChip(ts: number): boolean {
    return ts === this.startOfDay(Date.now());
  }

  build(): void {
    Column() {
      this.HeaderBar()
      this.DateChipsRow()
      this.CoursesList()
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Bottom,
      colors: [[Theme.pageBgStart, 0.0], [Theme.pageBgMid, 0.55], [Theme.pageBgEnd, 1.0]],
    })
  }

  @Builder
  HeaderBar(): void {
    Row() {
      Text('课程日历')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)

      Column() {
        SvgIcon({ variant: 'add', iconSize: 20 })
      }
      .id('courses-add-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.clay)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow(Theme.shadowButton())
      .onClick(() => this.onAddCourse())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 8, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  DateChipsRow(): void {
    Scroll() {
      Row() {
        ForEach(this.chips, (chip: DateChip) => {
          Column() {
            Text(chip.weekdayLabel)
              .fontSize(11)
              .fontColor(this.selectedTs === chip.ts ? Theme.textLightSecondary : Theme.textSecondary)
              .margin({ bottom: 4 })
            Text(chip.dayLabel)
              .fontSize(15)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.selectedTs === chip.ts ? Theme.textLight : Theme.textPrimary)
              .fontFamily('monospace')
            if (this.isTodayChip(chip.ts)) {
              Text('今天')
                .fontSize(10)
                .fontColor(this.selectedTs === chip.ts ? Theme.textLightSecondary : Theme.clay)
                .margin({ top: 4 })
            }
          }
          .padding({ top: 10, bottom: 10, left: 12, right: 12 })
          .backgroundColor(this.selectedTs === chip.ts ? Theme.darkCardBg : Theme.cardBg)
          .borderRadius(16)
          .border({ width: 1.5, color: this.selectedTs === chip.ts ? Theme.darkCardBg : Theme.borderSoft })
          .shadow(this.selectedTs === chip.ts ? Theme.shadowDarkCard() : Theme.shadowCard())
          .margin({ right: 10 })
          .alignItems(HorizontalAlign.Center)
          .onClick(() => this.onSelectChip(chip.ts))
        }, (chip: DateChip) => chip.iso)
      }
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      .alignItems(VerticalAlign.Center)
    }
    .id('courses-date-picker')
    .width('100%')
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .padding({ top: 8, bottom: 12 })
  }

  @Builder
  CoursesList(): void {
    Scroll() {
      Column() {
        if (this.isReady && this.courses.length === 0) {
          this.EmptyState()
        } else {
          Column() {
            ForEach(this.courses, (c: Course) => {
              this.CourseCard(c)
            }, (c: Course) => c.id)
          }
          .id('courses-list')
          .width('100%')
          .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 140 })
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  @Builder
  CourseCard(c: Course): void {
    Column() {
      Row() {
        Column() {
          SvgIcon({ variant: 'course-pottery', iconSize: 20 })
        }
        .width(44)
        .height(44)
        .borderRadius(14)
        .backgroundColor(Theme.clayLight)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Column() {
          Text(c.title && c.title.length > 0 ? c.title : '未命名课程')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(`${this.formatTime(c.startTime)} 开课`)
            .fontSize(12)
            .fontColor(Theme.textSecondary)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })

        Text(`${this.bookedCount(c)}/${c.capacity}`)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.clay)
          .fontFamily('monospace')
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Row() {
        Text(this.materialSummary(c))
          .fontSize(12)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(`奖励 ${c.rewardPoints} 积分`)
          .fontSize(12)
          .fontColor(Theme.moss)
          .margin({ left: 8 })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ top: 12 })
      .padding({ top: 12 })
      .border({ width: { top: 1.5 }, color: { top: Theme.dashedDivider }, style: { top: BorderStyle.Dashed } })
    }
    .id(`course-card-${c.id}`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 12 })
    .onClick(() => this.onOpenCourse(c.id))
  }

  @Builder
  EmptyState(): void {
    Column() {
      Column() {
        Text('日')
          .fontSize(28)
          .fontColor(Theme.clay)
          .fontFamily('cursive')
      }
      .width(72)
      .height(72)
      .borderRadius(36)
      .backgroundColor(Theme.clayLight)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 14 })

      Text('这一天还没有课程')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })

      Text('点击右上角添加新课，安排手作时光')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .textAlign(TextAlign.Center)
        .lineHeight(20)
    }
    .id('courses-empty-state')
    .width('100%')
    .padding({ top: 56, bottom: 56, left: 24, right: 24 })
    .alignItems(HorizontalAlign.Center)
  }
}
