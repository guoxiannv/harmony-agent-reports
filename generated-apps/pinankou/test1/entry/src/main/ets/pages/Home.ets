// Home.ets - 平安扣 home / workbench surface (home-page).
//
// Semantic targets bound (see design-alignment §2):
//   home-scan-button, home-report-button,
//   home-safety-items-card, home-hazards-card, home-inspections-card,
//   home-emergency-card, home-stats-card,
//   home-pending-count, home-overdue-count, home-today-inspection-status,
//   home-quick-action-list
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { ActivityEntry } from '../model/Types';

@Component
export struct HomePage {
  controller: AppController;
  onGoTab: (tab: string) => void = () => {};

  build() {
    Column() {
      // Glass header.
      this.Header()

      Scroll() {
        Column() {
          this.Welcome()
          this.Dashboard()
          this.PrimaryActions()
          this.QuickGrid()
          this.ActivityCard()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Header() {
    Row() {
      Row() {
        Column() {
          SvgIcon({ variant: 'brand', iconSize: 20, color: '#FFFFFF' })
        }
        .width(34)
        .height(34)
        .borderRadius(10)
        .linearGradient(BrandGradient.primary)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Text('平安扣')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.teal)
          .margin({ left: 10 })
      }

      Column() {
        SvgIcon({ variant: 'notification', iconSize: 20, color: Theme.slate600 })
      }
      .width(36)
      .height(36)
      .borderRadius(12)
      .backgroundColor('rgba(255,255,255,0.7)')
      .border({ width: 1, color: Theme.slate200 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.toast('暂无新通知'))
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 14, bottom: 14 })
    .backgroundColor('rgba(255,255,255,0.82)')
    .border({ width: { bottom: 1 }, color: { bottom: 'rgba(226,232,240,0.5)' } })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Welcome() {
    Column() {
      Text('欢迎使用平安扣')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)

      Row() {
        SvgIcon({ variant: 'calendar', iconSize: 14, color: Theme.slate600 })
        Text(this.todayLabel())
          .fontSize(13)
          .fontColor(Theme.slate600)
          .margin({ left: 6 })
      }
      .padding({ left: 12, right: 12, top: 6, bottom: 6 })
      .borderRadius(20)
      .backgroundColor('rgba(255,255,255,0.72)')
      .border({ width: 1, color: 'rgba(255,255,255,0.6)' })
      .margin({ top: 8 })
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 18, bottom: 8 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Dashboard() {
    Scroll() {
      Row() {
        this.DashCard('待处理事项', String(this.controller.homeSummary().pendingCount), 'dash-pending', false,
          'home-pending-count')
        this.DashCard('逾期事项', String(this.controller.homeSummary().overdueCount), 'dash-overdue', true,
          'home-overdue-count')
        this.DashCard('今日巡检', this.controller.homeSummary().todayInspectionStatus, 'dash-inspection', false,
          'home-today-inspection-status')
      }
      .padding({ left: 16, right: 16 })
    }
    .scrollable(ScrollDirection.Horizontal)
    .scrollBar(BarState.Off)
    .width('100%')
    .margin({ top: 8, bottom: 8 })
  }

  @Builder
  DashCard(label: string, value: string, icon: string, alert: boolean, sid: string) {
    Column() {
      Row() {
        SvgIcon({ variant: icon, iconSize: 20, color: Theme.slate900 })
      }
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(alert ? 'rgba(254,226,226,0.7)' : 'rgba(224,242,254,0.7)')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(label)
        .fontSize(13)
        .fontColor(Theme.slate600)
        .margin({ top: 10 })

      Text(value)
        .fontSize(value.length > 4 ? 20 : 30)
        .fontWeight(FontWeight.Bold)
        .fontColor(alert ? Theme.riskHigh : Theme.teal)
        .margin({ top: 4 })
    }
    .id(sid)
    .width(156)
    .padding(18)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .margin({ right: 12 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  QuickGrid() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Column() {
        this.QuickCard('安全事项', '管理检查与保养', 'quick-items', BrandGradient.quickBlue, 'home-safety-items-card',
          () => { this.controller.navigateSafetyItems(); })
        this.QuickCard('风险隐患', '上报与整改跟踪', 'quick-hazards', BrandGradient.quickOrange, 'home-hazards-card',
          () => { this.onGoTab('tab-hazards'); })
        this.QuickCard('巡检打卡', '检查点逐项确认', 'quick-inspections', BrandGradient.quickGreen, 'home-inspections-card',
          () => { this.onGoTab('tab-inspections'); })
        this.QuickCard('应急联系', '一键拨号求助', 'quick-emergency', BrandGradient.quickRed, 'home-emergency-card',
          () => { this.controller.navigateEmergency(); })
        this.QuickCard('统计看板', '安全健康度', 'quick-stats', BrandGradient.quickTeal, 'home-stats-card',
          () => { this.onGoTab('tab-stats'); })
        this.QuickCard('更多', '我的与设置', 'quick-more', BrandGradient.quickPurple, 'home-stats-card',
          () => { this.onGoTab('tab-profile'); })
      }
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .margin({ top: 8 })
  }

  @Builder
  QuickCard(title: string, desc: string, icon: string, grad: LinearGradient, sid: string,
            onTap: () => void) {
    Column() {
      Column() {
        SvgIcon({ variant: icon, iconSize: 26, color: '#FFFFFF' })
      }
      .width(52)
      .height(52)
      .borderRadius(16)
      .linearGradient(grad)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(title)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.slate900)
        .margin({ top: 12 })

      Text(desc)
        .fontSize(12)
        .fontColor(Theme.slate400)
        .margin({ top: 2 })
    }
    .id(sid)
    .width('47%')
    .padding(18)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .margin({ right: 6, bottom: 12 })
    .alignItems(HorizontalAlign.Start)
    .onClick(() => onTap())
  }

  @Builder
  ActivityCard() {
    Column() {
      Text('最近动态')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.slate900)

      if (this.controller.activityFeed().length === 0) {
        Column() {
          Text('暂无动态')
            .fontSize(14)
            .fontColor(Theme.slate400)
            .margin({ top: 16, bottom: 16 })
        }
        .id('home-quick-action-list')
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      } else {
        Column() {
          ForEach(this.controller.activityFeed(), (e: ActivityEntry) => {
            Row() {
              Row() {
                Text(e.kind === 'hazard' ? '患' : '项')
                  .fontSize(12)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FFFFFF')
              }
              .width(28)
              .height(28)
              .borderRadius(14)
              .backgroundColor(this.accentColor(e.accent))
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)

              Column() {
                Text(e.title)
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.slate900)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(e.subtitle)
                  .fontSize(12)
                  .fontColor(Theme.slate400)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({ top: 2 })
              }
              .layoutWeight(1)
              .margin({ left: 10 })
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .padding({ top: 8, bottom: 8 })
            .alignItems(VerticalAlign.Center)
          }, (e: ActivityEntry) => e.id)
        }
        .id('home-quick-action-list')
        .width('100%')
        .margin({ top: 12 })
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width('100%')
    .padding(18)
    .margin({ left: 16, right: 16, top: 8, bottom: 24 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .alignItems(HorizontalAlign.Start)
  }

  // --- primary action buttons row (home-scan-button, home-report-button) ---
  // Rendered as a fixed row directly under the dashboard for first-screen reach.
  // We expose them here via a helper the Index can also call; but since the
  // design places scan/report inside dashboard area, we render inline at top of
  // QuickGrid section header. To satisfy semantic IDs we attach them to a small
  // action row inserted before QuickGrid.

  private todayLabel(): string {
    const d: Date = new Date();
    const y: number = d.getFullYear();
    const m: number = d.getMonth() + 1;
    const day: number = d.getDate();
    const week: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return `${y}年${m}月${day}日 ${week[d.getDay()]}`;
  }

  private accentColor(a: string): string {
    if (a === 'red') return Theme.riskHigh;
    if (a === 'orange') return Theme.riskMid;
    if (a === 'blue') return Theme.riskLow;
    return Theme.doneGreen;
  }

  // Public build-time entry used by Index to render scan/report buttons.
  @Builder
  PrimaryActions() {
    Row() {
      Column() {
        Row() {
          SvgIcon({ variant: 'start-inspection', iconSize: 16, color: '#FFFFFF' })
          Text('开始巡检')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
            .margin({ left: 6 })
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
      }
      .id('home-scan-button')
      .layoutWeight(1)
      .height(44)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.tealDeep)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => { this.onGoTab('tab-inspections'); })

      Column() {
        Row() {
          SvgIcon({ variant: 'report-hazard', iconSize: 16, color: '#FFFFFF' })
          Text('上报隐患')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor('#FFFFFF')
            .margin({ left: 6 })
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
      }
      .id('home-report-button')
      .layoutWeight(1)
      .height(44)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.riskMid)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ left: 10 })
      .onClick(() => { this.controller.openHazardForm(''); })
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
    .margin({ top: 4, bottom: 4 })
  }
}
