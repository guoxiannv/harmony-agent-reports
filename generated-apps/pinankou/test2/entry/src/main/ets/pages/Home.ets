// Home.ets — 工作台
import { promptAction } from '@kit.ArkUI';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { DataStore } from '../services/DataStore';
import { TabId } from '../common/TabTypes';
import { StatTile, EmptyState } from '../components/CommonUi';
import { SafetyTodo } from '../model/Types';

@Component
export struct HomePage {
  @StorageLink('dataStore') store: DataStore = appStoreFallback();
  goToTab: (tab: TabId) => void = () => {};
  openHazardEdit: (hazardId: string) => void = () => {};
  openPatrol: () => void = () => {};
  emergencyCall: () => void = () => {};

  build() {
    Column() {
      this.Header()
      Scroll() {
        Column() {
          this.HeroSummary()
          this.QuickActions()
          this.TodoSection()
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%').height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder Header() {
    Row() {
      Column() {
        Text('平安扣').fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textOnBrand)
        Text('安全工作台').fontSize(12).fontColor('rgba(255,255,255,0.82)').margin({ top: 2 })
      }.alignItems(HorizontalAlign.Start).layoutWeight(1)

      Row() {
        SvgIcon({ variant: 'bell', iconSize: 22, color: Theme.textOnBrand, strokeWidth: 1.8 })
      }
      .id('home-notification-button')
      .width(40).height(40).borderRadius(20)
      .backgroundColor('rgba(255,255,255,0.16)')
      .justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center)
      .onClick(() => promptAction.showToast({ message: '暂无新通知' }))
    }
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 16 })
    .linearGradient(BrandGradient.hero)
  }

  @Builder HeroSummary() {
    Column() {
      Row() {
        StatTile({ label: '待整改', value: `${this.store.pendingHazardsCount()}`, sub: '项隐患', accent: Theme.riskHigh })
          .id('home-summary-pending-count')
        Column().width(1).height(38).backgroundColor(Theme.cardDivider)
        StatTile({ label: '今日打卡', value: `${this.store.todayCheckinCount()}`, sub: '巡检点', accent: Theme.brandPrimary })
          .id('home-summary-today-patrol-count')
        Column().width(1).height(38).backgroundColor(Theme.cardDivider)
        StatTile({ label: '完成率', value: `${Math.round(this.store.completionRate() * 100)}%`, sub: '整改闭环', accent: Theme.riskLow })
          .id('home-summary-completion-rate')
      }
      .width('100%')
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .margin({ top: -20 })
    }
    .width('100%')
  }

  @Builder QuickActions() {
    Column() {
      Text('快捷操作').fontSize(15).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        .margin({ top: 20, bottom: 10 })
      Row() {
        this.ActionTile('alert', '新建隐患', Theme.riskHigh, 'home-add-hazard-button', () => this.openHazardEdit(''))
        this.ActionTile('check', '开始巡检', Theme.brandPrimary, 'home-start-patrol-button', () => { this.openPatrol(); })
        this.ActionTile('phone', '一键呼救', Theme.riskCritical, 'home-emergency-call-button', () => this.emergencyCall())
      }.width('100%').justifyContent(FlexAlign.SpaceBetween)
    }.width('100%')
  }

  @Builder ActionTile(icon: string, label: string, color: string, itemId: string, action: () => void) {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        SvgIcon({ variant: icon, iconSize: 22, color: Theme.textOnBrand, strokeWidth: 2 })
      }
      .width(48).height(48).borderRadius(16).backgroundColor(color)
      Text(label).fontSize(12).fontColor(Theme.textSecondary).margin({ top: 8 })
    }
    .id(itemId)
    .layoutWeight(1)
    .padding({ top: 14, bottom: 14 })
    .alignItems(HorizontalAlign.Center)
    .onClick(() => action())
  }

  @Builder TodoSection() {
    Column() {
      Row() {
        Text('今日待办').fontSize(15).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        Blank()
        Text(`${this.store.derivedTodos().length} 项`).fontSize(12).fontColor(Theme.textTertiary)
      }.width('100%').margin({ top: 20, bottom: 10 })

      Column() {
        if (this.store.derivedTodos().length === 0) {
          EmptyState({
            icon: 'check', title: '今日暂无待办', hint: '隐患与巡检事项将显示在这里',
            actionLabel: '去巡检', onAction: () => this.openPatrol()
          }).id('home-todo-empty-state')
        } else {
          Column() {
            ForEach(this.store.derivedTodos(), (t: SafetyTodo) => {
              Row() {
                Text(t.title).fontSize(14).fontColor(Theme.textPrimary).layoutWeight(1).maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(t.type === 'hazard' ? '隐患' : t.type === 'patrol' ? '巡检' : '复核')
                  .fontSize(11).fontColor(Theme.brandPrimary).backgroundColor(Theme.brandSoft)
                  .borderRadius(Theme.radiusChip).padding({ left: 8, right: 8, top: 2, bottom: 2 })
              }
              .width('100%')
              .padding({ top: 12, bottom: 12 })
              .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
              .onClick(() => {
                if (t.type === 'patrol') {
                  this.openPatrol();
                } else {
                  this.goToTab('tab-hazard');
                }
              })
            }, (t: SafetyTodo) => t.id)
          }
          .id('home-todo-list')
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .padding({ left: 16, right: 16 })
        }
      }.width('100%')
    }.width('100%')
  }
}

function appStoreFallback(): DataStore {
  // Placeholder default; real value injected by AppStorage via @StorageLink.
  return new DataStore();
}
