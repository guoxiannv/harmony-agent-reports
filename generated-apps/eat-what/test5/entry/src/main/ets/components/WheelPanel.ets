// WheelPanel.ets
// 转盘抽菜 panel: rotating wheel (prepared wheel-face SVG) + GO button, candidate management,
// and a result sheet that appears when a spin finishes. Spins via animateTo on rotation angle.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Store } from '../services/Store';
import { WheelCandidate } from '../model/Models';
import { WheelState } from '../model/Enums';
import { toast } from '../common/Feedback';

@Component
export struct WheelPanel {
  checkinWithResult: (dish: string) => void = () => {};

  @State candidates: WheelCandidate[] = [];
  @State inputText: string = '';
  @State wheelState: WheelState = 'idle';
  @State angle: number = 0;
  @State resultName: string = '';

  async aboutToAppear() {
    await Store.ensureLoaded();
    this.candidates = Store.getCandidates();
  }

  build() {
    Column() {
      Text('交给命运')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      Text('添加候选菜品，点击转盘开始抽取')
        .fontSize(14)
        .fontColor(Theme.warmGray)
        .margin({ bottom: 24 })
        .alignSelf(ItemAlign.Start)

      // Wheel
      Stack({ alignContent: Alignment.Top }) {
        Row() {
          SvgIcon({ variant: 'wheel-pointer', iconSize: 28 })
        }
        .margin({ top: -6 })
        .zIndex(3)

        Stack() {
          Image($rawfile('icon_Spinning-Wheel.svg'))
            .width(280)
            .height(280)
            .objectFit(ImageFit.Contain)
            .rotate({ angle: this.angle })

          // Center GO button
          Text(this.wheelState === 'spinning' ? '...' : 'GO')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.white)
            .width(72)
            .height(72)
            .borderRadius(36)
            .textAlign(TextAlign.Center)
            .linearGradient(BrandGradient.orange)
            .shadow({ radius: 16, color: 'rgba(255,140,66,0.4)' })
            .onClick(() => this.spin())
        }
        .width(280)
        .height(280)
        .alignContent(Alignment.Center)
        .margin({ top: 28 })
      }
      .id('wheel-canvas')
      .width('100%')
      .height(320)
      .alignContent(Alignment.Top)
      .margin({ bottom: 24 })

      // Candidate section
      Column() {
        Row({ space: 10 }) {
          TextInput({ text: this.inputText, placeholder: '输入菜品名称，如：麻婆豆腐' })
            .id('wheel-add-candidate-input')
            .layoutWeight(1)
            .fontSize(15)
            .fontColor(Theme.textPrimary)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .onChange((v: string) => { this.inputText = v; })

          Row() {
            SvgIcon({ variant: 'add', iconSize: 22 })
          }
          .id('wheel-add-candidate-button')
          .width(48)
          .height(48)
          .borderRadius(Theme.radiusSmall)
          .linearGradient(BrandGradient.orange)
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.addCandidate())
        }
        .width('100%')
        .margin({ bottom: 14 })

        if (this.candidates.length === 0) {
          Text('还没有候选菜品，先添加 2 个以上吧')
            .id('wheel-empty-candidate')
            .fontSize(14)
            .fontColor(Theme.warmGray)
            .width('100%')
            .padding({ top: 8, bottom: 8 })
        } else {
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(this.candidates, (c: WheelCandidate) => {
              Row({ space: 6 }) {
                Text(c.name)
                  .fontSize(14)
                  .fontColor(Theme.textPrimary)
                Row() {
                  SvgIcon({ variant: 'remove', iconSize: 12 })
                }
                .width(18)
                .height(18)
                .borderRadius(9)
                .backgroundColor(Theme.border)
                .justifyContent(FlexAlign.Center)
                .onClick(() => this.removeCandidate(c.id))
              }
              .id('wheel-candidate-' + c.id)
              .padding({ left: 14, right: 10, top: 8, bottom: 8 })
              .borderRadius(Theme.radiusChip)
              .backgroundColor(Theme.lightGray)
              .margin({ right: 10, bottom: 10 })
            }, (c: WheelCandidate) => c.id)
          }
          .width('100%')
          .id('wheel-candidate-list')
        }

        Text('清空候选')
          .fontSize(14)
          .fontColor(Theme.warmGray)
          .margin({ top: 12 })
          .alignSelf(ItemAlign.Start)
          .onClick(() => this.clearCandidates())
      }
      .id('wheel-candidate-section')
      .width('100%')
      .padding(20)
      .borderRadius(22)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
      .alignItems(HorizontalAlign.Start)

      this.ResultSheet()
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private addCandidate(): void {
    const name = this.inputText.trim();
    if (name.length === 0) {
      toast('请输入菜品名称');
      return;
    }
    Store.addCandidate(name);
    this.inputText = '';
    this.candidates = Store.getCandidates();
  }

  private removeCandidate(id: string): void {
    Store.removeCandidate(id);
    this.candidates = Store.getCandidates();
  }

  private clearCandidates(): void {
    Store.clearCandidates();
    this.candidates = Store.getCandidates();
    this.wheelState = 'idle';
    this.resultName = '';
  }

  private spin(): void {
    if (this.wheelState === 'spinning') {
      return;
    }
    const list = Store.getCandidates();
    if (list.length < 2) {
      toast('至少添加 2 个候选菜品');
      return;
    }
    const idx = Math.floor(Math.random() * list.length);
    const picked = list[idx];
    const sector = 360 / list.length;
    // Random offset within the sector so the pointer (top) lands inside the picked slice.
    const within = Math.random() * (sector * 0.7);
    const base = 360 * 5;
    const target = base + (360 - (idx * sector + within));
    this.wheelState = 'spinning';
    animateTo({
      duration: 3000,
      curve: Curve.EaseOut,
      onFinish: () => {
        this.resultName = picked.name;
        this.wheelState = 'finished';
      },
    }, () => {
      this.angle = this.angle + target;
    });
  }

  @Builder
  ResultSheet() {
    if (this.wheelState === 'finished') {
      Column() {
        Text('今天的选择是')
          .fontSize(14)
          .fontColor(Theme.warmGray)
          .margin({ bottom: 8 })
        Text(this.resultName)
          .fontSize(36)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.orangeDark)
          .margin({ bottom: 20 })
        Row({ space: 12 }) {
          Text('再转一次')
            .layoutWeight(1)
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .textAlign(TextAlign.Center)
            .padding({ top: 15, bottom: 15 })
            .borderRadius(Theme.radiusButton)
            .backgroundColor(Theme.paper)
            .border({ width: 1.5, color: Theme.border })
            .onClick(() => this.spin())

          Text('去打卡')
            .id('wheel-go-checkin-button')
            .layoutWeight(1)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.white)
            .textAlign(TextAlign.Center)
            .padding({ top: 15, bottom: 15 })
            .borderRadius(Theme.radiusButton)
            .linearGradient(BrandGradient.orange)
            .onClick(() => this.checkinWithResult(this.resultName))
        }
        .width('100%')
      }
      .id('wheel-result-panel')
      .width('100%')
      .padding({ left: 24, right: 24, top: 28, bottom: 32 })
      .borderRadius({ topLeft: 28, topRight: 28 })
      .backgroundColor('rgba(255,252,250,0.96)')
      .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
      .shadow({ radius: 32, color: 'rgba(46,42,37,0.12)', offsetY: -6 })
    }
  }
}
