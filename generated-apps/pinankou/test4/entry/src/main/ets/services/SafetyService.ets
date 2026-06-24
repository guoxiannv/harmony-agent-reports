import {
  Contact,
  ContactFormDraft,
  Issue,
  IssueFormDraft,
  IssueStatus,
  IssueType,
  PatrolCheckinDraft,
  PatrolPoint,
  PatrolPointStatus,
  PatrolRecord,
  RiskLevel,
  StatsPeriod,
  StatsSnapshot,
  TimelineEvent,
  TodaySummary,
  TrendPoint
} from '../models/SafetyTypes'
import { SafetyStore } from './SafetyStore'
import { uuid } from '../common/Uuid'

class CheckinResult {
  point: PatrolPoint = new PatrolPoint()
  record: PatrolRecord = new PatrolRecord()
  issue: Issue | undefined = undefined
}

export class SafetyService {
  private store: SafetyStore

  constructor(store: SafetyStore) {
    this.store = store
  }

  // Issues
  listIssues(): Issue[] {
    return this.store.getIssues().slice().sort((a: Issue, b: Issue) => b.updatedAt - a.updatedAt)
  }

  getIssue(id: string): Issue | null {
    return this.store.getIssues().find((i: Issue) => i.id === id) ?? null
  }

  createIssue(draft: IssueFormDraft, actorId: string = ''): Issue {
    let now: number = Date.now()
    let issue: Issue = new Issue()
    issue.id = uuid()
    issue.title = draft.title.trim()
    issue.type = draft.type
    issue.riskLevel = draft.riskLevel
    issue.status = IssueStatus.PENDING
    issue.reporterId = actorId
    issue.assignee = draft.assignee.trim()
    issue.location = draft.location.trim()
    issue.photos = draft.photos.slice()
    issue.description = draft.description.trim()
    issue.createdAt = now
    issue.dueDate = draft.dueDate
    issue.updatedAt = now
    issue.timeline = [this.makeTimelineEvent(issue.id, IssueStatus.PENDING, '隐患上报', actorId, now)]

    let issues: Issue[] = this.store.getIssues()
    issues.unshift(issue)
    this.store.saveIssues(issues)
    return issue
  }

  updateIssue(id: string, patch: IssueFormDraft): Issue | null {
    let issues: Issue[] = this.store.getIssues()
    let idx: number = issues.findIndex((i: Issue) => i.id === id)
    if (idx < 0) {
      return null
    }
    let issue: Issue = issues[idx]
    issue.title = patch.title.trim()
    issue.type = patch.type
    issue.riskLevel = patch.riskLevel
    issue.assignee = patch.assignee.trim()
    issue.location = patch.location.trim()
    issue.photos = patch.photos.slice()
    issue.description = patch.description.trim()
    issue.dueDate = patch.dueDate
    issue.updatedAt = Date.now()
    this.store.saveIssues(issues)
    return issue
  }

  addTimelineEvent(issueId: string, status: IssueStatus, note: string, actorId: string = ''): Issue | null {
    let issues: Issue[] = this.store.getIssues()
    let idx: number = issues.findIndex((i: Issue) => i.id === issueId)
    if (idx < 0) {
      return null
    }
    let issue: Issue = issues[idx]
    issue.status = status
    issue.updatedAt = Date.now()
    issue.timeline.push(this.makeTimelineEvent(issue.id, status, note, actorId, issue.updatedAt))
    this.store.saveIssues(issues)
    return issue
  }

  closeIssue(id: string, actorId: string = ''): Issue | null {
    return this.addTimelineEvent(id, IssueStatus.CLOSED, '关闭事项', actorId)
  }

  private makeTimelineEvent(issueId: string, status: IssueStatus, note: string, actorId: string, timestamp: number): TimelineEvent {
    let event: TimelineEvent = new TimelineEvent()
    event.id = uuid()
    event.issueId = issueId
    event.timestamp = timestamp
    event.status = status
    event.note = note
    event.actorId = actorId
    return event
  }

  // Patrol
  listPatrolPoints(): PatrolPoint[] {
    let points: PatrolPoint[] = this.store.getPatrolPoints()
    if (points.length === 0) {
      points = defaultPatrolPoints()
      this.store.savePatrolPoints(points)
    }
    return points.slice().sort((a: PatrolPoint, b: PatrolPoint) => a.sequence - b.sequence)
  }

  getPatrolPoint(id: string): PatrolPoint | null {
    return this.listPatrolPoints().find((p: PatrolPoint) => p.id === id) ?? null
  }

