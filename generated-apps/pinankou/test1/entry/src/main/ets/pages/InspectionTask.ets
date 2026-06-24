// InspectionTask.ets - inspection detail with checkpoints (inspection-task-page).
//
// Semantic targets:
//   task-back-button, task-progress-bar, task-checkpoint-list,
//   task-checkpoint-{id}, task-checkpoint-{id}-normal, task-checkpoint-{id}-abnormal,
//   task-checkpoint-{id}-photo, task-checkpoint-{id}-note, task-submit-button
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { InspectionTask, Checkpoint } from '../model/Types';

@Component
export struct InspectionTaskPage {
  controller: AppController;

  build() {
    Column() {
      this.TopBar()
      this.ProgressPanel()
      this.CheckpointList()
      this.SubmitBar()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TopBar() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back-inspection', iconSize: 20, color: Theme.slate600 })
      }
      .id('task-back-button')
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.navigateBack())

      Text(this.taskName())
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)
        .layoutWeight(1)
        .margin({ left: 4 })
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 14, bottom: 14 })
    .backgroundColor('rgba(255,255,255,0.82)')
    .border({ width: { bottom: 1 }, color: { bottom: 'rgba(226,232,240,0.5)' } })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  ProgressPanel() {
    Column() {
      Row() {
        Text('巡检进度')
          .fontSize(14)
          .fontColor(Theme.slate600)
        Text(`${this.percent()}%`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.teal)
          .margin({ left: 8 })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Column()
          .id('task-progress-bar')
          .width(`${this.percent()}%`)
          .height(8)
          .borderRadius(4)
          .linearGradient(BrandGradient.tealDeep)
      }
      .width('100%')
      .height(8)
      .borderRadius(4)
      .backgroundColor(Theme.slate200)
      .margin({ top: 10 })
    }
    .width('100%')
    .padding(16)
    .margin({ left: 16, right: 16, top: 12 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  CheckpointList() {
    Scroll() {
      Column() {
        ForEach(this.checkpoints(), (c: Checkpoint) => {
          this.CheckpointCard(c)
        }, (c: Checkpoint) => c.id)
      }
      .width('100%')
      .padding({ top: 12, bottom: 100, left: 16, right: 16 })
      .alignItems(HorizontalAlign.Center)
    }
    .id('task-checkpoint-list')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  private checkpoints(): Checkpoint[] {
    const t: InspectionTask | null = this.task();
    if (t === null) {
      return [];
    }
    return (t as InspectionTask).checkpoints;
  }

  @Builder
  CheckpointCard(c: Checkpoint) {
    Column() {
      Row() {
        Column() {
          Text(c.name)
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.slate900)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          if (c.location.length > 0) {
            Row() {
              SvgIcon({ variant: 'checkpoint-location', iconSize: 12, color: Theme.slate400 })
              Text(c.location)
                .fontSize(11)
                .fontColor(Theme.slate400)
                .margin({ left: 3 })
            }
            .margin({ top: 4 })
            .alignItems(VerticalAlign.Center)
          }
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      // Normal / abnormal toggle.
      Row() {
        this.Toggle(`task-checkpoint-${c.id}-normal`, '正常',
          c.result === '正常',
          'checkpoint-normal-active', 'checkpoint-normal-idle', Theme.doneGreen,
          () => { this.controller.markCheckpointNormal(this.controller.activeInspectionId, c.id); })

        this.Toggle(`task-checkpoint-${c.id}-abnormal`, '异常',
          c.result === '异常',
          'checkpoint-abnormal-active', 'checkpoint-abnormal-idle', Theme.riskHigh,
          () => { this.controller.markCheckpointAbnormal(this.controller.activeInspectionId, c.id); })
      }
      .width('100%')
      .margin({ top: 12 })
      .justifyContent(FlexAlign.SpaceBetween)

      // Note + photo.
      Row() {
        Row() {
          SvgIcon({ variant: 'checkpoint-photo', iconSize: 14,
            color: c.hasPhoto ? Theme.teal : Theme.slate400 })
          Text(c.hasPhoto ? '已拍照' : '拍照')
            .fontSize(12)
            .fontColor(c.hasPhoto ? Theme.teal : Theme.slate600)
            .margin({ left: 4 })
        }
        .id(`task-checkpoint-${c.id}-photo`)
        .height(32)
        .padding({ left: 12, right: 12 })
        .borderRadius(16)
        .backgroundColor(c.hasPhoto ? Theme.chipSelectedStart : 'rgba(255,255,255,0.6)')
        .border({ width: 1, color: Theme.slate200 })
        .alignItems(VerticalAlign.Center)
        .onClick(() => { this.controller.captureCheckpointPhoto(this.controller.activeInspectionId, c.id); })
      }
      .width('100%')
      .margin({ top: 10 })
      .alignItems(VerticalAlign.Center)

      TextInput({ text: c.note, placeholder: '备注（可选）' })
        .id(`task-checkpoint-${c.id}-note`)
        .width('100%')
        .height(40)
        .margin({ top: 10 })
        .padding({ left: 12, right: 12 })
        .borderRadius(12)
        .backgroundColor('rgba(241,245,249,0.7)')
        .placeholderColor(Theme.slate400)
        .placeholderFont({ size: 13 })
        .fontSize(13)
        .fontColor(Theme.slate900)
        .onChange((v: string) => {
          this.controller.changeCheckpointNote(this.controller.activeInspectionId, c.id, v);
        })
    }
    .id(`task-checkpoint-${c.id}`)
    .width('100%')
    .padding(14)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderHairline })
    .margin({ bottom: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Toggle(sid: string, label: string, active: boolean, iconActive: string, iconIdle: string,
         activeColor: string, onTap: () => void) {
    Row() {
      SvgIcon({ variant: active ? iconActive : iconIdle, iconSize: 16,
        color: active ? activeColor : Theme.slate400 })
      Text(label)
        .fontSize(13)
        .fontColor(active ? activeColor : Theme.slate600)
        .margin({ left: 4 })
    }
    .id(sid)
    .layoutWeight(1)
    .height(36)
    .borderRadius(18)
    .backgroundColor(active ? (activeColor === Theme.riskHigh ? 'rgba(254,226,226,0.7)' : 'rgba(209,250,229,0.7)') : 'rgba(241,245,249,0.7)')
    .border({ width: 1, color: active ? activeColor : Theme.slate200 })
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .margin({ right: 8 })
    .onClick(() => onTap())
  }

  @Builder
  SubmitBar() {
    Row() {
      Text('提交巡检')
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
    }
    .id('task-submit-button')
    .width('100%')
    .height(50)
    .borderRadius(Theme.radiusButton)
    .linearGradient(BrandGradient.tealDeep)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ left: 16, right: 16, bottom: 20 })
    .onClick(() => this.controller.submitInspection(this.controller.activeInspectionId))
  }

  private task(): InspectionTask | null {
    return this.controller.activeInspection();
  }

  private taskName(): string {
    const t: InspectionTask | null = this.task();
    if (t === null) {
      return '巡检任务';
    }
    return (t as InspectionTask).name;
  }

  private percent(): number {
    const t: InspectionTask | null = this.task();
    if (t === null) {
      return 0;
    }
    return this.controller.inspectionProgress(t as InspectionTask);
  }
}
