import { JsonPreferenceStore } from './Store'
import { Pet, Gender } from '../models/Pet'
import { RecordModel, RecordType, WasteType } from '../models/Record'
import { Reminder, ReminderCategory } from '../models/Reminder'
import { MedicalRecord } from '../models/MedicalRecord'
import { FamilyGroup, FamilyMember, FamilyRole } from '../models/Family'

const KEY_PETS = 'pawlog_pets'
const KEY_RECORDS = 'pawlog_records'
const KEY_REMINDERS = 'pawlog_reminders'
const KEY_MEDICAL = 'pawlog_medical'
const KEY_FAMILY = 'pawlog_family'

interface PetJson {
  id: string
  name: string
  avatar: string
  species: string
  breed: string
  birthday: string
  gender: string
  weight: number
  neutered: boolean
  medicalHistory: string
}

interface RecordJson {
  id: string
  petId: string
  type: string
  datetime: string
  foodAmount: number
  foodType: string
  wasteType: string
  weightValue: number
  medicineName: string
  medicineDose: string
  note: string
}

interface ReminderJson {
  id: string
  petId: string
  title: string
  category: string
  dueDate: string
  advanceDays: number
  repeat: boolean
  enabled: boolean
}

interface MedicalJson {
  id: string
  petId: string
  date: string
  hospital: string
  doctor: string
  symptom: string
  diagnosis: string
  prescription: string
  images: string[]
}

interface FamilyJson {
  id: string
  name: string
  inviteCode: string
  members: MemberJson[]
}

interface MemberJson {
  id: string
  nickname: string
  role: string
  avatar: string
}

export class Repository {
  private store: JsonPreferenceStore
  private pets: Pet[] = []
  private records: RecordModel[] = []
  private reminders: Reminder[] = []
  private medicalRecords: MedicalRecord[] = []
  private familyGroup: FamilyGroup | null = null

  constructor(store: JsonPreferenceStore) {
    this.store = store
  }

  async loadAll(): Promise<void> {
    this.pets = await this.loadPets()
    this.records = await this.loadRecords()
    this.reminders = await this.loadReminders()
    this.medicalRecords = await this.loadMedical()
    this.familyGroup = await this.loadFamily()
  }

  // Pets
  listPets(): Pet[] {
    return this.pets.slice()
  }

  getPet(id: string): Pet | null {
    return this.pets.find((p: Pet) => p.id === id) ?? null
  }

  async savePet(pet: Pet): Promise<void> {
    const idx: number = this.pets.findIndex((p: Pet) => p.id === pet.id)
    if (idx >= 0) {
      this.pets[idx] = pet
    } else {
      this.pets.push(pet)
    }
    await this.persistPets()
  }

  async deletePet(id: string): Promise<void> {
    this.pets = this.pets.filter((p: Pet) => p.id !== id)
    this.records = this.records.filter((r: RecordModel) => r.petId !== id)
    this.reminders = this.reminders.filter((r: Reminder) => r.petId !== id)
    this.medicalRecords = this.medicalRecords.filter((m: MedicalRecord) => m.petId !== id)
    await this.persistPets()
    await this.persistRecords()
    await this.persistReminders()
    await this.persistMedical()
  }

  latestWeight(petId: string): number | null {
    const list: RecordModel[] = this.records
      .filter((r: RecordModel) => r.petId === petId && r.type === RecordType.WEIGHT)
      .sort((a: RecordModel, b: RecordModel) => b.datetime.localeCompare(a.datetime))
    return list.length > 0 ? list[0].weightValue : null
  }

  // Records
  listRecords(): RecordModel[] {
    return this.records.slice()
  }

  async saveRecord(record: RecordModel): Promise<void> {
    const idx: number = this.records.findIndex((r: RecordModel) => r.id === record.id)
    if (idx >= 0) {
      this.records[idx] = record
    } else {
      this.records.push(record)
    }
    this.records.sort((a: RecordModel, b: RecordModel) => b.datetime.localeCompare(a.datetime))
    await this.persistRecords()
  }

  async deleteRecord(id: string): Promise<void> {
    this.records = this.records.filter((r: RecordModel) => r.id !== id)
    await this.persistRecords()
  }

