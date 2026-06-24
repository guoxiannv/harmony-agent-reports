import {
  CareTab,
  DietPayload,
  FamilyInfo,
  MedicalCase,
  MedicalListItem,
  Pet,
  Record,
  RecordItem,
  RecordsFilter,
  Reminder,
  ReminderDialogMode,
  ReminderItem,
  SheetSurface,
  TodaySummaryItem,
  TrendChart,
  TrendDataset,
  TrendPoint,
  TrendStat,
  TrendsMetric,
  TrendsPeriod,
  WeightPayload
} from '../models/AppTypes';
import { AppServices } from '../services/AppServices';

export class AppViewModel {
  private services: AppServices

  // observable surface state will be mirrored by Index.ets
  activeTab: string = 'tab-home'
  surface: string = 'home'
  sheet: SheetSurface = SheetSurface.None
  reminderDialogMode: ReminderDialogMode = ReminderDialogMode.None
  editingReminderId: string = ''

  // current pet
  currentPet: Pet | null = null
  pets: Pet[] = []

  // home
  todaySummary: TodaySummaryItem[] = []
  upcomingReminders: ReminderItem[] = []

  // records
  recordsFilter: RecordsFilter = RecordsFilter.All
  recordsList: RecordItem[] = []

  // trends
  trendsMetric: TrendsMetric = TrendsMetric.Weight
  trendsPeriod: TrendsPeriod = TrendsPeriod.Week
  trendChart: TrendChart = new TrendChart()
  trendStats: TrendStat[] = []

  // care
  careTab: CareTab = CareTab.Reminders
  reminders: ReminderItem[] = []
  medicalCases: MedicalListItem[] = []

  // profile
  familyInfo: FamilyInfo = new FamilyInfo()

  constructor(services: AppServices) {
    this.services = services
  }

  async load(): Promise<void> {
    await this.services.init()
    this.pets = this.services.petRepository.list()
    this.currentPet = this.services.petRepository.getCurrent()
    this.familyInfo = this.services.familyRepository.getInfo()
    this.refreshCurrentPetData()
  }

  setSurface(surface: string): void {
    this.surface = surface
  }

  setTab(tab: string): void {
    this.activeTab = tab
  }

  openSheet(sheet: SheetSurface): void {
    this.sheet = sheet
  }

  closeSheet(): void {
    this.sheet = SheetSurface.None
  }

  async selectPet(id: string): Promise<void> {
    await this.services.petRepository.setCurrent(id)
    this.currentPet = this.services.petRepository.getCurrent()
    this.refreshCurrentPetData()
  }

  async savePet(pet: Pet): Promise<void> {
    await this.services.petRepository.save(pet)
    this.pets = this.services.petRepository.list()
    this.currentPet = this.services.petRepository.getCurrent()
    this.refreshCurrentPetData()
  }

  async deletePet(id: string): Promise<void> {
    await this.services.petRepository.delete(id)
    this.pets = this.services.petRepository.list()
    this.currentPet = this.services.petRepository.getCurrent()
    this.refreshCurrentPetData()
  }

  setRecordsFilter(filter: RecordsFilter): void {
    this.recordsFilter = filter
    this.refreshRecords()
  }

  async saveRecord(record: Record): Promise<void> {
    await this.services.recordRepository.save(record)
    this.refreshCurrentPetData()
  }

  async deleteRecord(id: string): Promise<void> {
    await this.services.recordRepository.delete(id)
    this.refreshCurrentPetData()
  }

  setTrendsMetric(metric: TrendsMetric): void {
    this.trendsMetric = metric
    this.refreshTrends()
  }

  setTrendsPeriod(period: TrendsPeriod): void {
    this.trendsPeriod = period
    this.refreshTrends()
  }

  setCareTab(tab: CareTab): void {
    this.careTab = tab
  }

  async saveReminder(reminder: Reminder): Promise<void> {
    await this.services.reminderRepository.save(reminder)
    this.refreshCare()
    this.refreshHomeReminders()
  }

  async markReminderDone(id: string): Promise<void> {
    await this.services.reminderRepository.markDone(id)
    this.refreshCare()
    this.refreshHomeReminders()
  }

  async deleteReminder(id: string): Promise<void> {
    await this.services.reminderRepository.delete(id)
    this.refreshCare()
    this.refreshHomeReminders()
  }

  openReminderEditor(mode: ReminderDialogMode, id: string = ''): void {
    this.reminderDialogMode = mode
    this.editingReminderId = id
  }

  closeReminderEditor(): void {
    this.reminderDialogMode = ReminderDialogMode.None
    this.editingReminderId = ''
  }

  async saveMedicalCase(c: MedicalCase): Promise<void> {
    await this.services.medicalRepository.save(c)
    this.refreshCare()
  }

  async deleteMedicalCase(id: string): Promise<void> {
    await this.services.medicalRepository.delete(id)
    this.refreshCare()
  }

  private refreshCurrentPetData(): void {
    this.refreshHome()
    this.refreshRecords()
    this.refreshTrends()
    this.refreshCare()
  }

  private refreshHome(): void {
    if (!this.currentPet) {
      this.todaySummary = []
      this.upcomingReminders = []
      return
    }
    this.todaySummary = this.services.recordRepository.todaySummary(this.currentPet.id)
    this.upcomingReminders = this.services.reminderRepository.upcomingByPet(this.currentPet.id, 5)
  }

