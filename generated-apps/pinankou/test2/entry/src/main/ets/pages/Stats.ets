// Stats.ets — 统计看板
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { StatsService } from '../services/StatsService';
import { SectionCard, StatTile, ProgressRing, MiniBarChart, EmptyState } from '../components/CommonUi';
import { TimeRange, RankItem, StatsResult } from '../model/Types';

const RANGE_OPTIONS: string[] = ['本周', '本月', '本季', '全部'];
const RANGE_MAP: TimeRange[] = ['week', 'month', 'quarter', 'all'];

@Component
export struct StatsPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @State rangeIdx: number = 1;

  private stats(): StatsResult {
    return StatsService.computeStats(this.store, RANGE_MAP[this.rangeIdx]);
  }

  build() {
    Column() {
      Text('统计看板').fontSize(20).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, top: 48, bottom: 8 })

      Row() {
        ForEach(RANGE_OPTIONS, (opt: string, idx: number) => {
          Text(opt)
            .fontSize(13).fontWeight(FontWeight.Medium)
            .fontColor(this.rangeIdx === idx ? Theme.textOnBrand : Theme.textSecondary)
            .backgroundColor(this.rangeIdx === idx ? Theme.brandPrimary : Theme.chipSoftBg)
            .borderRadius(Theme.radiusChip)
            .padding({ left: 14, right: 14, top: 7, bottom: 7 })
            .margin({ right: 8 })
            .onClick(() => this.rangeIdx = idx)
        }, (opt: string) => opt)
      }
      .id('stats-time-filter')
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 8 })

      Scroll() {
        Column() {
          this.MetricsSection()
          this.RingsSection()
          this.TrendSection()
          this.RankSection()
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      }
      .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder MetricsSection() {
    SectionCard() {
      Row() {
        StatTile({ label: '隐患总数', value: `${this.stats().hazardTotal}`, sub: `完成 ${this.stats().doneCount}`, accent: Theme.brandPrimary })
          .id('stats-hazard-total')
        Column().width(1).height(40).backgroundColor(Theme.cardDivider)
        StatTile({ label: '整改完成率', value: `${Math.round(this.stats().completionRate * 100)}%`, sub: `待办 ${this.stats().pendingCount}`, accent: Theme.riskLow })
          .id('stats-completion-rate')
        Column().width(1).height(40).backgroundColor(Theme.cardDivider)
        StatTile({ label: '巡检覆盖率', value: `${Math.round(this.stats().patrolCoverage * 100)}%`, sub: '今日点位', accent: Theme.brandAccent })
          .id('stats-patrol-coverage')
      }.width('100%')
    }
  }

  @Builder RingsSection() {
    Row() {
      Column() {
        SectionCard() {
          Column() {
            ProgressRing({ percent: Math.round(this.stats().completionRate * 100), label: '完成率', color: Theme.riskLow, ringSize: 88 })
            Text(`整改闭环 ${this.stats().doneCount}/${this.stats().hazardTotal}`)
              .fontSize(12).fontColor(Theme.textTertiary).margin({ top: 8 })
          }.alignItems(HorizontalAlign.Center)
        }
      }.layoutWeight(1)

      Column() {
        SectionCard() {
          Column() {
            ProgressRing({ percent: Math.round(this.stats().patrolCoverage * 100), label: '覆盖率', color: Theme.brandAccent, ringSize: 88 })
            Text(`今日打卡 ${this.store.todayCheckinCount()} 次`)
              .fontSize(12).fontColor(Theme.textTertiary).margin({ top: 8 })
          }.alignItems(HorizontalAlign.Center)
        }
      }.layoutWeight(1).margin({ left: 10 })
    }
    .width('100%')
    .margin({ top: 12 })
  }

  @Builder TrendSection() {
    SectionCard({ marginTop: 12 }) {
      Column() {
        Text('隐患趋势').fontSize(15).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
        MiniBarChart({ points: this.stats().trend, heightValue: 130 }).id('stats-trend-chart').margin({ top: 10 })
      }.width('100%').alignItems(HorizontalAlign.Start)
    }
  }

  @Builder RankSection() {
    Column() {
      Text('区域隐患排名').fontSize(15).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
        .margin({ top: 18, bottom: 8 })
      SectionCard() {
        if (this.stats().rank.length === 0) {
          EmptyState({ icon: 'chart', title: '暂无排名数据' }).id('stats-rank-empty')
        } else {
          Column() {
            ForEach(this.stats().rank, (item: RankItem, idx: number) => {
              Row() {
                Text(`${idx + 1}`).fontSize(13).fontWeight(FontWeight.Bold)
                  .fontColor(idx < 3 ? Theme.brandPrimary : Theme.textQuaternary).width(20)
                Text(item.label).fontSize(13).fontColor(Theme.textPrimary).layoutWeight(1).maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(`${item.value}`).fontSize(13).fontColor(Theme.textSecondary)
              }
              .id(`stats-rank-${idx}`)
              .width('100%').padding({ top: 9, bottom: 9 })
              .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
            }, (item: RankItem, idx: number) => `${item.label}-${idx}`)
          }.id('stats-rank-list').width('100%')
        }
      }
    }.width('100%')
  }
}