  checkinPatrolPoint(draft: PatrolCheckinDraft, actorId: string = ''): CheckinResult {
    let points: PatrolPoint[] = this.listPatrolPoints()
    let point: PatrolPoint | undefined = points.find((p: PatrolPoint) => p.id === draft.pointId)
    if (!point) {
      throw new Error('Patrol point not found')
    }
    let now: number = Date.now()
    point.status = draft.isAbnormal ? PatrolPointStatus.ABNORMAL : PatrolPointStatus.DONE
    point.lastCheckAt = now
    this.store.savePatrolPoints(points)

    let record: PatrolRecord = new PatrolRecord()
    record.id = uuid()
    record.pointId = draft.pointId
    record.checkedAt = now
    record.photos = draft.photos.slice()
    record.notes = draft.notes.trim()
    record.abnormal = draft.isAbnormal
    record.relatedIssueId = null

    let records: PatrolRecord[] = this.store.getPatrolRecords()
    records.unshift(record)
    this.store.savePatrolRecords(records)

    let issue: Issue | undefined = undefined
    if (draft.isAbnormal) {
      let issueDraft: IssueFormDraft = new IssueFormDraft()
      issueDraft.title = `${point.name} 巡检异常`
      issueDraft.type = IssueType.HAZARD
      issueDraft.riskLevel = RiskLevel.MEDIUM
      issueDraft.location = point.area
      issueDraft.assignee = ''
      issueDraft.dueDate = now + 24 * 60 * 60 * 1000
      issueDraft.description = record.notes
      issueDraft.photos = record.photos.slice()
      issueDraft.linkedPointId = point.id
      issue = this.createIssue(issueDraft, actorId)
      record.relatedIssueId = issue.id
      let updatedRecords: PatrolRecord[] = this.store.getPatrolRecords()
      let ridx: number = updatedRecords.findIndex((r: PatrolRecord) => r.id === record.id)
      if (ridx >= 0) {
        updatedRecords[ridx] = record
        this.store.savePatrolRecords(updatedRecords)
      }
    }

    let result: CheckinResult = new CheckinResult()
    result.point = point
    result.record = record
    result.issue = issue
    return result
  }

  // Contacts
  listContacts(): Contact[] {
    return this.store.getContacts().slice().sort(contactSort)
  }

  getContact(id: string): Contact | null {
    return this.store.getContacts().find((c: Contact) => c.id === id) ?? null
  }

  saveContact(draft: ContactFormDraft): Contact {
    let contacts: Contact[] = this.store.getContacts()
    let now: number = Date.now()
    if (draft.id) {
      let idx: number = contacts.findIndex((c: Contact) => c.id === draft.id)
      if (idx >= 0) {
        let c: Contact = contacts[idx]
        c.name = draft.name.trim()
        c.role = draft.role.trim()
        c.group = draft.group
        c.phone = draft.phone.trim()
        c.priority = draft.priority
        this.store.saveContacts(contacts)
        return c
      }
    }
    let contact: Contact = new Contact()
    contact.id = uuid()
    contact.name = draft.name.trim()
    contact.role = draft.role.trim()
    contact.group = draft.group
    contact.phone = draft.phone.trim()
    contact.priority = draft.priority
    contacts.push(contact)
    this.store.saveContacts(contacts)
    return contact
  }

  deleteContact(id: string): void {
    let contacts: Contact[] = this.store.getContacts().filter((c: Contact) => c.id !== id)
    this.store.saveContacts(contacts)
  }

  // Stats
  getTodaySummary(): TodaySummary {
    let points: PatrolPoint[] = this.listPatrolPoints()
    let done: number = points.filter((p: PatrolPoint) => p.status !== PatrolPointStatus.PENDING).length
    let total: number = points.length || 1
    let issues: Issue[] = this.store.getIssues()
    let pending: number = issues.filter((i: Issue) => i.status === IssueStatus.PENDING || i.status === IssueStatus.PROCESSING).length
    let resolvedThisWeek: number = issues.filter((i: Issue) => i.status === IssueStatus.COMPLETED && i.updatedAt >= weekStart()).length
    return {
      dateLabel: formatToday(),
      patrolProgress: done / total,
      pendingIssues: pending,
      resolvedThisWeek: resolvedThisWeek
    }
  }

