import { Repository } from '../service/Repository'
import { Pet } from '../models/Pet'
import { RecordModel, RecordType } from '../models/Record'
import { Reminder } from '../models/Reminder'
import { MedicalRecord } from '../models/MedicalRecord'
import { FamilyGroup, FamilyMember, FamilyRole } from '../models/Family'
import { ChartPoint, ChartInsight, ChartMetric, ChartPeriod } from '../models/ChartModels'
import { AppSurface, TabId, RecordFilter, ChartSelection } from '../models/AppTypes'

export type SheetMode =
  | 'record-editor'
  | 'pet-editor'
  | 'reminder-editor'
  | 'medical-editor'
  | 'family-invite'
  | null

@Observed
export class AppState {
  pets: Pet[] = []
  records: RecordModel[] = []
  reminders: Reminder[] = []
  medicalRecords: MedicalRecord[] = []
  familyGroup: FamilyGroup | null = null
  selectedPetId: string = ''
  activeTab: TabId = 'tab-home'
  currentSurface: AppSurface = 'home'
  sheetMode: SheetMode = null
  editingRecordId: string | null = null
  editingPetId: string | null = null
  editingReminderId: string | null = null
  editingMedicalId: string | null = null
  pendingRecordType: RecordType = RecordType.FOOD
  recordFilter: RecordFilter = new RecordFilter()
  reminderFilterStatus: 'all' | 'due' | 'upcoming' | 'normal' = 'all'
  medicalFilterPetId: string | 'all' = 'all'
  chartSelection: ChartSelection = new ChartSelection()
  lastTabBeforePush: TabId = 'tab-home'
  isLoading: boolean = false
  errorMessage: string = ''
}

export class AppViewModel {
  readonly state: AppState = new AppState()
  private repository: Repository

  constructor(repository: Repository) {
    this.repository = repository
  }

  async load(): Promise<void> {
    this.state.isLoading = true
    this.state.errorMessage = ''
    try {
      await this.repository.loadAll()
      this.state.pets = this.repository.listPets()
      this.state.records = this.repository.listRecords()
      this.state.reminders = this.repository.listReminders()
      this.state.medicalRecords = this.repository.listMedical()
      this.state.familyGroup = this.repository.getFamily()
      if (this.state.pets.length > 0 && !this.state.selectedPetId) {
        this.state.selectedPetId = this.state.pets[0].id
      }
      if (this.state.pets.length > 0 && !this.state.chartSelection.petId) {
        this.state.chartSelection.petId = this.state.pets[0].id
      }
    } catch (err) {
      this.state.errorMessage = '数据加载失败'
    }
    this.state.isLoading = false
  }

  // Navigation
  switchTab(tab: TabId): void {
    this.state.activeTab = tab
    if (tab === 'tab-home') {
      this.state.currentSurface = 'home'
    } else if (tab === 'tab-records') {
      this.state.currentSurface = 'records'
    } else if (tab === 'tab-charts') {
      this.state.currentSurface = 'charts'
    } else if (tab === 'tab-profile') {
      this.state.currentSurface = 'profile'
    }
  }

  goToTabSurface(surface: AppSurface, tab: TabId): void {
    this.state.lastTabBeforePush = this.state.activeTab
    this.state.activeTab = tab
    this.state.currentSurface = surface
  }

  goToNonTab(surface: AppSurface): void {
    this.state.lastTabBeforePush = this.state.activeTab
    this.state.currentSurface = surface
  }

  goBack(): void {
    this.state.currentSurface = this.tabSurfaceFor(this.state.lastTabBeforePush)
    this.state.activeTab = this.state.lastTabBeforePush
  }

  private tabSurfaceFor(tab: TabId): AppSurface {
    if (tab === 'tab-home') return 'home'
    if (tab === 'tab-records') return 'records'
    if (tab === 'tab-charts') return 'charts'
    return 'profile'
  }

  // Pet selection
  selectPet(petId: string): void {
    this.state.selectedPetId = petId
    this.state.chartSelection.petId = petId
  }

  // Sheet control
  openRecordEditor(recordId?: string, type?: RecordType, petId?: string): void {
    this.state.editingRecordId = recordId ?? null
    this.state.pendingRecordType = type ?? RecordType.FOOD
    if (petId) {
      this.state.selectedPetId = petId
    }
    this.state.sheetMode = 'record-editor'
  }

  openPetEditor(petId?: string): void {
    this.state.editingPetId = petId ?? null
    this.state.sheetMode = 'pet-editor'
  }

  openReminderEditor(reminderId?: string, petId?: string): void {
    this.state.editingReminderId = reminderId ?? null
    this.state.sheetMode = 'reminder-editor'
  }

  openMedicalEditor(medicalId?: string, petId?: string): void {
    this.state.editingMedicalId = medicalId ?? null
    this.state.sheetMode = 'medical-editor'
  }

  openFamilyInvite(): void {
    this.state.sheetMode = 'family-invite'
  }

