import { preferences } from '@kit.ArkData'
import type { Context } from '@kit.AbilityKit'
import {
  Contact,
  ContactGroup,
  Issue,
  IssueStatus,
  IssueType,
  PatrolPoint,
  PatrolPointStatus,
  PatrolRecord,
  RiskLevel,
  StatsPeriod,
  TimelineEvent
} from '../models/SafetyTypes'

const STORE_NAME: string = 'pinankou_safety'

export class SafetyStore {
  private pref: preferences.Preferences | null = null

  constructor(context: Context) {
    this.pref = preferences.getPreferencesSync(context, { name: STORE_NAME })
  }

  getIssues(): Issue[] {
    return this.readArray('issues', toIssue)
  }

  saveIssues(items: Issue[]): void {
    this.writeArray('issues', items)
  }

  getPatrolPoints(): PatrolPoint[] {
    return this.readArray('patrol_points', toPatrolPoint)
  }

  savePatrolPoints(items: PatrolPoint[]): void {
    this.writeArray('patrol_points', items)
  }

  getPatrolRecords(): PatrolRecord[] {
    return this.readArray('patrol_records', toPatrolRecord)
  }

  savePatrolRecords(items: PatrolRecord[]): void {
    this.writeArray('patrol_records', items)
  }

  getContacts(): Contact[] {
    return this.readArray('contacts', toContact)
  }

  saveContacts(items: Contact[]): void {
    this.writeArray('contacts', items)
  }

  getStatsPeriod(): StatsPeriod {
    try {
      let value: string | null = this.pref?.getSync('stats_period', StatsPeriod.WEEK) as string ?? StatsPeriod.WEEK
      return Object.values(StatsPeriod).includes(value as StatsPeriod) ? value as StatsPeriod : StatsPeriod.WEEK
    } catch (_) {
      return StatsPeriod.WEEK
    }
  }

  saveStatsPeriod(period: StatsPeriod): void {
    try {
      this.pref?.putSync('stats_period', period)
      this.pref?.flush()
    } catch (_) {
    }
  }

  private readArray<T>(key: string, mapper: (raw: object) => T): T[] {
    try {
      let json: string = this.pref?.getSync(key, '[]') as string ?? '[]'
      let parsed: object[] = JSON.parse(json) as object[]
      return parsed.map(mapper)
    } catch (_) {
      return []
    }
  }

  private writeArray<T>(key: string, items: T[]): void {
    try {
      this.pref?.putSync(key, JSON.stringify(items))
      this.pref?.flush()
    } catch (_) {
    }
  }
}

function toIssue(raw: object): Issue {
  let r = raw as Record<string, object>
  let item: Issue = new Issue()
  item.id = String(r['id'] ?? '')
  item.title = String(r['title'] ?? '')
  item.type = Object.values(IssueType).includes(String(r['type']) as IssueType) ? String(r['type']) as IssueType : IssueType.HAZARD
  item.riskLevel = Object.values(RiskLevel).includes(String(r['riskLevel']) as RiskLevel) ? String(r['riskLevel']) as RiskLevel : RiskLevel.LOW
  item.status = Object.values(IssueStatus).includes(String(r['status']) as IssueStatus) ? String(r['status']) as IssueStatus : IssueStatus.PENDING
  item.reporterId = String(r['reporterId'] ?? '')
  item.assignee = String(r['assignee'] ?? '')
  item.location = String(r['location'] ?? '')
  item.photos = Array.isArray(r['photos']) ? (r['photos'] as object[]).map((p: object) => String(p)) : []
  item.description = String(r['description'] ?? '')
  item.createdAt = Number(r['createdAt'] ?? 0)
  item.dueDate = Number(r['dueDate'] ?? 0)
  item.updatedAt = Number(r['updatedAt'] ?? 0)
  item.timeline = Array.isArray(r['timeline']) ? (r['timeline'] as object[]).map(toTimelineEvent) : []
  return item
}

function toTimelineEvent(raw: object): TimelineEvent {
  let r = raw as Record<string, object>
  let item: TimelineEvent = new TimelineEvent()
  item.id = String(r['id'] ?? '')
  item.issueId = String(r['issueId'] ?? '')
  item.timestamp = Number(r['timestamp'] ?? 0)
  item.status = Object.values(IssueStatus).includes(String(r['status']) as IssueStatus) ? String(r['status']) as IssueStatus : IssueStatus.PENDING
  item.note = String(r['note'] ?? '')
  item.actorId = String(r['actorId'] ?? '')
  return item
}

function toPatrolPoint(raw: object): PatrolPoint {
  let r = raw as Record<string, object>
  let item: PatrolPoint = new PatrolPoint()
  item.id = String(r['id'] ?? '')
  item.name = String(r['name'] ?? '')
  item.area = String(r['area'] ?? '')
  item.sequence = Number(r['sequence'] ?? 0)
  item.status = Object.values(PatrolPointStatus).includes(String(r['status']) as PatrolPointStatus) ? String(r['status']) as PatrolPointStatus : PatrolPointStatus.PENDING
  item.lastCheckAt = r['lastCheckAt'] == null ? null : Number(r['lastCheckAt'])
  item.lat = r['lat'] == null ? null : Number(r['lat'])
  item.lng = r['lng'] == null ? null : Number(r['lng'])
  return item
}

function toPatrolRecord(raw: object): PatrolRecord {
  let r = raw as Record<string, object>
  let item: PatrolRecord = new PatrolRecord()
  item.id = String(r['id'] ?? '')
  item.pointId = String(r['pointId'] ?? '')
  item.checkedAt = Number(r['checkedAt'] ?? 0)
  item.photos = Array.isArray(r['photos']) ? (r['photos'] as object[]).map((p: object) => String(p)) : []
  item.notes = String(r['notes'] ?? '')
  item.abnormal = Boolean(r['abnormal'] ?? false)
  item.relatedIssueId = r['relatedIssueId'] == null ? null : String(r['relatedIssueId'])
  return item
}

function toContact(raw: object): Contact {
  let r = raw as Record<string, object>
  let item: Contact = new Contact()
  item.id = String(r['id'] ?? '')
  item.name = String(r['name'] ?? '')
  item.role = String(r['role'] ?? '')
  item.group = Object.values(ContactGroup).includes(String(r['group']) as ContactGroup) ? String(r['group']) as ContactGroup : ContactGroup.OTHER
  item.phone = String(r['phone'] ?? '')
  item.priority = Boolean(r['priority'] ?? false)
  return item
}
