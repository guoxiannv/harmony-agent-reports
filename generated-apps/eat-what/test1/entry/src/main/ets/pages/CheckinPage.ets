// CheckinPage — 今日打卡 (summary + timeline).
import { AppController } from '../controller/AppController';
import { Checkin } from '../model/Checkin';
import { MealType } from '../model/Enums';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';

@Component
export struct CheckinPage {
  controller: AppController = AppController.getInstance();

  build() {
    Scroll() {
      Column() {
        // header
        Row() {
          Text('今日打卡')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Button() {
            SvgIcon({ variant: 'share', iconSize: 22, color: Theme.brandPrimary, strokeWidth: 2 })
          }
          .id('checkin-share-button')
          .width(42)
          .height(42)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.cardBg)
          .shadow(ShadowConfig.soft)
          .onClick(() => this.controller.openShareCard('checkin', this.firstTodayId()))
        }
        .width('100%')
        .margin({ top: 20, bottom: 18 })

        // summary card
        Column() {
          Text(this.dateLabel())
            .fontSize(13)
            .fontColor('#FFFFFF')
            .opacity(0.9)
            .width('100%')
            .margin({ bottom: 16 })
          Row() {
            Column() {
              Text('' + this.controller.todayCount)
                .id('checkin-today-count')
                .fontSize(32)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
              Text('今日打卡')
                .fontSize(12)
                .fontColor('#FFFFFF')
                .opacity(0.9)
                .margin({ top: 6 })
            }
            .alignItems(HorizontalAlign.Start)
            Column() {
              Text('' + this.controller.todayCalories)
                .id('checkin-today-calories')
                .fontSize(32)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
              Text('kcal 总热量')
                .fontSize(12)
                .fontColor('#FFFFFF')
                .opacity(0.9)
                .margin({ top: 6 })
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 32 })
          }
          .width('100%')
        }
        .width('100%')
        .padding(22)
        .borderRadius(Theme.radiusHero)
        .linearGradient(BrandGradient.summary)
        .shadow({ radius: 36, color: 'rgba(217,119,54,0.28)', offsetX: 0, offsetY: 14 })
        .margin({ bottom: 20 })

        // section header
        Row() {
          Text('记录')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Button('记一笔')
            .id('checkin-add-button')
            .height(38)
            .borderRadius(Theme.radiusChip)
            .backgroundColor(Theme.brandPrimary)
            .fontColor('#FFFFFF')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .onClick(() => this.controller.openCheckinForm('checkin', '', ''))
        }
        .width('100%')
        .margin({ bottom: 14 })

        // timeline
        if (this.controller.todayCheckins.length > 0) {
          Column() {
            ForEach(this.controller.todayCheckins, (item: Checkin) => {
              this.timelineItem(item)
            }, (item: Checkin) => 'checkin-item-' + item.id)
          }
          .width('100%')
          .id('checkin-timeline-list')
          .alignItems(HorizontalAlign.Start)
        } else {
          this.emptyState()
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      .alignItems(HorizontalAlign.Start)
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  private firstTodayId(): string {
    if (this.controller.todayCheckins.length > 0) {
      return this.controller.todayCheckins[0].id;
    }
    return '';
  }

  private dateLabel(): string {
    const now: Date = new Date();
    const y: number = now.getFullYear();
    const m: number = now.getMonth() + 1;
    const d: number = now.getDate();
    return y + '年' + m + '月' + d + '日';
  }

  @Builder
  timelineItem(item: Checkin) {
    Row() {
      // dot column
      Column() {
        Column()
          .width(22)
          .height(22)
          .borderRadius(11)
          .backgroundColor(this.mealColor(item.meal as MealType))
          .border({ width: 3, color: Theme.pageBg })
      }
      .width(22)
      .margin({ right: 14 })

      // card
      Column() {
        Row() {
          Text(item.dishName)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          Blank()
          Text(this.timeLabel(item.timestamp))
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textQuaternary)
        }
        .width('100%')
        .margin({ bottom: 6 })

        if (item.note.length > 0) {
          Text(item.note)
            .fontSize(13)
            .fontColor(Theme.textSecondary)
            .width('100%')
            .margin({ bottom: 10 })
        }

        Row() {
          Text(item.calories + ' kcal')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textQuaternary)
          Blank()
          Row() {
            Button() {
              SvgIcon({ variant: 'edit', iconSize: 14, color: Theme.textTertiary, strokeWidth: 2 })
            }
            .id('checkin-edit-button')
            .width(30)
            .height(30)
            .borderRadius(10)
            .backgroundColor(Theme.inputBg)
            .onClick(() => this.controller.editCheckin(item.id))
            Button() {
              SvgIcon({ variant: 'trash', iconSize: 14, color: Theme.textTertiary, strokeWidth: 2 })
            }
            .id('checkin-delete-button')
            .width(30)
            .height(30)
            .borderRadius(10)
            .backgroundColor(Theme.inputBg)
            .margin({ left: 8 })
            .onClick(() => this.controller.deleteCheckin(item.id))
          }
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)
      }
      .layoutWeight(1)
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .borderRadius(20)
      .shadow(ShadowConfig.card)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
    .margin({ bottom: 18 })
  }

  @Builder
  emptyState() {
    Column() {
      SvgIcon({ variant: 'checkin', iconSize: 56, color: Theme.brandPrimary, strokeWidth: 1.5 })
        .margin({ bottom: 14 })
      Text('今天还没有打卡')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })
      Text('记录第一餐，开启健康饮食的一天')
        .id('checkin-empty-state')
        .fontSize(14)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 40, bottom: 40 })
  }

  private mealColor(meal: MealType): string {
    if (meal === 'breakfast') {
      return Theme.yellow;
    } else if (meal === 'lunch') {
      return Theme.green;
    } else if (meal === 'dinner') {
      return Theme.red;
    }
    return Theme.purple;
  }

  private timeLabel(ts: number): string {
    const d: Date = new Date(ts);
    const h: number = d.getHours();
    const mi: number = d.getMinutes();
    const hh: string = h < 10 ? '0' + h : '' + h;
    const mm: string = mi < 10 ? '0' + mi : '' + mi;
    return hh + ':' + mm;
  }
}
