import { AppController } from '../viewmodel/AppController';
import { AppSettings } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct SettingsPage {
  @ObjectLink ctrl: AppController;
  onBack: () => void = () => {};
  @State threshold: string = '';
  @State ratio: string = '';

  aboutToAppear(): void {
    this.threshold = `${this.ctrl.settings.dormantThresholdDays}`;
    this.ratio = `${this.ctrl.settings.pointsRatio}`;
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Button() {
            SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary })
          }
          .width(40)
          .height(40)
          .backgroundColor(Color.Transparent)
          .onClick(() => this.onBack())

          Text('设置')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)

          Blank().width(40)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        this.Field('沉睡会员阈值（天）', 'settings-dormant-threshold-input', '例如 60', this.threshold, (v: string) => this.threshold = v)
        this.Field('消费积分比例（1 元 = ? 积分）', 'settings-points-ratio-input', '例如 1', this.ratio, (v: string) => this.ratio = v)

        Row({ space: 12 }) {
          Button('备份数据')
            .id('settings-backup-button')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnAccent)
            .backgroundColor(Theme.terracotta)
            .borderRadius(999)
            .onClick(() => promptAction.showToast({ message: '数据已备份到本地 Preferences' }))

          Button('恢复数据')
            .id('settings-restore-button')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .border({ width: 1.5, color: Theme.terracotta })
            .borderRadius(999)
            .onClick(async () => {
              await this.ctrl.loadAll();
              promptAction.showToast({ message: '数据已恢复' });
            })
        }
        .width('100%')
        .margin({ top: 16 })

        Button('保存设置')
          .width('100%')
          .height(48)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(Theme.terracotta)
          .borderRadius(999)
          .margin({ top: 24 })
          .onClick(async () => {
            const s: AppSettings = new AppSettings();
            s.dormantThresholdDays = parseInt(this.threshold, 10) || 60;
            s.pointsRatio = parseFloat(this.ratio) || 1;
            await this.ctrl.updateSettings(s);
            promptAction.showToast({ message: '设置已保存' });
            this.onBack();
          })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }

  @Builder
  Field(label: string, id: string, placeholder: string, value: string, onChange: (v: string) => void) {
    Text(label)
      .fontSize(Theme.captionSize)
      .fontColor(Theme.textTertiary)
      .width('100%')
      .margin({ bottom: 6 })
    TextInput({ placeholder: placeholder, text: value })
      .id(id)
      .width('100%')
      .height(48)
      .backgroundColor(Theme.inputBg)
      .borderRadius(Theme.radiusSmall)
      .placeholderColor(Theme.textPlaceholder)
      .fontSize(Theme.bodySize)
      .padding({ left: 16, right: 16 })
      .margin({ bottom: 16 })
      .onChange(onChange)
  }
}
