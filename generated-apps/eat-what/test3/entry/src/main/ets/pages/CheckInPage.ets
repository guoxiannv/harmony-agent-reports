// CheckInPage.ets
//
// 打卡页（check-in-page）。统计卡 + 按日期分组的打卡列表 + 补录 FAB。

import { AppController } from '../controller/AppController';
import { CheckInService } from '../services/CheckInService';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient, TAG_DOT_COLORS } from '../common/Theme';
import { CheckInDayGroup, CheckInRecord, formatDateKey } from '../model/Types';

@Component
export struct CheckInPage {
  goToEditor: () => void = () => {};
  goToShare: () => void = () => {};
  private controller: AppController = AppController.getInstance();

  @StorageLink('checkInRecords') records: CheckInRecord[] = [];

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          Text('饮食打卡')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 18 })

          // 统计卡
          Row() {
            Column() {
              Text(`${this.controller.streak()}`)
                .id('profile-streak-count')
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.tomato)
              Text('连续打卡')
                .fontSize(12)
                .fontColor(Theme.textTertiary)
                .margin({ top: 6 })
            }
            .layoutWeight(1)

            Column() {
              Text(`${this.controller.totalCheckIns()}`)
                .id('profile-total-check-ins')
                .fontSize(36)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Text('总次数')
                .fontSize(12)
                .fontColor(Theme.textTertiary)
                .margin({ top: 6 })
            }
            .layoutWeight(1)
          }
          .width('100%')
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .padding(22)
          .shadow({ radius: 32, color: Theme.shadowCard, offsetY: 10 })
          .margin({ bottom: 24 })

          // 打卡列表
          if (this.records.length === 0) {
            Column() {
              Text('还没有打卡记录')
                .fontSize(15)
                .fontColor(Theme.textTertiary)
              Text('点击右下角按钮，记录今天这一餐')
                .fontSize(13)
                .fontColor(Theme.textTertiary)
                .margin({ top: 6 })
            }
            .width('100%')
            .padding({ top: 40, bottom: 40 })
            .alignItems(HorizontalAlign.Center)
          } else {
            Column() {
              ForEach(this.groups(), (group: CheckInDayGroup, gi: number) => {
                Text(this.dateHeader(group.date))
                  .fontSize(13)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textSecondary)
                  .backgroundColor(Theme.inputBg)
                  .borderRadius(Theme.radiusTiny)
                  .padding({ left: 14, right: 14, top: 8, bottom: 8 })
                  .margin({ top: gi === 0 ? 0 : 22, bottom: 12 })

                Column({ space: 12 }) {
                  ForEach(group.records, (rec: CheckInRecord, ri: number) => {
                    this.recordItem(rec, gi * 10 + ri)
                  }, (rec: CheckInRecord) => rec.id)
                }
              }, (group: CheckInDayGroup) => group.date)
            }
            .width('100%')
            .id('check-in-list')
          }
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 120 })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.Top)
      .scrollBar(BarState.Off)

      // 补录 FAB
      Column() {
        SvgIcon({ variant: 'plus-fab', iconSize: 24 })
      }
      .id('check-in-add-button')
      .width(56)
      .height(56)
      .borderRadius(28)
      .linearGradient(BrandGradient.tomato)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow({ radius: 20, color: 'rgba(232,93,78,0.3)', offsetY: 8 })
      .margin({ right: Theme.pageHorizontalPadding, bottom: 16 })
      .onClick(() => {
        this.controller.openCheckInEditorNew('');
        this.goToEditor();
      })
    }
    .width('100%')
    .height('100%')
    .id('check-in-page')
  }

  @Builder
  recordItem(rec: CheckInRecord, colorIndex: number) {
    Row() {
      // 彩色竖条
      Column()
        .width(4)
        .height(44)
        .borderRadius(4)
        .backgroundColor(TAG_DOT_COLORS[colorIndex % TAG_DOT_COLORS.length])

      Column() {
        Row() {
          Text(rec.meal)
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textTertiary)
          Blank()
          if (rec.moods.length > 0) {
            Text(rec.moods[0])
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.avocadoText)
              .backgroundColor(Theme.avocadoSoft)
              .borderRadius(8)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          }
        }
        .width('100%')
        .margin({ bottom: 6 })

        Text(rec.dishName)
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .layoutWeight(1)
      .margin({ left: 14 })
      .alignItems(HorizontalAlign.Start)

      // 操作
      Row({ space: 10 }) {
        Column() {
          SvgIcon({ variant: 'share-gray', iconSize: 18 })
        }
        .id('check-in-share-button')
        .width(34).height(34).borderRadius(10)
        .backgroundColor(Theme.inputBg)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => {
          this.controller.openShareCard(rec);
          this.goToShare();
        })

        Column() {
          SvgIcon({ variant: 'trash', iconSize: 18 })
        }
        .id('check-in-delete-button')
        .width(34).height(34).borderRadius(10)
        .backgroundColor(Theme.inputBg)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.controller.deleteCheckIn(rec.id))
      }
      .alignItems(VerticalAlign.Center)
    }
    .id(`check-in-record-${rec.id}`)
    .width('100%')
    .backgroundColor(Theme.cardBg)
    .borderRadius(20)
    .padding(16)
    .shadow({ radius: 20, color: 'rgba(46,43,40,0.06)', offsetY: 6 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.controller.openCheckInEditorEdit(rec);
      this.goToEditor();
    })
  }

  private groups(): CheckInDayGroup[] {
    return CheckInService.groupByDate(this.records);
  }

  private dateHeader(date: string): string {
    const today: string = formatDateKey(Date.now());
    const yesterday: string = formatDateKey(Date.now() - 24 * 60 * 60 * 1000);
    const weekdays: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    let prefix: string = '';
    if (date === today) {
      prefix = '今天 · ';
    } else if (date === yesterday) {
      prefix = '昨天 · ';
    }
    const parts: string[] = date.split('-');
    const d: Date = new Date(`${parts[0]}-${parts[1]}-${parts[2]}T00:00:00`);
    return `${prefix}${Number(parts[1])}月${Number(parts[2])}日 ${weekdays[d.getDay()]}`;
  }
}