  closeSheet(): void {
    this.state.sheetMode = null
    this.state.editingRecordId = null
    this.state.editingPetId = null
    this.state.editingReminderId = null
    this.state.editingMedicalId = null
    this.state.pendingRecordType = RecordType.FOOD
  }

  // Pet CRUD
  async savePet(draft: Pet): Promise<boolean> {
    if (!draft.name.trim()) {
      this.state.errorMessage = '宠物名字不能为空'
      return false
    }
    await this.repository.savePet(draft)
    this.state.pets = this.repository.listPets()
    if (!this.state.selectedPetId && this.state.pets.length > 0) {
      this.state.selectedPetId = this.state.pets[0].id
    }
    this.closeSheet()
    return true
  }

  async deletePet(id: string): Promise<void> {
    await this.repository.deletePet(id)
    this.state.pets = this.repository.listPets()
    this.state.records = this.repository.listRecords()
    this.state.reminders = this.repository.listReminders()
    this.state.medicalRecords = this.repository.listMedical()
    if (this.state.selectedPetId === id) {
      this.state.selectedPetId = this.state.pets.length > 0 ? this.state.pets[0].id : ''
    }
    this.closeSheet()
  }

  // Record CRUD
  async saveRecord(draft: RecordModel): Promise<boolean> {
    if (!draft.petId || !draft.datetime) {
      this.state.errorMessage = '请选择宠物和时间'
      return false
    }
    if (draft.type === RecordType.WEIGHT && draft.weightValue <= 0) {
      this.state.errorMessage = '请输入有效体重'
      return false
    }
    if (draft.type === RecordType.MEDICINE && !draft.medicineName.trim()) {
      this.state.errorMessage = '请输入药品名称'
      return false
    }
    await this.repository.saveRecord(draft)
    this.state.records = this.repository.listRecords()
    this.closeSheet()
    return true
  }

  async deleteRecord(id: string): Promise<void> {
    await this.repository.deleteRecord(id)
    this.state.records = this.repository.listRecords()
    this.closeSheet()
  }

  // Reminder CRUD
  async saveReminder(draft: Reminder): Promise<boolean> {
    if (!draft.petId || !draft.title.trim() || !draft.dueDate) {
      this.state.errorMessage = '请完善提醒信息'
      return false
    }
    await this.repository.saveReminder(draft)
    this.state.reminders = this.repository.listReminders()
    this.closeSheet()
    return true
  }

  async deleteReminder(id: string): Promise<void> {
    await this.repository.deleteReminder(id)
    this.state.reminders = this.repository.listReminders()
    this.closeSheet()
  }

  // Medical CRUD
  async saveMedical(draft: MedicalRecord): Promise<boolean> {
    if (!draft.petId || !draft.date) {
      this.state.errorMessage = '请选择宠物和就诊日期'
      return false
    }
    await this.repository.saveMedical(draft)
    this.state.medicalRecords = this.repository.listMedical()
    this.closeSheet()
    return true
  }

  async deleteMedical(id: string): Promise<void> {
    await this.repository.deleteMedical(id)
    this.state.medicalRecords = this.repository.listMedical()
    this.closeSheet()
  }

  // Family
  async ensureFamily(): Promise<void> {
    if (!this.state.familyGroup) {
      const group: FamilyGroup = new FamilyGroup(this.uuid(), '我的家庭', this.generateInviteCode())
      const owner: FamilyMember = new FamilyMember()
      owner.id = this.uuid()
      owner.nickname = '我'
      owner.role = FamilyRole.OWNER
      group.members = [owner]
      await this.repository.saveFamily(group)
      this.state.familyGroup = group
    }
  }

  async createFamily(name: string): Promise<void> {
    const group: FamilyGroup = new FamilyGroup(this.uuid(), name || '我的家庭', this.generateInviteCode())
    const owner: FamilyMember = new FamilyMember()
    owner.id = this.uuid()
    owner.nickname = '我'
    owner.role = FamilyRole.OWNER
    group.members = [owner]
    await this.repository.saveFamily(group)
    this.state.familyGroup = group
  }

  // Filters
  setRecordFilterPet(petId: string | 'all'): void {
    this.state.recordFilter.petId = petId
  }

  setRecordFilterType(type: RecordType | 'all'): void {
    this.state.recordFilter.type = type
  }

  setRecordFilterDateRange(range: '7' | '30' | '90' | 'all'): void {
    this.state.recordFilter.dateRange = range
  }

  clearRecordFilters(): void {
    this.state.recordFilter = new RecordFilter()
  }

  setReminderFilterStatus(status: 'all' | 'due' | 'upcoming' | 'normal'): void {
    this.state.reminderFilterStatus = status
  }

  setMedicalFilterPet(petId: string | 'all'): void {
    this.state.medicalFilterPetId = petId
  }

  // Chart
  setChartMetric(metric: ChartMetric): void {
    this.state.chartSelection.metric = metric
  }

