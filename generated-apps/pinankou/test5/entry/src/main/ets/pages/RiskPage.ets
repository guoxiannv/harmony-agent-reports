import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { EmptyStateView } from '../components/EmptyStateView';
import { RiskItem, RiskStatus } from '../models/Models';
import { Formatters } from '../common/Formatters';

@Component
export struct RiskPage {
  @Prop risks: RiskItem[] = [];
  @Prop activeFilter: RiskStatus | 'all' = 'all';
  @Prop searchQuery: string = '';
  onFilterChange: (filter: RiskStatus | 'all') => void = () => {};
  onSearchChange: (query: string) => void = () => {};
  onAddRisk: () => void = () => {};
  onOpenDetail: (id: string) => void = () => {};

  build() {
    Column({ space: 12 }) {
      PageHeader({ title: '隐患管理' })

      Row({ space: 8 }) {
        this.FilterChip('全部', 'all', 'risk-filter-all')
        this.FilterChip('待整改', RiskStatus.PENDING, 'risk-filter-pending')
        this.FilterChip('整改中', RiskStatus.INPROGRESS, 'risk-filter-inprogress')
        this.FilterChip('待复核', RiskStatus.REVIEW, 'risk-filter-review')
        this.FilterChip('已关闭', RiskStatus.CLOSED, 'risk-filter-closed')
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      Row({ space: 8 }) {
        Image($rawfile('icon_搜索隐患.svg'))
          .width(20)
          .height(20)
          .fillColor(Theme.textTertiary)
        TextInput({ text: this.searchQuery, placeholder: '搜索隐患/地点/责任人' })
          .id('risk-search-input')
          .width('100%')
          .height(40)
          .fontSize(14)
          .backgroundColor(Theme.pageBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.onSearchChange(value))
      }
      .width('100%')
      .height(48)
      .padding({ left: 12, right: 12 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      Button('上报隐患')
        .id('risk-add-button')
        .width('90%')
        .height(44)
        .fontSize(15)
        .fontColor('#FFFFFF')
        .backgroundColor(Theme.brandPrimary)
        .borderRadius(Theme.radiusButton)
        .onClick(() => this.onAddRisk())

      if (this.risks.length === 0) {
        EmptyStateView({ message: '暂无隐患', testId: 'risk-empty-list' })
      } else {
        List({ space: 8 }) {
          ForEach(this.risks, (risk: RiskItem) => {
            ListItem() {
              this.RiskCard(risk)
            }
            .id(`risk-item-${risk.id}`)
            .onClick(() => this.onOpenDetail(risk.id))
          }, (risk: RiskItem) => risk.id)
        }
        .id('risk-list')
        .width('100%')
        .layoutWeight(1)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  FilterChip(label: string, filter: RiskStatus | 'all', componentId: string) {
    Text(label)
      .id(componentId)
      .fontSize(12)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.activeFilter === filter ? '#FFFFFF' : Theme.textSecondary)
      .backgroundColor(this.activeFilter === filter ? Theme.brandPrimary : Theme.chipSoftBg)
      .padding({ left: 10, right: 10, top: 6, bottom: 6 })
      .borderRadius(Theme.radiusPill)
      .onClick(() => this.onFilterChange(filter))
  }

  @Builder
  RiskCard(risk: RiskItem) {
    Column({ space: 8 }) {
      Row() {
        Text(risk.title)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })

        Text(Formatters.riskLevelLabel(risk.level))
          .fontSize(12)
          .fontColor('#FFFFFF')
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .backgroundColor(Formatters.riskLevelColor(risk.level))
          .borderRadius(Theme.radiusChip)
      }
      .width('100%')

      Row() {
        Text(Formatters.riskStatusLabel(risk.status))
          .fontSize(12)
          .fontColor(Theme.brandPrimary)
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .backgroundColor(Theme.brandLight)
          .borderRadius(Theme.radiusChip)

        Text(risk.location)
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
          .textAlign(TextAlign.End)
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(HorizontalAlign.Start)
  }
}
