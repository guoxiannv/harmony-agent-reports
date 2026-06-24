import { AppStore } from './AppStore';
import {
  DietPayload,
  MedsPayload,
  Record,
  RecordItem,
  RecordPayload,
  RecordType,
  RecordsFilter,
  StoolPayload,
  TodaySummaryItem,
  WeightPayload
} from '../models/AppTypes';

const KEY_RECORDS = 'records'

interface RecordRaw {
  id?: string
  petId?: string
  type?: string
  time?: number
  title?: string
  subtitle?: string
  tagText?: string
  tagColor?: string
  payload?: PayloadRaw
  createdAt?: number
}

interface PayloadRaw {
  foodName?: string
  amount?: number
  unit?: string
  note?: string
  type?: string
  color?: string
  smell?: string
  value?: number
  name?: string
  dose?: string
}

export class RecordRepository {
  private store: AppStore
  private records: Record[] = []
  private initialized: boolean = false

  constructor(store: AppStore) {
    this.store = store
  }

  async init(): Promise<void> {
    if (this.initialized) {
      return
    }
    let raw: string = await this.store.getString(KEY_RECORDS, '[]')
    try {
      let parsed: object[] = JSON.parse(raw) as object[]
      this.records = parsed.map((o: object) => this.toRecord(o as RecordRaw))
    } catch (_) {
      this.records = []
    }
    this.initialized = true
  }

  listByPet(petId: string, filter: RecordsFilter = RecordsFilter.All): Record[] {
    return this.records
      .filter((r: Record) => r.petId === petId)
      .filter((r: Record) => filter === RecordsFilter.All || r.type === String(filter))
      .sort((a: Record, b: Record) => b.time - a.time)
  }

  listItemsByPet(petId: string, filter: RecordsFilter = RecordsFilter.All): RecordItem[] {
    return this.listByPet(petId, filter).map((r: Record): RecordItem => this.toListItem(r))
  }

  todaySummary(petId: string): TodaySummaryItem[] {
    let dayStart: number = this.startOfDay(Date.now())
    let today: Record[] = this.records.filter((r: Record) => r.petId === petId && r.time >= dayStart)
    let result: TodaySummaryItem[] = []
    result.push(this.makeSummaryForType(RecordType.Diet, today))
    result.push(this.makeSummaryForType(RecordType.Stool, today))
    result.push(this.makeSummaryForType(RecordType.Weight, today))
    result.push(this.makeSummaryForType(RecordType.Meds, today))
    return result
  }

  async save(record: Record): Promise<void> {
    if (record.id.length === 0) {
      record.id = this.makeId()
      record.createdAt = Date.now()
      this.records.push(record)
    } else {
      let idx: number = this.records.findIndex((r: Record) => r.id === record.id)
      if (idx >= 0) {
        record.createdAt = this.records[idx].createdAt
        this.records[idx] = record
      } else {
        this.records.push(record)
      }
    }
    this.enrichRecord(record)
    await this.persist()
  }

  async delete(id: string): Promise<void> {
    this.records = this.records.filter((r: Record) => r.id !== id)
    await this.persist()
  }

  private enrichRecord(r: Record): void {
    if (r.type === RecordType.Diet) {
      let p: DietPayload = r.payload as DietPayload
      r.title = p.foodName.length > 0 ? p.foodName : '饮食记录'
      r.subtitle = p.note
      r.tagText = `${p.amount}${p.unit}`
      r.tagColor = '#A8E6CF'
    } else if (r.type === RecordType.Stool) {
      let p: StoolPayload = r.payload as StoolPayload
      r.title = `排泄：${p.type}`
      r.subtitle = [p.color, p.smell, p.note].filter((s: string) => s.length > 0).join(' · ')
      r.tagText = p.type
      r.tagColor = '#FFD3B6'
    } else if (r.type === RecordType.Weight) {
      let p: WeightPayload = r.payload as WeightPayload
      r.title = `体重 ${p.value}${p.unit}`
      r.subtitle = ''
      r.tagText = `${p.value}${p.unit}`
      r.tagColor = '#DCEDC1'
    } else if (r.type === RecordType.Meds) {
      let p: MedsPayload = r.payload as MedsPayload
      r.title = p.name.length > 0 ? p.name : '用药记录'
      r.subtitle = p.note
      r.tagText = p.dose
      r.tagColor = '#FFAAA5'
    }
  }

