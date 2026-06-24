import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Settings } from '../model/Models';

@Component
export struct ProfilePage {
  onOpenPoints: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private checkInPointsText: string = '5';
  @State private spendRatioText: string = '1';
  @State private sleepThresholdText: string = '45';
  @State private notificationsEnabled: boolean = true;
  @State private saving: boolean = false;
  @State private infoMessage: string = '';
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    const s: Settings = controller.settings;
    this.checkInPointsText = s.checkInPoints.toString();
    this.spendRatioText = s.spendRatio.toString();
    this.sleepThresholdText = s.sleepThresholdDays.toString();
    this.notificationsEnabled = s.notificationsEnabled;
    this.isReady = true;
  }

  private parseNumber(raw: string): number {
    const n: number = parseInt(raw, 10);
    if (isNaN(n) || n < 0) {
      return 0;
    }
    return n;
  }

  private async onSave(): Promise<void> {
    if (this.saving || !this.controller) {
      return;
    }
    this.saving = true;
    this.infoMessage = '';

    const settings: Settings = new Settings();
    settings.checkInPoints = this.parseNumber(this.checkInPointsText);
    settings.spendRatio = this.parseNumber(this.spendRatioText);
    settings.sleepThresholdDays = this.parseNumber(this.sleepThresholdText);
    settings.notificationsEnabled = this.notificationsEnabled;

    try {
      await this.controller.saveSettings(settings);
      this.saving = false;
      this.infoMessage = '设置已保存';
    } catch (e) {
      this.saving = false;
      this.infoMessage = '保存失败，请重试';
    }
  }

  build(): void {
    Column() {
      this.HeaderBar()
      Scroll() {
        Column() {
          this.OwnerCard()
          this.PointsEntry()
          this.SettingsCard()
          this.SaveButton()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 140 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Bottom,
      colors: [[Theme.pageBgStart, 0.0], [Theme.pageBgMid, 0.55], [Theme.pageBgEnd, 1.0]],
    })
  }

  @Builder
  HeaderBar(): void {
    Row() {
      Text('我的')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  OwnerCard(): void {
    Row() {
      Column() {
        Text('主')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textLight)
          .fontFamily('cursive')
      }
      .id('profile-avatar')
      .width(72)
      .height(72)
      .borderRadius(36)
      .backgroundColor(Theme.darkCardBg)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column() {
        Text('主理人')
          .id('profile-name')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('手作·印记 工作室')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .margin({ left: 14 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 16 })
  }

  @Builder
  PointsEntry(): void {
    Row() {
      Column() {
        Text('积分明细')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text('查看全店积分流水与兑换')
          .fontSize(12)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('›')
        .fontSize(20)
        .fontColor(Theme.textSecondary)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 16 })
    .onClick(() => this.onOpenPoints())
  }

  @Builder
  SectionLabel(label: string): void {
    Text(label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .margin({ top: 4, bottom: 10 })
  }

  @Builder
  SettingsCard(): void {
    Column() {
      this.SectionLabel('运营设置')

      this.SettingRow('每日签到积分', this.checkInPointsText, 'profile-check-in-points-setting', (v: string) => {
        this.checkInPointsText = v;
      }, '签到一次获得的积分数')

      this.Divider()

      this.SettingRow('消费积分比', this.spendRatioText, 'profile-spend-ratio-setting', (v: string) => {
        this.spendRatioText = v;
      }, '每消费 1 元获得的积分数')

      this.Divider()

      this.SettingRow('沉睡阈值（天）', this.sleepThresholdText, 'profile-sleeping-threshold-setting', (v: string) => {
        this.sleepThresholdText = v;
      }, '超过此天数未到店视为沉睡')

      this.Divider()

      Row() {
        Column() {
          Text('推送通知')
            .fontSize(14)
            .fontColor(Theme.textPrimary)
          Text('沉睡与低库存提醒')
            .fontSize(12)
            .fontColor(Theme.textSecondary)
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Toggle({ type: ToggleType.Switch, isOn: this.notificationsEnabled })
          .id('profile-notification-toggle')
          .selectedColor(Theme.clay)
          .onChange((on: boolean) => {
            this.notificationsEnabled = on;
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 4 })

      if (this.infoMessage.length > 0) {
        Text(this.infoMessage)
          .fontSize(13)
          .fontColor(Theme.moss)
          .backgroundColor('rgba(126, 146, 115, 0.16)')
          .borderRadius(10)
          .padding({ left: 12, right: 12, top: 10, bottom: 10 })
          .margin({ top: 14 })
          .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 16 })
  }

  @Builder
  Divider(): void {
    Column()
      .width('100%')
      .height(1)
      .backgroundColor(Theme.cardDivider)
      .margin({ top: 10, bottom: 6 })
  }

  @Builder
  SettingRow(label: string, value: string, inputId: string, onChange: (v: string) => void, hint: string): void {
    Row() {
      Column() {
        Text(label)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
        Text(hint)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      TextInput({ text: value })
        .id(inputId)
        .type(InputType.Number)
        .width(96)
        .height(44)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .backgroundColor(Theme.pageBgEnd)
        .borderRadius(12)
        .border({ width: 1, color: Theme.borderDefault })
        .textAlign(TextAlign.Center)
        .padding({ left: 8, right: 8 })
        .onChange((v: string) => onChange(v))
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 12, bottom: 4 })
  }

  @Builder
  SaveButton(): void {
    Text('保存设置')
      .fontSize(16)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textLight)
      .backgroundColor(this.saving || !this.isReady ? Theme.disabledBg : Theme.clay)
      .borderRadius(Theme.radiusButton)
      .padding({ left: 26, right: 26, top: 14, bottom: 14 })
      .width('100%')
      .textAlign(TextAlign.Center)
      .shadow(Theme.shadowButton())
      .onClick(() => this.onSave())
  }
}
