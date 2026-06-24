import { AppState, AppViewModel } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme } from '../common/Theme'
import { Pet, Gender } from '../models/Pet'
import { RecordModel, RecordType, WasteType } from '../models/Record'
import { Reminder, ReminderCategory } from '../models/Reminder'
import { MedicalRecord } from '../models/MedicalRecord'

interface SelectOption {
  value: string
}

function petOptions(pets: Pet[]): SelectOption[] {
  const opts: SelectOption[] = [{ value: '选择宠物' }, ...pets.map((p: Pet): SelectOption => ({ value: p.name }))]
  return opts
}

function todayIso(): string {
  const d = new Date()
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}T${String(d.getHours()).padStart(2, '0')}:${String(d.getMinutes()).padStart(2, '0')}`
}

function dateIso(): string {
  const d = new Date()
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
}

@Component
export struct RecordEditorSheet {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onClose: () => void = () => {}
  @State private draft: RecordModel = new RecordModel('', '', RecordType.FOOD, todayIso())

  aboutToAppear(): void {
    if (this.state.editingRecordId) {
      const existing: RecordModel | undefined = this.state.records.find((r: RecordModel) => r.id === this.state.editingRecordId)
      if (existing) {
        this.draft = existing
      }
    } else {
      this.draft = new RecordModel(this.vm.uuid(), this.state.selectedPetId || '', this.state.pendingRecordType, todayIso())
    }
  }

  build() {
    Column({ space: 16 }) {
      Row() {
        Text('记录')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('✕')
          .id('record-editor-close')
          .fontSize(18)
          .fontColor(Theme.textQuaternary)
          .onClick(() => this.onClose())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      this.TypeSelect()
      this.PetSelect()

      TextInput({ text: this.draft.datetime, placeholder: '时间' })
        .id('record-editor-datetime')
        .onChange((v: string) => this.draft.datetime = v)

      if (this.draft.type === RecordType.FOOD) {
        TextInput({ text: this.draft.foodAmount > 0 ? String(this.draft.foodAmount) : '', placeholder: '食量 (g)' })
          .id('record-editor-food-amount')
          .type(InputType.Number)
          .onChange((v: string) => this.draft.foodAmount = parseFloat(v) || 0)
        TextInput({ text: this.draft.foodType, placeholder: '食物类型' })
          .id('record-editor-food-type')
          .onChange((v: string) => this.draft.foodType = v)
      } else if (this.draft.type === RecordType.WASTE) {
        this.WasteSelect()
      } else if (this.draft.type === RecordType.WEIGHT) {
        TextInput({ text: this.draft.weightValue > 0 ? String(this.draft.weightValue) : '', placeholder: '体重 (kg)' })
          .id('record-editor-weight-value')
          .type(InputType.Number)
          .onChange((v: string) => this.draft.weightValue = parseFloat(v) || 0)
      } else if (this.draft.type === RecordType.MEDICINE) {
        TextInput({ text: this.draft.medicineName, placeholder: '药品名称' })
          .id('record-editor-medicine-name')
          .onChange((v: string) => this.draft.medicineName = v)
        TextInput({ text: this.draft.medicineDose, placeholder: '剂量' })
          .id('record-editor-medicine-dose')
          .onChange((v: string) => this.draft.medicineDose = v)
      }

      TextInput({ text: this.draft.note, placeholder: '备注' })
        .id('record-editor-note')
        .onChange((v: string) => this.draft.note = v)

      Row({ space: 12 }) {
        if (this.state.editingRecordId) {
          Button('删除')
            .id('record-editor-delete')
            .type(ButtonType.Normal)
            .fontColor(Theme.pawPink)
            .backgroundColor(Theme.pawPinkSoft)
            .layoutWeight(1)
            .height(48)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.vm.deleteRecord(this.draft.id))
        }
        Button('保存')
          .id('record-editor-save')
          .type(ButtonType.Normal)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.vm.saveRecord(this.draft))
      }
      .width('100%')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius({ topLeft: 24, topRight: 24 })
  }

  @Builder
  TypeSelect() {
    Select([
      { value: '饮食' },
      { value: '排泄' },
      { value: '体重' },
      { value: '用药' }
    ])
      .id('record-editor-type-picker')
      .selected(this.typeIndex())
      .onSelect((index: number) => {
        const types: RecordType[] = [RecordType.FOOD, RecordType.WASTE, RecordType.WEIGHT, RecordType.MEDICINE]
        this.draft.type = types[index]
      })
  }

  @Builder
  PetSelect() {
    Select(petOptions(this.state.pets))
      .id('record-editor-pet-picker')
      .selected(this.petIndex())
      .onSelect((index: number) => {
        this.draft.petId = index === 0 ? '' : this.state.pets[index - 1].id
      })
  }

  @Builder
  WasteSelect() {
    Select([
      { value: '小便' },
      { value: '大便' },
      { value: '呕吐' },
      { value: '其他' }
    ])
      .id('record-editor-waste-type')
      .selected(this.wasteIndex())
      .onSelect((index: number) => {
        const types: WasteType[] = [WasteType.PEE, WasteType.POOP, WasteType.VOMIT, WasteType.OTHER]
        this.draft.wasteType = types[index]
      })
  }

  private typeIndex(): number {
    if (this.draft.type === RecordType.WASTE) return 1
    if (this.draft.type === RecordType.WEIGHT) return 2
    if (this.draft.type === RecordType.MEDICINE) return 3
    return 0
  }

  private petIndex(): number {
    if (!this.draft.petId) return 0
    const idx = this.state.pets.findIndex((p: Pet) => p.id === this.draft.petId)
    return idx + 1
  }

  private wasteIndex(): number {
    if (this.draft.wasteType === WasteType.POOP) return 1
    if (this.draft.wasteType === WasteType.VOMIT) return 2
    if (this.draft.wasteType === WasteType.OTHER) return 3
    return 0
  }
}

@Component
export struct PetEditorSheet {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onClose: () => void = () => {}
  @State private draft: Pet = new Pet('', '')

  aboutToAppear(): void {
    if (this.state.editingPetId) {
      const existing: Pet | undefined = this.state.pets.find((p: Pet) => p.id === this.state.editingPetId)
      if (existing) {
        this.draft = existing
      }
    } else {
      this.draft = new Pet(this.vm.uuid(), '')
    }
  }

  build() {
    Column({ space: 16 }) {
      Row() {
        Text(this.state.editingPetId ? '编辑宠物' : '添加宠物')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('✕')
          .id('pet-editor-close')
          .fontSize(18)
          .fontColor(Theme.textQuaternary)
          .onClick(() => this.onClose())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Text('头像')
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .id('pet-editor-avatar-picker')
      .width(64)
      .height(64)
      .borderRadius(32)
      .backgroundColor(Theme.brandSoft)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .alignSelf(ItemAlign.Center)

      TextInput({ text: this.draft.name, placeholder: '名字 *' })
        .id('pet-editor-name')
        .onChange((v: string) => this.draft.name = v)
      TextInput({ text: this.draft.species, placeholder: '物种（如 猫 / 狗）' })
        .id('pet-editor-species')
        .onChange((v: string) => this.draft.species = v)
      TextInput({ text: this.draft.breed, placeholder: '品种' })
        .id('pet-editor-breed')
        .onChange((v: string) => this.draft.breed = v)
      TextInput({ text: this.draft.birthday, placeholder: '生日 (YYYY-MM-DD)' })
        .id('pet-editor-birthday')
        .onChange((v: string) => this.draft.birthday = v)
      Select([
        { value: '未知' },
        { value: '公' },
        { value: '母' }
      ])
        .id('pet-editor-gender')
        .selected(this.genderIndex())
        .onSelect((index: number) => {
          const genders: Gender[] = [Gender.UNKNOWN, Gender.MALE, Gender.FEMALE]
          this.draft.gender = genders[index]
        })
      TextInput({ text: this.draft.weight > 0 ? String(this.draft.weight) : '', placeholder: '当前体重 (kg)' })
        .id('pet-editor-weight')
        .type(InputType.Number)
        .onChange((v: string) => this.draft.weight = parseFloat(v) || 0)
      Row() {
        Text('已绝育')
          .fontSize(15)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.draft.neutered })
          .id('pet-editor-neutered')
          .selectedColor(Theme.brandPrimary)
          .onChange((isOn: boolean) => this.draft.neutered = isOn)
      }
      .width('100%')
      TextInput({ text: this.draft.medicalHistory, placeholder: '基础病史' })
        .id('pet-editor-medical-history')
        .onChange((v: string) => this.draft.medicalHistory = v)

      Row({ space: 12 }) {
        if (this.state.editingPetId) {
          Button('删除')
            .id('pet-editor-delete')
            .type(ButtonType.Normal)
            .fontColor(Theme.pawPink)
            .backgroundColor(Theme.pawPinkSoft)
            .layoutWeight(1)
            .height(48)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.vm.deletePet(this.draft.id))
        }
        Button('保存')
          .id('pet-editor-save')
          .type(ButtonType.Normal)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.vm.savePet(this.draft))
      }
      .width('100%')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius({ topLeft: 24, topRight: 24 })
  }

  private genderIndex(): number {
    if (this.draft.gender === Gender.MALE) return 1
    if (this.draft.gender === Gender.FEMALE) return 2
    return 0
  }
}

@Component
export struct ReminderEditorSheet {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onClose: () => void = () => {}
  @State private draft: Reminder = new Reminder('', '', '', ReminderCategory.OTHER, dateIso())

  aboutToAppear(): void {
    if (this.state.editingReminderId) {
      const existing: Reminder | undefined = this.state.reminders.find((r: Reminder) => r.id === this.state.editingReminderId)
      if (existing) {
        this.draft = existing
      }
    } else {
      this.draft = new Reminder(this.vm.uuid(), this.state.selectedPetId || '', '', ReminderCategory.OTHER, dateIso())
    }
  }

  build() {
    Column({ space: 16 }) {
      Row() {
        Text(this.state.editingReminderId ? '编辑提醒' : '添加提醒')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('✕')
          .id('reminder-editor-close')
          .fontSize(18)
          .fontColor(Theme.textQuaternary)
          .onClick(() => this.onClose())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Select(petOptions(this.state.pets))
        .id('reminder-editor-pet-picker')
        .selected(this.petIndex())
        .onSelect((index: number) => {
          this.draft.petId = index === 0 ? '' : this.state.pets[index - 1].id
        })

      TextInput({ text: this.draft.title, placeholder: '提醒标题' })
        .id('reminder-editor-title')
        .onChange((v: string) => this.draft.title = v)

      Select([
        { value: '疫苗' },
        { value: '驱虫' },
        { value: '体检' },
        { value: '其他' }
      ])
        .id('reminder-editor-category')
        .selected(this.categoryIndex())
        .onSelect((index: number) => {
          const cats: ReminderCategory[] = [ReminderCategory.VACCINE, ReminderCategory.DEWORM, ReminderCategory.CHECKUP, ReminderCategory.OTHER]
          this.draft.category = cats[index]
        })

      TextInput({ text: this.draft.dueDate, placeholder: '到期日 (YYYY-MM-DD)' })
        .id('reminder-editor-due-date')
        .onChange((v: string) => this.draft.dueDate = v)

      TextInput({ text: String(this.draft.advanceDays), placeholder: '提前提醒天数' })
        .id('reminder-editor-advance-days')
        .type(InputType.Number)
        .onChange((v: string) => this.draft.advanceDays = parseInt(v, 10) || 0)

      Row() {
        Text('重复提醒')
          .fontSize(15)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.draft.repeat })
          .id('reminder-editor-repeat')
          .selectedColor(Theme.brandPrimary)
          .onChange((isOn: boolean) => this.draft.repeat = isOn)
      }
      .width('100%')

      Row({ space: 12 }) {
        if (this.state.editingReminderId) {
          Button('删除')
            .id('reminder-editor-delete')
            .type(ButtonType.Normal)
            .fontColor(Theme.pawPink)
            .backgroundColor(Theme.pawPinkSoft)
            .layoutWeight(1)
            .height(48)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.vm.deleteReminder(this.draft.id))
        }
        Button('保存')
          .id('reminder-editor-save')
          .type(ButtonType.Normal)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.vm.saveReminder(this.draft))
      }
      .width('100%')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius({ topLeft: 24, topRight: 24 })
  }

  private petIndex(): number {
    if (!this.draft.petId) return 0
    const idx = this.state.pets.findIndex((p: Pet) => p.id === this.draft.petId)
    return idx + 1
  }

  private categoryIndex(): number {
    if (this.draft.category === ReminderCategory.DEWORM) return 1
    if (this.draft.category === ReminderCategory.CHECKUP) return 2
    if (this.draft.category === ReminderCategory.OTHER) return 3
    return 0
  }
}

@Component
export struct MedicalEditorSheet {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onClose: () => void = () => {}
  @State private draft: MedicalRecord = new MedicalRecord('', '', dateIso())

  aboutToAppear(): void {
    if (this.state.editingMedicalId) {
      const existing: MedicalRecord | undefined = this.state.medicalRecords.find((m: MedicalRecord) => m.id === this.state.editingMedicalId)
      if (existing) {
        this.draft = existing
      }
    } else {
      this.draft = new MedicalRecord(this.vm.uuid(), this.state.selectedPetId || '', dateIso())
    }
  }

  build() {
    Column({ space: 16 }) {
      Row() {
        Text(this.state.editingMedicalId ? '编辑病历' : '添加病历')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('✕')
          .id('medical-editor-close')
          .fontSize(18)
          .fontColor(Theme.textQuaternary)
          .onClick(() => this.onClose())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Select(petOptions(this.state.pets))
        .id('medical-editor-pet-picker')
        .selected(this.petIndex())
        .onSelect((index: number) => {
          this.draft.petId = index === 0 ? '' : this.state.pets[index - 1].id
        })

      TextInput({ text: this.draft.date, placeholder: '就诊日期' })
        .id('medical-editor-date')
        .onChange((v: string) => this.draft.date = v)
      TextInput({ text: this.draft.hospital, placeholder: '医院' })
        .id('medical-editor-hospital')
        .onChange((v: string) => this.draft.hospital = v)
      TextInput({ text: this.draft.doctor, placeholder: '医生' })
        .id('medical-editor-doctor')
        .onChange((v: string) => this.draft.doctor = v)
      TextInput({ text: this.draft.symptom, placeholder: '症状' })
        .id('medical-editor-symptom')
        .onChange((v: string) => this.draft.symptom = v)
      TextInput({ text: this.draft.diagnosis, placeholder: '诊断' })
        .id('medical-editor-diagnosis')
        .onChange((v: string) => this.draft.diagnosis = v)
      TextInput({ text: this.draft.prescription, placeholder: '处方/用药' })
        .id('medical-editor-prescription')
        .onChange((v: string) => this.draft.prescription = v)

      Button('添加图片（占位）')
        .id('medical-editor-image-picker')
        .width('100%')
        .height(44)
        .fontColor(Theme.brandPrimary)
        .backgroundColor(Theme.brandSoft)
        .borderRadius(Theme.radiusSmall)
        .onClick(() => {
          // Image picker stub
        })

      Row({ space: 8 }) {
        ForEach(this.draft.images, (img: string, index: number) => {
          Image(img)
            .id(`medical-editor-image-${index}`)
            .width(64)
            .height(64)
            .borderRadius(8)
            .objectFit(ImageFit.Cover)
        }, (img: string, index: number) => `${index}`)
      }
      .id('medical-editor-image-list')
      .width('100%')

      Row({ space: 12 }) {
        if (this.state.editingMedicalId) {
          Button('删除')
            .id('medical-editor-delete')
            .type(ButtonType.Normal)
            .fontColor(Theme.pawPink)
            .backgroundColor(Theme.pawPinkSoft)
            .layoutWeight(1)
            .height(48)
            .borderRadius(Theme.radiusButton)
            .onClick(() => this.vm.deleteMedical(this.draft.id))
        }
        Button('保存')
          .id('medical-editor-save')
          .type(ButtonType.Normal)
          .fontColor('#FFFFFF')
          .backgroundColor(Theme.brandPrimary)
          .layoutWeight(1)
          .height(48)
          .borderRadius(Theme.radiusButton)
          .onClick(() => this.vm.saveMedical(this.draft))
      }
      .width('100%')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius({ topLeft: 24, topRight: 24 })
  }

  private petIndex(): number {
    if (!this.draft.petId) return 0
    const idx = this.state.pets.findIndex((p: Pet) => p.id === this.draft.petId)
    return idx + 1
  }
}

@Component
export struct FamilyInviteSheet {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onClose: () => void = () => {}
  aboutToAppear(): void {
    this.vm.ensureFamily()
  }

  build() {
    Column({ space: 20 }) {
      Row() {
        Text('邀请家庭成员')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('✕')
          .id('family-invite-close')
          .fontSize(18)
          .fontColor(Theme.textQuaternary)
          .onClick(() => this.onClose())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      if (this.state.familyGroup) {
        Column({ space: 8 }) {
          Text('邀请码')
            .fontSize(13)
            .fontColor(Theme.textTertiary)
          Text(this.state.familyGroup.inviteCode)
            .id('family-invite-code')
            .fontSize(36)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.brandPrimary)
            .letterSpacing(8)
        }
        .width('100%')
        .padding(24)
        .backgroundColor(Theme.brandSoft)
        .borderRadius(Theme.radiusCard)

        Button('复制邀请码')
          .id('family-invite-copy')
          .width('100%')
          .height(48)
          .backgroundColor(Theme.brandPrimary)
          .fontColor('#FFFFFF')
          .borderRadius(Theme.radiusButton)
          .onClick(() => {
            // Clipboard stub
          })

        Button('分享')
          .id('family-invite-share')
          .width('100%')
          .height(48)
          .fontColor(Theme.brandPrimary)
          .backgroundColor(Theme.brandSoft)
          .borderRadius(Theme.radiusButton)
          .onClick(() => {
            // Share stub
          })
      } else {
        Text('正在生成邀请信息...')
          .fontSize(14)
          .fontColor(Theme.textTertiary)
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .borderRadius({ topLeft: 24, topRight: 24 })
  }
}
