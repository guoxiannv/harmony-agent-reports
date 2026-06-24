// Patrol.ets — 巡检打卡
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState, GhostButton, PrimaryButton } from '../components/CommonUi';
import { PatrolRoute, PatrolCheckpoint } from '../model/Types';

@Component
export struct PatrolPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();

  build() {
    Column() {
      Row() {
        Text('巡检打卡').fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 8 })

      if (this.store.activeRouteId.length > 0 && this.store.getRoute(this.store.activeRouteId)) {
        this.ActiveSession(this.store.getRoute(this.store.activeRouteId) as PatrolRoute)
      } else {
        this.RouteList()
      }
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder RouteList() {
    Scroll() {
      Column() {
        if (this.store.routes.length === 0) {
          EmptyState({
            icon: 'shield', title: '暂无巡检路线', hint: '联系管理员配置巡检路线模板'
          }).id('patrol-empty-state')
        } else {
          Text('巡检路线').fontSize(13).fontColor(Theme.textTertiary)
            .width('100%').margin({ bottom: 8 })
          ForEach(this.store.routes, (r: PatrolRoute) => {
            Column() {
              Row() {
                Column() {
                  Text(r.name).fontSize(15).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
                  Text(r.description).fontSize(12).fontColor(Theme.textTertiary).margin({ top: 4 })
                  Text(`${r.checkpoints.length} 个巡检点`).fontSize(12).fontColor(Theme.brandPrimary).margin({ top: 6 })
                }.alignItems(HorizontalAlign.Start).layoutWeight(1)
                Button('开始')
                  .id('patrol-start-button')
                  .type(ButtonType.Capsule)
                  .backgroundColor(Theme.brandPrimary).fontColor(Theme.textOnBrand)
                  .fontSize(13).height(36).padding({ left: 18, right: 18 })
                  .onClick(() => {
                    this.store.startPatrol(r.id);
                    promptAction.showToast({ message: `开始巡检：${r.name}` });
                  })
              }.width('100%')
            }
            .id(`patrol-route-${r.id}`)
            .width('100%').backgroundColor(Theme.cardBg).borderRadius(Theme.radiusCard).padding(16)
            .margin({ bottom: 10 })
          }, (r: PatrolRoute) => r.id)
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)
  }

  @Builder ActiveSession(r: PatrolRoute) {
    Column() {
      // session header
      Column() {
        Text('巡检进行中').fontSize(12).fontColor(Theme.textOnBrand)
        Text(r.name).fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textOnBrand).margin({ top: 2 })
        Text(`已完成 ${this.store.checkedCheckpoints.length} / ${r.checkpoints.length} 个巡检点`)
          .fontSize(12).fontColor('rgba(255,255,255,0.85)').margin({ top: 4 })
      }
      .width('100%').alignItems(HorizontalAlign.Start)
      .padding({ left: 16, right: 16, top: 16, bottom: 16 })
      .borderRadius(Theme.radiusCard)
      .linearGradient({
        angle: 135, direction: GradientDirection.RightTop,
        colors: [['#0E7C86', 0.0], ['#0A4F57', 1.0]],
      } as LinearGradient)
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 12 })

      Scroll() {
        Column() {
          Text('巡检点位').fontSize(13).fontColor(Theme.textTertiary)
            .width('100%').margin({ bottom: 8 })
          ForEach(r.checkpoints, (cp: PatrolCheckpoint) => {
            Row() {
              Column() {
                Text(cp.name).fontSize(14).fontColor(Theme.textPrimary)
                Text(this.store.isCheckpointChecked(cp.id) ? '已打卡' : '未打卡')
                  .fontSize(11).fontColor(this.store.isCheckpointChecked(cp.id) ? Theme.riskLow : Theme.textQuaternary)
                  .margin({ top: 3 })
              }.alignItems(HorizontalAlign.Start).layoutWeight(1)

              if (this.store.isCheckpointChecked(cp.id)) {
                SvgIcon({ variant: 'check', iconSize: 20, color: Theme.riskLow, strokeWidth: 2.4 })
              } else {
                GhostButton({
                  label: '打卡', onTap: () => this.checkin(cp.id, false)
                }).id(cp.order === 1 ? 'patrol-checkin-button' : '').layoutWeight(0)
              }
            }
            .id(`patrol-checkpoint-${cp.id}`)
            .width('100%').backgroundColor(Theme.cardBg).borderRadius(Theme.radiusCard).padding(16)
            .margin({ bottom: 8 })
            Row() {
              Button('上报异常')
                .id('patrol-report-abnormal-button')
                .type(ButtonType.Capsule)
                .backgroundColor(Theme.riskHighBg).fontColor(Theme.riskHigh)
                .fontSize(12).height(32).padding({ left: 14, right: 14 })
                .margin({ left: 'auto' })
                .onClick(() => this.checkin(cp.id, true))
            }.width('100%').margin({ bottom: 8 })
          }, (cp: PatrolCheckpoint) => cp.id)

          PrimaryButton({
            label: '完成本次巡检',
            isEnabled: this.store.checkedCheckpoints.length > 0,
            onTap: () => {
              this.store.completePatrol();
              promptAction.showToast({ message: '巡检已完成，记录已保存' });
            }
          }).id('patrol-complete-button').margin({ top: 12 })
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      }
      .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)
    }.width('100%').height('100%')
  }

  private checkin(cpId: string, abnormal: boolean): void {
    this.store.checkinCheckpoint(cpId, abnormal, abnormal ? '现场发现异常' : '');
    if (abnormal) {
      promptAction.showToast({ message: '异常已记录，请同步上报隐患' });
    } else {
      promptAction.showToast({ message: '打卡成功' });
    }
  }
}
