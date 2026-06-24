import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { EmptyStateView } from '../components/EmptyStateView';
import { RiskItem, RiskStatus, RiskTimelineEvent } from '../models/Models';
import { Formatters } from '../common/Formatters';

@Component
export struct RiskDetailPage {
  @Prop risk: RiskItem = new RiskItem();
  onBack: () => void = () => {};
  onAssign: () => void = () => {};
  onRemind: () => void = () => {};
  onSubmitFix: () => void = () => {};
  onReviewPass: () => void = () => {};
  onReviewReject: () => void = () => {};

  build() {
    Scroll() {
      Column({ space: 16 }) {
        PageHeader({ title: '隐患详情', showBack: true, onBack: this.onBack })

        Column({ space: 8 }) {
          Text(this.risk.title)
            .id('risk-detail-title')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .width('100%')

          Row({ space: 8 }) {
            Text(Formatters.riskStatusLabel(this.risk.status))
              .id('risk-detail-status')
              .fontSize(12)
              .fontColor(Theme.brandPrimary)
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .backgroundColor(Theme.brandLight)
              .borderRadius(Theme.radiusChip)

            Text(Formatters.riskLevelLabel(this.risk.level))
              .id('risk-detail-level')
              .fontSize(12)
              .fontColor('#FFFFFF')
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .backgroundColor(Formatters.riskLevelColor(this.risk.level))
              .borderRadius(Theme.radiusChip)
          }
          .width('100%')

          Text(`地点：${this.risk.location}`)
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .width('100%')

          Text(`整改人：${this.risk.handler || '未指派'}`)
            .fontSize(14)
            .fontColor(Theme.textSecondary)
            .width('100%')

          if (this.risk.description.length > 0) {
            Text(this.risk.description)
              .fontSize(14)
              .fontColor(Theme.textPrimary)
              .width('100%')
          }
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)

        Column({ space: 12 }) {
          Text('整改进度')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .width('100%')

          if (this.risk.timeline.length === 0) {
            EmptyStateView({ message: '暂无进度', testId: 'risk-empty-timeline' })
          } else {
            ForEach(this.risk.timeline, (event: RiskTimelineEvent) => {
              Row({ space: 12 }) {
                Column() {
                  Circle({ width: 8, height: 8 })
                    .fill(Theme.brandPrimary)
                  Row()
                    .width(2)
                    .height(30)
                    .backgroundColor(Theme.borderDefault)
                }
                .width(16)
                .alignItems(HorizontalAlign.Center)

                Column({ space: 2 }) {
                  Text(`${event.action} · ${event.actor}`)
                    .fontSize(14)
                    .fontColor(Theme.textPrimary)
                  if (event.note.length > 0) {
                    Text(event.note)
                      .fontSize(12)
                      .fontColor(Theme.textSecondary)
                  }
                  Text(Formatters.dateTimeString(event.timestamp))
                    .fontSize(11)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .id(`risk-timeline-${event.id}`)
              .width('100%')
              .alignItems(VerticalAlign.Top)
            }, (event: RiskTimelineEvent) => event.id)
          }
        }
        .id('risk-detail-progress-timeline')
        .width('100%')
        .padding(16)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)

        this.ActionButtons()
      }
      .width('100%')
      .padding(Theme.pageHorizontalPadding)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  ActionButtons() {
    Column({ space: 10 }) {
      if (this.risk.status === RiskStatus.PENDING || this.risk.status === RiskStatus.INPROGRESS || this.risk.status === RiskStatus.REJECTED) {
        Button('指派/更改整改人')
          .id('risk-action-assign')
          .width('100%')
          .height(44)
          .fontSize(15)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.onAssign())

        Button('催办')
          .id('risk-action-remind')
          .width('100%')
          .height(44)
          .fontSize(15)
          .fontColor(Theme.textPrimary)
          .backgroundColor(Theme.chipSoftBg)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.onRemind())
      }

      if (this.risk.status === RiskStatus.INPROGRESS || this.risk.status === RiskStatus.REJECTED) {
        Button('提交整改')
          .id('risk-action-submit-fix')
          .width('100%')
          .height(44)
          .fontSize(15)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.onSubmitFix())
      }

      if (this.risk.status === RiskStatus.REVIEW) {
        Row({ space: 12 }) {
          Button('复核通过')
            .id('risk-action-review-pass')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontColor('#FFFFFF')
            .backgroundColor(Theme.brandPrimary)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.onReviewPass())

          Button('退回整改')
            .id('risk-action-review-reject')
            .layoutWeight(1)
            .height(44)
            .fontSize(15)
            .fontColor('#FFFFFF')
            .backgroundColor(Theme.dangerRed)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.onReviewReject())
        }
        .width('100%')
      }
    }
    .width('100%')
  }
}
