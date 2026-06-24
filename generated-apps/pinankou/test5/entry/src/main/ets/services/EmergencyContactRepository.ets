import { EmergencyContact } from '../models/Models';
import { JsonPreferenceStore } from './JsonPreferenceStore';

export class EmergencyContactRepository {
  private items: EmergencyContact[] = []
  private store?: JsonPreferenceStore
  private key: string = 'contacts'

  constructor(store?: JsonPreferenceStore) {
    this.store = store
  }

  list(): EmergencyContact[] {
    return this.items.slice()
  }

  search(query: string): EmergencyContact[] {
    let normalized: string = query.trim().toLowerCase()
    if (normalized.length === 0) {
      return this.list()
    }
    return this.items.filter((item: EmergencyContact) => {
      return item.name.toLowerCase().includes(normalized) ||
        item.role.toLowerCase().includes(normalized) ||
        item.duty.toLowerCase().includes(normalized)
    })
  }

  add(contact: EmergencyContact): void {
    contact.id = this.nextId()
    this.items.unshift(contact)
    this.persist()
  }

  update(contact: EmergencyContact): void {
    let idx: number = this.items.findIndex((it: EmergencyContact) => it.id === contact.id)
    if (idx >= 0) {
      this.items[idx] = contact
      this.persist()
    }
  }

  delete(id: string): void {
    let idx: number = this.items.findIndex((it: EmergencyContact) => it.id === id)
    if (idx >= 0) {
      this.items.splice(idx, 1)
      this.persist()
    }
  }

  get(id: string): EmergencyContact | undefined {
    return this.items.find((it: EmergencyContact) => it.id === id)
  }

  private nextId(): string {
    return `C-${Date.now()}-${Math.floor(Math.random() * 1000)}`
  }

  private persist(): void {
    if (!this.store) {
      return
    }
    this.store.setString(this.key, JSON.stringify(this.items))
  }
}