  private refreshRecords(): void {
    if (!this.currentPet) {
      this.recordsList = []
      return
    }
    this.recordsList = this.services.recordRepository.listItemsByPet(this.currentPet.id, this.recordsFilter)
  }

  private refreshTrends(): void {
    if (!this.currentPet) {
      this.trendChart = new TrendChart()
      this.trendStats = []
      return
    }
    let now: number = Date.now()
    let days: number = this.trendsPeriod === TrendsPeriod.Week ? 7 : 30
    let points: TrendPoint[] = []
    for (let i = days - 1; i >= 0; i--) {
      let d: Date = new Date(now - i * 24 * 60 * 60 * 1000)
      let tp: TrendPoint = new TrendPoint()
      tp.date = d.getTime()
      tp.value = 0
      points.push(tp)
    }

    if (this.trendsMetric === TrendsMetric.Weight) {
      let records: Record[] = this.services.recordRepository.listByPet(this.currentPet.id, RecordsFilter.Weight)
      let latest: number = this.currentPet.weight
      for (let p of points) {
        let dayStart: number = this.startOfDay(p.date)
        let dayEnd: number = dayStart + 24 * 60 * 60 * 1000
        let dayRecords: Record[] = records.filter((r: Record) => r.time >= dayStart && r.time < dayEnd)
        if (dayRecords.length > 0) {
          latest = (dayRecords[0].payload as WeightPayload).value
        }
        p.value = latest
      }
      let chart: TrendChart = new TrendChart()
      chart.labels = points.map((p: TrendPoint) => this.formatDay(p.date))
      let ds: TrendDataset = new TrendDataset()
      ds.label = '体重'
      ds.color = '#7FD5C0'
      ds.points = points
      chart.datasets = [ds]
      this.trendChart = chart

      this.trendStats = [
        this.makeStat('latest-weight', '当前体重', String(latest), 'kg', '0'),
        this.makeStat('pet-weight', '档案体重', String(this.currentPet.weight), 'kg', '0')
      ]
    } else if (this.trendsMetric === TrendsMetric.Diet) {
      let records: Record[] = this.services.recordRepository.listByPet(this.currentPet.id, RecordsFilter.Diet)
      for (let p of points) {
        let dayStart: number = this.startOfDay(p.date)
        let dayEnd: number = dayStart + 24 * 60 * 60 * 1000
        let total: number = records
          .filter((r: Record) => r.time >= dayStart && r.time < dayEnd)
          .reduce((sum: number, r: Record) => sum + (r.payload as DietPayload).amount, 0)
        p.value = total
      }
      let chart: TrendChart = new TrendChart()
      chart.labels = points.map((p: TrendPoint) => this.formatDay(p.date))
      let ds: TrendDataset = new TrendDataset()
      ds.label = '饮食'
      ds.color = '#FFB7B2'
      ds.points = points
      chart.datasets = [ds]
      this.trendChart = chart

      let weekTotal: number = points.reduce((sum: number, p: TrendPoint) => sum + p.value, 0)
      this.trendStats = [
        this.makeStat('avg-diet', '日均饮食', String(Math.round(weekTotal / days)), 'g', '0'),
        this.makeStat('total-diet', '累计饮食', String(weekTotal), 'g', '0')
      ]
    } else if (this.trendsMetric === TrendsMetric.Stool) {
      let records: Record[] = this.services.recordRepository.listByPet(this.currentPet.id, RecordsFilter.Stool)
      for (let p of points) {
        let dayStart: number = this.startOfDay(p.date)
        let dayEnd: number = dayStart + 24 * 60 * 60 * 1000
        let count: number = records.filter((r: Record) => r.time >= dayStart && r.time < dayEnd).length
        p.value = count
      }
      let chart: TrendChart = new TrendChart()
      chart.labels = points.map((p: TrendPoint) => this.formatDay(p.date))
      let ds: TrendDataset = new TrendDataset()
      ds.label = '排泄'
      ds.color = '#FFDAC1'
      ds.points = points
      chart.datasets = [ds]
      this.trendChart = chart

      let total: number = points.reduce((sum: number, p: TrendPoint) => sum + p.value, 0)
      this.trendStats = [
        this.makeStat('avg-stool', '日均排泄', String(Math.round(total / days)), '次', '0'),
        this.makeStat('total-stool', '累计排泄', String(total), '次', '0')
      ]
    }
  }

  private refreshCare(): void {
    if (!this.currentPet) {
      this.reminders = []
      return
    }
    this.reminders = this.services.reminderRepository.listByPet(this.currentPet.id)
  }

  private refreshHomeReminders(): void {
    if (!this.currentPet) {
      this.upcomingReminders = []
      return
    }
    this.upcomingReminders = this.services.reminderRepository.upcomingByPet(this.currentPet.id, 5)
  }

  private makeStat(key: string, label: string, value: string, unit: string, change: string): TrendStat {
    let s: TrendStat = new TrendStat()
    s.key = key
    s.label = label
    s.value = value
    s.unit = unit
    s.change = change
    return s
  }

  private startOfDay(ts: number): number {
    let d: Date = new Date(ts)
    d.setHours(0, 0, 0, 0)
    return d.getTime()
  }

  private formatDay(ts: number): string {
    let d: Date = new Date(ts)
    return `${d.getMonth() + 1}/${d.getDate()}`
  }
}
