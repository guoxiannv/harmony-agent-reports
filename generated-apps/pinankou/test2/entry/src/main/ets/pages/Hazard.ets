// Hazard.ets — 隐患管理 (list + filter + create)
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { EmptyState, RiskBadge, StatusBadge, SearchField, ChipBar } from '../components/CommonUi';
import { HazardItem } from '../model/Types';

const FILTERS: string[] = ['全部', '待整改', '整改中', '待验收', '已完成'];

@Component
export struct HazardPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @State keyword: string = '';
  @State statusFilter: string = '全部';
  openDetail: (hazardId: string) => void = () => {};
  openCreate: () => void = () => {};

  private filtered(): HazardItem[] {
    const kw = this.keyword.trim();
    return this.store.hazards.filter(h => {
      if (this.statusFilter === '待整改' && h.status !== 'pending') return false;
      if (this.statusFilter === '整改中' && h.status !== 'rectifying') return false;
      if (this.statusFilter === '待验收' && h.status !== 'accepting') return false;
      if (this.statusFilter === '已完成' && h.status !== 'done') return false;
      if (kw.length > 0) {
        const hay = `${h.title} ${h.location} ${h.description}`;
        if (hay.indexOf(kw) < 0) return false;
      }
      return true;
    });
  }

  build() {
    Column() {
      // Header
      Row() {
        Text('隐患管理').fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        Blank()
        Button('+ 新建')
          .id('hazard-create-button')
          .type(ButtonType.Capsule)
          .backgroundColor(Theme.brandPrimary).fontColor(Theme.textOnBrand)
          .fontSize(13).height(34)
          .onClick(() => this.openCreate())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 8 })

      Column() {
        SearchField({
          value: this.keyword, placeholder: '搜索隐患 / 地点 / 描述',
          onTextChange: (v: string) => this.keyword = v
        }).id('hazard-search-input')
        ChipBar({
          options: FILTERS, selected: this.statusFilter,
          onSelect: (opt: string) => this.statusFilter = opt
        }).id('hazard-status-filter').margin({ top: 10 })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 8 })

      Scroll() {
        Column() {
          if (this.filtered().length === 0) {
            EmptyState({
              icon: 'alert', title: '暂无隐患记录', hint: '发现风险时立即上报，3 步完成',
              actionLabel: '新建隐患', onAction: () => this.openCreate()
            }).id('hazard-empty-state')
          } else {
            ForEach(this.filtered(), (h: HazardItem) => {
              Column() {
                Row() {
                  Text(h.title).fontSize(15).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
                    .layoutWeight(1).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
                  StatusBadge({ status: h.status })
                }.width('100%')
                Row() {
                  RiskBadge({ level: h.level })
                  Text(h.location || '未指定地点')
                    .fontSize(12).fontColor(Theme.textTertiary).margin({ left: 8 })
                    .layoutWeight(1).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
                }.width('100%').margin({ top: 8 })
                Row() {
                  Text(`责任人：${h.assignee || '未指派'}`).fontSize(12).fontColor(Theme.textTertiary).layoutWeight(1)
                  Text(this.timeLabel(h.createdAt)).fontSize(12).fontColor(Theme.textQuaternary)
                }.width('100%').margin({ top: 6 })
              }
              .id(`hazard-item-${h.id}`)
              .width('100%')
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusCard)
              .padding(16)
              .margin({ bottom: 10 })
              .onClick(() => this.openDetail(h.id))
            }, (h: HazardItem) => h.id)
          }
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%').height('100%')
    .backgroundColor(Theme.pageBg)
  }

  private timeLabel(ms: number): string {
    const d = new Date(ms);
    return `${d.getMonth() + 1}/${d.getDate()} ${d.getHours()}:${String(d.getMinutes()).padStart(2, '0')}`;
  }
}
