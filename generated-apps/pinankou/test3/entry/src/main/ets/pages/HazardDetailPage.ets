import { Theme } from '../common/Theme';
import { HazardController } from '../controllers/HazardController';
import { Hazard, HazardLevel, HazardStatus, HazardComment } from '../model/Hazard';
import { PageHeader, FormField, PrimaryButton, DangerButton, GhostButton } from '../components/CommonUi';
import { formatDate, parseDate } from '../services/IdGenerator';
import { levelColor, levelSoftColor, levelLabel, hazardStatusLabel, hazardStatusColor, hazardStatusSoftColor } from '../components/CommonUi';
import { promptAction } from '@kit.ArkUI';

const STATUS_OPTIONS: HazardStatus[] = [HazardStatus.PENDING, HazardStatus.IN_PROGRESS, HazardStatus.AWAITING_ACCEPTANCE, HazardStatus.CLOSED];
const LEVEL_OPTIONS: HazardLevel[] = [HazardLevel.LOW, HazardLevel.MEDIUM, HazardLevel.HIGH];

@Component
export struct HazardDetailPage {
  hazardId: string = '';
  onBack?: () => void;
  @State draft: Hazard = new Hazard();
  @State comments: HazardComment[] = [];
  @State commentInput: string = '';
  private controller = new HazardController();

  aboutToAppear(): void {
    this.load();
  }

  private load(): void {
    if (this.hazardId) {
      const found = this.controller.get(this.hazardId);
      if (found) {
        this.draft = new Hazard();
        this.draft.id = found.id;
        this.draft.title = found.title;
        this.draft.description = found.description;
        this.draft.location = found.location;
        this.draft.level = found.level;
        this.draft.status = found.status;
        this.draft.assignee = found.assignee;
        this.draft.deadline = found.deadline;
        this.draft.photos = found.photos;
        this.draft.createdAt = found.createdAt;
        this.draft.updatedAt = found.updatedAt;
      } else {
        this.draft = this.controller.createDraft();
      }
      this.comments = this.controller.comments(this.hazardId);
    } else {
      this.draft = this.controller.createDraft();
      this.comments = [];
    }
  }

  private save(): void {
    if (!this.draft.title.trim()) {
      promptAction.showToast({ message: '请输入隐患标题' });
      return;
    }
    this.controller.save(this.draft);
    promptAction.showToast({ message: '已保存' });
    if (this.onBack) this.onBack();
  }

  private delete(): void {
    if (this.hazardId) {
      this.controller.delete(this.hazardId);
      if (this.onBack) this.onBack();
    }
  }

  private submitComment(): void {
    if (!this.commentInput.trim() || !this.hazardId) return;
    this.controller.addComment(this.hazardId, this.commentInput);
    this.commentInput = '';
    this.comments = this.controller.comments(this.hazardId);
    const updated = this.controller.get(this.hazardId);
    if (updated) {
      this.draft = new Hazard();
      this.draft.id = updated.id;
      this.draft.title = updated.title;
      this.draft.description = updated.description;
      this.draft.location = updated.location;
      this.draft.level = updated.level;
      this.draft.status = updated.status;
      this.draft.assignee = updated.assignee;
      this.draft.deadline = updated.deadline;
      this.draft.photos = updated.photos;
      this.draft.createdAt = updated.createdAt;
      this.draft.updatedAt = updated.updatedAt;
    }
  }

  private statusIndex(): number {
    return STATUS_OPTIONS.indexOf(this.draft.status);
  }

