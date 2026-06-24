import { Theme } from '../common/Theme';
import { SafetyNoteController } from '../controllers/SafetyNoteController';
import { SafetyNote, Priority } from '../model/SafetyNote';
import { PageHeader, FormField, PrimaryButton, DangerButton } from '../components/CommonUi';
import { formatDate, parseDate } from '../services/IdGenerator';
import { levelColor, levelSoftColor, levelLabel } from '../components/CommonUi';
import { promptAction } from '@kit.ArkUI';

const PRIORITY_OPTIONS: Priority[] = [Priority.LOW, Priority.MEDIUM, Priority.HIGH];

@Component
export struct SafetyNoteDetailPage {
  noteId: string = '';
  onBack?: () => void;
  @State draft: SafetyNote = new SafetyNote();
  private controller = new SafetyNoteController();

  aboutToAppear(): void {
    if (this.noteId) {
      const found = this.controller.get(this.noteId);
      if (found) {
        this.draft = new SafetyNote();
        this.draft.id = found.id;
        this.draft.title = found.title;
        this.draft.description = found.description;
        this.draft.priority = found.priority;
        this.draft.assignee = found.assignee;
        this.draft.deadline = found.deadline;
        this.draft.isDone = found.isDone;
        this.draft.createdAt = found.createdAt;
        this.draft.updatedAt = found.updatedAt;
      } else {
        this.draft = this.controller.createDraft();
      }
    } else {
      this.draft = this.controller.createDraft();
    }
  }

  private save(): void {
    if (!this.draft.title.trim()) {
      promptAction.showToast({ message: '请输入事项标题' });
      return;
    }
    this.controller.save(this.draft);
    promptAction.showToast({ message: '已保存' });
    if (this.onBack) this.onBack();
  }

  private delete(): void {
    if (this.noteId) {
      this.controller.delete(this.noteId);
      if (this.onBack) this.onBack();
    }
  }

  private priorityIndex(): number {
    return PRIORITY_OPTIONS.indexOf(this.draft.priority);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: this.noteId ? '事项详情' : '新建事项',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.saveButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Column({ space: 16 }) {
            FormField({
              label: '事项标题',
              placeholder: '请输入事项标题',
              value: this.draft.title,
              componentId: 'safety-note-detail-title-input',
              onChange: (v) => this.draft.title = v
            })

            Column({ space: 6 }) {
              Text('优先级')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              Select([
                { value: '低' },
                { value: '中' },
                { value: '高' }
              ])
                .id('safety-note-detail-priority-picker')
                .selected(this.priorityIndex())
                .value(levelLabel(this.draft.priority))
                .font({ size: 14, weight: FontWeight.Medium })
                .fontColor(levelColor(this.draft.priority))
                .backgroundColor(levelSoftColor(this.draft.priority))
                .width('100%')
                .onSelect((index: number) => {
                  this.draft.priority = PRIORITY_OPTIONS[index];
                })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)

            FormField({
              label: '责任人',
              placeholder: '请输入责任人',
              value: this.draft.assignee,
              componentId: 'safety-note-detail-assignee-input',
              onChange: (v) => this.draft.assignee = v
            })

            Column({ space: 6 }) {
              Text('截止日期')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              TextInput({ text: formatDate(this.draft.deadline), placeholder: '选择日期' })
                .id('safety-note-detail-deadline-picker')
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

            FormField({
              label: '备注',
              placeholder: '请输入备注',
              value: this.draft.description,
              componentId: 'safety-note-detail-description-input',
              multiline: true,
              onChange: (v) => this.draft.description = v
            })

            Row({ space: 12 }) {
              Text('已完成')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .layoutWeight(1)
              Toggle({ type: ToggleType.Switch, isOn: this.draft.isDone })
                .id('safety-note-detail-done-toggle')
                .selectedColor(Theme.brandPrimary)
                .onChange((isOn: boolean) => {
                  this.draft.isDone = isOn;
                })
            }
            .width('100%')
            .height(48)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          if (this.noteId) {
            DangerButton({
              label: '删除事项',
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

      Column() {
        PrimaryButton({
          label: '保存',
          onTap: () => this.save()
        })
          .id('safety-note-detail-save-button')
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.pageBg)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  saveButton() {
    Button('保存')
      .id('safety-note-detail-save-button')
      .fontSize(14)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.brandPrimary)
      .backgroundColor(Color.Transparent)
      .onClick(() => this.save())
  }
}
