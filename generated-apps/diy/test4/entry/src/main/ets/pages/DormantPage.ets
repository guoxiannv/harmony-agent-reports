import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { Member } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct DormantPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBack: () => void = () => {};

  @State thresholdInput: string = '';

  build() {
    Column() {
      this.Header('沉睡提醒')

      Scroll() {
        Column({ space: 16 }) {
          Row() {
            Text('沉睡会员')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Text(`${this.state.dormantMembers().length} 人`)
              .id('dormant-count')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.alert)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          Row({ space: 8 }) {
            Text('沉睡阈值（天）')
              .fontSize(14)
              .fontColor(Theme.textSecondary)
            TextInput({ text: this.thresholdInput, placeholder: '30' })
              .id('dormant-threshold-input')
              .width(120)
              .height(40)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.cardBg)
              .type(InputType.Number)
              .onChange((v) => this.thresholdInput = v)
            Button('应用', { type: ButtonType.Normal })
              .height(40)
              .borderRadius(12)
              .backgroundColor(Theme.brandPrimary)
              .fontColor(Theme.textOnBrand)
              .onClick(() => this.applyThreshold())
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .alignItems(VerticalAlign.Center)

          Button('一键唤醒全部', { type: ButtonType.Normal })
            .id('dormant-wake-all-button')
            .width('100%')
            .height(44)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.alert)
            .fontColor(Theme.textOnBrand)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .onClick(() => this.wakeAll())

          Column({ space: 0 }) {
            ForEach(this.state.dormantMembers(), (m: Member, index: number) => {
              this.DormantItem(m, index)
            }, (m: Member) => m.id)
          }
          .id('dormant-list')
          .width('100%')
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.state.dormantMembers().length === 0) {
            Column({ space: 8 }) {
              Text('暂无沉睡会员')
                .id('dormant-empty-state')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
              Text('所有会员都在活跃中')
                .fontSize(13)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(32)
          }
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header(title: string) {
    Stack({ alignContent: Alignment.Center }) {
      Column()
        .width('100%')
        .height(56)
        .linearGradient({
          angle: 180,
          direction: GradientDirection.Bottom,
          colors: [[Theme.headerGradientStart, 0.0], [Theme.headerGradientEnd, 1.0]]
        })
        .borderRadius({ bottomLeft: 28, bottomRight: 28 })

      Row() {
        Button({ type: ButtonType.Circle }) {
          Text('<')
            .fontSize(18)
            .fontColor(Theme.textOnBrand)
        }
        .id('back-button')
        .width(40)
        .height(40)
        .backgroundColor('rgba(255,255,255,0.16)')
        .onClick(() => this.onBack())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  DormantItem(m: Member, index: number) {
    Row() {
      Column({ space: 4 }) {
        Text(m.name)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(`最后活跃：${this.formatDate(m.lastActiveAt)}`)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Button('唤醒', { type: ButtonType.Normal })
        .id(`dormant-wake-button-${m.id}`)
        .height(32)
        .borderRadius(10)
        .backgroundColor(Theme.brandSoft)
        .fontColor(Theme.brandPrimary)
        .fontSize(13)
        .padding({ left: 12, right: 12 })
        .onClick(() => this.wakeMember(m.id))
    }
    .id(`dormant-item-${m.id}`)
    .width('100%')
    .padding(16)
    .border({ width: { bottom: index < this.state.dormantMembers().length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  private applyThreshold(): void {
    const days = Number(this.thresholdInput);
    if (days > 0) {
      this.ctrl.updateSettings({ dormantThresholdDays: days });
    }
  }

  private wakeMember(id: string): void {
    this.ctrl.wakeMember(id).then(() => {
      promptAction.showToast({ message: '已唤醒' });
    });
  }

  private wakeAll(): void {
    this.ctrl.wakeAllDormant().then(() => {
      promptAction.showToast({ message: '已全部唤醒' });
    });
  }

  private formatDate(ts: number): string {
    const d = new Date(ts);
    const m = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${m}月${day}日`;
  }
}