  private levelIndex(): number {
    return LEVEL_OPTIONS.indexOf(this.draft.level);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: this.hazardId ? '隐患详情' : '上报隐患',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.saveButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Column({ space: 16 }) {
            FormField({
              label: '隐患标题',
              placeholder: '请输入隐患标题',
              value: this.draft.title,
              componentId: 'hazard-detail-title-input',
              onChange: (v) => this.draft.title = v
            })
            FormField({
              label: '发生地点',
              placeholder: '请输入地点',
              value: this.draft.location,
              componentId: 'hazard-detail-location-input',
              onChange: (v) => this.draft.location = v
            })
            FormField({
              label: '隐患描述',
              placeholder: '请描述隐患情况',
              value: this.draft.description,
              componentId: 'hazard-detail-description-input',
              multiline: true,
              onChange: (v) => this.draft.description = v
            })

            Column({ space: 6 }) {
              Text('风险等级')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              Select([
                { value: '低' },
                { value: '中' },
                { value: '高' }
              ])
                .id('hazard-detail-level-picker')
                .selected(this.levelIndex())
                .value(levelLabel(this.draft.level))
                .font({ size: 14, weight: FontWeight.Medium })
                .fontColor(levelColor(this.draft.level))
                .backgroundColor(levelSoftColor(this.draft.level))
                .width('100%')
                .onSelect((index: number) => {
                  this.draft.level = LEVEL_OPTIONS[index];
                })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)

            Column({ space: 6 }) {
              Text('整改进度')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              Select([
                { value: '待处理' },
                { value: '整改中' },
                { value: '待验收' },
                { value: '已关闭' }
              ])
                .id('hazard-detail-status-picker')
                .selected(this.statusIndex())
                .value(hazardStatusLabel(this.draft.status))
                .font({ size: 14, weight: FontWeight.Medium })
                .fontColor(hazardStatusColor(this.draft.status))
                .backgroundColor(hazardStatusSoftColor(this.draft.status))
                .width('100%')
                .onSelect((index: number) => {
                  this.draft.status = STATUS_OPTIONS[index];
                })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)

            FormField({
              label: '责任人',
              placeholder: '请输入责任人',
              value: this.draft.assignee,
              componentId: 'hazard-detail-assignee-input',
              onChange: (v) => this.draft.assignee = v
            })

            Column({ space: 6 }) {
              Text('整改期限')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              TextInput({ text: formatDate(this.draft.deadline), placeholder: '选择日期' })
                .id('hazard-detail-deadline-picker')
                .width('100%')
                .height(48)
                .fontSize(14)
                .fontColor(Theme.textPrimary)
                .placeholderColor(Theme.textPlaceholder)
                .backgroundColor(Theme.inputBg)
                .border({ width: 1, color: Theme.borderDefault })
                .borderRadius(Theme.radiusPill)
                .padding({ left: 14, right: 14 })
                .onChange((v) => {
                  const ts = parseDate(v);
                  this.draft.deadline = ts;
                })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          if (this.hazardId) {
            Column({ space: 12 }) {
              Text('整改进度')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
                .width('100%')

              this.ProgressTracker()
            }
            .id('hazard-detail-progress-tracker')
            .width('100%')
            .padding(16)
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusCard)
            .shadow(Theme.cardShadow)

            Column({ space: 12 }) {
              Text('评论')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
                .width('100%')

              List({ space: 12 }) {
                if (this.comments.length === 0) {
                  ListItem() {
                    Text('暂无评论')
                      .id('hazard-empty-comments')
                      .fontSize(14)
                      .fontColor(Theme.textQuaternary)
                      .width('100%')
                      .padding({ top: 16, bottom: 16 })
                      .textAlign(TextAlign.Center)
                  }
                }
                ForEach(this.comments, (comment: HazardComment) => {
                  ListItem() {
                    Column({ space: 4 }) {
                      Text(comment.content)
                        .fontSize(14)
                        .fontColor(Theme.textSecondary)
                        .width('100%')
                      Text(formatDate(comment.createdAt))
                        .fontSize(11)
                        .fontColor(Theme.textQuaternary)
                        .width('100%')
                    }
                    .width('100%')
                    .padding(12)
                    .backgroundColor(Theme.inputBg)
                    .borderRadius(Theme.radiusPill)
                    .alignItems(HorizontalAlign.Start)
                  }
                  .id(`hazard-comment-${comment.id}`)
                }, (comment: HazardComment) => comment.id)
              }
              .id('hazard-detail-comment-list')
              .width('100%')

              Row({ space: 8 }) {
                TextInput({ text: this.commentInput, placeholder: '添加评论...' })
                  .id('hazard-detail-comment-input')
                  .layoutWeight(1)
                  .height(44)
                  .fontSize(14)
                  .fontColor(Theme.textPrimary)
                  .placeholderColor(Theme.textPlaceholder)
                  .backgroundColor(Theme.inputBg)
                  .border({ width: 1, color: Theme.borderDefault })
                  .borderRadius(Theme.radiusPill)
                  .padding({ left: 14, right: 14 })
                  .onChange((v) => this.commentInput = v)
                Button('发送')
                  .id('hazard-detail-submit-comment-button')
                  .height(44)
                  .padding({ left: 16, right: 16 })
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textOnBrand)
                  .backgroundColor(Theme.brandPrimary)
                  .borderRadius(Theme.radiusButton)
                  .enabled(this.commentInput.trim().length > 0)
                  .onClick(() => this.submitComment())
              }
              .width('100%')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Theme.cardBg)
            .borderRadius(Theme.radiusCard)
            .shadow(Theme.cardShadow)

            DangerButton({
              label: '删除隐患',
              onTap: () => this.delete()
            })
          }

          Blank().height(24)
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
  saveButton() {
    Button('保存')
      .id('hazard-detail-save-button')
      .fontSize(14)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.brandPrimary)
      .backgroundColor(Color.Transparent)
      .onClick(() => this.save())
  }

  @Builder
  ProgressTracker() {
    Column({ space: 0 }) {
      ForEach(STATUS_OPTIONS, (status: HazardStatus, index: number) => {
        Row({ space: 12 }) {
          Column() {
            if (this.isActiveStatus(status)) {
              Column()
                .width(12)
                .height(12)
                .borderRadius(6)
                .backgroundColor(Theme.brandPrimary)
            } else if (this.isCompletedStatus(status)) {
              Column()
                .width(12)
                .height(12)
                .borderRadius(6)
                .border({ width: 2, color: Theme.brandPrimary })
                .backgroundColor(Theme.cardBg)
            } else {
              Column()
                .width(12)
                .height(12)
                .borderRadius(6)
                .border({ width: 2, color: Theme.borderDefault })
                .backgroundColor(Theme.cardBg)
            }
          }
          .width(24)
          .height(24)
          .justifyContent(FlexAlign.Center)

          Text(hazardStatusLabel(status))
            .fontSize(14)
            .fontWeight(this.isActiveStatus(status) ? FontWeight.Bold : FontWeight.Normal)
            .fontColor(this.isActiveStatus(status) || this.isCompletedStatus(status) ? Theme.textPrimary : Theme.textQuaternary)
            .layoutWeight(1)
        }
        .width('100%')
        .height(40)
      }, (status: HazardStatus) => status)
    }
    .width('100%')
  }

  private isActiveStatus(status: HazardStatus): boolean {
    return this.draft.status === status;
  }

  private isCompletedStatus(status: HazardStatus): boolean {
    const idx = STATUS_OPTIONS.indexOf(status);
    const current = STATUS_OPTIONS.indexOf(this.draft.status);
    return idx < current;
  }
}
