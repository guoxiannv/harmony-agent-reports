import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme } from '../common/Theme'
import { Reminder } from '../models/Reminder'
import { Pet } from '../models/Pet'

interface RemindersPageProps {
  state: AppState
  repository: Repository
  onBack: () => void
  onOpenReminderEditor: (reminderId?: string, petId?: string) => void
}

@Component
export struct RemindersPage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))
  onBack: () => void = () => {}
  onOpenReminderEditor: (reminderId?: string, petId?: string) => void = () => {}

  private filteredReminders(): Reminder[] {
    if (this.state.reminderFilterStatus === 'all') {
      return this.state.reminders.slice()
    }
    return this.state.reminders.filter((r: Reminder) => this.repository.reminderStatus(r) === this.state.reminderFilterStatus)
  }

  private petName(petId: string): string {
    return this.state.pets.find((p: Pet) => p.id === petId)?.name ?? ''
  }

  private statusLabel(status: 'due' | 'upcoming' | 'normal'): string {
    if (status === 'due') return '逾期'
    if (status === 'upcoming') return '即将到期'
    return '正常'
  }

  private statusBg(status: 'due' | 'upcoming' | 'normal'): string {
    if (status === 'due') return Theme.statusOverdueBg
    if (status === 'upcoming') return Theme.statusSoonBg
    return Theme.statusOkBg
  }

  private statusText(status: 'due' | 'upcoming' | 'normal'): string {
    if (status === 'due') return Theme.statusOverdueText
    if (status === 'upcoming') return Theme.statusSoonText
    return Theme.statusOkText
  }

  private statusBorder(status: 'due' | 'upcoming' | 'normal'): string {
    if (status === 'due') return Theme.statusOverdue
    if (status === 'upcoming') return Theme.statusSoon
    return Theme.statusOk
  }

  build() {
    Column({ space: 0 }) {
      Row() {
        Text('<')
          .fontSize(22)
          .fontColor(Theme.textSecondary)
          .onClick(() => this.onBack())
        Text('提醒管理')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text('添加')
          .id('reminders-add-button')
          .fontSize(14)
          .fontColor(Theme.brandPrimary)
          .onClick(() => this.onOpenReminderEditor(undefined, this.state.selectedPetId))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({ top: 24, bottom: 16 })

      Select([
        { value: '全部' },
        { value: '逾期' },
        { value: '即将到期' },
        { value: '正常' }
      ])
        .id('reminders-filter-status')
        .selected(this.statusIndex())
        .onSelect((index: number) => {
          const statuses: ('all' | 'due' | 'upcoming' | 'normal')[] = ['all', 'due', 'upcoming', 'normal']
          this.state.reminderFilterStatus = statuses[index]
        })
        .margin({ bottom: 16 })

      List({ space: 12 }) {
        if (this.filteredReminders().length === 0) {
          ListItem() {
            Text('暂无提醒')
              .id('reminders-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 60, bottom: 60 })
          }
        } else {
          ForEach(this.filteredReminders(), (r: Reminder) => {
            ListItem() {
              Row({ space: 12 }) {
                Column({ space: 2 }) {
                  Text(`${this.petName(r.petId)} · ${r.title}`)
                    .fontSize(15)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                  Text(`到期日 ${r.dueDate}`)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                Toggle({ type: ToggleType.Switch, isOn: r.enabled })
                  .id(`reminders-item-${r.id}-toggle`)
                  .selectedColor(Theme.brandPrimary)
                  .onChange((isOn: boolean) => {
                    r.enabled = isOn
                  })

                Text(this.statusLabel(this.repository.reminderStatus(r)))
                  .fontSize(11)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.statusText(this.repository.reminderStatus(r)))
                  .backgroundColor(this.statusBg(this.repository.reminderStatus(r)))
                  .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                  .borderRadius(8)
              }
              .width('100%')
              .padding(14)
              .backgroundColor(Theme.cardBg)
              .borderRadius(16)
              .border({ width: { left: 4 }, color: { left: this.statusBorder(this.repository.reminderStatus(r)) } })
            }
            .id(`reminders-item-${r.id}`)
            .onClick(() => this.onOpenReminderEditor(r.id))
          }, (r: Reminder) => r.id)
        }
      }
      .id('reminders-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .id('reminders-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }

  private statusIndex(): number {
    const s = this.state.reminderFilterStatus
    if (s === 'all') return 0
    if (s === 'due') return 1
    if (s === 'upcoming') return 2
    return 3
  }
}