  setChartPeriod(period: ChartPeriod): void {
    this.state.chartSelection.period = period
  }

  setChartPet(petId: string): void {
    this.state.chartSelection.petId = petId
  }

  // Computed getters (use methods returning fresh arrays for ArkUI observation)
  todayReminders(): Reminder[] {
    return this.state.reminders
      .filter((r: Reminder) => {
        if (!r.enabled) return false
        const status: 'due' | 'upcoming' | 'normal' = this.repository.reminderStatus(r)
        return status === 'due' || status === 'upcoming'
      })
      .filter((r: Reminder) => this.state.selectedPetId ? r.petId === this.state.selectedPetId : true)
      .slice(0, 5)
  }

  recentRecords(): RecordModel[] {
    return this.state.records
      .filter((r: RecordModel) => this.state.selectedPetId ? r.petId === this.state.selectedPetId : true)
      .slice(0, 5)
  }

  filteredRecords(): RecordModel[] {
    return this.repository.filterRecords(
      this.state.recordFilter.petId,
      this.state.recordFilter.type,
      this.state.recordFilter.dateRange
    )
  }

  filteredReminders(): Reminder[] {
    if (this.state.reminderFilterStatus === 'all') {
      return this.state.reminders.slice()
    }
    return this.state.reminders.filter((r: Reminder) => this.repository.reminderStatus(r) === this.state.reminderFilterStatus)
  }

  filteredMedical(): MedicalRecord[] {
    if (this.state.medicalFilterPetId === 'all') {
      return this.state.medicalRecords.slice()
    }
    return this.state.medicalRecords.filter((m: MedicalRecord) => m.petId === this.state.medicalFilterPetId)
  }

  chartData(): ChartPoint[] {
    return this.buildChartData(this.state.chartSelection.metric, this.state.chartSelection.period, this.state.chartSelection.petId)
  }

  chartInsight(): ChartInsight {
    const data: ChartPoint[] = this.chartData()
    const insight: ChartInsight = new ChartInsight()
    if (data.length === 0) {
      insight.summary = '暂无数据'
      insight.trend = 'flat'
      return insight
    }
    const first: number = data[0].value
    const last: number = data[data.length - 1].value
    const change: number = first === 0 ? 0 : Math.round(((last - first) / first) * 100)
    insight.changePercent = change
    if (change > 0) insight.trend = 'up'
    else if (change < 0) insight.trend = 'down'
    else insight.trend = 'flat'
    const label: string = this.metricLabel(this.state.chartSelection.metric)
    insight.summary = `${label}较上期${change >= 0 ? '增长' : '下降'} ${Math.abs(change)}%`
    return insight
  }

  private metricLabel(metric: ChartMetric): string {
    if (metric === 'weight') return '体重'
    if (metric === 'food') return '食量'
    if (metric === 'waste') return '排泄次数'
    return '用药次数'
  }

  private buildChartData(metric: ChartMetric, period: ChartPeriod, petId: string): ChartPoint[] {
    const days: number = period === 'week' ? 7 : 30
    const records: RecordModel[] = this.state.records.filter((r: RecordModel) => r.petId === petId)
    const result: ChartPoint[] = []
    for (let i: number = days - 1; i >= 0; i--) {
      const d: Date = new Date(Date.now() - i * 24 * 60 * 60 * 1000)
      const dateKey: string = d.toISOString().slice(0, 10)
      const dayRecords: RecordModel[] = records.filter((r: RecordModel) => r.datetime.slice(0, 10) === dateKey)
      let value: number = 0
      if (metric === 'weight') {
        const w: RecordModel | undefined = dayRecords
          .filter((r: RecordModel) => r.type === RecordType.WEIGHT)
          .sort((a: RecordModel, b: RecordModel) => b.datetime.localeCompare(a.datetime))[0]
        value = w ? w.weightValue : 0
      } else if (metric === 'food') {
        value = dayRecords
          .filter((r: RecordModel) => r.type === RecordType.FOOD)
          .reduce((sum: number, r: RecordModel) => sum + r.foodAmount, 0)
      } else if (metric === 'waste') {
        value = dayRecords.filter((r: RecordModel) => r.type === RecordType.WASTE).length
      } else if (metric === 'medicine') {
        value = dayRecords.filter((r: RecordModel) => r.type === RecordType.MEDICINE).length
      }
      result.push({ dateLabel: `${d.getMonth() + 1}/${d.getDate()}`, value })
    }
    return result
  }

  generateInviteCode(): string {
    const chars: string = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    let code: string = ''
    for (let i: number = 0; i < 6; i++) {
      code += chars.charAt(Math.floor(Math.random() * chars.length))
    }
    return code
  }

  uuid(): string {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c: string) => {
      const r: number = Math.random() * 16 | 0
      const v: number = c === 'x' ? r : (r & 0x3 | 0x8)
      return v.toString(16)
    })
  }
}
