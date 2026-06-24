import { InspectionTask, CheckItem, InspectionStatus, RiskItem, RiskType, RiskLevel } from '../models/Models';
import { JsonPreferenceStore } from './JsonPreferenceStore';
import { RiskRepository } from './RiskRepository';

export class InspectionRepository {
  private items: InspectionTask[] = []
  private store?: JsonPreferenceStore
  private key: string = 'inspections'
  private riskRepo: RiskRepository

  constructor(riskRepo: RiskRepository, store?: JsonPreferenceStore) {
    this.riskRepo = riskRepo
    this.store = store
  }

  list(): InspectionTask[] {
    return this.items.slice()
  }

  get(id: string): InspectionTask | undefined {
    return this.items.find((item: InspectionTask) => item.id === id)
  }

  listBySegment(segment: 'today' | 'pending' | 'history'): InspectionTask[] {
    let todayStr: string = this.dateString(Date.now())
    if (segment === 'today') {
      return this.items.filter((item: InspectionTask) => item.planDate === todayStr)
    } else if (segment === 'pending') {
      return this.items.filter((item: InspectionTask) => item.status !== InspectionStatus.DONE)
    } else {
      return this.items.filter((item: InspectionTask) => item.status === InspectionStatus.DONE)
    }
  }

  add(task: InspectionTask): void {
    task.id = this.nextId()
    task.status = InspectionStatus.PLANNED
    this.items.unshift(task)
    this.persist()
  }

  start(id: string): void {
    let task: InspectionTask | undefined = this.get(id)
    if (!task || task.status !== InspectionStatus.PLANNED) {
      return
    }
    task.status = InspectionStatus.ONGOING
    task.startedAt = Date.now()
    this.update(task)
  }

  markCheckItem(taskId: string, checkItemId: string, result: 'pass' | 'fail'): void {
    let task: InspectionTask | undefined = this.get(taskId)
    if (!task) {
      return
    }
    let item: CheckItem | undefined = task.checkItems.find((it: CheckItem) => it.id === checkItemId)
    if (!item) {
      return
    }
    item.result = result
    if (result === 'fail') {
      let risk: RiskItem = new RiskItem()
      risk.title = `${task.title} - ${item.label} 异常`
      risk.type = RiskType.OTHER
      risk.level = RiskLevel.MEDIUM
      risk.location = task.area
      risk.description = `巡检项「${item.label}」检查异常`
      risk.deadline = this.dateString(Date.now() + 3 * 24 * 60 * 60 * 1000)
      risk.handler = ''
      risk.reporter = task.inspector
      risk.linkedInspectionId = task.id
      this.riskRepo.add(risk)
    }
    this.update(task)
  }

  setCheckItemNote(taskId: string, checkItemId: string, note: string): void {
    let task: InspectionTask | undefined = this.get(taskId)
    if (!task) {
      return
    }
    let item: CheckItem | undefined = task.checkItems.find((it: CheckItem) => it.id === checkItemId)
    if (item) {
      item.note = note
      this.update(task)
    }
  }

  submitResult(taskId: string): void {
    let task: InspectionTask | undefined = this.get(taskId)
    if (!task) {
      return
    }
    if (task.checkItems.some((it: CheckItem) => it.result === 'unchecked')) {
      return
    }
    task.status = InspectionStatus.DONE
    task.completedAt = Date.now()
    this.update(task)
  }

  update(task: InspectionTask): void {
    let idx: number = this.items.findIndex((it: InspectionTask) => it.id === task.id)
    if (idx >= 0) {
      this.items[idx] = task
      this.persist()
    }
  }

  private nextId(): string {
    return `I-${Date.now()}-${Math.floor(Math.random() * 1000)}`
  }

  private dateString(ts: number): string {
    let d: Date = new Date(ts)
    let y: number = d.getFullYear()
    let m: number = d.getMonth() + 1
    let day: number = d.getDate()
    return `${y}-${this.pad(m)}-${this.pad(day)}`
  }

  private pad(n: number): string {
    return n < 10 ? `0${n}` : String(n)
  }

  private persist(): void {
    if (!this.store) {
      return
    }
    this.store.setString(this.key, JSON.stringify(this.items))
  }
}
