export enum IssueType {
  HAZARD = 'hazard',
  ROUTINE = 'routine',
  RECTIFICATION = 'rectification'
}

export enum RiskLevel {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

export enum IssueStatus {
  PENDING = 'pending',
  PROCESSING = 'processing',
  AWAITING_REVIEW = 'awaiting-review',
  COMPLETED = 'completed',
  CLOSED = 'closed'
}

export enum PatrolPointStatus {
  PENDING = 'pending',
  DONE = 'done',
  ABNORMAL = 'abnormal'
}

export enum ContactGroup {
  FIRE = 'fire',
  SECURITY = 'security',
  MEDICAL = 'medical',
  MANAGER = 'manager',
  OTHER = 'other'
}

export enum StatsPeriod {
  DAY = 'day',
  WEEK = 'week',
  MONTH = 'month'
}

export class TimelineEvent {
  id: string = ''
  issueId: string = ''
  timestamp: number = 0
  status: IssueStatus = IssueStatus.PENDING
  note: string = ''
  actorId: string = ''
}

export class Issue {
  id: string = ''
  title: string = ''
  type: IssueType = IssueType.HAZARD
  riskLevel: RiskLevel = RiskLevel.LOW
  status: IssueStatus = IssueStatus.PENDING
  reporterId: string = ''
  assignee: string = ''
  location: string = ''
  photos: string[] = []
  description: string = ''
  createdAt: number = 0
  dueDate: number = 0
  updatedAt: number = 0
  timeline: TimelineEvent[] = []
}

export class PatrolPoint {
  id: string = ''
  name: string = ''
  area: string = ''
  sequence: number = 0
  status: PatrolPointStatus = PatrolPointStatus.PENDING
  lastCheckAt: number | null = null
  lat: number | null = null
  lng: number | null = null
}

export class PatrolRecord {
  id: string = ''
  pointId: string = ''
  checkedAt: number = 0
  photos: string[] = []
  notes: string = ''
  abnormal: boolean = false
  relatedIssueId: string | null = null
}

export class Contact {
  id: string = ''
  name: string = ''
  role: string = ''
  group: ContactGroup = ContactGroup.OTHER
  phone: string = ''
  priority: boolean = false
}

export class TrendPoint {
  label: string = ''
  created: number = 0
  resolved: number = 0
}

export class StatsSnapshot {
  period: StatsPeriod = StatsPeriod.WEEK
  issueCount: number = 0
  resolvedCount: number = 0
  completionRate: number = 0
  patrolCompletionRate: number = 0
  riskDistribution: Record<string, number> = {}
  avgResolutionHours: number = 0
  trend: TrendPoint[] = []
}

export class IssueFormDraft {
  title: string = ''
  type: IssueType = IssueType.HAZARD
  riskLevel: RiskLevel = RiskLevel.LOW
  location: string = ''
  assignee: string = ''
  dueDate: number = 0
  description: string = ''
  photos: string[] = []
  linkedPointId: string | null = null
}

export class ContactFormDraft {
  id: string | null = null
  name: string = ''
  role: string = ''
  group: ContactGroup = ContactGroup.OTHER
  phone: string = ''
  priority: boolean = false
}

export class IssuesFilter {
  query: string = ''
  status: IssueStatus | 'all' = 'all'
  risk: RiskLevel | 'all' = 'all'
}

export class PatrolCheckinDraft {
  pointId: string = ''
  notes: string = ''
  isAbnormal: boolean = false
  photos: string[] = []
}

export class TodaySummary {
  dateLabel: string = ''
  patrolProgress: number = 0
  pendingIssues: number = 0
  resolvedThisWeek: number = 0
}