  computeStats(period: StatsPeriod): StatsSnapshot {
    let issues: Issue[] = this.store.getIssues()
    let start: number = periodStart(period)
    let filtered: Issue[] = issues.filter((i: Issue) => i.createdAt >= start)
    let resolved: Issue[] = filtered.filter((i: Issue) => i.status === IssueStatus.COMPLETED || i.status === IssueStatus.CLOSED)
    let total: number = filtered.length || issues.length
    let completionRate: number = total === 0 ? 0 : resolved.length / total

    let points: PatrolPoint[] = this.listPatrolPoints()
    let donePoints: number = points.filter((p: PatrolPoint) => p.status !== PatrolPointStatus.PENDING).length
    let patrolRate: number = points.length === 0 ? 0 : donePoints / points.length

    let riskDistribution: Record<string, number> = {}
    filtered.forEach((i: Issue) => {
      riskDistribution[i.riskLevel] = (riskDistribution[i.riskLevel] ?? 0) + 1
    })

    let avgHours: number = 0
    if (resolved.length > 0) {
      let sum: number = resolved.reduce((acc: number, i: Issue) => {
        let resolvedEvent: TimelineEvent | undefined = [...i.timeline].reverse().find((e: TimelineEvent) => e.status === IssueStatus.COMPLETED)
        let resolvedAt: number = resolvedEvent ? resolvedEvent.timestamp : i.updatedAt
        return acc + (resolvedAt - i.createdAt) / 3600000
      }, 0)
      avgHours = sum / resolved.length
    }

    return {
      period: period,
      issueCount: filtered.length,
      resolvedCount: resolved.length,
      completionRate: completionRate,
      patrolCompletionRate: patrolRate,
      riskDistribution: riskDistribution,
      avgResolutionHours: avgHours,
      trend: buildTrend(period, issues)
    }
  }
}

function contactSort(a: Contact, b: Contact): number {
  if (a.priority !== b.priority) {
    return a.priority ? -1 : 1
  }
  return a.name.localeCompare(b.name)
}

function defaultPatrolPoints(): PatrolPoint[] {
  return [
    makePoint('A1', '1号楼大堂', 1, 30.0, 120.0),
    makePoint('A2', '1号楼消防通道', 2, 30.001, 120.001),
    makePoint('A3', '地下车库B1', 3, 30.002, 120.002),
    makePoint('A4', '园区东门岗亭', 4, 30.003, 120.003),
    makePoint('A5', '中心配电房', 5, 30.004, 120.004)
  ]
}

function makePoint(id: string, name: string, sequence: number, lat: number, lng: number): PatrolPoint {
  let p: PatrolPoint = new PatrolPoint()
  p.id = id
  p.name = name
  p.area = name
  p.sequence = sequence
  p.status = PatrolPointStatus.PENDING
  p.lat = lat
  p.lng = lng
  return p
}

function weekStart(): number {
  let now: Date = new Date()
  let day: number = now.getDay() || 7
  now.setHours(0, 0, 0, 0)
  return now.getTime() - (day - 1) * 86400000
}

function periodStart(period: StatsPeriod): number {
  let now: number = Date.now()
  if (period === StatsPeriod.DAY) {
    return now - 86400000
  } else if (period === StatsPeriod.WEEK) {
    return now - 7 * 86400000
  } else {
    return now - 30 * 86400000
  }
}

function buildTrend(period: StatsPeriod, issues: Issue[]): TrendPoint[] {
  let buckets: number = period === StatsPeriod.DAY ? 6 : (period === StatsPeriod.WEEK ? 7 : 10)
  let step: number = period === StatsPeriod.DAY ? 4 * 3600000 : (period === StatsPeriod.WEEK ? 86400000 : 3 * 86400000)
  let now: number = Date.now()
  let result: TrendPoint[] = []
  for (let i: number = buckets - 1; i >= 0; i--) {
    let bucketStart: number = now - (i + 1) * step
    let bucketEnd: number = now - i * step
    let label: string = ''
    if (period === StatsPeriod.DAY) {
      label = `${new Date(bucketEnd).getHours()}:00`
    } else {
      label = `${new Date(bucketEnd).getMonth() + 1}/${new Date(bucketEnd).getDate()}`
    }
    result.push({
      label: label,
      created: issues.filter((issue: Issue) => issue.createdAt >= bucketStart && issue.createdAt < bucketEnd).length,
      resolved: issues.filter((issue: Issue) => (issue.status === IssueStatus.COMPLETED || issue.status === IssueStatus.CLOSED) && issue.updatedAt >= bucketStart && issue.updatedAt < bucketEnd).length
    })
  }
  return result
}

function formatToday(): string {
  let d: Date = new Date()
  let days: string[] = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
  return `${d.getFullYear()}年${d.getMonth() + 1}月${d.getDate()}日 ${days[d.getDay()]}`
}
