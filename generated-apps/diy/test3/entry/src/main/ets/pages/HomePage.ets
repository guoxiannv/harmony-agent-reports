// HomePage.ets — 首页(对齐 page-home-page.html)
// 品牌 header(含沉睡提醒入口) + 赤陶渐变 hero 卡(积分/连续签到) + 窑火橙圆形签到按钮
// + 快捷入口(预约课程/积分明细) + 最近动态列表(彩色圆点)

import { Theme, BrandGradient } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { DateUtil } from '../services/DateUtil';
import { ActivityItem } from '../model/Models';

@Component
export struct HomePage {
  @Prop @Watch('onRefreshTick') refreshTick: number = 0;
  goToTab: (tab: TabId) => void = () => {};
  goDormant: () => void = () => {};

  @State name: string = '';
  @State balance: number = 0;
  @State streak: number = 0;
  @State lastCheckIn: string = '';
  @State activities: ActivityItem[] = [];
  @State dormantCount: number = 0;
  @State feedback: string = '';

  aboutToAppear(): void {
    this.load();
  }

  onRefreshTick(): void {
    this.load();
  }

  private load(): void {
    const m = DataStore.getCurrentMember();
    this.name = m.name.length > 0 ? m.name : '手作之友';
    this.balance = DataStore.getBalance();
    this.streak = DataStore.getStreak();
    this.lastCheckIn = DataStore.getLastCheckIn();
    this.activities = DataStore.getActivities();
    this.dormantCount = DataStore.getDormantMembers().length;
  }

  private get checkedToday(): boolean {
    return this.lastCheckIn === DateUtil.todayStr();
  }

  private doCheckIn(): void {
    const r = DataStore.checkIn();
    this.feedback = r.message;
    this.load();
    setTimeout(() => { this.feedback = ''; }, 2600);
  }

  // 动态圆点颜色: +积分为绿, -/库存为红, 其余黄
  private dotColor(sub: string): string {
    if (sub.startsWith('+')) { return Theme.green; }
    if (sub.startsWith('-') || sub.indexOf('不足') >= 0) { return Theme.red; }
    return Theme.yellow;
  }