  filterRecords(petId: string | 'all', type: RecordType | 'all', dateRange: '7' | '30' | '90' | 'all'): RecordModel[] {
    let result: RecordModel[] = this.records.slice()
    if (petId !== 'all') {
      result = result.filter((r: RecordModel) => r.petId === petId)
    }
    if (type !== 'all') {
      result = result.filter((r: RecordModel) => r.type === type)
    }
    if (dateRange !== 'all') {
      const days: number = parseInt(dateRange, 10)
      const cutoff: Date = new Date(Date.now() - days * 24 * 60 * 60 * 1000)
      const cutoffIso: string = cutoff.toISOString()
      result = result.filter((r: RecordModel) => r.datetime >= cutoffIso)
    }
    return result
  }

  // Reminders
  listReminders(): Reminder[] {
    return this.reminders.slice()
  }

  async saveReminder(reminder: Reminder): Promise<void> {
    const idx: number = this.reminders.findIndex((r: Reminder) => r.id === reminder.id)
    if (idx >= 0) {
      this.reminders[idx] = reminder
    } else {
      this.reminders.push(reminder)
    }
    await this.persistReminders()
  }

  async deleteReminder(id: string): Promise<void> {
    this.reminders = this.reminders.filter((r: Reminder) => r.id !== id)
    await this.persistReminders()
  }

  reminderStatus(reminder: Reminder): 'due' | 'upcoming' | 'normal' {
    const due: Date = new Date(reminder.dueDate)
    const today: Date = new Date()
    today.setHours(0, 0, 0, 0)
    const advance: Date = new Date(due.getTime() - reminder.advanceDays * 24 * 60 * 60 * 1000)
    if (due < today) {
      return 'due'
    }
    if (advance <= today) {
      return 'upcoming'
    }
    return 'normal'
  }

  // Medical
  listMedical(): MedicalRecord[] {
    return this.medicalRecords.slice()
  }

  async saveMedical(record: MedicalRecord): Promise<void> {
    const idx: number = this.medicalRecords.findIndex((m: MedicalRecord) => m.id === record.id)
    if (idx >= 0) {
      this.medicalRecords[idx] = record
    } else {
      this.medicalRecords.push(record)
    }
    this.medicalRecords.sort((a: MedicalRecord, b: MedicalRecord) => b.date.localeCompare(a.date))
    await this.persistMedical()
  }

  async deleteMedical(id: string): Promise<void> {
    this.medicalRecords = this.medicalRecords.filter((m: MedicalRecord) => m.id !== id)
    await this.persistMedical()
  }

  // Family
  getFamily(): FamilyGroup | null {
    return this.familyGroup
  }

  async saveFamily(family: FamilyGroup): Promise<void> {
    this.familyGroup = family
    await this.persistFamily()
  }

  async clearFamily(): Promise<void> {
    this.familyGroup = null
    await this.store.delete(KEY_FAMILY)
  }

  // Persistence helpers
  private async persistPets(): Promise<void> {
    await this.store.setJson(KEY_PETS, this.pets.map((p: Pet) => this.petToRaw(p)))
  }

  private async persistRecords(): Promise<void> {
    await this.store.setJson(KEY_RECORDS, this.records.map((r: RecordModel) => this.recordToRaw(r)))
  }

  private async persistReminders(): Promise<void> {
    await this.store.setJson(KEY_REMINDERS, this.reminders.map((r: Reminder) => this.reminderToRaw(r)))
  }

  private async persistMedical(): Promise<void> {
    await this.store.setJson(KEY_MEDICAL, this.medicalRecords.map((m: MedicalRecord) => this.medicalToRaw(m)))
  }

  private async persistFamily(): Promise<void> {
    if (this.familyGroup) {
      await this.store.setJson(KEY_FAMILY, this.familyToRaw(this.familyGroup))
    } else {
      await this.store.delete(KEY_FAMILY)
    }
  }

  private async loadPets(): Promise<Pet[]> {
    const json: string = this.store.getString(KEY_PETS, '[]')
    try {
      return (JSON.parse(json) as object[]).map((raw: object) => this.rawToPet(raw as Record<string, string | number | boolean>))
    } catch (_) {
      return []
    }
  }

