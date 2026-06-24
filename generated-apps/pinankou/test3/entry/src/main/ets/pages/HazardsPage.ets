import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { HazardController, HazardFilter } from '../controllers/HazardController';
import { Hazard, HazardLevel, HazardStatus } from '../model/Hazard';
import { PageHeader, EmptyStateView, GhostButton } from '../components/CommonUi';
import { formatDate } from '../services/IdGenerator';
import { levelColor, levelSoftColor, levelLabel, hazardStatusLabel, hazardStatusColor, hazardStatusSoftColor } from '../components/CommonUi';

@Component
export struct HazardsPage {
  onBack?: () => void;
  onOpenDetail?: (id: string) => void;
  @State statusFilter: string = 'all';
  @State levelFilter: string = 'all';
  @State items: Hazard[] = [];
  private controller = new HazardController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    const filter: HazardFilter = { status: this.statusFilter, level: this.levelFilter };
    this.items = this.controller.list(filter);
  }

  private setStatusFilter(f: string): void {
    this.statusFilter = f;
    this.refresh();
  }

  private setLevelFilter(f: string): void {
    this.levelFilter = f;
    this.refresh();
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: '隐患',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.addButton
      })

      Scroll() {
        Column({ space: 16 }) {
          this.StatusFilter()
          this.LevelFilter()

          Text(`共 ${this.items.length} 项`)
            .id('hazards-total-count')
            .fontSize(12)
            .fontColor(Theme.textTertiary)
            .width('100%')

          List({ space: 12 }) {
            if (this.items.length === 0) {
              ListItem() {
                EmptyStateView({ title: '暂无隐患', subtitle: '点击右上角 + 上报隐患' })
                  .id('hazards-empty-state')
              }
            }
            ForEach(this.items, (item: Hazard) => {
              ListItem() {
                this.HazardCard(item)
              }
              .id(`hazard-${item.id}`)
              .onClick(() => {
                if (this.onOpenDetail) this.onOpenDetail(item.id);
              })
            }, (item: Hazard) => item.id)
          }
          .id('hazards-list')
          .width('100%')
          .layoutWeight(1)
        }
        .width('100%')
        .padding(16)
        .padding({ bottom: 24 })
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
  addButton() {
    Button() {
      SvgIcon({ variant: 'add', iconSize: 20 })
    }
    .id('hazards-add-button')
    .width(40)
    .height(40)
    .borderRadius(12)
    .linearGradient(BrandGradient.primary)
    .shadow(Theme.buttonShadow)
    .onClick(() => {
      if (this.onOpenDetail) this.onOpenDetail('');
    })
  }

  @Builder
  StatusFilter() {
    Scroll() {
      Row({ space: 8 }) {
        GhostButton({ label: '全部', active: this.statusFilter === 'all', onTap: () => this.setStatusFilter('all') })
        GhostButton({ label: '待处理', active: this.statusFilter === 'pending', onTap: () => this.setStatusFilter('pending') })
        GhostButton({ label: '整改中', active: this.statusFilter === 'in_progress', onTap: () => this.setStatusFilter('in_progress') })
        GhostButton({ label: '待验收', active: this.statusFilter === 'awaiting_acceptance', onTap: () => this.setStatusFilter('awaiting_acceptance') })
        GhostButton({ label: '已关闭', active: this.statusFilter === 'closed', onTap: () => this.setStatusFilter('closed') })
      }
      .id('hazards-filter-status')
      .padding({ right: 16 })
    }
    .width('100%')
    .scrollBar(BarState.Off)
    .scrollable(ScrollDirection.Horizontal)
  }

  @Builder
  LevelFilter() {
    Row({ space: 8 }) {
      GhostButton({ label: '全部等级', active: this.levelFilter === 'all', onTap: () => this.setLevelFilter('all') })
      GhostButton({ label: '高', active: this.levelFilter === 'high', onTap: () => this.setLevelFilter('high') })
      GhostButton({ label: '中', active: this.levelFilter === 'medium', onTap: () => this.setLevelFilter('medium') })
      GhostButton({ label: '低', active: this.levelFilter === 'low', onTap: () => this.setLevelFilter('low') })
    }
    .id('hazards-filter-level')
    .width('100%')
  }

  @Builder
  HazardCard(item: Hazard) {
    Row({ space: 12 }) {
      Column()
        .width(4)
        .height('100%')
        .borderRadius(2)
        .backgroundColor(levelColor(item.level))

      Column({ space: 8 }) {
        Row() {
          Text(item.title || '未命名隐患')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')

        Row({ space: 8 }) {
          Text(levelLabel(item.level))
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(levelColor(item.level))
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .backgroundColor(levelSoftColor(item.level))
            .borderRadius(Theme.radiusChip)
          Text(hazardStatusLabel(item.status))
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(hazardStatusColor(item.status))
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .backgroundColor(hazardStatusSoftColor(item.status))
            .borderRadius(Theme.radiusChip)
        }

        Row() {
          Text(item.location || '未填写地点')
            .fontSize(12)
            .fontColor(Theme.textTertiary)
            .layoutWeight(1)
          if (item.deadline !== null && item.deadline < Date.now() && item.status !== HazardStatus.CLOSED) {
            Text(`逾期 ${formatDate(item.deadline)}`)
              .fontSize(11)
              .fontColor(Theme.danger)
          } else if (item.deadline !== null) {
            Text(`截止 ${formatDate(item.deadline)}`)
              .fontSize(11)
              .fontColor(Theme.textQuaternary)
          }
        }
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
    .alignItems(VerticalAlign.Center)
  }
}