  build() {
    Column() {
      // 品牌 header
      Row() {
        Text('手作·印记')
          .fontSize(34)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.clay)
          .fontFamily('MaShan')
        Blank()
        Row() {
          SvgIcon({ variant: 'bell', iconSize: 20 })
        }
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Theme.cardLight)
        .border({ width: 1, color: Theme.borderDefault })
        .justifyContent(FlexAlign.Center)
        .id('home-dormant-alert')
        .onClick(() => this.goDormant())
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 16 })
      .alignItems(VerticalAlign.Center)

      Scroll() {
        Column() {
          // hero 卡(赤陶渐变)
          Column() {
            Text(this.greeting())
              .fontSize(15)
              .fontColor(Theme.textOnClay)
              .opacity(0.92)
            Text(this.name)
              .fontSize(28)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnClay)
              .fontFamily('MaShan')
              .margin({ top: 2, bottom: 20 })

            Row() {
              Column() {
                Text(`${this.balance}`)
                  .fontSize(32)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textOnClay)
                Text('积分余额')
                  .fontSize(12)
                  .fontColor(Theme.textOnClay)
                  .opacity(0.85)
                  .margin({ top: 6 })
              }
              .layoutWeight(1)
              .padding(16)
              .backgroundColor('rgba(255,255,255,0.16)')
              .borderRadius(18)
              .id('home-points-balance')

              Column() {
                Text(`${this.streak}`)
                  .fontSize(32)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textOnClay)
                Text('连续签到')
                  .fontSize(12)
                  .fontColor(Theme.textOnClay)
                  .opacity(0.85)
                  .margin({ top: 6 })
              }
              .layoutWeight(1)
              .padding(16)
              .backgroundColor('rgba(255,255,255,0.16)')
              .borderRadius(18)
              .margin({ left: 16 })
              .id('home-streak-days')
            }
            .width('100%')
          }
          .width('100%')
          .padding(24)
          .borderRadius(Theme.radiusHero)
          .linearGradient(BrandGradient.clay)
          .shadow({ radius: 28, color: 'rgba(166,93,72,0.28)', offsetY: 10 })
          .margin({ left: 20, right: 20 })

          // 签到(窑火橙大圆形)
          Column() {
            Column() {
              SvgIcon({ variant: 'checkin', iconSize: 28 })
              Text(this.checkedToday ? '已签到' : '签到')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnClay)
                .margin({ top: 6 })
            }
            .width(120)
            .height(120)
            .borderRadius(60)
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.checkedToday ? Theme.cardBg : Theme.fire)
            .linearGradient(this.checkedToday ? BrandGradient.paper : BrandGradient.fire)
            .shadow({ radius: 24, color: 'rgba(229,122,57,0.36)', offsetY: 8 })
            .opacity(this.checkedToday ? 0.7 : 1.0)
            .id('home-checkin-button')
            .onClick(() => { if (!this.checkedToday) this.doCheckIn(); })

            Text(this.feedback.length > 0
              ? this.feedback
              : (this.checkedToday ? '今日已签到，明天继续' : '连续签到 7 天可获双倍积分'))
              .fontSize(13)
              .fontColor(this.feedback.length > 0
                ? (this.feedback.startsWith('签到成功') ? Theme.green : Theme.warningText)
                : Theme.textSecondary)
              .margin({ top: 12 })
          }
          .width('100%')
          .padding({ top: 24, bottom: 24 })
          .alignItems(HorizontalAlign.Center)

          // 快捷入口
          Text('快捷入口')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, bottom: 12 })

          Row() {
            this.ActionTile('预约课程', '查看本周可约', 'book-class', 'tab-classes')
            this.ActionTile('积分明细', '消费与签到', 'points-detail', 'tab-points')
          }
          .width('100%')
          .padding({ left: 20, right: 20 })
          .justifyContent(FlexAlign.SpaceBetween)

          // 最近动态
          Text('最近动态')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 12 })

          if (this.activities.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-activity', title: '还没有动态', hint: '去签个到，留下今天的手作印记吧～' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('home-empty-state')
          } else {
            Column() {
              ForEach(this.activities.slice(0, 6), (a: ActivityItem) => {
                Row() {
                  Circle({ width: 8, height: 8 })
                    .fill(this.dotColor(a.subtitle))
                  Column() {
                    Text(a.title)
                      .fontSize(15)
                      .fontColor(Theme.textPrimary)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .layoutWeight(1)
                  }
                  .layoutWeight(1)
                  .margin({ left: 12 })
                  .alignItems(HorizontalAlign.Start)
                  Text(this.relativeDay(a.date))
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .width('100%')
                .padding({ top: 14, bottom: 14 })
                .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
                .alignItems(VerticalAlign.Center)
                .id(`home-activity-${a.id}`)
              }, (a: ActivityItem) => a.id)
            }
            .width('100%')
            .padding({ left: 18, right: 18 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
            .margin({ left: 20, right: 20 })
            .id('home-recent-list')
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
  ActionTile(title: string, desc: string, icon: string, tab: TabId) {
    Column() {
      Row() {
        SvgIcon({ variant: icon, iconSize: 22 })
      }
      .width(44)
      .height(44)
      .borderRadius(14)
      .backgroundColor(Theme.sand)
      .justifyContent(FlexAlign.Center)
      Text(title)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .margin({ top: 10 })
      Text(desc)
        .fontSize(12)
        .fontColor(Theme.textTertiary)
        .margin({ top: 4 })
    }
    .layoutWeight(1)
    .padding(18)
    .margin({ left: tab === 'tab-points' ? 7 : 0, right: tab === 'tab-classes' ? 7 : 0 })
    .backgroundColor(Theme.cardLight)
    .borderRadius(20)
    .border({ width: 1, color: Theme.borderDefault })
    .alignItems(HorizontalAlign.Center)
    .id(tab)
    .onClick(() => this.goToTab(tab))
  }

  private greeting(): string {
    const h = new Date().getHours();
    if (h < 6) return '夜深了，记得早些休息';
    if (h < 12) return '早安，欢迎来到工坊';
    if (h < 18) return '下午好，欢迎来到工坊';
    return '晚上好，欢迎来到工坊';
  }

  private relativeDay(dateStr: string): string {
    const diff = DateUtil.daysSince(dateStr);
    if (diff === 0) return '今天';
    if (diff === 1) return '昨天';
    return `${diff}天前`;
  }
}
