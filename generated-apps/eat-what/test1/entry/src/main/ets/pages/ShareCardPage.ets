// ShareCardPage — 分享卡片 (preview + template selector + save/share).
//
// The card preview is bound to controller.shareCardData. Template switching is
// fully functional. Save/Share capture the card node to a PNG in the app cache
// and hand the file URI to ShareService (systemShare / album). Cross-app sharing
// of a sandbox image may need additional permission/file-provider setup at
// runtime — see handoff.
import { AppController } from '../controller/AppController';
import { ShareCardData } from '../model/ShareCardData';
import { ShareTemplate } from '../model/Enums';
import { Theme, ShadowConfig, BrandGradient } from '../common/Theme';
import { componentSnapshot } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';

interface TemplateOption {
  key: ShareTemplate;
  gradient: LinearGradient;
  label: string;
}

@Component
export struct ShareCardPage {
  controller: AppController = AppController.getInstance();

  private templates(): TemplateOption[] {
    const list: TemplateOption[] = [];
    const classic: TemplateOption = { key: 'classic', gradient: BrandGradient.primary as LinearGradient, label: '经典金' };
    const warm: TemplateOption = { key: 'warm', gradient: BrandGradient.yellow as LinearGradient, label: '温暖橙' };
    const fresh: TemplateOption = { key: 'fresh', gradient: BrandGradient.green as LinearGradient, label: '清新绿' };
    list.push(classic);
    list.push(warm);
    list.push(fresh);
    return list;
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          // header
          Row() {
            Button() {
              Text('‹')
                .fontSize(24)
                .fontColor(Theme.textPrimary)
            }
            .width(40)
            .height(40)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.cardBg)
            .shadow(ShadowConfig.soft)
            .onClick(() => this.controller.back())
            Text('分享卡片')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .margin({ left: 12 })
          }
          .width('100%')
          .margin({ top: 20, bottom: 12 })

          // card stage
          Column() {
            this.cardFace()
          }
          .width('100%')
          .padding({ top: 20, bottom: 20 })

          // template selector
          Row() {
            ForEach(this.templates(), (opt: TemplateOption) => {
              Column()
                .width(64)
                .height(64)
                .borderRadius(16)
                .linearGradient(opt.gradient)
                .border({
                  width: this.controller.shareSelectedTemplate === opt.key ? 3 : 0,
                  color: this.controller.shareSelectedTemplate === opt.key ? Theme.brandPrimary : Color.Transparent,
                })
                .margin({ right: 12 })
                .onClick(() => this.controller.selectTemplate(opt.key))
            }, (opt: TemplateOption) => opt.key)
          }
          .width('100%')
          .id('share-template-selector')
          .margin({ bottom: 18 })

          // actions
          Row() {
            Button('保存到相册')
              .id('share-save-button')
              .layoutWeight(1)
              .height(52)
              .borderRadius(Theme.radiusButton)
              .backgroundColor(Theme.cardBg)
              .fontColor(Theme.brandPrimary)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .border({ width: 1.5, color: Theme.brandPrimary })
              .onClick(() => this.save())
            Button('分享卡片')
              .id('share-share-button')
              .layoutWeight(1)
              .height(52)
              .borderRadius(Theme.radiusButton)
              .backgroundColor(Theme.brandPrimary)
              .fontColor('#FFFFFF')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 12 })
              .onClick(() => this.share())
          }
          .width('100%')
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 30 })
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  cardFace() {
    Column() {
      // header
      Column() {
        Text(this.dateLabel())
          .fontSize(13)
          .fontColor('#FFFFFF')
          .opacity(0.85)
        Text('今天吃什么')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FFFFFF')
          .opacity(0.95)
          .margin({ top: 6 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Blank()

      // body
      Column() {
        Text(this.dishTitle())
          .fontSize(34)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .textAlign(TextAlign.Center)
          .margin({ bottom: 14 })
        Text(this.quote())
          .fontSize(15)
          .fontColor('#FFFFFF')
          .opacity(0.92)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Blank()

      // footer
      Row() {
        Column() {
          Text('' + this.streakValue())
            .fontSize(28)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
          Text('连续打卡天')
            .fontSize(12)
            .fontColor('#FFFFFF')
            .opacity(0.85)
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
        Blank()
        Text('今天吃什么')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .opacity(0.9)
      }
      .width('100%')
      .alignItems(VerticalAlign.Bottom)
    }
    .id('share-card-preview')
    .width(300)
    .height(420)
    .padding(28)
    .borderRadius(28)
    .linearGradient(this.cardGradient())
    .shadow({ radius: 50, color: 'rgba(0,0,0,0.14)', offsetX: 0, offsetY: 20 })
  }

  private data(): ShareCardData | null {
    return this.controller.shareCardData;
  }

  private dishTitle(): string {
    const d: ShareCardData | null = this.data();
    return d !== null ? d.title : '今日推荐';
  }

  private quote(): string {
    const d: ShareCardData | null = this.data();
    return d !== null && d.moodLine.length > 0 ? '"' + d.moodLine + '"' : '"好好吃饭，认真生活"';
  }

  private streakValue(): number {
    const d: ShareCardData | null = this.data();
    return d !== null ? d.streakDays : this.controller.streakDays;
  }

  private dateLabel(): string {
    const d: ShareCardData | null = this.data();
    const key: string = d !== null ? d.dateKey : this.controller.todayKey;
    if (key.length >= 10) {
      return key.replace(/-/g, '.');
    }
    return '';
  }

  private cardGradient(): LinearGradient {
    const t: ShareTemplate = this.controller.shareSelectedTemplate;
    if (t === 'warm') {
      return BrandGradient.yellow as LinearGradient;
    } else if (t === 'fresh') {
      return BrandGradient.green as LinearGradient;
    }
    return BrandGradient.primary as LinearGradient;
  }

  private async captureToFile(): Promise<string> {
    try {
      const pixel: image.PixelMap = await componentSnapshot.get('share-card-preview');
      const packer: image.ImagePacker = image.createImagePacker();
      const data: ArrayBuffer = await packer.packing(pixel, { format: 'image/png', quality: 100 });
      const ctx: common.Context = getContext(this);
      const path: string = ctx.cacheDir + '/share_card.png';
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, data);
      fs.closeSync(file);
      return 'file://' + path;
    } catch (e) {
      return '';
    }
  }

  private save(): void {
    this.captureToFile().then((uri: string) => {
      if (uri.length === 0) {
        promptAction.showToast({ message: '卡片生成失败' });
        return;
      }
      const ctx: common.Context = getContext(this);
      this.controller.saveCard(ctx, uri).then((saved: string) => {
        promptAction.showToast({ message: saved.length > 0 ? '已保存到相册' : '保存未完成' });
      });
    });
  }

  private share(): void {
    this.captureToFile().then((uri: string) => {
      if (uri.length === 0) {
        promptAction.showToast({ message: '卡片生成失败' });
        return;
      }
      const ctx: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
      this.controller.shareCard(ctx, uri).then(() => {
      });
    });
  }
}
