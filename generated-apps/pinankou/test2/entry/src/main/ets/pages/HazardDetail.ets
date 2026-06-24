// HazardDetail.ets — 隐患详情
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { SvgIcon } from '../common/SvgIcon';
import { SectionCard, RiskBadge, StatusBadge, GhostButton } from '../components/CommonUi';
import { HazardItem, HazardProgress, ProgressType } from '../model/Types';

@Component
export struct HazardDetailPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @Prop hazardId: string = '';
  onBack: () => void = () => {};
  openEdit: (hazardId: string) => void = () => {};

  private hazard(): HazardItem | undefined {
    return this.store.getHazard(this.hazardId);
  }

  build() {
    Column() {
      this.Header()
      Scroll() {
        Column() {
          if (this.hazard()) {
            this.DetailBody(this.hazard() as HazardItem)
          } else {
            Text('隐患不存在').fontSize(14).fontColor(Theme.textTertiary).margin(40)
          }
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 28 })
      }
      .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder Header() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary, strokeWidth: 2 })
      }
      .id('hazard-detail-back-button')
      .width(40).height(40).justifyContent(FlexAlign.Center)
      .onClick(() => this.onBack())
      Text('隐患详情').fontSize(17).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary).margin({ left: 4 })
      Blank()
      Text('编辑').id('hazard-detail-edit-button').fontSize(14).fontColor(Theme.brandPrimary)
        .padding({ left: 8, right: 8 }).onClick(() => this.openEdit(this.hazardId))
    }
    .width('100%')
    .padding({ left: 8, right: Theme.pageHorizontalPadding, top: 48, bottom: 8 })
  }

  @Builder DetailBody(h: HazardItem) {
    SectionCard() {
      Column() {
        Text(h.title).id('hazard-detail-title')
          .fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        Row() {
          StatusBadge({ status: h.status }).id('hazard-detail-status')
          RiskBadge({ level: h.level }).margin({ left: 8 })
        }.margin({ top: 10 })
      }.width('100%').alignItems(HorizontalAlign.Start)
    }

    SectionCard({ marginTop: 12 }) {
      Column() {
        this.InfoRow('地点', h.location || '未指定')
        this.InfoRow('描述', h.description || '无')
        this.InfoRow('责任人', h.assignee || '未指派')
        this.InfoRow('整改期限', h.deadline > 0 ? this.timeLabel(h.deadline) : '未设置')
        this.InfoRow('登记时间', this.timeLabel(h.createdAt))
      }.width('100%')
    }

    Column() {
      Text('整改进度').fontSize(15).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        .margin({ top: 16, bottom: 8 })
      SectionCard() {
        if (h.progress.length === 0) {
          Text('暂无进度').id('hazard-detail-progress-empty')
            .fontSize(13).fontColor(Theme.textTertiary)
        } else {
          Column() {
            ForEach(h.progress, (p: HazardProgress) => {
              Row() {
                Column() {
                  Text(this.progressTypeLabel(p.type)).fontSize(13).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
                  Text(p.text).fontSize(12).fontColor(Theme.textTertiary).margin({ top: 2 })
                }.alignItems(HorizontalAlign.Start).layoutWeight(1)
                Text(this.timeLabel(p.createdAt)).fontSize(11).fontColor(Theme.textQuaternary)
              }
              .id(`hazard-progress-${p.id}`)
              .width('100%').padding({ top: 8, bottom: 8 })
              .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
            }, (p: HazardProgress) => p.id)
          }.id('hazard-detail-progress-list').width('100%')
        }
      }
    }.width('100%').alignItems(HorizontalAlign.Start)

    Row() {
      if (h.status !== 'done') {
        GhostButton({ label: '催办', onTap: () => {
          this.store.urgeHazard(h.id);
          promptAction.showToast({ message: '已催办整改' });
        } }).id('hazard-detail-urge-button').layoutWeight(1)
      }
      if (h.status !== 'done') {
        GhostButton({ label: '验收通过', onTap: () => {
          this.store.acceptHazard(h.id);
          promptAction.showToast({ message: '已验收，隐患闭环' });
        } }).id('hazard-detail-accept-button').layoutWeight(1).margin({ left: 10 })
      }
    }.width('100%').margin({ top: 16 })
  }

  @Builder InfoRow(label: string, value: string) {
    Row() {
      Text(label).fontSize(13).fontColor(Theme.textTertiary).width(80)
      Text(value).fontSize(13).fontColor(Theme.textPrimary).layoutWeight(1)
    }.width('100%').padding({ top: 7, bottom: 7 })
  }

  private progressTypeLabel(t: ProgressType): string {
    if (t === 'create') return '登记';
    if (t === 'rectify') return '整改';
    if (t === 'urge') return '催办';
    if (t === 'accept') return '验收';
    return '备注';
  }

  private timeLabel(ms: number): string {
    const d = new Date(ms);
    return `${d.getFullYear()}/${d.getMonth() + 1}/${d.getDate()} ${d.getHours()}:${String(d.getMinutes()).padStart(2, '0')}`;
  }
}
