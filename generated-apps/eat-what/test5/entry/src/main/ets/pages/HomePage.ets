// HomePage.ets
// 首页: today status card + quick-action grid + recent checkins. Built from page-home-page.html.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionTitle, FeatureCard } from '../components/UiKit';
import { Store } from '../services/Store';
import { Checkin } from '../model/Models';
import { mealLabel } from '../model/Enums';

@Component
export struct HomePage {
  goToWheel: () => void = () => {};
  goToIngredient: () => void = () => {};
  goToFilter: () => void = () => {};
  goToCheckin: () => void = () => {};
  goToSettings: () => void = () => {};

  @State greeting: string = '今天想吃点什么？';
  @State todayText: string = '还没决定\n今天吃什么？';
  @State todayDesc: string = '转一转，让命运决定今日美味。';
  @State recent: Checkin[] = [];

  async aboutToAppear() {
    await Store.ensureLoaded();
    this.refresh();
  }

  private refresh(): void {
    const status = Store.todayStatus();
    const list = Store.recentCheckins(6);
    this.recent = list;
    if (status.count === 0) {
      this.todayText = '还没决定\n今天吃什么？';
      this.todayDesc = '转一转，让命运决定今日美味。';
    } else {
      this.todayText = '今日已记录 ' + status.count + ' 餐';
      this.todayDesc = '继续保持，记录每一餐的美好。';
    }
  }

  build() {
    Column() {
      // Header
      Row() {
        Column() {
          Text(this.greeting)
            .fontSize(13)
            .fontColor(Theme.warmGray)
            .margin({ bottom: 4 })
          Text('今天吃什么')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Row() {
          SvgIcon({ variant: 'settings', iconSize: 22 })
        }
        .width(44)
        .height(44)
        .borderRadius(Theme.radiusTiny)
        .backgroundColor(Theme.lightGray)
        .justifyContent(FlexAlign.Center)
        .onClick(() => this.goToSettings())
      }
      .width('100%')
      .margin({ bottom: 24 })

      // Today card
      Row() {
        Column() {
          Text('今日状态')
            .fontSize(13)
            .fontColor(Theme.orangeDark)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 })
          Text(this.todayText)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .lineHeight(28)
            .margin({ bottom: 10 })
          Text(this.todayDesc)
            .fontSize(14)
            .fontColor(Theme.warmGray)
            .lineHeight(20)
          Text('去转盘')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.white)
            .padding({ left: 20, right: 20, top: 12, bottom: 12 })
            .borderRadius(Theme.radiusButton)
            .linearGradient(BrandGradient.orange)
            .margin({ top: 14 })
            .onClick(() => this.goToWheel())
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        SvgIcon({ variant: 'chef', iconSize: 80 })
      }
      .id('home-today-status-card')
      .width('100%')
      .padding(24)
      .borderRadius(Theme.radiusHero)
      .linearGradient(BrandGradient.todayCard)
      .shadow({ radius: 20, color: 'rgba(46,42,37,0.06)', offsetY: 6 })
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 24 })

      // Quick grid
      SectionTitle({ text: '快捷入口' })
      Row() {
        FeatureCard({
          icon: 'spin', tint: Theme.tintOrange, title: '转盘抽菜', desc: '随机决定今天吃什么',
          cardId: 'home-spin-wheel-button', onTap: (): void => this.goToWheel(),
        })
        FeatureCard({
          icon: 'ingredient', tint: Theme.tintGreen, title: '冰箱食材', desc: '看看能做什么菜',
          cardId: 'home-ingredient-button', onTap: (): void => this.goToIngredient(),
        })
      }
      .width('100%')
      .margin({ bottom: 12 })
      Row() {
        FeatureCard({
          icon: 'filter', tint: Theme.tintSage, title: '心情筛选', desc: '按心情和时段选菜',
          cardId: 'home-filter-button', onTap: (): void => this.goToFilter(),
        })
        FeatureCard({
          icon: 'daily', tint: Theme.tintOlive, title: '每日打卡', desc: '记录每一餐',
          cardId: 'home-checkin-button', onTap: (): void => this.goToCheckin(),
        })
      }
      .width('100%')
      .margin({ bottom: 28 })

      // Recent checkins
      SectionTitle({ text: '最近打卡' })
      if (this.recent.length === 0) {
        Row() {
          Text('还没有打卡记录，去记录第一餐吧')
            .fontSize(14)
            .fontColor(Theme.warmGray)
        }
        .width('100%')
        .padding({ top: 24, bottom: 24 })
        .justifyContent(FlexAlign.Center)
        .id('home-empty-checkin')
      } else {
        List({ space: 10 }) {
          ForEach(this.recent, (c: Checkin) => {
            ListItem() {
              Row() {
                Column() {
                  Text(mealLabel(c.meal))
                    .fontSize(12)
                    .fontColor(Theme.warmGray)
                    .margin({ bottom: 6 })
                  Text(c.dishName)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.textPrimary)
                    .margin({ bottom: 8 })
                  Text(this.dateLabel(c))
                    .fontSize(11)
                    .fontColor(Theme.sage)
                    .fontWeight(FontWeight.Medium)
                }
                .alignItems(HorizontalAlign.Start)
              }
              .id('home-checkin-' + c.id)
              .width(140)
              .padding(14)
              .borderRadius(Theme.radiusCard)
              .backgroundColor(Theme.paper)
              .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
            }
          }, (c: Checkin) => c.id)
        }
        .id('home-recent-checkin-list')
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
        .width('100%')
        .height(120)
      }
    }
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
  }

  private dateLabel(c: Checkin): string {
    const d = new Date(c.createdAt);
    const hh = d.getHours();
    const mm = d.getMinutes();
    const mmStr = mm < 10 ? '0' + mm : '' + mm;
    const hhStr = hh < 10 ? '0' + hh : '' + hh;
    const tk = this.todayKey();
    if (c.dateKey === tk) {
      return '今天 ' + hhStr + ':' + mmStr;
    }
    return c.dateKey.slice(5).replace('-', '/') + ' ' + hhStr + ':' + mmStr;
  }

  private todayKey(): string {
    const d = new Date();
    const y = d.getFullYear();
    const m = d.getMonth() + 1;
    const day = d.getDate();
    const mm = m < 10 ? '0' + m : '' + m;
    const dd = day < 10 ? '0' + day : '' + day;
    return '' + y + '-' + mm + '-' + dd;
  }
}
