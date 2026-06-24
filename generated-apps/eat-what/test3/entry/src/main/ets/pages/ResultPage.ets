// ResultPage.ets
//
// 结果详情页（result-page）。深色 Hero + 上拉白底详情卡 + 底部双按钮。

import { AppController } from '../controller/AppController';
import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient } from '../common/Theme';
import { Dish } from '../model/Types';

@Component
export struct ResultPage {
  onBack: () => void = () => {};
  goToEditor: () => void = () => {};
  goToShare: () => void = () => {};
  private controller: AppController = AppController.getInstance();
  @StorageLink('resultDish') dish: Dish | null = null;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          // Hero
          Column() {
            // 返回按钮
            Column() {
              SvgIcon({ variant: 'back-light', iconSize: 20 })
            }
            .id('result-back-button')
            .width(40).height(40).borderRadius(Theme.radiusTiny)
            .backgroundColor('rgba(255,248,240,0.12)')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .position({ x: 18, y: 18 })
            .onClick(() => this.onBack())

            Text('为你选中')
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9E94')
              .backgroundColor('rgba(232,93,78,0.2)')
              .borderRadius(10)
              .padding({ left: 14, right: 14, top: 7, bottom: 7 })
              .margin({ bottom: 18, top: 60 })

            Text(this.dish === null ? '—' : this.dish.name)
              .id('result-dish-name')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnDark)
              .margin({ bottom: 18 })

            Row({ space: 10 }) {
              ForEach(this.heroTags(), (t: string) => {
                Text(t)
                  .fontSize(13)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.textOnDark)
                  .height(32)
                  .borderRadius(Theme.radiusPill)
                  .backgroundColor('rgba(255,248,240,0.12)')
                  .padding({ left: 14, right: 14 })
              }, (t: string) => t)
            }
            .id('result-dish-tags')
            .margin({ bottom: 24 })
          }
          .width('100%')
          .padding({ top: 22, bottom: 46, left: 22, right: 22 })
          .linearGradient(BrandGradient.heroEspresso)
          .alignItems(HorizontalAlign.Center)

          // 详情卡
          Column() {
            Row() {
              SvgIcon({ variant: 'ingredient', iconSize: 20 })
              Text('所需食材')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
                .margin({ left: 8 })
            }
            .margin({ bottom: 14 })

            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.ingredients(), (ing: string) => {
                Text(ing)
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.avocadoText)
                  .height(36)
                  .backgroundColor(Theme.inputBg)
                  .borderRadius(Theme.radiusTiny)
                  .padding({ left: 14, right: 14 })
                  .margin({ right: 10, bottom: 10 })
              }, (ing: string) => ing)
            }
            .width('100%')
            .margin({ bottom: 24 })

            // 推荐语
            Row() {
              Text(this.dish === null ? '' : this.dish.recommend)
                .fontSize(16)
                .fontColor(Theme.textSecondary)
                .lineHeight(26)
            }
            .width('100%')
            .backgroundColor(Theme.cardBg)
            .borderRadius(20)
            .padding(20)
            .shadow({ radius: 24, color: 'rgba(46,43,40,0.06)', offsetY: 8 })
            .margin({ bottom: 24 })

            // 信息网格
            Row({ space: 12 }) {
              Column() {
                Text('预计时间')
                  .fontSize(12)
                  .fontColor(Theme.textTertiary)
                  .margin({ bottom: 6 })
                Text(`${this.dish === null ? 0 : this.dish.estimatedMinutes} 分钟`)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textPrimary)
              }
              .layoutWeight(1)
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusSmall)
              .padding(16)
              .shadow({ radius: 18, color: 'rgba(46,43,40,0.06)', offsetY: 6 })
              .alignItems(HorizontalAlign.Start)

              Column() {
                Text('难度')
                  .fontSize(12)
                  .fontColor(Theme.textTertiary)
                  .margin({ bottom: 6 })
                Text(this.dish === null ? '—' : this.dish.difficulty)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textPrimary)
              }
              .layoutWeight(1)
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusSmall)
              .padding(16)
              .shadow({ radius: 18, color: 'rgba(46,43,40,0.06)', offsetY: 6 })
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
          }
          .width('100%')
          .backgroundColor(Theme.pageBg)
          .borderRadius({ topLeft: Theme.radiusHero, topRight: Theme.radiusHero })
          .margin({ top: -24 })
          .padding({ left: 22, right: 22, top: 28, bottom: 120 })
        }
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)

      // 底部双按钮
      Row({ space: 12 }) {
        Row() {
          SvgIcon({ variant: 'check-in', iconSize: 18 })
          Text('记录打卡')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnDark)
            .margin({ left: 8 })
        }
        .id('result-check-in-button')
        .layoutWeight(1)
        .height(54)
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.tomato)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .shadow({ radius: 24, color: Theme.shadowTomato, offsetY: 10 })
        .onClick(() => {
          this.controller.checkInFromResult();
          this.goToEditor();
        })

        Row() {
          SvgIcon({ variant: 'share-dark', iconSize: 18 })
          Text('分享卡片')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .margin({ left: 8 })
        }
        .id('result-share-button')
        .layoutWeight(1)
        .height(54)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1.5, color: Theme.borderSoft })
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .onClick(() => {
          this.controller.shareFromResult();
          this.goToShare();
        })
      }
      .width('100%')
      .padding({ left: 22, right: 22, top: 14, bottom: 28 })
      .backgroundColor(Theme.pageBg)
    }
    .width('100%')
    .height('100%')
    .id('result-page')
  }

  private ingredients(): string[] {
    return this.dish === null ? [] : this.dish.ingredients;
  }

  private heroTags(): string[] {
    if (this.dish === null) {
      return [];
    }
    const tags: string[] = this.dish.moods.slice();
    if (this.dish.timeScenes.length > 0) {
      tags.push(this.dish.timeScenes[0]);
    }
    return tags;
  }
}
