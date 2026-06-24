import { AppStore } from './AppStore';
import { Reminder, ReminderCategory, ReminderItem } from '../models/AppTypes';

const KEY_REMINDERS = 'reminders'
const URGENCY_DAYS = 3 * 24 * 60 * 60 * 1000

export class ReminderRepository {
  private store: AppStore
  private reminders: Reminder[] = []
  private initialized: boolean = false

  constructor(store: AppStore) {
    this.store = store
  }

  async init(): Promise<void> {
    if (this.initialized) {
      return
    }
    let raw: string = await this.store.getString(KEY_REMINDERS, '[]')
    try {
      let parsed: object[] = JSON.parse(raw) as object[]
      this.reminders = parsed.map((o: object) => this.toReminder(o as Record<string, string | number | boolean>))
    } catch (_) {
      this.reminders = []
    }
    this.initialized = true
  }

  listByPet(petId: string): ReminderItem[] {
    return this.reminders
      .filter((r: Reminder) => r.petId === petId)
      .sort((a: Reminder, b: Reminder) => a.dueDate - b.dueDate)
      .map((r: Reminder) => this.toListItem(r))
  }

  upcomingByPet(petId: string, limit: number = 5): ReminderItem[] {
    return this.listByPet(petId).filter((r: ReminderItem): boolean => !r.isDone).slice(0, limit)
  }

  getById(id: string): Reminder | null {
    return this.reminders.find((r: Reminder) => r.id === id) ?? null
  }

  async save(reminder: Reminder): Promise<void> {
    if (reminder.id.length === 0) {
      reminder.id = this.makeId()
      reminder.createdAt = Date.now()
      this.reminders.push(reminder)
    } else {
      let idx: number = this.reminders.findIndex((r: Reminder) => r.id === reminder.id)
      if (idx >= 0) {
        reminder.createdAt = this.reminders[idx].createdAt
        this.reminders[idx] = reminder
      } else {
        this.reminders.push(reminder)
      }
    }
    reminder.updatedAt = Date.now()
    await this.persist()
  }

  async markDone(id: string): Promise<void> {
    let r: Reminder | undefined = this.reminders.find((item: Reminder) => item.id === id)
    if (r) {
      r.isDone = true
      r.updatedAt = Date.now()
      await this.persist()
    }
  }

  async delete(id: string): Promise<void> {
    this.reminders = this.reminders.filter((r: Reminder) => r.id !== id)
    await this.persist()
  }

  private toListItem(r: Reminder): ReminderItem {
    let item: ReminderItem = new ReminderItem()
    item.id = r.id
    item.title = r.title
    item.category = r.category
    item.dueDate = r.dueDate
    item.isDone = r.isDone
    item.isUrgent = !r.isDone && (r.dueDate - Date.now()) <= URGENCY_DAYS
    return item
  }

  private toReminder(raw: Record<string, string | number | boolean>): Reminder {
    let r: Reminder = new Reminder()
    r.id = String(raw['id'] ?? '')
    r.petId = String(raw['petId'] ?? '')
    r.title = String(raw['title'] ?? '')
    r.category = String(raw['category'] ?? 'vaccine') as ReminderCategory
    r.dueDate = Number(raw['dueDate'] ?? 0)
    r.isDone = Boolean(raw['isDone'] ?? false)
    r.createdAt = Number(raw['createdAt'] ?? 0)
    r.updatedAt = Number(raw['updatedAt'] ?? 0)
    return r
  }

  private async persist(): Promise<void> {
    await this.store.setString(KEY_REMINDERS, JSON.stringify(this.reminders))
  }

  private makeId(): string {
    return 'rem_' + Date.now() + '_' + Math.floor(Math.random() * 1000)
  }
}
