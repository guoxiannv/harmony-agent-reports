// ProfilePage.ets
//
// 我的页（profile-page）。头像/昵称/连续打卡徽章、2×2 统计、设置菜单。

import { AppController } from '../controller/AppController';
import { SvgIcon } from '../common/SvgIcon';
import { Theme } from '../common/Theme';
import { CheckInRecord } from '../model/Types';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ProfilePage {
  private controller: AppController = AppController.getInstance();
  @StorageLink('checkInRecords') records: CheckInRecord[] = [];

  build() {
    Scroll() {
      Column() {
        // 头像 + 昵称 + 徽章
        Row() {
          Column() {
            SvgIcon({ variant: 'avatar', iconSize: 32 })
          }
          .width(72).height(72).borderRadius(36)
          .backgroundColor(Theme.inputBg)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Text('美食探险家')
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .margin({ bottom: 6 })
            Row() {
              SvgIcon({ variant: 'streak-badge', iconSize: 14 })
              Text(`连续打卡 ${this.controller.streak()} 天`)
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.moodActiveText)
                .margin({ left: 4 })
            }
            .height(26)
            .backgroundColor(Theme.moodActiveBg)
            .borderRadius(10)
            .padding({ left: 10, right: 10 })
            .alignItems(VerticalAlign.Center)
          }
          .margin({ left: 16 })
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)
        .margin({ bottom: 24 })

        // 2×2 统计
        Row({ space: 14 }) {
          this.statCard(`${this.controller.streak()}`, '连续打卡', true, 'profile-streak-count')
          this.statCard(`${this.controller.totalCheckIns()}`, '总打卡数', false, 'profile-total-check-ins')
        }
        .width('100%')
        .margin({ bottom: 14 })
        Row({ space: 14 }) {
          this.statCard(this.favoriteThisMonth(), '本月最爱', false, '')
          this.statCard(`${this.dishesThisWeek()}`, '本周菜品', false, '')
        }
        .width('100%')
        .margin({ bottom: 24 })

        // 菜单
        Column() {
          this.menuItem('设置', 'settings', 'arrow-setting', 'profile-settings-button', () => {
            this.toast('设置功能即将上线');
          })
          Column().width('100%').height(1).backgroundColor(Theme.cardDivider)
          this.menuItem('关于', 'about', 'arrow-about', '', () => {
            this.toast('今天吃什么 v1.0.0');
          })
        }
        .width('100%')
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .shadow({ radius: 32, color: Theme.shadowCard, offsetY: 10 })
        .clip(true)
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Off)
    .id('profile-page')
  }

  @Builder
  statCard(value: string, label: string, accent: boolean, idStr: string) {
    Column() {
      Text(value)
        .id(idStr)
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(accent ? Theme.tomato : Theme.textPrimary)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ bottom: 6 })
      Text(label)
        .fontSize(13)
        .fontColor(Theme.textTertiary)
    }
    .layoutWeight(1)
    .backgroundColor(Theme.cardBg)
    .borderRadius(20)
    .padding(18)
    .shadow({ radius: 32, color: Theme.shadowCard, offsetY: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  menuItem(label: string, iconVariant: string, arrowVariant: string, idStr: string, action: () => void) {
    Row() {
      Row() {
        Column() {
          SvgIcon({ variant: iconVariant, iconSize: 20 })
        }
        .width(36).height(36).borderRadius(10)
        .backgroundColor(Theme.inputBg)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Text(label)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .margin({ left: 12 })
      }

      SvgIcon({ variant: arrowVariant, iconSize: 18 })
    }
    .id(idStr)
    .width('100%')
    .padding({ left: 20, right: 20, top: 18, bottom: 18 })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .onClick(() => action())
  }

  private toast(msg: string): void {
    try {
      promptAction.showToast({ message: msg });
    } catch (err) {
      // 忽略 toast 失败。
    }
  }

  // 本月最爱：当前月内出现次数最多的菜品名
  private favoriteThisMonth(): string {
    const now: Date = new Date();
    const prefix: string = `${now.getFullYear()}-${`${now.getMonth() + 1}`.padStart(2, '0')}`;
    const counts: Map<string, number> = new Map();
    for (let i = 0; i < this.records.length; i++) {
      const r: CheckInRecord = this.records[i];
      if (r.date.startsWith(prefix)) {
        counts.set(r.dishName, (counts.get(r.dishName) ?? 0) + 1);
      }
    }
    let best: string = '—';
    let bestCount: number = 0;
    counts.forEach((c: number, name: string) => {
      if (c > bestCount) {
        bestCount = c;
        best = name;
      }
    });
    return best;
  }

  // 本周菜品：近 7 天内不同菜品数
  private dishesThisWeek(): number {
    const weekAgo: number = Date.now() - 7 * 24 * 60 * 60 * 1000;
    const set: Set<string> = new Set();
    for (let i = 0; i < this.records.length; i++) {
      const r: CheckInRecord = this.records[i];
      const ts: number = new Date(`${r.date}T00:00:00`).getTime();
      if (!isNaN(ts) && ts >= weekAgo) {
        set.add(r.dishName);
      }
    }
    return set.size;
  }
}
