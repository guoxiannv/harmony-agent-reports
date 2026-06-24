import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController, TodayCounts } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Course, Member, PointsRecord } from '../model/Models';

@Component
export struct HomePage {
  onQuickCheckIn: () => void = () => {};
  onOpenSleeping: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private greeting: string = '早上好，主理人';
  @State private todayClassesCount: number = 0;
  @State private todayReservationsCount: number = 0;
  @State private sleepingCount: number = 0;
  @State private todayCourses: Course[] = [];
  @State private recentPoints: PointsRecord[] = [];
  @State private memberCache: Record<string, Member> = {};
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    const today: TodayCounts = await controller.todayCounts();
    const sleepingCount: number = await controller.sleepingCount();
    const todayCourses: Course[] = await controller.listCourses(Date.now());
    const recentPoints: PointsRecord[] = await controller.listPointsHistory(undefined, 5);

    const cache: Record<string, Member> = {};
    for (const rec of recentPoints) {
      const mid = rec.memberId ?? '';
      if (mid && !cache[mid]) {
        const m = await controller.getMember(mid);
        if (m) {
          cache[mid] = m;
        }
      }
    }

    this.greeting = this.greetingText();
    this.todayClassesCount = today.classes;
    this.todayReservationsCount = today.reservations;
    this.sleepingCount = sleepingCount;
    this.todayCourses = todayCourses;
    this.recentPoints = recentPoints;
    this.memberCache = cache;
    this.isReady = true;
  }

  private greetingText(): string {
    const h: number = new Date().getHours();
    if (h < 6) {
      return '凌晨好，主理人';
    } else if (h < 12) {
      return '早上好，主理人';
    } else if (h < 14) {
      return '中午好，主理人';
    } else if (h < 18) {
      return '下午好，主理人';
    }
    return '晚上好，主理人';
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mm: string = d.getMinutes().toString().padStart(2, '0');
    return `${hh}:${mm}`;
  }

  private memberInitial(member: Member | undefined): string {
    if (!member || !member.name) {
      return '?';
    }
    return member.name.charAt(0);
  }

  private memberName(member: Member | undefined, fallback: string): string {
    return member && member.name ? member.name : fallback;
  }

  private pointLabel(rec: PointsRecord): string {
    const mid = rec.memberId ?? '';
    const member: Member | undefined = mid ? this.memberCache[mid] : undefined;
    const name = this.memberName(member, '会员');
    let action = '';
    if (rec.type === 'check-in') {
      action = '签到';
    } else if (rec.type === 'course') {
      action = '完成课程';
    } else if (rec.type === 'spend') {
      action = '消费';
    } else if (rec.type === 'redeem') {
      action = '兑换';
    } else if (rec.type === 'wake') {
      action = '唤醒礼遇';
    } else {
      action = rec.description ?? '积分变动';
    }
    return `${name} ${action}`;
  }

  private pointValueText(rec: PointsRecord): string {
    const sign = rec.value >= 0 ? '+' : '';
    return `${sign}${rec.value}`;
  }

  private courseTimeText(c: Course): string {
    const hh: string = new Date(c.startTime).getHours().toString().padStart(2, '0');
    const mm: string = new Date(c.startTime).getMinutes().toString().padStart(2, '0');
    return `${hh}:${mm}`;
  }

  private sleepingThreshold(): number {
    return this.controller && this.controller.settings ? this.controller.settings.sleepThresholdDays : 45;
  }

  private courseIcon(c: Course): string {
    const title: string = c.title;
    if (title.includes('木')) {
      return 'course-woodwork';
    }
    return 'course-pottery';
  }

  build(): void {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          this.HeroSection()
          this.QuickGrid()
          this.SleepingReminderCard()
          this.TodayCoursesSection()
          this.PointsActivitySection()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ bottom: 140 })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)

      this.FabButton()
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
  HeroSection(): void {
    Column() {
      Text(this.greeting)
        .fontSize(14)
        .fontColor(Theme.textSecondary)
        .margin({ bottom: 4 })

      Text('手作·印记')
        .fontSize(44)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .fontFamily('cursive')
        .margin({ top: 0, bottom: 8 })
        .rotate({ x: 0, y: 0, z: 1, angle: -1 })

      Text('今日也用心，记住每一位客人')
        .fontSize(14)
        .fontColor(Theme.textSecondary)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ top: 48, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 12 })
  }

  @Builder
  QuickGrid(): void {
    Row() {
      Column() {
        Text('今日课程')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
        Text(this.isReady ? this.todayClassesCount.toString() : '–')
          .id('home-today-classes-count')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .fontFamily('monospace')
          .alignSelf(ItemAlign.Start)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding(16)
      .backgroundColor(Theme.cardBgGlass)
      .border({ width: 1, color: Theme.borderSoft })
      .borderRadius(20)
      .shadow(Theme.shadowCard())

      Column() {
        Text('待处理预约')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
        Text(this.isReady ? this.todayReservationsCount.toString() : '–')
          .id('home-today-reservations-count')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .fontFamily('monospace')
          .alignSelf(ItemAlign.Start)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding(16)
      .backgroundColor(Theme.cardBgGlass)
      .border({ width: 1, color: Theme.borderSoft })
      .borderRadius(20)
      .shadow(Theme.shadowCard())
      .margin({ left: 12 })
    }
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 4 })
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  SleepingReminderCard(): void {
    Column() {
      Row() {
        SvgIcon({ variant: 'sleeping-reminder', iconSize: 20 })
          .margin({ right: 10 })
        Text('沉睡会员提醒')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textLight)
      }
      .alignItems(VerticalAlign.Center)

      Text(this.isReady ? this.sleepingCount.toString() : '–')
        .id('home-sleeping-count')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.ochre)
        .fontFamily('monospace')
        .margin({ top: 12, bottom: 4 })

      Text(`位会员已超过 ${this.sleepingThreshold()} 天未到店`)
        .fontSize(13)
        .fontColor(Theme.textLightSecondary)

      Text('去唤醒')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .padding({ left: 18, right: 18, top: 10, bottom: 10 })
        .backgroundColor(Theme.ochre)
        .borderRadius(14)
        .margin({ top: 14 })
    }
    .id('home-sleeping-reminder-card')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(18)
    .backgroundColor(Theme.darkCardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowDarkCard())
    .margin({ top: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .onClick(() => this.onOpenSleeping())
  }

  @Builder
  SectionTitle(title: string): void {
    Row() {
      Column()
        .width(8)
        .height(8)
        .borderRadius(4)
        .backgroundColor(Theme.clay)
        .margin({ right: 8 })
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
    }
    .alignItems(VerticalAlign.Center)
    .margin({ top: 24, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  TodayCoursesSection(): void {
    Column() {
      this.SectionTitle('今日预约')

      Column() {
        if (!this.isReady || this.todayCourses.length === 0) {
          Row() {
            Column() {
              Text('—')
                .fontSize(14)
                .fontColor(Theme.clay)
            }
            .width(40)
            .height(40)
            .borderRadius(12)
            .backgroundColor(Theme.clayLight)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)

            Column() {
              Text('今日暂无课程')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
              Text('去课程日历添加新课')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textPrimary)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 12 })
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
          .padding({ top: 12, bottom: 12 })
        } else {
          ForEach(this.todayCourses, (c: Course, idx: number) => {
            Row() {
              Column() {
                SvgIcon({
                  variant: this.courseIcon(c),
                  iconSize: 20,
                })
              }
              .width(40)
              .height(40)
              .borderRadius(12)
              .backgroundColor(Theme.clayLight)
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)

              Column() {
                Text(`${this.courseTimeText(c)} · ${c.title}`)
                  .fontSize(13)
                  .fontColor(Theme.textSecondary)
                Text(`限 ${c.capacity} 人 · 奖励 ${c.rewardPoints} 积分`)
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.textPrimary)
                  .margin({ top: 2 })
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .margin({ left: 12 })
            }
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .padding({ top: 12, bottom: 12 })
            .border(idx < this.todayCourses.length - 1
              ? { width: { bottom: 1.5 }, color: { bottom: Theme.dashedDivider }, style: { bottom: BorderStyle.Dashed } }
              : { width: 0 })
          }, (c: Course) => c.id)
        }
      }
      .width('100%')
      .padding(18)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  PointsActivitySection(): void {
    Column() {
      this.SectionTitle('积分动态')

      Column() {
        Text('最近积分变动')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 12 })
          .alignSelf(ItemAlign.Start)

        if (!this.isReady || this.recentPoints.length === 0) {
          Text('暂无积分动态')
            .id('home-points-empty')
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .padding({ top: 24, bottom: 24 })
            .width('100%')
            .textAlign(TextAlign.Center)
        } else {
          Column() {
            ForEach(this.recentPoints, (rec: PointsRecord) => {
              Row() {
                Row() {
                  Text(this.memberInitial(rec.memberId ? this.memberCache[rec.memberId] : undefined))
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.clay)
                }
                .width(36)
                .height(36)
                .borderRadius(18)
                .backgroundColor('rgba(184, 131, 99, 0.18)')
                .justifyContent(FlexAlign.Center)
                .alignItems(VerticalAlign.Center)

                Column() {
                  Text(this.pointLabel(rec))
                    .fontSize(14)
                    .fontColor(Theme.textPrimary)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  Text(this.formatTime(rec.createdAt))
                    .fontSize(11)
                    .fontColor(Theme.textSecondary)
                    .margin({ top: 2 })
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
                .margin({ left: 10 })

                Text(this.pointValueText(rec))
                  .id(`home-points-item-${rec.id}`)
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(rec.value >= 0 ? Theme.moss : Theme.ochre)
                  .fontFamily('monospace')
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)
              .padding(12)
              .backgroundColor('rgba(184, 131, 99, 0.06)')
              .borderRadius(14)
              .margin({ bottom: 10 })
            }, (rec: PointsRecord) => rec.id)
          }
          .id('home-points-activity-list')
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
      }
      .width('100%')
      .padding(18)
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .shadow(Theme.shadowCard())
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FabButton(): void {
    Column() {
      SvgIcon({ variant: 'check-in-fab', iconSize: 24 })
    }
    .id('home-quick-check-in-button')
    .width(56)
    .height(56)
    .borderRadius(28)
    .backgroundColor(Theme.darkCardBg)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .shadow(Theme.shadowFAB())
    .margin({ right: Theme.pageHorizontalPadding + 8, bottom: Theme.bottomTabHeight + 16 })
    .onClick(() => this.onQuickCheckIn())
  }
}
