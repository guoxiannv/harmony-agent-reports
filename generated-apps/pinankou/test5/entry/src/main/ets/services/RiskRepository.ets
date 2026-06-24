import { RiskItem, RiskStatus, RiskTimelineEvent } from '../models/Models';
import { JsonPreferenceStore } from './JsonPreferenceStore';

export class RiskRepository {
  private items: RiskItem[] = []
  private store?: JsonPreferenceStore
  private key: string = 'risks'

  constructor(store?: JsonPreferenceStore) {
    this.store = store
  }

  list(): RiskItem[] {
    return this.items.slice()
  }

  get(id: string): RiskItem | undefined {
    return this.items.find((item: RiskItem) => item.id === id)
  }

  search(query: string): RiskItem[] {
    let normalized: string = query.trim().toLowerCase()
    if (normalized.length === 0) {
      return this.list()
    }
    return this.items.filter((item: RiskItem) => {
      return item.title.toLowerCase().includes(normalized) ||
        item.location.toLowerCase().includes(normalized) ||
        item.handler.toLowerCase().includes(normalized)
    })
  }

  filterByStatus(status: RiskStatus | 'all'): RiskItem[] {
    if (status === 'all') {
      return this.list()
    }
    return this.items.filter((item: RiskItem) => item.status === status)
  }

  add(item: RiskItem): void {
    item.id = this.nextId()
    item.createdAt = Date.now()
    item.updatedAt = item.createdAt
    item.timeline = [this.makeTimelineEvent('创建隐患', item.reporter, '')]
    this.items.unshift(item)
    this.persist()
  }

  update(item: RiskItem): void {
    let idx: number = this.items.findIndex((it: RiskItem) => it.id === item.id)
    if (idx >= 0) {
      item.updatedAt = Date.now()
      this.items[idx] = item
      this.persist()
    }
  }

  assign(id: string, handler: string): void {
    let item: RiskItem | undefined = this.get(id)
    if (!item || handler.trim().length === 0) {
      return
    }
    item.handler = handler.trim()
    item.status = RiskStatus.INPROGRESS
    item.timeline.push(this.makeTimelineEvent('指派整改人', handler, `整改人：${handler}`))
    item.updatedAt = Date.now()
    this.update(item)
  }

  submitFix(id: string, note: string): void {
    let item: RiskItem | undefined = this.get(id)
    if (!item) {
      return
    }
    item.status = RiskStatus.REVIEW
    item.timeline.push(this.makeTimelineEvent('提交整改', item.handler, note))
    item.updatedAt = Date.now()
    this.update(item)
  }

  reviewPass(id: string, note: string): void {
    let item: RiskItem | undefined = this.get(id)
    if (!item) {
      return
    }
    item.status = RiskStatus.CLOSED
    item.timeline.push(this.makeTimelineEvent('复核通过', '复核人', note))
    item.updatedAt = Date.now()
    this.update(item)
  }

  reviewReject(id: string, note: string): void {
    let item: RiskItem | undefined = this.get(id)
    if (!item) {
      return
    }
    item.status = RiskStatus.REJECTED
    item.timeline.push(this.makeTimelineEvent('复核不通过', '复核人', note))
    item.updatedAt = Date.now()
    this.update(item)
  }

  remind(id: string): void {
    let item: RiskItem | undefined = this.get(id)
    if (!item) {
      return
    }
    item.timeline.push(this.makeTimelineEvent('催办', '系统', `已催办 ${item.handler}`))
    item.updatedAt = Date.now()
    this.update(item)
  }

  private nextId(): string {
    return `R-${Date.now()}-${Math.floor(Math.random() * 1000)}`
  }

  private makeTimelineEvent(action: string, actor: string, note: string): RiskTimelineEvent {
    let ev: RiskTimelineEvent = new RiskTimelineEvent()
    ev.id = `TL-${Date.now()}-${Math.floor(Math.random() * 1000)}`
    ev.timestamp = Date.now()
    ev.action = action
    ev.actor = actor
    ev.note = note
    return ev
  }

  private persist(): void {
    if (!this.store) {
      return
    }
    this.store.setString(this.key, JSON.stringify(this.items))
  }
}
