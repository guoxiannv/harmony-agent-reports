import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme, BrandGradient } from '../common/Theme'
import { SvgIcon } from '../common/SvgIcon'
import { Pet } from '../models/Pet'
import { Reminder } from '../models/Reminder'
import { RecordModel, RecordType } from '../models/Record'

interface HomePageProps {
  state: AppState
  repository: Repository
  onOpenRecordEditor: (recordId?: string, type?: RecordType, petId?: string) => void
  onOpenPetEditor: (petId?: string) => void
  onSelectPet: (petId: string) => void
  onNavigateRecords: () => void
  onOpenProfile: () => void
}

@Component
export struct HomePage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))
  onOpenRecordEditor: (recordId?: string, type?: RecordType, petId?: string) => void = () => {}
  onOpenPetEditor: (petId?: string) => void = () => {}
  onSelectPet: (petId: string) => void = () => {}
  onNavigateRecords: () => void = () => {}
  onOpenProfile: () => void = () => {}

  private todayReminders(): Reminder[] {
    return this.state.reminders
      .filter((r: Reminder) => r.enabled)
      .filter((r: Reminder) => {
        const status: 'due' | 'upcoming' | 'normal' = this.repository.reminderStatus(r)
        return status === 'due' || status === 'upcoming'
      })
      .filter((r: Reminder) => this.state.selectedPetId ? r.petId === this.state.selectedPetId : true)
      .slice(0, 5)
  }

  private recentRecords(): RecordModel[] {
    return this.state.records
      .filter((r: RecordModel) => this.state.selectedPetId ? r.petId === this.state.selectedPetId : true)
      .slice(0, 5)
  }

  private petName(petId: string): string {
    return this.state.pets.find((p: Pet) => p.id === petId)?.name ?? ''
  }

  private reminderStatus(reminder: Reminder): 'due' | 'upcoming' | 'normal' {
    return this.repository.reminderStatus(reminder)
  }

  private reminderLabel(reminder: Reminder): string {
    const status = this.reminderStatus(reminder)
    if (status === 'due') return '逾期'
    if (status === 'upcoming') return '即将到期'
    return '正常'
  }

  private reminderStatusBg(reminder: Reminder): string {
    const status = this.reminderStatus(reminder)
    if (status === 'due') return Theme.statusOverdueBg
    if (status === 'upcoming') return Theme.statusSoonBg
    return Theme.statusOkBg
  }

  private reminderStatusText(reminder: Reminder): string {
    const status = this.reminderStatus(reminder)
    if (status === 'due') return Theme.statusOverdueText
    if (status === 'upcoming') return Theme.statusSoonText
    return Theme.statusOkText
  }

  private reminderStatusBorder(reminder: Reminder): string {
    const status = this.reminderStatus(reminder)
    if (status === 'due') return '#EF4444'
    if (status === 'upcoming') return '#F59E0B'
    return '#14B8A6'
  }

  private recordTypeColor(type: RecordType): string {
    if (type === RecordType.FOOD) return Theme.foodAccent
    if (type === RecordType.WASTE) return Theme.wasteAccent
    if (type === RecordType.WEIGHT) return Theme.weightAccent
    return Theme.medicineAccent
  }

  private recordTitle(r: RecordModel): string {
    const petName: string = this.petName(r.petId)
    if (r.type === RecordType.FOOD) return `${petName} · 饮食 · ${r.foodAmount}g ${r.foodType}`
    if (r.type === RecordType.WASTE) return `${petName} · 排泄 · ${this.wasteLabel(r.wasteType)}`
    if (r.type === RecordType.WEIGHT) return `${petName} · 体重 · ${r.weightValue}kg`
    return `${petName} · 用药 · ${r.medicineName}`
  }

  private wasteLabel(type: string): string {
    if (type === 'pee') return '小便'
    if (type === 'poop') return '大便'
    if (type === 'vomit') return '呕吐'
    return '其他'
  }

  private formatTime(datetime: string): string {
    return datetime.slice(11, 16)
  }

  private todayLabel(): string {
    const d: Date = new Date()
    const weekdays: string[] = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
    return `${d.getFullYear()}年${d.getMonth() + 1}月${d.getDate()}日 ${weekdays[d.getDay()]}`
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Column({ space: 4 }) {
            Text('早安，铲屎官 👋')
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
            Text(this.todayLabel())
              .fontSize(13)
              .fontColor(Theme.textTertiary)
          }
          .alignItems(HorizontalAlign.Start)

          Column() {
            SvgIcon({ variant: 'open-profile', iconSize: 20 })
          }
          .id('profile-settings-row')
          .width(42)
          .height(42)
          .borderRadius(21)
          .linearGradient(BrandGradient.avatar)
          .shadow({ radius: 12, color: 'rgba(251,113,133,0.20)', offsetY: 4 })
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.onOpenProfile())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 28, bottom: 20 })

        // Pet switcher section
        Row({ space: 8 }) {
          SvgIcon({ variant: 'current-pet', iconSize: 20 })
          Text('我的毛孩子')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
        }
        .width('100%')
        .margin({ bottom: 12 })

        Scroll() {
          Row({ space: 12 }) {
            ForEach(this.state.pets, (pet: Pet, index: number) => {
              Column({ space: 6 }) {
                Column() {
                  SvgIcon({ variant: index % 2 === 0 ? 'avatar-1' : 'avatar-2', iconSize: 28 })
                }
                .width(60)
                .height(60)
                .borderRadius(30)
                .linearGradient(BrandGradient.avatar)
                .border({
                  width: this.state.selectedPetId === pet.id ? 3 : 2,
                  color: this.state.selectedPetId === pet.id ? Theme.brandPrimary : Theme.pawPinkSoft
                })
                .shadow(this.state.selectedPetId === pet.id ? { radius: 12, color: 'rgba(20,184,166,0.25)' } : undefined)

                Text(pet.name)
                  .fontSize(12)
                  .fontColor(Theme.textSecondary)
              }
              .id(`home-pet-chip-${pet.id}`)
              .onClick(() => this.onSelectPet(pet.id))
            }, (pet: Pet) => pet.id)

            Column({ space: 6 }) {
              Column() {
                SvgIcon({ variant: 'add-pet', iconSize: 24 })
              }
              .width(60)
              .height(60)
              .borderRadius(30)
              .backgroundColor(Theme.cardBg)
              .border({ width: 2, color: Theme.borderDashed, style: BorderStyle.Dashed })

              Text('添加')
                .fontSize(12)
                .fontColor(Theme.textQuaternary)
            }
            .id('home-add-pet-button')
            .onClick(() => this.onOpenPetEditor())
          }
          .padding({ bottom: 6 })
        }
        .id('home-pet-switcher')
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Horizontal)
        .margin({ bottom: 20 })

        // Today reminders
        Row({ space: 8 }) {
          SvgIcon({ variant: 'reminder-vaccine', iconSize: 20 })
          Text('今日待办')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
        }
        .width('100%')
        .margin({ bottom: 12 })

        Column({ space: 10 }) {
          if (this.todayReminders().length === 0) {
            Text('今天没有待办提醒')
              .id('home-reminder-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 24, bottom: 24 })
          } else {
            ForEach(this.todayReminders(), (reminder: Reminder) => {
              Row({ space: 12 }) {
                Column() {
                  SvgIcon({ variant: reminder.category === 'deworm' ? 'reminder-deworm' : 'reminder-vaccine', iconSize: 20 })
                }
                .width(36)
                .height(36)
                .borderRadius(12)
                .backgroundColor(Theme.brandSoft)
                .justifyContent(FlexAlign.Center)

                Column({ space: 2 }) {
                  Text(`${this.petName(reminder.petId)} · ${reminder.title}`)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                  Text(this.reminderMeta(reminder))
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                Text(this.reminderLabel(reminder))
                  .fontSize(11)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.reminderStatusText(reminder))
                  .backgroundColor(this.reminderStatusBg(reminder))
                  .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                  .borderRadius(8)
              }
              .id(`home-reminder-${reminder.id}`)
              .width('100%')
              .padding(14)
              .backgroundColor(Theme.cardBg)
              .borderRadius(16)
              .border({ width: { left: 4 }, color: { left: this.reminderStatusBorder(reminder) } })
            }, (reminder: Reminder) => reminder.id)
          }
        }
        .id('home-reminder-list')
        .width('100%')
        .padding(18)
        .backgroundColor(Theme.cardWarmBg)
        .borderRadius(Theme.radiusCard)
        .border({ width: 1, color: 'rgba(251,113,133,0.10)' })
        .margin({ bottom: 20 })

        // Quick records
        Text('一键记录')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ bottom: 12 })

        Grid() {
          GridItem() { this.QuickRecordBtn('饮食', '吃了多少、吃什么', 'record-food', Theme.foodAccent, Theme.foodBg, 'home-quick-record-food', RecordType.FOOD) }
          GridItem() { this.QuickRecordBtn('排泄', '大小便、异常情况', 'record-waste', Theme.wasteAccent, Theme.wasteBg, 'home-quick-record-waste', RecordType.WASTE) }
          GridItem() { this.QuickRecordBtn('体重', '定期称重、追踪趋势', 'record-weight', Theme.weightAccent, Theme.weightBg, 'home-quick-record-weight', RecordType.WEIGHT) }
          GridItem() { this.QuickRecordBtn('用药', '药品、剂量、时间', 'record-medicine', Theme.medicineAccent, Theme.medicineBg, 'home-quick-record-medicine', RecordType.MEDICINE) }
        }
        .width('100%')
        .columnsTemplate('1fr 1fr')
        .columnsGap(12)
        .rowsGap(12)
        .margin({ bottom: 20 })

        // Recent records
        Text('最近记录')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ bottom: 12 })

        Column({ space: 12 }) {
          if (this.recentRecords().length === 0) {
            Text('还没有记录，快去添加吧')
              .id('home-recent-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 24, bottom: 24 })
          } else {
            ForEach(this.recentRecords(), (r: RecordModel) => {
              Row({ space: 12 }) {
                Column()
                  .width(10)
                  .height(10)
                  .borderRadius(5)
                  .backgroundColor(this.recordTypeColor(r.type))

                Column({ space: 2 }) {
                  Text(this.recordTitle(r))
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                  Text(r.note || this.typeHint(r.type))
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                Text(this.formatTime(r.datetime))
                  .fontSize(12)
                  .fontColor(Theme.textQuaternary)
              }
              .id(`home-recent-record-${r.id}`)
              .width('100%')
              .padding(14)
              .backgroundColor(Theme.cardBg)
              .borderRadius(18)
              .shadow({ radius: 8, color: 'rgba(15,23,42,0.04)', offsetY: 2 })
              .onClick(() => this.onOpenRecordEditor(r.id))
            }, (r: RecordModel) => r.id)
          }

          Text('查看全部记录')
            .id('home-view-all-records')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.brandPrimary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(12)
            .backgroundColor('#F8FAFC')
            .borderRadius(16)
            .margin({ top: 4 })
            .onClick(() => this.onNavigateRecords())
        }
        .width('100%')
        .padding(18)
        .backgroundColor(Theme.cardBg)
        .borderRadius(Theme.radiusCard)
        .shadow({ radius: 16, color: 'rgba(15,23,42,0.06)', offsetY: 4 })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      .constraintSize({ maxWidth: Theme.contentMaxWidth })
    }
    .id('home-page')
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .scrollBar(BarState.Off)
  }

  @Builder
  QuickRecordBtn(label: string, hint: string, icon: string, accent: string, bg: string, id: string, type: RecordType) {
    Column({ space: 10 }) {
      Column() {
        SvgIcon({ variant: icon, iconSize: 24 })
      }
      .width(44)
      .height(44)
      .borderRadius(14)
      .backgroundColor(bg)
      .justifyContent(FlexAlign.Center)

      Text(label)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textSecondary)

      Text(hint)
        .fontSize(12)
        .fontColor(Theme.textTertiary)
    }
    .id(id)
    .width('100%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(20)
    .shadow({ radius: 16, color: 'rgba(15,23,42,0.06)', offsetY: 4 })
    .alignItems(HorizontalAlign.Start)
    .onClick(() => this.onOpenRecordEditor(undefined, type, this.state.selectedPetId))
  }

  private reminderMeta(reminder: Reminder): string {
    const due: Date = new Date(reminder.dueDate)
    const today: Date = new Date()
    today.setHours(0, 0, 0, 0)
    const diff: number = Math.ceil((due.getTime() - today.getTime()) / (24 * 60 * 60 * 1000))
    if (diff < 0) return `已逾期 ${Math.abs(diff)} 天`
    if (diff === 0) return '今天到期'
    return `${diff} 天后到期`
  }

  private typeHint(type: RecordType): string {
    if (type === RecordType.FOOD) return '记录了饮食'
    if (type === RecordType.WASTE) return '记录了排泄'
    if (type === RecordType.WEIGHT) return '记录了体重'
    return '记录了用药'
  }
}
