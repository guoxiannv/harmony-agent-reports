import { AppStorageV2 } from '@kit.ArkUI'
import {
  Contact,
  ContactFormDraft,
  Issue,
  IssueFormDraft,
  IssuesFilter,
  PatrolCheckinDraft,
  PatrolPoint,
  StatsPeriod,
  StatsSnapshot,
  TodaySummary
} from '../models/SafetyTypes'
import { SafetyService } from '../services/SafetyService'
import { PhotoService } from '../services/PhotoService'
import { NotificationService } from '../services/NotificationService'
import { CallService } from '../services/CallService'
import { SafetyStore } from '../services/SafetyStore'
import type { Context } from '@kit.AbilityKit'

@Observed
export class SafetyAppState {
  today: TodaySummary = { dateLabel: '', patrolProgress: 0, pendingIssues: 0, resolvedThisWeek: 0 }
  issues: Issue[] = []
  recentIssues: Issue[] = []
  patrolPoints: PatrolPoint[] = []
  contacts: Contact[] = []
  stats: StatsSnapshot = new StatsSnapshot()
  statsPeriod: StatsPeriod = StatsPeriod.WEEK

  issueForm: IssueFormDraft = new IssueFormDraft()
  contactForm: ContactFormDraft = new ContactFormDraft()
  issuesFilter: IssuesFilter = new IssuesFilter()
  contactsFilter: ContactsFilterStateLocal = new ContactsFilterStateLocal()
  patrolCheckin: PatrolCheckinDraft = new PatrolCheckinDraft()

  readonly service: SafetyService
  private photoService: PhotoService = new PhotoService()
  private notify: NotificationService = new NotificationService()
  private call: CallService = new CallService()

  constructor(store: SafetyStore) {
    this.service = new SafetyService(store)
    this.statsPeriod = store.getStatsPeriod()
    this.refreshAll()
  }

  static create(context: Context): SafetyAppState {
    let store: SafetyStore = new SafetyStore(context)
    return new SafetyAppState(store)
  }

  refreshAll(): void {
    this.today = this.service.getTodaySummary()
    this.issues = this.service.listIssues()
    this.recentIssues = this.issues.slice(0, 5)
    this.patrolPoints = this.service.listPatrolPoints()
    this.contacts = this.service.listContacts()
    this.stats = this.service.computeStats(this.statsPeriod)
  }

  setIssuesFilter(next: IssuesFilter): void {
    this.issuesFilter = next
    this.applyIssueFilter()
  }

  applyIssueFilter(): void {
    let all: Issue[] = this.service.listIssues()
    let q: string = this.issuesFilter.query.trim().toLowerCase()
    this.issues = all.filter((i: Issue) => {
      let matchesQuery: boolean = q.length === 0 || i.title.toLowerCase().includes(q) || i.location.toLowerCase().includes(q)
      let matchesStatus: boolean = this.issuesFilter.status === 'all' || i.status === this.issuesFilter.status
      let matchesRisk: boolean = this.issuesFilter.risk === 'all' || i.riskLevel === this.issuesFilter.risk
      return matchesQuery && matchesStatus && matchesRisk
    })
  }

  resetIssueForm(): void {
    this.issueForm = new IssueFormDraft()
  }

  prepareIssueFormForEdit(issue: Issue): void {
    let draft: IssueFormDraft = new IssueFormDraft()
    draft.title = issue.title
    draft.type = issue.type
    draft.riskLevel = issue.riskLevel
    draft.location = issue.location
    draft.assignee = issue.assignee
    draft.dueDate = issue.dueDate
    draft.description = issue.description
    draft.photos = issue.photos.slice()
    draft.linkedPointId = null
    this.issueForm = draft
  }

  submitIssueForm(): boolean {
    if (!this.validateIssueForm()) {
      return false
    }
    this.service.createIssue(this.issueForm)
    this.notify.show('隐患已上报', this.issueForm.title)
    this.resetIssueForm()
    this.refreshAll()
    return true
  }

