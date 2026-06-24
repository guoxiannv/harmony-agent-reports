import { AppState } from '../viewmodel/AppViewModel'
import { Theme } from '../common/Theme'
import { MedicalRecord } from '../models/MedicalRecord'
import { Pet } from '../models/Pet'

interface SelectOption {
  value: string
}

interface MedicalPageProps {
  state: AppState
  onBack: () => void
  onOpenMedicalEditor: (medicalId?: string, petId?: string) => void
}

@Component
export struct MedicalPage {
  @ObjectLink state: AppState
  onBack: () => void = () => {}
  onOpenMedicalEditor: (medicalId?: string, petId?: string) => void = () => {}

  private filteredMedical(): MedicalRecord[] {
    if (this.state.medicalFilterPetId === 'all') {
      return this.state.medicalRecords.slice()
    }
    return this.state.medicalRecords.filter((m: MedicalRecord) => m.petId === this.state.medicalFilterPetId)
  }

  private petName(petId: string): string {
    return this.state.pets.find((p: Pet) => p.id === petId)?.name ?? ''
  }

  build() {
    Column({ space: 0 }) {
      Row() {
        Text('<')
          .fontSize(22)
          .fontColor(Theme.textSecondary)
          .onClick(() => this.onBack())
        Text('病历归档')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text('添加')
          .id('medical-add-button')
          .fontSize(14)
          .fontColor(Theme.brandPrimary)
          .onClick(() => this.onOpenMedicalEditor(undefined, this.state.selectedPetId))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({ top: 24, bottom: 16 })

      Select([{ value: '全部宠物' }, ...this.state.pets.map((p: Pet): SelectOption => ({ value: p.name }))])
        .id('medical-filter-pet')
        .selected(this.state.medicalFilterPetId === 'all' ? 0 : this.state.pets.findIndex((p: Pet) => p.id === this.state.medicalFilterPetId) + 1)
        .onSelect((index: number) => {
          this.state.medicalFilterPetId = index === 0 ? 'all' : this.state.pets[index - 1].id
        })
        .margin({ bottom: 16 })

      List({ space: 12 }) {
        if (this.filteredMedical().length === 0) {
          ListItem() {
            Text('暂无病历')
              .id('medical-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 60, bottom: 60 })
          }
        } else {
          ForEach(this.filteredMedical(), (m: MedicalRecord) => {
            ListItem() {
              Column({ space: 8 }) {
                Row() {
                  Text(`${this.petName(m.petId)} · ${m.hospital || '未知医院'}`)
                    .fontSize(15)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                    .layoutWeight(1)
                  Text(m.date)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .width('100%')

                if (m.symptom) {
                  Text(`症状：${m.symptom}`)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                    .width('100%')
                }

                if (m.diagnosis) {
                  Text(`诊断：${m.diagnosis}`)
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                    .width('100%')
                }

                if (m.images.length > 0) {
                  Row({ space: 8 }) {
                    ForEach(m.images.slice(0, 3), (img: string, index: number) => {
                      Image(img)
                        .id(`medical-card-${m.id}-image-${index}`)
                        .width(60)
                        .height(60)
                        .borderRadius(8)
                        .objectFit(ImageFit.Cover)
                    }, (img: string, index: number) => `${index}`)
                  }
                  .id(`medical-card-${m.id}-images`)
                  .width('100%')
                  .margin({ top: 4 })
                }
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusCard)
            }
            .id(`medical-card-${m.id}`)
            .onClick(() => this.onOpenMedicalEditor(m.id))
          }, (m: MedicalRecord) => m.id)
        }
      }
      .id('medical-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .id('medical-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }
}
