import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme, BrandGradient } from '../common/Theme'
import { SvgIcon } from '../common/SvgIcon'
import { Pet } from '../models/Pet'
import { Reminder } from '../models/Reminder'
import { MedicalRecord } from '../models/MedicalRecord'

interface PetDetailPageProps {
  state: AppState
  repository: Repository
  petId: string
  onBack: () => void
  onOpenPetEditor: (petId?: string) => void
  onOpenReminderEditor: (reminderId?: string, petId?: string) => void
  onOpenMedicalEditor: (medicalId?: string, petId?: string) => void
}

@Component
export struct PetDetailPage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))
  petId: string = ''
  @State private pet: Pet | null = null
  onBack: () => void = () => {}
  onOpenPetEditor: (petId?: string) => void = () => {}
  onOpenReminderEditor: (reminderId?: string, petId?: string) => void = () => {}
  onOpenMedicalEditor: (medicalId?: string, petId?: string) => void = () => {}

  aboutToAppear(): void {
    this.pet = this.state.pets.find((p: Pet) => p.id === this.petId) ?? null
  }

  private reminders(): Reminder[] {
    return this.state.reminders.filter((r: Reminder) => r.petId === this.petId).slice(0, 3)
  }

  private medical(): MedicalRecord[] {
    return this.state.medicalRecords.filter((m: MedicalRecord) => m.petId === this.petId).slice(0, 3)
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        Row() {
          Text('<')
            .id('pet-detail-back')
            .fontSize(22)
            .fontColor(Theme.textSecondary)
            .onClick(() => this.onBack())
          Text('宠物详情')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
          Text('编辑')
            .id('pet-detail-edit')
            .fontSize(14)
            .fontColor(Theme.brandPrimary)
            .onClick(() => this.onOpenPetEditor(this.petId))
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 24, bottom: 20 })

        if (this.pet === null) {
          Text('宠物不存在')
            .fontSize(14)
            .fontColor(Theme.textTertiary)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding({ top: 80 })
        } else {
          Column() {
            SvgIcon({ variant: 'avatar-1', iconSize: 40 })
          }
          .id('pet-detail-avatar')
          .width(90)
          .height(90)
          .borderRadius(45)
          .linearGradient(BrandGradient.avatar)
          .justifyContent(FlexAlign.Center)
          .alignSelf(ItemAlign.Center)
          .margin({ bottom: 12 })

          Text(this.pet!.name)
            .id('pet-detail-name')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .alignSelf(ItemAlign.Center)

          Text(`${this.pet!.species || ''} · ${this.pet!.breed || ''} · ${this.pet!.gender === 'male' ? '公' : this.pet!.gender === 'female' ? '母' : '未知'}`)
            .id('pet-detail-info')
            .fontSize(13)
            .fontColor(Theme.textTertiary)
            .alignSelf(ItemAlign.Center)
            .margin({ bottom: 16 })

          Row({ space: 16 }) {
            this.InfoChip('最近体重', this.latestWeight(this.pet!.id), 'pet-detail-latest-weight')
            this.InfoChip('生日', this.pet!.birthday || '未设置', '')
            this.InfoChip('绝育', this.pet!.neutered ? '已绝育' : '未绝育', '')
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 24 })

          // Reminders
          this.SectionHeader('提醒', () => this.onOpenReminderEditor(undefined, this.petId), 'pet-detail-add-reminder')
          Column({ space: 10 }) {
            if (this.reminders().length === 0) {
              Text('暂无提醒')
                .id('pet-detail-reminder-empty')
                .fontSize(13)
                .fontColor(Theme.textTertiary)
                .width('100%')
                .textAlign(TextAlign.Center)
                .padding({ top: 16, bottom: 16 })
            } else {
              ForEach(this.reminders(), (r: Reminder) => {
                Row() {
                  Text(r.title)
                    .fontSize(14)
                    .fontColor(Theme.textSecondary)
                    .layoutWeight(1)
                  Text(r.dueDate)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .id(`pet-detail-reminder-${r.id}`)
                .width('100%')
                .padding(12)
                .backgroundColor(Theme.cardBg)
                .borderRadius(12)
              }, (r: Reminder) => r.id)
            }
          }
          .id('pet-detail-reminder-list')
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.brandSoft)
          .borderRadius(Theme.radiusCard)
          .margin({ bottom: 16 })

          // Medical
          this.SectionHeader('病历', () => this.onOpenMedicalEditor(undefined, this.petId), 'pet-detail-add-medical')
          Column({ space: 10 }) {
            if (this.medical().length === 0) {
              Text('暂无病历')
                .id('pet-detail-medical-empty')
                .fontSize(13)
                .fontColor(Theme.textTertiary)
                .width('100%')
                .textAlign(TextAlign.Center)
                .padding({ top: 16, bottom: 16 })
            } else {
              ForEach(this.medical(), (m: MedicalRecord) => {
                Row() {
                  Text(m.hospital || '未知医院')
                    .fontSize(14)
                    .fontColor(Theme.textSecondary)
                    .layoutWeight(1)
                  Text(m.date)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .id(`pet-detail-medical-${m.id}`)
                .width('100%')
                .padding(12)
                .backgroundColor(Theme.cardBg)
                .borderRadius(12)
              }, (m: MedicalRecord) => m.id)
            }
          }
          .id('pet-detail-medical-list')
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardWarmBg)
          .borderRadius(Theme.radiusCard)
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      .constraintSize({ maxWidth: Theme.contentMaxWidth })
    }
    .id('pet-detail-page')
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .scrollBar(BarState.Off)
  }

  @Builder
  InfoChip(label: string, value: string, id: string) {
    Column({ space: 4 }) {
      Text(label)
        .fontSize(11)
        .fontColor(Theme.textTertiary)
      Text(value)
        .id(id)
        .fontSize(15)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textSecondary)
    }
    .padding({ left: 12, right: 12, top: 10, bottom: 10 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(14)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  SectionHeader(title: string, onAdd: () => void, addId: string) {
    Row() {
      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
      Text('添加')
        .id(addId)
        .fontSize(13)
        .fontColor(Theme.brandPrimary)
        .onClick(onAdd)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .margin({ bottom: 12 })
  }

  private latestWeight(petId: string): string {
    const w: number | null = this.repository.latestWeight(petId)
    return w !== null ? `${w.toFixed(1)}kg` : '未记录'
  }
}
