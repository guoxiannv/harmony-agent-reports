import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { EmptyStateView } from '../components/EmptyStateView';
import { InspectionTask } from '../models/Models';
import { Formatters } from '../common/Formatters';

@Component
export struct InspectionPage {
  @Prop tasks: InspectionTask[] = [];
  @Prop activeSegment: 'today' | 'pending' | 'history' = 'today';
  onSwitchSegment: (segment: 'today' | 'pending' | 'history') => void = () => {};
  onStartTask: (id: string) => void = () => {};
  onAddTask: () => void = () => {};

  build() {
    Column({ space: 12 }) {
      PageHeader({ title: '巡检任务' })

      Row({ space: 8 }) {
        this.SegmentButton('今日', 'today', 'inspection-segment-today')
        this.SegmentButton('待办', 'pending', 'inspection-segment-pending')
        this.SegmentButton('历史', 'history', 'inspection-segment-history')
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      if (this.tasks.length === 0) {
        EmptyStateView({ message: '暂无巡检任务', testId: 'inspection-empty-task' })
      } else {
        List({ space: 8 }) {
          ForEach(this.tasks, (task: InspectionTask) => {
            ListItem() {
              this.TaskCard(task)
            }
            .id(`inspection-task-${task.id}`)
          }, (task: InspectionTask) => task.id)
        }
        .id('inspection-task-list')
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
  SegmentButton(label: string, segment: 'today' | 'pending' | 'history', componentId: string) {
    Text(label)
      .id(componentId)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.activeSegment === segment ? '#FFFFFF' : Theme.textSecondary)
      .backgroundColor(this.activeSegment === segment ? Theme.brandPrimary : Theme.cardBg)
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })
      .borderRadius(Theme.radiusPill)
      .layoutWeight(1)
      .textAlign(TextAlign.Center)
      .onClick(() => this.onSwitchSegment(segment))
  }

  @Builder
  TaskCard(task: InspectionTask) {
    Column({ space: 8 }) {
      Row() {
        Text(task.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text(Formatters.inspectionStatusLabel(task.status))
          .fontSize(12)
          .fontColor(this.statusColor(task.status))
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .backgroundColor(Theme.chipSoftBg)
          .borderRadius(Theme.radiusChip)
      }
      .width('100%')

      Text(`${task.area} · ${task.planDate}`)
        .fontSize(13)
        .fontColor(Theme.textSecondary)

      Row() {
        Text(`${task.checkItems.filter(it => it.result !== 'unchecked').length}/${task.checkItems.length} 项已检查`)
          .fontSize(13)
          .fontColor(Theme.textTertiary)
          .layoutWeight(1)

        Button(task.status === 'planned' ? '开始巡检' : '继续巡检')
          .id(`inspection-task-start-${task.id}`)
          .fontSize(13)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .padding({ left: 12, right: 12, top: 6, bottom: 6 })
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.onStartTask(task.id))
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(HorizontalAlign.Start)
  }

  private statusColor(status: string): string {
    if (status === 'done') {
      return Theme.brandPrimary
    } else if (status === 'ongoing') {
      return Theme.warnOrange
    }
    return Theme.textSecondary
  }
}