  updateIssueForm(issueId: string): boolean {
    if (!this.validateIssueForm()) {
      return false
    }
    this.service.updateIssue(issueId, this.issueForm)
    this.notify.show('隐患已更新', this.issueForm.title)
    this.resetIssueForm()
    this.refreshAll()
    return true
  }

  private validateIssueForm(): boolean {
    return this.issueForm.title.trim().length > 0
  }

  closeIssue(issueId: string): void {
    this.service.closeIssue(issueId)
    this.notify.show('事项已关闭', '')
    this.refreshAll()
  }

  advanceIssue(issueId: string): void {
    let issue: Issue | null = this.service.getIssue(issueId)
    if (!issue) {
      return
    }
    let transitions: Record<string, string> = {
      'pending': 'processing',
      'processing': 'awaiting-review',
      'awaiting-review': 'completed'
    }
    let next: string = transitions[issue.status] ?? issue.status
    if (next !== issue.status) {
      this.service.addTimelineEvent(issueId, next as import('../models/SafetyTypes').IssueStatus, '进度更新')
      this.notify.show('进度已更新', '')
      this.refreshAll()
    }
  }

  async capturePhotoForIssueForm(): Promise<void> {
    let uri: string = await this.photoService.capture()
    this.issueForm.photos.push(uri)
  }

  async capturePhotoForCheckin(): Promise<void> {
    let uri: string = await this.photoService.capture()
    this.patrolCheckin.photos.push(uri)
  }

  openPatrolCheckin(pointId: string): void {
    let draft: PatrolCheckinDraft = new PatrolCheckinDraft()
    draft.pointId = pointId
    this.patrolCheckin = draft
  }

  submitPatrolCheckin(): void {
    this.service.checkinPatrolPoint(this.patrolCheckin)
    this.notify.show('巡检打卡成功', this.patrolCheckin.isAbnormal ? '已生成异常隐患' : '状态正常')
    this.patrolCheckin = new PatrolCheckinDraft()
    this.refreshAll()
  }

  resetContactForm(): void {
    this.contactForm = new ContactFormDraft()
  }

  prepareContactFormForEdit(contact: Contact): void {
    let draft: ContactFormDraft = new ContactFormDraft()
    draft.id = contact.id
    draft.name = contact.name
    draft.role = contact.role
    draft.group = contact.group
    draft.phone = contact.phone
    draft.priority = contact.priority
    this.contactForm = draft
  }

  submitContactForm(): boolean {
    if (!this.validateContactForm()) {
      return false
    }
    let draft: ContactFormDraft = this.contactForm
    this.service.saveContact(draft)
    this.notify.show('联系人已保存', this.contactForm.name)
    this.resetContactForm()
    this.refreshAll()
    return true
  }

  private validateContactForm(): boolean {
    return this.contactForm.name.trim().length > 0 && this.contactForm.phone.trim().length > 0
  }

  deleteContact(id: string): void {
    this.service.deleteContact(id)
    this.refreshAll()
  }

  callContact(contact: Contact): void {
    this.call.call(contact.phone)
  }

  setStatsPeriod(period: StatsPeriod): void {
    this.statsPeriod = period
    this.stats = this.service.computeStats(period)
  }

  applyContactFilter(): void {
    let q: string = this.contactsFilter.query.trim().toLowerCase()
    if (q.length === 0) {
      this.contacts = this.service.listContacts()
      return
    }
    this.contacts = this.service.listContacts().filter((c: Contact) => {
      return c.name.toLowerCase().includes(q) || c.role.toLowerCase().includes(q) || c.phone.includes(q)
    })
  }
}

class ContactsFilterStateLocal {
  query: string = ''
}

const SAFETY_STATE_KEY: string = 'safetyAppState'

export function provideSafetyState(context: Context): SafetyAppState {
  return SafetyAppState.create(context)
}
