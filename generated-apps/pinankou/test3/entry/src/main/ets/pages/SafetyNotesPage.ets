import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SafetyNoteController } from '../controllers/SafetyNoteController';
import { SafetyNote, Priority } from '../model/SafetyNote';
import { PageHeader, EmptyStateView } from '../components/CommonUi';
import { formatDate } from '../services/IdGenerator';
import { levelColor, levelSoftColor, levelLabel } from '../components/CommonUi';

@Component
export struct SafetyNotesPage {
  onBack?: () => void;
  onOpenDetail?: (id: string) => void;
  @State items: SafetyNote[] = [];
  @State completedCount: number = 0;
  private controller = new SafetyNoteController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    this.items = this.controller.list();
    this.completedCount = this.items.filter(n => n.isDone).length;
  }

  private toggleDone(item: SafetyNote): void {
    item.isDone = !item.isDone;
    this.controller.save(item);
    this.refresh();
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: '安全事项',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.addButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Row() {
            Text(`已完成 ${this.completedCount}/${this.items.length}`)
              .id('safety-notes-completed-count')
              .fontSize(12)
              .fontColor(Theme.textTertiary)
            Blank()
          }
          .width('100%')

          List({ space: 12 }) {
            if (this.items.length === 0) {
              ListItem() {
                EmptyStateView({ title: '暂无安全事项', subtitle: '点击右上角 + 新增' })
                  .id('safety-notes-empty-state')
              }
            }
            ForEach(this.items, (item: SafetyNote) => {
              ListItem() {
                this.NoteCard(item)
              }
              .id(`safety-note-${item.id}`)
              .onClick(() => {
                if (this.onOpenDetail) this.onOpenDetail(item.id);
              })
            }, (item: SafetyNote) => item.id)
          }
          .id('safety-notes-list')
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
    .id('safety-notes-add-button')
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
  NoteCard(item: SafetyNote) {
    Row({ space: 12 }) {
      Toggle({ type: ToggleType.Checkbox, isOn: item.isDone })
        .width(22)
        .height(22)
        .selectedColor(Theme.brandPrimary)
        .onChange((isOn: boolean) => {
          item.isDone = isOn;
          this.toggleDone(item);
        })

      Column({ space: 6 }) {
        Text(item.title || '未命名事项')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(item.isDone ? Theme.textQuaternary : Theme.textPrimary)
          .decoration({ type: item.isDone ? TextDecorationType.LineThrough : TextDecorationType.None })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .layoutWeight(1)

        Row({ space: 8 }) {
          Text(levelLabel(item.priority))
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(levelColor(item.priority))
            .padding({ left: 8, right: 8, top: 3, bottom: 3 })
            .backgroundColor(levelSoftColor(item.priority))
            .borderRadius(Theme.radiusChip)
          Text(item.assignee || '未指派')
            .fontSize(12)
            .fontColor(Theme.textTertiary)
          if (item.deadline !== null) {
            Text(formatDate(item.deadline))
              .fontSize(11)
              .fontColor(Theme.textQuaternary)
          }
        }
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
