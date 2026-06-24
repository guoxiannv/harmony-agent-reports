import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { InspectionController } from '../controllers/InspectionController';
import { Inspection, InspectionStatus } from '../model/Inspection';
import { PageHeader, EmptyStateView, GhostButton } from '../components/CommonUi';
import { formatDate } from '../services/IdGenerator';
import { inspectionStatusLabel, inspectionStatusColor } from '../components/CommonUi';

@Component
export struct InspectionsPage {
  onBack?: () => void;
  onOpenDetail?: (id: string) => void;
  @State filter: 'all' | 'in_progress' | 'completed' = 'all';
  @State items: Inspection[] = [];
  private controller = new InspectionController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    this.items = this.controller.list().filter(i => {
      if (this.filter === 'in_progress') {
        return i.status === InspectionStatus.PENDING || i.status === InspectionStatus.IN_PROGRESS || i.status === InspectionStatus.ABNORMAL;
      }
      if (this.filter === 'completed') {
        return i.status === InspectionStatus.COMPLETED;
      }
      return true;
    });
  }

  private setFilter(f: 'all' | 'in_progress' | 'completed'): void {
    this.filter = f;
    this.refresh();
  }

  private progressText(item: Inspection): string {
    const done = item.checklist.filter(ci => ci.result !== null).length;
    return `${done}/${item.checklist.length}`;
  }

  private progressPercent(item: Inspection): number {
    if (item.checklist.length === 0) return 0;
    return Math.round((item.checklist.filter(ci => ci.result !== null).length / item.checklist.length) * 100);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: '巡检',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.addButton
      })

      Scroll() {
        Column({ space: 16 }) {
          this.FilterSegment()

          Text(`共 ${this.items.length} 项`)
            .id('inspections-total-count')
            .fontSize(12)
            .fontColor(Theme.textTertiary)
            .width('100%')

          List({ space: 12 }) {
            if (this.items.length === 0) {
              ListItem() {
                EmptyStateView({ title: '暂无巡检任务', subtitle: '点击右上角 + 创建巡检' })
                  .id('inspections-empty-state')
              }
            }
            ForEach(this.items, (item: Inspection) => {
              ListItem() {
                this.InspectionCard(item)
              }
              .id(`inspection-${item.id}`)
              .onClick(() => {
                if (this.onOpenDetail) this.onOpenDetail(item.id);
              })
            }, (item: Inspection) => item.id)
          }
          .id('inspections-list')
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
    .id('inspections-add-button')
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
  FilterSegment() {
    Row({ space: 8 }) {
      GhostButton({ label: '全部', active: this.filter === 'all', onTap: () => this.setFilter('all') })
      GhostButton({ label: '进行中', active: this.filter === 'in_progress', onTap: () => this.setFilter('in_progress') })
      GhostButton({ label: '已完成', active: this.filter === 'completed', onTap: () => this.setFilter('completed') })
    }
    .id('inspections-filter-segment')
    .width('100%')
  }

  @Builder
  InspectionCard(item: Inspection) {
    Row({ space: 12 }) {
      Column()
        .width(4)
        .height('100%')
        .borderRadius(2)
        .backgroundColor(inspectionStatusColor(item.status))
        .margin({ right: 4 })

      Column({ space: 8 }) {
        Row() {
          Text(item.title || '未命名巡检')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
          Text(inspectionStatusLabel(item.status))
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(inspectionStatusColor(item.status))
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .backgroundColor(Theme.inputBg)
            .borderRadius(Theme.radiusChip)
        }
        .width('100%')

        Text(`${item.location || '未填写地点'} · ${formatDate(item.date)}`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)

        Row() {
          Progress({ value: this.progressPercent(item), total: 100, type: ProgressType.Linear })
            .width('100%')
            .height(6)
            .color(Theme.brandPrimary)
            .backgroundColor(Theme.borderDefault)
            .borderRadius(3)
        }
        .width('100%')

        Text(`完成 ${this.progressText(item)}`)
          .fontSize(11)
          .fontColor(Theme.textQuaternary)
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
