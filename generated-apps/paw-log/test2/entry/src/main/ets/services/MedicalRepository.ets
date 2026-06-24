import { AppStore } from './AppStore';
import { MedicalCase, MedicalListItem } from '../models/AppTypes';

const KEY_MEDICAL = 'medical_cases'

export class MedicalRepository {
  private store: AppStore
  private cases: MedicalCase[] = []
  private initialized: boolean = false

  constructor(store: AppStore) {
    this.store = store
  }

  async init(): Promise<void> {
    if (this.initialized) {
      return
    }
    let raw: string = await this.store.getString(KEY_MEDICAL, '[]')
    try {
      let parsed: object[] = JSON.parse(raw) as object[]
      this.cases = parsed.map((o: object) => this.toCase(o as Record<string, string | number | boolean | string[]>))
    } catch (_) {
      this.cases = []
    }
    this.initialized = true
  }

  listByPet(petId: string): MedicalListItem[] {
    return this.cases
      .filter((c: MedicalCase) => c.petId === petId)
      .sort((a: MedicalCase, b: MedicalCase) => b.date - a.date)
      .map((c: MedicalCase) => {
        let item: MedicalListItem = new MedicalListItem()
        item.id = c.id
        item.title = c.title
        item.date = c.date
        item.hospital = c.hospital
        item.diagnosis = c.diagnosis
        item.imageCount = c.images.length
        return item
      })
  }

  getById(id: string): MedicalCase | null {
    return this.cases.find((c: MedicalCase) => c.id === id) ?? null
  }

  async save(c: MedicalCase): Promise<void> {
    if (c.id.length === 0) {
      c.id = this.makeId()
      c.createdAt = Date.now()
      this.cases.push(c)
    } else {
      let idx: number = this.cases.findIndex((item: MedicalCase) => item.id === c.id)
      if (idx >= 0) {
        c.createdAt = this.cases[idx].createdAt
        this.cases[idx] = c
      } else {
        this.cases.push(c)
      }
    }
    c.updatedAt = Date.now()
    await this.persist()
  }

  async delete(id: string): Promise<void> {
    this.cases = this.cases.filter((c: MedicalCase) => c.id !== id)
    await this.persist()
  }

  private toCase(raw: Record<string, string | number | boolean | string[]>): MedicalCase {
    let c: MedicalCase = new MedicalCase()
    c.id = String(raw['id'] ?? '')
    c.petId = String(raw['petId'] ?? '')
    c.title = String(raw['title'] ?? '')
    c.date = Number(raw['date'] ?? 0)
    c.hospital = String(raw['hospital'] ?? '')
    c.diagnosis = String(raw['diagnosis'] ?? '')
    c.note = String(raw['note'] ?? '')
    c.images = Array.isArray(raw['images']) ? raw['images'] as string[] : []
    c.createdAt = Number(raw['createdAt'] ?? 0)
    c.updatedAt = Number(raw['updatedAt'] ?? 0)
    return c
  }

  private async persist(): Promise<void> {
    await this.store.setString(KEY_MEDICAL, JSON.stringify(this.cases))
  }

  private makeId(): string {
    return 'med_' + Date.now() + '_' + Math.floor(Math.random() * 1000)
  }
}
