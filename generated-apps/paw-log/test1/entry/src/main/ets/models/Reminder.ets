export enum ReminderCategory {
  VACCINE = 'vaccine',
  DEWORM = 'deworm',
  CHECKUP = 'checkup',
  OTHER = 'other'
}

@Observed
export class Reminder {
  id: string = ''
  petId: string = ''
  title: string = ''
  category: ReminderCategory = ReminderCategory.OTHER
  dueDate: string = ''
  advanceDays: number = 0
  repeat: boolean = false
  enabled: boolean = true

  constructor(id: string, petId: string, title: string, category: ReminderCategory, dueDate: string) {
    this.id = id
    this.petId = petId
    this.title = title
    this.category = category
    this.dueDate = dueDate
  }
}
