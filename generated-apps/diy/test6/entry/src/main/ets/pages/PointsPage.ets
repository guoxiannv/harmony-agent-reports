// 手作·印记 — 积分 / Points surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { PointTransaction, PointRow, Member, KEY_POINT_TX, KEY_MEMBERS } from '../common/Models';
import { TimeUtil } from '../common/Util';
import { NavOpen } from './Index';

@Component
export struct PointsPage {
  @StorageLink(KEY_POINT_TX) txLink: PointTransaction[] = [];
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @State filter: string = 'all'; // all | earn | spend
  onOpen: (req: NavOpen) => void = () => {};

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          Text('积分')
            .fontSize(Theme.fontPageTitle)
            .fontColor(Theme.textTitle)
            .margin({ top: 8, bottom: 14 })

          this.BalanceCard()
          this.FilterPill()
          this.TransactionList()
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
      .id('points-add-record-button')
      .onClick(() => this.onOpen({ target: 'point-record' }))
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  BalanceCard() {
    Column() {
      Text('积分总余额')
        .fontSize(Theme.fontBody)
        .fontColor('rgba(255,255,255,0.92)')
      Text(`${AppStore.get().totalPoints()}`)
        .fontSize(48)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
        .id('points-total-balance')
        .margin({ top: 6 })

      Row() {
        Column() {
          Row() {
            SvgIcon({ variant: 'checkin-primary', iconSize: 18 })
            Text('每日签到')
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textOnBrand)
              .margin({ left: 4 })
          }
        }
        .padding({ left: 18, right: 18, top: 11, bottom: 11 })
        .borderRadius(Theme.radiusButton)
        .backgroundColor('rgba(255,255,255,0.22)')
        .id('points-checkin-button')
        .onClick(() => this.doQuickCheckin())
      }
      .margin({ top: 18 })
    }
    .width('100%')
    .padding(22)
    .borderRadius(Theme.radiusCard)
    .linearGradient(BrandGradient.points)
    .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FilterPill() {
    Row() {
      Text('全部')
        .fontSize(Theme.fontBody)
        .fontColor(this.filter === 'all' ? Theme.brandPrimary : Theme.textMuted)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .borderRadius(Theme.radiusPill)
        .backgroundColor(this.filter === 'all' ? Theme.cardBg : Color.Transparent)
      Text('收入')
        .fontSize(Theme.fontBody)
        .fontColor(this.filter === 'earn' ? Theme.brandPrimary : Theme.textMuted)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .borderRadius(Theme.radiusPill)
        .backgroundColor(this.filter === 'earn' ? Theme.cardBg : Color.Transparent)
      Text('支出')
        .fontSize(Theme.fontBody)
        .fontColor(this.filter === 'spend' ? Theme.brandPrimary : Theme.textMuted)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .borderRadius(Theme.radiusPill)
        .backgroundColor(this.filter === 'spend' ? Theme.cardBg : Color.Transparent)
    }
    .padding(4)
    .borderRadius(Theme.radiusSmall)
    .backgroundColor(Theme.pageBg)
    .border({ width: 1, color: Theme.borderSoft })
    .id('points-filter-type')
    .margin({ top: 18, bottom: 14 })
  }

  @Builder
  TransactionList() {
    Column() {
      if (this.rows().length === 0) {
        Text('暂无积分流水')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 28, bottom: 28 })
          .id('points-empty-state')
      } else {
        ForEach(this.rows(), (p: PointRow) => {
          Row() {
            Column() {
              Text(this.typeLabel(p.type, p.reason))
                .fontSize(Theme.fontBody)
                .fontColor(Theme.textTitle)
              Text(`${p.memberName} · ${TimeUtil.relativeDays(p.createdAt, TimeUtil.now())}`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)

            Text(`${p.amount >= 0 ? '+' : ''}${p.amount}`)
              .fontSize(Theme.fontCardTitle)
              .fontWeight(FontWeight.Bold)
              .fontColor(p.amount >= 0 ? Theme.success : Theme.danger)
          }
          .width('100%')
          .padding({ top: 14, bottom: 14 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`points-transaction-${p.id}`)
        }, (p: PointRow) => p.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .id('points-transaction-list')
  }

  private rows(): PointRow[] {
    return AppStore.get().pointRows('', this.filter);
  }

  private typeLabel(type: string, reason: string): string {
    if (reason.length > 0) {
      return reason;
    }
    if (type === 'checkin') {
      return '签到奖励';
    }
    if (type === 'earn') {
      return '积分增加';
    }
    if (type === 'spend') {
      return '积分消耗';
    }
    return '积分调整';
  }

  // Quick check-in for the most recently visited / first member (no picker on this surface).
  private doQuickCheckin(): void {
    const store = AppStore.get();
    const list = store.getMembers();
    if (list.length === 0) {
      Ui.toast('请先添加会员');
      this.onOpen({ target: 'member-edit' });
      return;
    }
    // Pick the member with the earliest lastVisitAt (most in need) for a quick check-in.
    let target = list[0];
    for (let i = 1; i < list.length; i++) {
      if (list[i].lastVisitAt < target.lastVisitAt) {
        target = list[i];
      }
    }
    if (store.hasCheckedInToday(target.id)) {
      Ui.toast(`${target.name} 今日已签到`);
      return;
    }
    const pts = store.getSettings().checkinPoints;
    store.applyPointTx(target.id, 'checkin', pts, '每日签到', 'checkin', '');
    store.touchMember(target.id, TimeUtil.now(), 0);
    Ui.toast(`${target.name} 签到成功 +${pts}`);
  }
}
