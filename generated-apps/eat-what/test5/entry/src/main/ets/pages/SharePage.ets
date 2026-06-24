// SharePage.ets
// 分享卡片: template selection, gradient preview card, caption, save/system-share.
// Save captures the preview node via componentSnapshot and writes a PNG to the app files dir.
// Album write needs photo permission; first version saves to files dir with clear feedback.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionTitle } from '../components/UiKit';
import { ShareService } from '../services/ShareService';
import { common } from '@kit.AbilityKit';
import { toast } from '../common/Feedback';

interface Template {
  id: string;
  name: string;
  colors: [ResourceColor, ResourceColor];
}

const TEMPLATES: Template[] = [
  { id: 'orange', name: '暖橙', colors: ['#FF8C42', '#FFD7A8'] },
  { id: 'green', name: '清新', colors: ['#5A6B58', '#8FA897'] },
  { id: 'cream', name: '奶油', colors: ['#FFF5ED', '#FFE0CC'] },
];

@Component
export struct SharePage {
  title: string = '今日打卡';
  subtitle: string = '记录美好一餐';
  onBack: () => void = () => {};

  @State selected: number = 0;
  @State caption: string = '简单的一餐，也是幸福的一天。';
  @State dateLabel: string = '';

  aboutToAppear() {
    const d = new Date();
    const y = d.getFullYear();
    const m = d.getMonth() + 1;
    const day = d.getDate();
    this.dateLabel = '' + y + '.' + (m < 10 ? '0' + m : m) + '.' + (day < 10 ? '0' + day : day);
  }

  build() {
    Scroll() {
      Column() {
        // Header
        Row({ space: 12 }) {
          this.BackBtn()
          Text('分享卡片')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ bottom: 24 })

        // Template selection
        SectionTitle({ text: '选择模板' })
        Row({ space: 12 }) {
          ForEach(TEMPLATES, (t: Template, idx: number) => {
            Column()
              .width(72)
              .height(96)
              .borderRadius(14)
              .linearGradient({
                angle: 160,
                direction: GradientDirection.Bottom,
                colors: [[t.colors[0] as string, 0.0], [t.colors[1] as string, 1.0]],
              } as LinearGradient)
              .border({ width: this.selected === idx ? 2 : 0, color: Theme.brandPrimary })
              .onClick(() => { this.selected = idx; })
          }, (t: Template) => t.id)
        }
        .id('share-template-list')
        .width('100%')
        .margin({ bottom: 24 })

        // Preview card
        Column() {
          Column() {
            Text('TODAY\'S MEAL')
              .fontSize(13)
              .fontColor(this.textColor())
              .opacity(0.85)
              .alignSelf(ItemAlign.Start)
              .letterSpacing(1)
            Text(this.title)
              .fontSize(44)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.textColor())
              .lineHeight(48)
              .margin({ top: 16 })
              .alignSelf(ItemAlign.Start)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)

          Column() {
            Text('"' + this.caption + '"')
              .fontSize(16)
              .fontColor(this.textColor())
              .opacity(0.95)
              .lineHeight(24)
              .margin({ bottom: 20 })
              .alignSelf(ItemAlign.Start)
            Text(this.dateLabel + ' · ' + this.subtitle)
              .fontSize(14)
              .fontColor(this.textColor())
              .opacity(0.9)
              .alignSelf(ItemAlign.Start)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
        .id('share-card-preview')
        .width(320)
        .height(440)
        .padding(32)
        .borderRadius(28)
        .justifyContent(FlexAlign.SpaceBetween)
        .linearGradient({
          angle: 165,
          direction: GradientDirection.Bottom,
          colors: [[TEMPLATES[this.selected].colors[0] as string, 0.0],
          [TEMPLATES[this.selected].colors[1] as string, 1.0]],
        } as LinearGradient)
        .shadow({ radius: 40, color: 'rgba(46,42,37,0.16)', offsetY: 12 })
        .margin({ bottom: 24 })

        // Caption
        SectionTitle({ text: '卡片文案' })
        TextInput({ text: this.caption })
          .id('share-caption-input')
          .width('100%')
          .fontSize(15)
          .fontColor(Theme.textPrimary)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.paper)
          .border({ width: 1.5, color: Theme.border })
          .margin({ bottom: 24 })
          .onChange((v: string) => { this.caption = v; })

        // Action row
        Row({ space: 12 }) {
          Text('保存到相册')
            .id('share-save-button')
            .layoutWeight(1)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.white)
            .textAlign(TextAlign.Center)
            .padding({ top: 16, bottom: 16 })
            .borderRadius(Theme.radiusButton)
            .linearGradient(BrandGradient.orange)
            .onClick(() => this.save())

          Text('分享')
            .id('share-system-button')
            .layoutWeight(1)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.white)
            .textAlign(TextAlign.Center)
            .padding({ top: 16, bottom: 16 })
            .borderRadius(Theme.radiusButton)
            .backgroundColor(Theme.dark)
            .onClick(() => this.share())
        }
        .width('100%')
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }

  private textColor(): string {
    // Cream template uses dark text on light bg; others use white.
    return this.selected === 2 ? Theme.textPrimary : Theme.white;
  }

  private async save(): Promise<void> {
    const ctx = getContext(this) as common.UIAbilityContext;
    const path = await ShareService.captureAndSave(ctx, 'share-card-preview');
    if (path.length > 0) {
      toast('已保存到本地（相册写入需系统授权）');
    } else {
      toast('保存失败，请稍后重试');
    }
  }

  private async share(): Promise<void> {
    const ctx = getContext(this) as common.UIAbilityContext;
    const path = await ShareService.captureAndSave(ctx, 'share-card-preview');
    if (path.length > 0) {
      toast('卡片已生成，可用相册或文件分享');
    } else {
      toast('生成失败，请稍后重试');
    }
  }

  @Builder
  BackBtn() {
    Row() {
      SvgIcon({ variant: 'back', iconSize: 22 })
    }
    .width(44)
    .height(44)
    .borderRadius(Theme.radiusTiny)
    .backgroundColor(Theme.lightGray)
    .justifyContent(FlexAlign.Center)
    .onClick(() => this.onBack())
  }
}
