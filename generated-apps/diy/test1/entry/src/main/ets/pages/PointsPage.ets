import { AppController } from '../viewmodel/AppController';
import { PointRecord, Member } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct PointsPage {
  @ObjectLink ctrl: AppController;
  onMemberDetail: (id: string) => void = () => {};
  @State showRedeem: boolean = false;
  @State redeemMemberId: string = '';
  @State redeemAmount: string = '';
  @State redeemNote: string = '';

  build() {
    Column({ space: 0 }) {
      // Header
      Row() {
        Text('积分')
          .fontSize(Theme.pageTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Blank()
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 12, bottom: 12 })

      // Stats cards
      Row({ space: 12 }) {
        Column({ space: 4 }) {
          Text(`${this.ctrl.totalIssued()}`)
            .id('points-total-issued')
            .fontSize(Theme.statSize)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.caramel)
          Text('累计发放')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .layoutWeight(1)
        .padding(18)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderDefault })
        .borderRadius(Theme.radiusCard)
        .alignItems(HorizontalAlign.Center)

        Column({ space: 4 }) {
          Text(`${this.ctrl.totalRedeemed()}`)
            .id('points-total-redeemed')
            .fontSize(Theme.statSize)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.terracotta)
          Text('累计兑换')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .layoutWeight(1)
        .padding(18)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: Theme.borderDefault })
        .borderRadius(Theme.radiusCard)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .margin({ bottom: 16 })

      // Rule + redeem actions
      Row({ space: 12 }) {
        Button(`1 元 = ${this.ctrl.settings.pointsRatio} 积分`)
          .id('points-rule-setting-button')
          .layoutWeight(1)
          .height(40)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.terracotta)
          .backgroundColor(Color.Transparent)
          .border({ width: 1.5, color: Theme.terracotta })
          .borderRadius(999)

        Button('积分兑换')
          .id('points-redeem-button')
          .layoutWeight(1)
          .height(40)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(Theme.terracotta)
          .borderRadius(999)
          .onClick(() => {
            this.redeemMemberId = '';
            this.redeemAmount = '';
            this.redeemNote = '';
            this.showRedeem = true;
          })
      }
      .width('100%')
      .margin({ bottom: 16 })

      // Records
      Row() {
        Text('积分流水')
          .fontSize(Theme.sectionTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Blank()
      }
      .width('100%')
      .margin({ bottom: 14 })

      List({ space: 0 }) {
        if (this.ctrl.pointRecords.length === 0) {
          ListItem() {
            this.EmptyState()
          }
          .id('points-empty-state')
        } else {
          ForEach(this.ctrl.pointRecords, (record: PointRecord) => {
            ListItem() {
              this.RecordRow(record)
            }
            .id(`points-record-${record.id}`)
            .onClick(() => this.onMemberDetail(record.memberId))
          }, (record: PointRecord) => record.id)
        }
      }
      .id('points-record-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .bindSheet(
      this.showRedeem,
      this.RedeemSheet(),
      {
        height: SheetSize.FIT_CONTENT,
        onWillDisappear: () => this.showRedeem = false,
      }
    )
  }

  @Builder
  RecordRow(record: PointRecord) {
    Row({ space: 12 }) {
      Column({ space: 2 }) {
        Text(record.type === 'earn' ? `+${record.amount}` : `-${record.amount}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(record.type === 'earn' ? Theme.celadon : Theme.rust)
        Text(record.source)
          .fontSize(11)
          .fontColor(Theme.textQuaternary)
      }
      .width(64)
      .alignItems(HorizontalAlign.Start)

      Column({ space: 4 }) {
        Text(this.ctrl.memberName(record.memberId))
          .fontSize(Theme.cardTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(record.note || '')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text(this.formatDate(record.createdAt))
        .fontSize(11)
        .fontColor(Theme.textQuaternary)
    }
    .width('100%')
    .padding({ top: 14, bottom: 14 })
    .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })
  }

  @Builder
  EmptyState() {
    Column({ space: 8 }) {
      Text('暂无积分流水')
        .fontSize(Theme.cardTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('签到或消费后将自动生成记录')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
    }
    .width('100%')
    .padding({ top: 80, bottom: 80 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  RedeemSheet() {
    Column({ space: 16 }) {
      Text('积分兑换')
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      TextInput({ placeholder: '选择会员（输入会员ID或从会员列表选择）', text: this.redeemMemberId })
        .width('100%')
        .height(48)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusSmall)
        .placeholderColor(Theme.textPlaceholder)
        .fontSize(Theme.bodySize)
        .padding({ left: 16, right: 16 })
        .onChange((value: string) => this.redeemMemberId = value)

      TextInput({ placeholder: '兑换积分数量', text: this.redeemAmount })
        .width('100%')
        .height(48)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusSmall)
        .placeholderColor(Theme.textPlaceholder)
        .fontSize(Theme.bodySize)
        .padding({ left: 16, right: 16 })
        .onChange((value: string) => this.redeemAmount = value)

      TextInput({ placeholder: '备注（可选）', text: this.redeemNote })
        .width('100%')
        .height(48)
        .backgroundColor(Theme.inputBg)
        .borderRadius(Theme.radiusSmall)
        .placeholderColor(Theme.textPlaceholder)
        .fontSize(Theme.bodySize)
        .padding({ left: 16, right: 16 })
        .onChange((value: string) => this.redeemNote = value)

      Button('确认兑换')
        .width('100%')
        .height(48)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnAccent)
        .backgroundColor(Theme.terracotta)
        .borderRadius(999)
        .onClick(async () => {
          const amount: number = parseInt(this.redeemAmount, 10);
          if (!this.redeemMemberId || isNaN(amount) || amount <= 0) {
            promptAction.showToast({ message: '请输入有效的会员和积分数量' });
            return;
          }
          const ok: boolean = await this.ctrl.redeemPoints(
            this.redeemMemberId,
            amount,
            'redeem-material',
            '',
            this.redeemNote || '积分兑换'
          );
          if (ok) {
            promptAction.showToast({ message: '兑换成功' });
            this.showRedeem = false;
          } else {
            promptAction.showToast({ message: '积分不足或会员不存在' });
          }
        })
    }
    .width('100%')
    .padding(24)
  }

  private formatDate(ts: number): string {
    const d: Date = new Date(ts);
    return `${d.getMonth() + 1}/${d.getDate()}`;
  }
}
