// DormantPage.ets — 沉睡会员提醒(对齐 page-dormant-page.html)
// 藤金黄汇总卡 + 阈值设置行 + 会员卡(唤醒按钮 + 建议话术)

import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { PageHeader } from '../components/PageHeader';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { DormantMember, OpResult } from '../model/Models';

@Component
export struct DormantPage {
  onBack: () => void = () => {};

  @State count: number = 0;
  @State threshold: number = 30;
  @State members: DormantMember[] = [];
  @State feedback: string = '';

  aboutToAppear(): void {
    this.threshold = DataStore.getDormantThreshold();
    this.load();
  }

  private load(): void {
    this.members = DataStore.getDormantMembers();
    this.count = this.members.length;
  }

  private wake(m: DormantMember): void {
    const r: OpResult = DataStore.wakeMember(m.id);
    this.feedback = r.message;
    this.load();
    setTimeout(() => { this.feedback = ''; }, 2400);
  }

  private updateThreshold(v: string): void {
    const n = parseInt(v, 10);
    if (isNaN(n)) return;
    const r = DataStore.setDormantThreshold(n);
    if (r.success) {
      this.threshold = n;
      this.load();
    }
  }

  private suggestion(m: DormantMember): string {
    if (m.daysDormant > 60) return '可发送体验券 + 双倍积分唤醒';
    if (m.daysDormant > 45) return '推荐新课程并附优惠权益';
    return '可推送积分到期提醒与新品上架';
  }

  build() {
    Column() {
      PageHeader({ title: '沉睡会员', onBack: () => this.onBack() })

      Scroll() {
        Column() {
          // 汇总卡
          Column() {
            Text('待唤醒会员')
              .fontSize(14)
              .fontColor(Theme.textOnClay)
              .opacity(0.92)
              .alignSelf(ItemAlign.Start)
            Text(`${this.count}`)
              .fontSize(42)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnClay)
              .margin({ top: 4 })
              .alignSelf(ItemAlign.Start)
              .id('dormant-count')
          }
          .width('100%')
          .padding(24)
          .borderRadius(Theme.radiusHero)
          .linearGradient(BrandGradient.yellow)
          .shadow({ radius: 28, color: 'rgba(201,158,58,0.28)', offsetY: 10 })
          .margin({ left: 20, right: 20 })
          .alignItems(HorizontalAlign.Start)

          // 阈值设置
          Row() {
            Text('超过')
              .fontSize(14)
              .fontColor(Theme.textSecondary)
            TextInput({ text: `${this.threshold}` })
              .type(InputType.Number)
              .width(64)
              .height(36)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(Theme.pageBg)
              .border({ width: 1, color: Theme.borderDefault })
              .borderRadius(10)
              .margin({ left: 8, right: 8 })
              .id('dormant-threshold-input')
              .onChange((v: string) => this.updateThreshold(v))
            Text('天未活跃即视为沉睡')
              .fontSize(14)
              .fontColor(Theme.textSecondary)
              .layoutWeight(1)
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 14, bottom: 14 })
          .backgroundColor(Theme.cardLight)
          .border({ width: 1, color: Theme.borderDefault })
          .borderRadius(16)
          .margin({ left: 20, right: 20, top: 16 })
          .alignItems(VerticalAlign.Center)

          Text('提醒列表')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 12 })

          if (this.members.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-dormant', title: '暂无沉睡会员', hint: '继续保持温度吧～' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('dormant-empty-state')
          } else {
            ForEach(this.members, (m: DormantMember) => {
              Column() {
                Row() {
                  Row() {
                    SvgIcon({ variant: 'avatar', iconSize: 24 })
                  }
                  .width(48).height(48).borderRadius(24)
                  .backgroundColor(Theme.sand)
                  .justifyContent(FlexAlign.Center)
                  Column() {
                    Text(m.name)
                      .fontSize(16)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.textPrimary)
                    Text(`最后活跃：${m.daysDormant} 天前`)
                      .fontSize(12)
                      .fontColor(Theme.textTertiary)
                      .margin({ top: 2 })
                      .id(`dormant-member-${m.id}-last-active`)
                  }
                  .layoutWeight(1)
                  .margin({ left: 12 })
                  .alignItems(HorizontalAlign.Start)
                  Button() {
                    Text('唤醒')
                      .fontSize(13)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.textOnClay)
                  }
                  .type(ButtonType.Capsule)
                  .height(34)
                  .padding({ left: 16, right: 16 })
                  .backgroundColor(Theme.green)
                  .id(`dormant-member-${m.id}-wake`)
                  .onClick(() => this.wake(m))
                }
                .alignItems(VerticalAlign.Center)

                Text(this.suggestion(m))
                  .fontSize(12)
                  .fontColor(Theme.textSecondary)
                  .margin({ top: 10 })
                  .padding({ top: 10 })
                  .border({ width: { top: 1 }, color: { top: Theme.borderDefault } })
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Theme.cardLight)
              .borderRadius(20)
              .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
              .margin({ left: 20, right: 20, bottom: 12 })
              .alignItems(HorizontalAlign.Start)
              .id(`dormant-member-${m.id}`)
            }, (m: DormantMember) => m.id)
          }

          if (this.feedback.length > 0) {
            Text(this.feedback)
              .fontSize(13)
              .fontColor(Theme.green)
              .margin({ top: 12, left: 20 })
          }
          Blank().height(12)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }
}
