// PointsPage.ets — 积分与消费(对齐 page-points-page.html)
// 砂金米渐变积分卡 + 积分/消费分段器 + 列表(左侧色块图标区分类型)

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { DateUtil } from '../services/DateUtil';
import { PointRecord, ConsumptionRecord } from '../model/Models';

@Component
export struct PointsPage {
  @Prop @Watch('onRefreshTick') refreshTick: number = 0;
  @State segment: number = 0; // 0 积分明细, 1 消费记录
  @State balance: number = 0;
  @State lifetime: number = 0;
  @State points: PointRecord[] = [];
  @State consumption: ConsumptionRecord[] = [];

  aboutToAppear(): void {
    this.load();
  }

  onRefreshTick(): void {
    this.load();
  }

  private load(): void {
    this.balance = DataStore.getBalance();
    this.lifetime = DataStore.getLifetime();
    this.points = DataStore.getPointRecords();
    this.consumption = DataStore.getConsumption();
  }

  private pointIcon(t: string): string {
    if (t === 'checkin') return 'checkin-points';
    if (t === 'book-earn') return 'course-points';
    return 'redeem-points';
  }

  private pointColor(t: string): string {
    if (t === 'checkin') return Theme.green;
    if (t === 'book-earn') return Theme.yellow;
    return Theme.red;
  }

  build() {
    Column() {
      Text('积分与消费')
        .fontSize(Theme.fontDisplay)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.clay)
        .fontFamily('MaShan')
        .width('100%')
        .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      Scroll() {
        Column() {
          // 积分卡(砂金米渐变)
          Column() {
            Row() {
              Text('当前积分')
                .fontSize(13)
                .fontColor(Theme.clay)
              Blank()
              Row() {
                SvgIcon({ variant: 'points-detail', iconSize: 16 })
                Text(`累计 ${this.lifetime}`)
                  .fontSize(12)
                  .fontColor(Theme.clay)
                  .margin({ left: 4 })
              }
            }
            .width('100%')
            Text(`${this.balance}`)
              .fontSize(44)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.clayDeep)
              .margin({ top: 6 })
          }
          .width('100%')
          .padding(22)
          .borderRadius(Theme.radiusHero)
          .linearGradient(BrandGradient.paper)
          .border({ width: 1, color: '#E5D6BC' })
          .shadow({ radius: 24, color: 'rgba(201,158,58,0.18)', offsetY: 8 })
          .margin({ left: 20, right: 20 })
          .id('points-balance')

          // 分段器
          Row() {
            Text('积分明细')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.segment === 0 ? Theme.textOnClay : Theme.clay)
              .layoutWeight(1)
              .textAlign(TextAlign.Center)
              .height(42)
              .backgroundColor(this.segment === 0 ? Theme.clay : Theme.cardLight)
              .borderRadius(Theme.radiusChip)
              .onClick(() => this.segment = 0)
            Text('消费记录')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.segment === 1 ? Theme.textOnClay : Theme.clay)
              .layoutWeight(1)
              .textAlign(TextAlign.Center)
              .height(42)
              .backgroundColor(this.segment === 1 ? Theme.clay : Theme.cardLight)
              .borderRadius(Theme.radiusChip)
              .margin({ left: 10 })
              .onClick(() => this.segment = 1)
          }
          .width('100%')
          .padding({ left: 20, right: 20, top: 16 })
          .id('points-segment')

          // 列表
          if (this.segment === 0) {
            if (this.points.length === 0) {
              Column() {
                EmptyState({ icon: 'empty-points', title: '还没有积分明细', hint: '签到或预约课程即可获得积分' })
              }
              .width('100%')
              .padding({ left: 20, right: 20 })
              .backgroundColor(Theme.cardLight)
              .borderRadius(Theme.radiusCard)
              .margin({ top: 12 })
              .id('points-history-empty')
            } else {
              Column() {
                ForEach(this.points, (p: PointRecord) => {
                  Row() {
                    Row() {
                      SvgIcon({ variant: this.pointIcon(p.type), iconSize: 18 })
                    }
                    .width(36).height(36).borderRadius(10)
                    .backgroundColor(this.pointColor(p.type))
                    .justifyContent(FlexAlign.Center)
                    Column() {
                      Text(p.reason)
                        .fontSize(15)
                        .fontColor(Theme.textPrimary)
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                      Text(DateUtil.shortDate(p.date))
                        .fontSize(12)
                        .fontColor(Theme.textTertiary)
                        .margin({ top: 2 })
                    }
                    .layoutWeight(1)
                    .margin({ left: 12 })
                    .alignItems(HorizontalAlign.Start)
                    Text(`${p.amount >= 0 ? '+' : ''}${p.amount}`)
                      .fontSize(16)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(p.amount >= 0 ? Theme.green : Theme.red)
                  }
                  .width('100%')
                  .padding({ top: 14, bottom: 14 })
                  .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
                  .alignItems(VerticalAlign.Center)
                  .id(`points-history-${p.id}`)
                }, (p: PointRecord) => p.id)
              }
              .width('100%')
              .padding({ left: 18, right: 18 })
              .backgroundColor(Theme.cardLight)
              .borderRadius(Theme.radiusCard)
              .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
              .margin({ left: 20, right: 20, top: 12 })
              .id('points-history-list')
            }
          } else {
            if (this.consumption.length === 0) {
              Column() {
                EmptyState({ icon: 'empty-consumption', title: '还没有消费记录', hint: '预约课程后这里会留痕' })
              }
              .width('100%')
              .padding({ left: 20, right: 20 })
              .backgroundColor(Theme.cardLight)
              .borderRadius(Theme.radiusCard)
              .margin({ top: 12 })
              .id('points-consumption-empty')
            } else {
              Column() {
                ForEach(this.consumption, (c: ConsumptionRecord) => {
                  Row() {
                    Row() {
                      SvgIcon({ variant: 'course-points', iconSize: 18 })
                    }
                    .width(36).height(36).borderRadius(10)
                    .backgroundColor(Theme.yellow)
                    .justifyContent(FlexAlign.Center)
                    Column() {
                      Text(c.title)
                        .fontSize(15)
                        .fontColor(Theme.textPrimary)
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                      Text(DateUtil.shortDate(c.date))
                        .fontSize(12)
                        .fontColor(Theme.textTertiary)
                        .margin({ top: 2 })
                    }
                    .layoutWeight(1)
                    .margin({ left: 12 })
                    .alignItems(HorizontalAlign.Start)
                    Text(c.amountPoint > 0 ? `-${c.amountPoint} 积分` : '已记录')
                      .fontSize(14)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(c.amountPoint > 0 ? Theme.red : Theme.textSecondary)
                  }
                  .width('100%')
                  .padding({ top: 14, bottom: 14 })
                  .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
                  .alignItems(VerticalAlign.Center)
                  .id(`points-consumption-${c.id}`)
                }, (c: ConsumptionRecord) => c.id)
              }
              .width('100%')
              .padding({ left: 18, right: 18 })
              .backgroundColor(Theme.cardLight)
              .borderRadius(Theme.radiusCard)
              .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
              .margin({ left: 20, right: 20, top: 12 })
              .id('points-consumption-list')
            }
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
}
