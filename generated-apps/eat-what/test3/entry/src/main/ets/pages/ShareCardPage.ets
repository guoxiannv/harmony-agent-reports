// ShareCardPage.ets
//
// 分享卡片页（share-card-page）。番茄渐变卡片预览 + 保存/分享按钮。
// 保存到相册与系统分享为 UI 入口；系统能力在 QA 阶段验证（spec §11）。

import { SvgIcon } from '../common/SvgIcon';
import { Theme, BrandGradient } from '../common/Theme';
import { ShareCardModel, formatDateKey } from '../model/Types';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ShareCardPage {
  onBack: () => void = () => {};
  @StorageLink('shareCard') card: ShareCardModel | null = null;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // Top bar
        Row() {
          Column() {
            SvgIcon({ variant: 'back-dark', iconSize: 20 })
          }
          .id('share-back-button')
          .width(40).height(40).borderRadius(Theme.radiusTiny)
          .backgroundColor(Theme.inputBg)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick(() => this.onBack())

          Text('分享卡片')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ left: 14 })
        }
        .width('100%')
        .margin({ bottom: 22 })

        // 预览卡
        Column() {
          // 卡片本体
          Stack({ alignContent: Alignment.TopStart }) {
            // 装饰圆
            Column()
              .width(180).height(180).borderRadius(90)
              .backgroundColor('rgba(255,255,255,0.08)')
              .position({ x: 200, y: -60 })
            Column()
              .width(140).height(140).borderRadius(70)
              .backgroundColor('rgba(255,255,255,0.06)')
              .position({ x: -40, y: 300 })

            // 内容
            Column() {
              Text(this.dateLabel())
                .fontSize(12)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnDark)
                .height(30)
                .backgroundColor('rgba(255,255,255,0.18)')
                .borderRadius(Theme.radiusPill)
                .padding({ left: 14, right: 14 })
                .margin({ bottom: 22 })

              Text(this.dishName())
                .fontSize(40)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnDark)
                .margin({ bottom: 16 })

              Text(this.moodLine())
                .fontSize(13)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnDark)
                .height(30)
                .backgroundColor('rgba(255,255,255,0.2)')
                .borderRadius(10)
                .padding({ left: 12, right: 12 })
                .margin({ bottom: 22 })

              Text(this.quote())
                .fontSize(15)
                .fontColor(Theme.textOnDark)
                .opacity(0.92)
                .lineHeight(24)
                .margin({ bottom: 28 })

              // footer
              Column().width('100%').height(1).backgroundColor('rgba(255,255,255,0.2)').margin({ bottom: 18 })
              Row() {
                Row() {
                  Column() {
                    SvgIcon({ variant: 'app-logo', iconSize: 14 })
                  }
                  .width(26).height(26).borderRadius(13)
                  .backgroundColor('rgba(255,255,255,0.2)')
                  .justifyContent(FlexAlign.Center)
                  .alignItems(HorizontalAlign.Center)

                  Text('今天吃什么')
                    .fontSize(13)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.textOnDark)
                    .opacity(0.9)
                    .margin({ left: 8 })
                }

                SvgIcon({ variant: 'utensils', iconSize: 20 })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              .alignItems(VerticalAlign.Center)
            }
            .padding({ left: 28, right: 28, top: 32, bottom: 32 })
          }
          .id('share-card-preview')
          .width(330)
          .borderRadius(Theme.radiusHero)
          .linearGradient(BrandGradient.shareCard)
          .shadow({ radius: 40, color: 'rgba(232,93,78,0.3)', offsetY: 16 })
          .clip(true)
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .padding({ top: 10, bottom: 24 })
      }
      .width('100%')
      .height('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 110 })

      // 底部按钮
      Row({ space: 12 }) {
        Row() {
          SvgIcon({ variant: 'save-album', iconSize: 18 })
          Text('保存图片')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .margin({ left: 8 })
        }
        .id('share-save-button')
        .layoutWeight(1)
        .height(54)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1.5, color: Theme.borderSoft })
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .onClick(() => {
          this.toast('已保存到相册（演示）');
        })

        Row() {
          SvgIcon({ variant: 'system-share', iconSize: 18 })
          Text('分享')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnDark)
            .margin({ left: 8 })
        }
        .id('share-system-button')
        .layoutWeight(1)
        .height(54)
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.tomato)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .shadow({ radius: 24, color: Theme.shadowTomato, offsetY: 10 })
        .onClick(() => {
          this.toast('已调用系统分享（演示）');
        })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 14, bottom: 28 })
      .backgroundColor(Theme.pageBg)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .id('share-card-page')
  }

  private dateLabel(): string {
    const raw: string = this.card === null ? '' : this.card.date;
    const dateStr: string = raw.length > 0 ? raw : formatDateKey(Date.now());
    const parts: string[] = dateStr.split('-');
    const weekdays: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    const d: Date = new Date(`${parts[0]}-${parts[1]}-${parts[2]}T00:00:00`);
    return `${parts[0]}.${parts[1]}.${parts[2]} ${weekdays[d.getDay()]}`;
  }

  private dishName(): string {
    return this.card === null ? '今天吃什么' : this.card.dishName;
  }

  private moodLine(): string {
    if (this.card === null) {
      return '';
    }
    const mood: string = this.card.moods.length > 0 ? this.card.moods.join('·') : '';
    return mood.length > 0 ? `${mood} · ${this.card.meal}` : this.card.meal;
  }

  private quote(): string {
    return this.card === null ? '每一顿饭，都值得被认真对待。' : this.card.recommend;
  }

  private toast(msg: string): void {
    try {
      promptAction.showToast({ message: msg });
    } catch (err) {
      // 忽略 toast 失败。
    }
  }
}