  private async loadRecords(): Promise<RecordModel[]> {
    const json: string = this.store.getString(KEY_RECORDS, '[]')
    try {
      return (JSON.parse(json) as object[]).map((raw: object) => this.rawToRecord(raw as Record<string, string | number | boolean>))
    } catch (_) {
      return []
    }
  }

  private async loadReminders(): Promise<Reminder[]> {
    const json: string = this.store.getString(KEY_REMINDERS, '[]')
    try {
      return (JSON.parse(json) as object[]).map((raw: object) => this.rawToReminder(raw as Record<string, string | number | boolean>))
    } catch (_) {
      return []
    }
  }

  private async loadMedical(): Promise<MedicalRecord[]> {
    const json: string = this.store.getString(KEY_MEDICAL, '[]')
    try {
      return (JSON.parse(json) as object[]).map((raw: object) => this.rawToMedical(raw as Record<string, string | number | boolean | object[]>))
    } catch (_) {
      return []
    }
  }

  private async loadFamily(): Promise<FamilyGroup | null> {
    const json: string = this.store.getString(KEY_FAMILY, '')
    if (!json) {
      return null
    }
    try {
      return this.rawToFamily(JSON.parse(json) as Record<string, string | number | boolean | object[]>)
    } catch (_) {
      return null
    }
  }

  // Mappers
  private petToRaw(p: Pet): PetJson {
    return {
      id: p.id,
      name: p.name,
      avatar: p.avatar,
      species: p.species,
      breed: p.breed,
      birthday: p.birthday,
      gender: p.gender,
      weight: p.weight,
      neutered: p.neutered,
      medicalHistory: p.medicalHistory
    }
  }

  private rawToPet(raw: Record<string, string | number | boolean>): Pet {
    const p: Pet = new Pet(String(raw['id'] ?? ''), String(raw['name'] ?? ''))
    p.avatar = String(raw['avatar'] ?? '')
    p.species = String(raw['species'] ?? '')
    p.breed = String(raw['breed'] ?? '')
    p.birthday = String(raw['birthday'] ?? '')
    p.gender = this.parseGender(String(raw['gender'] ?? ''))
    p.weight = Number(raw['weight'] ?? 0)
    p.neutered = Boolean(raw['neutered'] ?? false)
    p.medicalHistory = String(raw['medicalHistory'] ?? '')
    return p
  }

  private parseGender(v: string): Gender {
    if (v === Gender.MALE) return Gender.MALE
    if (v === Gender.FEMALE) return Gender.FEMALE
    return Gender.UNKNOWN
  }

  private recordToRaw(r: RecordModel): RecordJson {
    return {
      id: r.id,
      petId: r.petId,
      type: r.type,
      datetime: r.datetime,
      foodAmount: r.foodAmount,
      foodType: r.foodType,
      wasteType: r.wasteType,
      weightValue: r.weightValue,
      medicineName: r.medicineName,
      medicineDose: r.medicineDose,
      note: r.note
    }
  }

  private rawToRecord(raw: Record<string, string | number | boolean>): RecordModel {
    const r: RecordModel = new RecordModel(
      String(raw['id'] ?? ''),
      String(raw['petId'] ?? ''),
      this.parseRecordType(String(raw['type'] ?? '')),
      String(raw['datetime'] ?? '')
    )
    r.foodAmount = Number(raw['foodAmount'] ?? 0)
    r.foodType = String(raw['foodType'] ?? '')
    r.wasteType = this.parseWasteType(String(raw['wasteType'] ?? ''))
    r.weightValue = Number(raw['weightValue'] ?? 0)
    r.medicineName = String(raw['medicineName'] ?? '')
    r.medicineDose = String(raw['medicineDose'] ?? '')
    r.note = String(raw['note'] ?? '')
    return r
  }

  private parseRecordType(v: string): RecordType {
    if (v === RecordType.WASTE) return RecordType.WASTE
    if (v === RecordType.WEIGHT) return RecordType.WEIGHT
    if (v === RecordType.MEDICINE) return RecordType.MEDICINE
    return RecordType.FOOD
  }

