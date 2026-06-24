import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme } from '../common/Theme'
import { RecordModel, RecordType } from '../models/Record'
import { Pet } from '../models/Pet'

interface SelectOption {
  value: string
}

interface RecordsPageProps {
  state: AppState
  repository: Repository
  onOpenRecordEditor: (recordId?: string, type?: RecordType, petId?: string) => void
}

@Component
export struct RecordsPage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))
  onOpenRecordEditor: (recordId?: string, type?: RecordType, petId?: string) => void = () => {}

  private filteredRecords(): RecordModel[] {
    return this.repository.filterRecords(
      this.state.recordFilter.petId,
      this.state.recordFilter.type,
      this.state.recordFilter.dateRange
    )
  }

  private petName(petId: string): string {
    return this.state.pets.find((p: Pet) => p.id === petId)?.name ?? ''
  }

  private formatDate(datetime: string): string {
    return datetime.slice(0, 10)
  }

  private typeLabel(type: RecordType): string {
    if (type === RecordType.FOOD) return '饮食'
    if (type === RecordType.WASTE) return '排泄'
    if (type === RecordType.WEIGHT) return '体重'
    return '用药'
  }

  build() {
    Column({ space: 0 }) {
      Text('记录')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .width('100%')
        .margin({ top: 24, bottom: 16 })

      // Filters
      Row({ space: 8 }) {
        Select([{ value: '全部宠物' }, ...this.state.pets.map((p: Pet): SelectOption => ({ value: p.name }))])
          .id('records-filter-pet')
          .selected(this.state.recordFilter.petId === 'all' ? 0 : this.state.pets.findIndex((p: Pet) => p.id === this.state.recordFilter.petId) + 1)
          .onSelect((index: number) => {
            this.state.recordFilter.petId = index === 0 ? 'all' : this.state.pets[index - 1].id
          })

        Select([
          { value: '全部类型' },
          { value: '饮食' },
          { value: '排泄' },
          { value: '体重' },
          { value: '用药' }
        ])
          .id('records-filter-type')
          .selected(this.filterTypeIndex())
          .onSelect((index: number) => {
            const types: (RecordType | 'all')[] = ['all', RecordType.FOOD, RecordType.WASTE, RecordType.WEIGHT, RecordType.MEDICINE]
            this.state.recordFilter.type = types[index]
          })

        Select([
          { value: '全部时间' },
          { value: '近7天' },
          { value: '近30天' },
          { value: '近90天' }
        ])
          .id('records-filter-date-range')
          .selected(this.dateRangeIndex())
          .onSelect((index: number) => {
            const ranges: ('all' | '7' | '30' | '90')[] = ['all', '7', '30', '90']
            this.state.recordFilter.dateRange = ranges[index]
          })
      }
      .width('100%')
      .margin({ bottom: 8 })

      Row() {
        Text('清空筛选')
          .id('records-clear-filters')
          .fontSize(13)
          .fontColor(Theme.textTertiary)
          .onClick(() => {
            this.state.recordFilter.petId = 'all'
            this.state.recordFilter.type = 'all'
            this.state.recordFilter.dateRange = 'all'
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .margin({ bottom: 12 })

      List({ space: 12 }) {
        if (this.filteredRecords().length === 0) {
          ListItem() {
            Text('暂无记录')
              .id('records-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 60, bottom: 60 })
          }
        } else {
          ForEach(this.filteredRecords(), (r: RecordModel) => {
            ListItem() {
              Row({ space: 12 }) {
                Column() {
                  Text(this.typeLabel(r.type))
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.brandPrimary)
                }
                .width(44)
                .height(44)
                .borderRadius(12)
                .backgroundColor(Theme.brandSoft)
                .justifyContent(FlexAlign.Center)

                Column({ space: 4 }) {
                  Text(`${this.petName(r.petId)} · ${this.formatDate(r.datetime)}`)
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                  Text(r.note || this.recordDetail(r))
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
              .padding(14)
              .backgroundColor(Theme.cardBg)
              .borderRadius(18)
            }
            .id(`records-item-${r.id}`)
            .onClick(() => this.onOpenRecordEditor(r.id))
          }, (r: RecordModel) => r.id)
        }
      }
      .id('records-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Button('添加记录')
        .id('records-add-button')
        .width('100%')
        .height(50)
        .backgroundColor(Theme.brandPrimary)
        .fontColor(Theme.textOnPrimary)
        .borderRadius(Theme.radiusButton)
        .margin({ top: 12, bottom: 12 })
        .onClick(() => this.onOpenRecordEditor(undefined, RecordType.FOOD, this.state.selectedPetId))
    }
    .id('records-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }

  private filterTypeIndex(): number {
    const type = this.state.recordFilter.type
    if (type === 'all') return 0
    if (type === RecordType.FOOD) return 1
    if (type === RecordType.WASTE) return 2
    if (type === RecordType.WEIGHT) return 3
    return 4
  }

  private dateRangeIndex(): number {
    const range = this.state.recordFilter.dateRange
    if (range === 'all') return 0
    if (range === '7') return 1
    if (range === '30') return 2
    return 3
  }

  private recordDetail(r: RecordModel): string {
    if (r.type === RecordType.FOOD) return `${r.foodAmount}g ${r.foodType}`
    if (r.type === RecordType.WASTE) return `${r.wasteType}`
    if (r.type === RecordType.WEIGHT) return `${r.weightValue}kg`
    return `${r.medicineName} ${r.medicineDose}`
  }
}
