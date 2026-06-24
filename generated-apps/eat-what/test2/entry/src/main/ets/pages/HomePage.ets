// HomePage.ets
//
// 今日决策首页 (surface: home). Faithful to page-home.html:
// dark hero with quick-wheel + filter actions, today check-in status,
// a "为你推荐" dish list driven by the active filter, and a floating
// add-record button.

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Dish } from '../common/Models';
import { RecommendService } from '../services/RecommendService';
import { filterStore, recordStore } from '../services/AppServices';
import { DateUtil } from '../common/DateUtil';

const WEEKDAYS: string[] = ['日', '一', '二', '三', '四', '五', '六'];

function todayLabel(): string {
  const d = new Date();
  return `${d.getMonth() + 1}月${d.getDate()}日 星期${WEEKDAYS[d.getDay()]}`;
}

@Component
export struct HomePage {
  goToWheel: () => void = () => {};
  goToFilter: () => void = () => {};
  openAddRecord: () => void = () => {};

  @State todayRecordStatus: string = '尚未打卡';
  @State recommendations: Dish[] = [];

  aboutToAppear(): void {
    this.refresh();
  }

  private async refresh(): Promise<void> {
    let count = 0;
    try {
      count = await recordStore.countForDay(DateUtil.today());
    } catch (e) {
      count = 0;
    }
    this.todayRecordStatus = count === 0 ? '今日还未打卡' : `已记录 ${count} 餐`;
    this.recommendations = RecommendService.filterByCriteria(filterStore.get()).slice(0, 5);
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // hero
        Column() {
          Text(todayLabel())
            .id('home-title')
            .fontSize(13)
            .fontColor('rgba(255,255,255,0.72)')
            .margin({ bottom: 6 })
          Text('今天吃什么？')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnDark)
            .lineHeight(34)
            .margin({ bottom: 20 })

          Row() {
            // quick wheel button
            Row() {
              SvgIcon({ variant: 'wheel', iconSize: 20, strokeWidth: 2.5 })
              Text('转一转')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textOnDark)
                .margin({ left: 8 })
            }
            .id('home-quick-wheel-button')
            .padding({ left: 28, right: 28, top: 14, bottom: 14 })
            .borderRadius(Theme.radiusButton)
            .linearGradient(BrandGradient.brand)
            .shadow({ radius: 24, color: 'rgba(255,107,53,0.32)', offsetY: 8 })
            .onClick(() => this.goToWheel())

            // filter icon button
            Column() {
              SvgIcon({ variant: 'filter', iconSize: 22, strokeWidth: 2 })
            }
            .id('home-filter-button')
            .width(Theme.touchTarget)
            .height(Theme.touchTarget)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor('rgba(255,255,255,0.10)')
            .border({ width: 1, color: 'rgba(255,255,255,0.14)' })
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .margin({ left: 12 })
            .onClick(() => this.goToFilter())
          }
          .width('100%')
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 28 })
        .linearGradient(BrandGradient.hero)
        .borderRadius({ bottomLeft: Theme.radiusHero, bottomRight: Theme.radiusHero })

        // status card
        Column() {
          Row() {
            Text('今日打卡')
              .fontSize(15)
              .fontColor(Theme.textSecondary)
            Blank()
            Text(this.todayRecordStatus)
              .id('home-today-record-status')
              .fontSize(12)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.teal)
              .padding({ left: 12, right: 12, top: 6, bottom: 6 })
              .borderRadius(Theme.radiusPill)
              .backgroundColor(Theme.tealSoft)
          }
          .width('100%')
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 24 })

        // recommendations
        Column() {
          Row() {
            Text('为你推荐')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Blank()
            Text('基于当前筛选')
              .fontSize(13)
              .fontColor(Theme.textTertiary)
          }
          .width('100%')
          .margin({ bottom: 16 })

          if (this.recommendations.length === 0) {
            this.EmptyRecommendations()
          } else {
            Column() {
              this.DishList()
            }
            .width('100%')
            .padding(18)
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusCard)
            .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 24 })

        // quick check-in hint
        Column() {
          Text('快速打卡')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 8 })
          Text('记录今天吃了什么，养成健康饮食小习惯。')
            .fontSize(13)
            .fontColor(Theme.textTertiary)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 24 })
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Start)

      // floating add-record button
      Column() {
        SvgIcon({ variant: 'add-record', iconSize: 24, strokeWidth: 2.5 })
      }
      .id('home-add-record-button')
      .width(52)
      .height(52)
      .borderRadius(26)
      .linearGradient(BrandGradient.brand)
      .shadow({ radius: 24, color: 'rgba(255,107,53,0.32)', offsetY: 8 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .position({ x: '78%', y: '82%' })
      .onClick(() => this.openAddRecord())
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  DishList() {
    List({ space: 12 }) {
      ForEach(this.recommendations, (dish: Dish) => {
        ListItem() {
          this.DishItem(dish)
        }
      }, (dish: Dish) => dish.id)
    }
    .width('100%')
    .id('home-recommend-list')
    .scrollBar(BarState.Off)
    .height(this.recommendations.length * 80)
  }

  @Builder
  DishItem(dish: Dish) {
    Row() {
      // thumb
      Column() {
        SvgIcon({ variant: dishIconVariant(dish), iconSize: 28, strokeWidth: 2 })
      }
      .width(56)
      .height(56)
      .borderRadius(Theme.radiusSmall)
      .linearGradient(dishThumbGradient(dish))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text(dish.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .margin({ bottom: 4 })
        Row() {
          Text(`${dish.cookMinutes} 分钟`)
            .fontSize(12)
            .fontColor(Theme.textTertiary)
          Text(dish.tags.length > 0 ? dish.tags[0] : '')
            .fontSize(11)
            .fontColor(Theme.brandPrimary)
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .borderRadius(Theme.radiusTiny)
            .backgroundColor(Theme.brandOrangeSoft)
            .margin({ left: 8 })
        }
        .alignItems(VerticalAlign.Center)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 14 })
      .layoutWeight(1)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(12)
    .borderRadius(16)
    .border({ width: 1, color: Theme.borderCard })
  }

  @Builder
  EmptyRecommendations() {
    Column() {
      SvgIcon({ variant: 'empty-no-recommend', iconSize: 48, strokeWidth: 1.5 })
      Text('暂无推荐')
        .fontSize(15)
        .fontColor(Theme.textSecondary)
        .margin({ top: 12, bottom: 6 })
      Text('添加冰箱食材或调整筛选，发现更多美味')
        .fontSize(13)
        .fontColor(Theme.textTertiary)
    }
    .id('home-empty-recommendations')
    .width('100%')
    .padding({ top: 32, bottom: 32, left: 20, right: 20 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 32, color: 'rgba(0,0,0,0.06)', offsetY: 12 })
    .alignItems(HorizontalAlign.Center)
  }
}

// Pick a thumb gradient for a dish, cycling a small palette deterministically.
export function dishThumbGradient(dish: Dish): LinearGradient {
  const idx = hashIndex(dish.id, 3);
  if (idx === 0) {
    return BrandGradient.thumbGold;
  } else if (idx === 1) {
    return BrandGradient.thumbTeal;
  }
  return BrandGradient.thumbPink;
}

export function dishIconVariant(dish: Dish): string {
  if (dish.id === 'dish-tomato-egg' || dish.tags.indexOf('家常') >= 0) {
    return 'dish-tomato-egg';
  } else if (dish.id === 'dish-mapo-tofu' || dish.tags.indexOf('辣') >= 0) {
    return 'dish-mapo';
  } else if (dish.id === 'dish-steamed-fish' || dish.tags.indexOf('清淡') >= 0) {
    return 'dish-fish';
  }
  return 'dish-tomato-egg';
}

function hashIndex(id: string, mod: number): number {
  let h = 0;
  for (let i = 0; i < id.length; i++) {
    h = (h * 31 + id.charCodeAt(i)) % 9973;
  }
  return h % mod;
}