  private parseWasteType(v: string): WasteType {
    if (v === 'pee') return WasteType.PEE
    if (v === 'poop') return WasteType.POOP
    if (v === 'vomit') return WasteType.VOMIT
    return WasteType.OTHER
  }

  private reminderToRaw(r: Reminder): ReminderJson {
    return {
      id: r.id,
      petId: r.petId,
      title: r.title,
      category: r.category,
      dueDate: r.dueDate,
      advanceDays: r.advanceDays,
      repeat: r.repeat,
      enabled: r.enabled
    }
  }

  private rawToReminder(raw: Record<string, string | number | boolean>): Reminder {
    const r: Reminder = new Reminder(
      String(raw['id'] ?? ''),
      String(raw['petId'] ?? ''),
      String(raw['title'] ?? ''),
      this.parseReminderCategory(String(raw['category'] ?? '')),
      String(raw['dueDate'] ?? '')
    )
    r.advanceDays = Number(raw['advanceDays'] ?? 1)
    r.repeat = Boolean(raw['repeat'] ?? false)
    r.enabled = Boolean(raw['enabled'] ?? true)
    return r
  }

  private parseReminderCategory(v: string): ReminderCategory {
    if (v === ReminderCategory.VACCINE) return ReminderCategory.VACCINE
    if (v === ReminderCategory.DEWORM) return ReminderCategory.DEWORM
    if (v === ReminderCategory.CHECKUP) return ReminderCategory.CHECKUP
    return ReminderCategory.OTHER
  }

  private medicalToRaw(m: MedicalRecord): MedicalJson {
    return {
      id: m.id,
      petId: m.petId,
      date: m.date,
      hospital: m.hospital,
      doctor: m.doctor,
      symptom: m.symptom,
      diagnosis: m.diagnosis,
      prescription: m.prescription,
      images: m.images
    }
  }

  private rawToMedical(raw: Record<string, string | number | boolean | object[]>): MedicalRecord {
    const m: MedicalRecord = new MedicalRecord(
      String(raw['id'] ?? ''),
      String(raw['petId'] ?? ''),
      String(raw['date'] ?? '')
    )
    m.hospital = String(raw['hospital'] ?? '')
    m.doctor = String(raw['doctor'] ?? '')
    m.symptom = String(raw['symptom'] ?? '')
    m.diagnosis = String(raw['diagnosis'] ?? '')
    m.prescription = String(raw['prescription'] ?? '')
    const imgs: object[] | undefined = raw['images'] as object[] | undefined
    m.images = imgs ? imgs.map((img: object) => String(img)) : []
    return m
  }

  private familyToRaw(f: FamilyGroup): FamilyJson {
    return {
      id: f.id,
      name: f.name,
      inviteCode: f.inviteCode,
      members: f.members.map((m: FamilyMember) => this.memberToRaw(m))
    }
  }

  private rawToFamily(raw: Record<string, string | number | boolean | object[]>): FamilyGroup {
    const f: FamilyGroup = new FamilyGroup(
      String(raw['id'] ?? ''),
      String(raw['name'] ?? ''),
      String(raw['inviteCode'] ?? '')
    )
    const membersRaw: object[] | undefined = raw['members'] as object[] | undefined
    f.members = membersRaw ? membersRaw.map((m: object) => this.rawToMember(m as Record<string, string | number | boolean>)) : []
    return f
  }

  private memberToRaw(m: FamilyMember): MemberJson {
    return {
      id: m.id,
      nickname: m.nickname,
      role: m.role,
      avatar: m.avatar
    }
  }

  private rawToMember(raw: Record<string, string | number | boolean>): FamilyMember {
    const m: FamilyMember = new FamilyMember()
    m.id = String(raw['id'] ?? '')
    m.nickname = String(raw['nickname'] ?? '')
    m.role = this.parseFamilyRole(String(raw['role'] ?? ''))
    m.avatar = String(raw['avatar'] ?? '')
    return m
  }

  private parseFamilyRole(v: string): FamilyRole {
    if (v === FamilyRole.OWNER) return FamilyRole.OWNER
    return FamilyRole.MEMBER
  }
}