  private makeSummaryForType(type: RecordType, todayRecords: Record[]): TodaySummaryItem {
    let item: TodaySummaryItem = new TodaySummaryItem()
    item.type = type
    let filtered: Record[] = todayRecords.filter((r: Record) => r.type === type)
    if (type === RecordType.Diet) {
      item.label = '今日饮食'
      if (filtered.length === 0) {
        item.value = '—'
        item.unit = ''
        item.status = 'empty'
      } else {
        let total: number = filtered.reduce((sum: number, r: Record) => sum + (r.payload as DietPayload).amount, 0)
        item.value = String(total)
        item.unit = 'g'
        item.status = 'ok'
      }
    } else if (type === RecordType.Stool) {
      item.label = '今日排泄'
      if (filtered.length === 0) {
        item.value = '—'
        item.unit = ''
        item.status = 'empty'
      } else {
        item.value = String(filtered.length)
        item.unit = '次'
        item.status = 'ok'
      }
    } else if (type === RecordType.Weight) {
      item.label = '最新体重'
      if (filtered.length === 0) {
        item.value = '—'
        item.unit = ''
        item.status = 'empty'
      } else {
        let latest: Record = filtered.sort((a: Record, b: Record) => b.time - a.time)[0]
        let p: WeightPayload = latest.payload as WeightPayload
        item.value = String(p.value)
        item.unit = p.unit
        item.status = 'ok'
      }
    } else if (type === RecordType.Meds) {
      item.label = '今日用药'
      if (filtered.length === 0) {
        item.value = '—'
        item.unit = ''
        item.status = 'empty'
      } else {
        item.value = String(filtered.length)
        item.unit = '次'
        item.status = 'ok'
      }
    }
    return item
  }

  private toListItem(r: Record): RecordItem {
    let m: RecordItem = new RecordItem()
    m.id = r.id
    m.type = r.type
    m.time = r.time
    m.title = r.title
    m.subtitle = r.subtitle
    m.tagText = r.tagText
    m.tagColor = r.tagColor
    return m
  }

  private toRecord(raw: RecordRaw): Record {
    let r: Record = new Record()
    r.id = raw.id ?? ''
    r.petId = raw.petId ?? ''
    r.type = (raw.type ?? 'diet') as RecordType
    r.time = raw.time ?? 0
    r.title = raw.title ?? ''
    r.subtitle = raw.subtitle ?? ''
    r.tagText = raw.tagText ?? ''
    r.tagColor = raw.tagColor ?? ''
    r.createdAt = raw.createdAt ?? 0
    r.payload = this.toPayload(r.type, raw.payload ?? {})
    return r
  }

  private toPayload(type: RecordType, raw: PayloadRaw): RecordPayload {
    if (type === RecordType.Diet) {
      let p: DietPayload = new DietPayload()
      p.foodName = raw.foodName ?? ''
      p.amount = raw.amount ?? 0
      p.unit = raw.unit ?? 'g'
      p.note = raw.note ?? ''
      return p
    } else if (type === RecordType.Stool) {
      let p: StoolPayload = new StoolPayload()
      p.type = raw.type ?? 'normal'
      p.color = raw.color ?? ''
      p.smell = raw.smell ?? ''
      p.note = raw.note ?? ''
      return p
    } else if (type === RecordType.Weight) {
      let p: WeightPayload = new WeightPayload()
      p.value = raw.value ?? 0
      p.unit = raw.unit ?? 'kg'
      return p
    } else if (type === RecordType.Meds) {
      let p: MedsPayload = new MedsPayload()
      p.name = raw.name ?? ''
      p.dose = raw.dose ?? ''
      p.note = raw.note ?? ''
      return p
    }
    return new RecordPayload()
  }

  private startOfDay(ts: number): number {
    let d: Date = new Date(ts)
    d.setHours(0, 0, 0, 0)
    return d.getTime()
  }

  private async persist(): Promise<void> {
    await this.store.setString(KEY_RECORDS, JSON.stringify(this.records))
  }

  private makeId(): string {
    return 'rec_' + Date.now() + '_' + Math.floor(Math.random() * 1000)
  }
}
