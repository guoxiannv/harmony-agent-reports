export enum RiskType {
  FIRE = 'fire',
  ELECTRICAL = 'electrical',
  MECHANICAL = 'mechanical',
  ENVIRONMENT = 'environment',
  PERSONNEL = 'personnel',
  OTHER = 'other'
}

export enum RiskLevel {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

export enum RiskStatus {
  PENDING = 'pending',
  INPROGRESS = 'inprogress',
  REVIEW = 'review',
  CLOSED = 'closed',
  REJECTED = 'rejected'
}

export enum InspectionStatus {
  PLANNED = 'planned',
  ONGOING = 'ongoing',
  DONE = 'done'
}

export enum ActivityType {
  RISK = 'risk',
  INSPECTION = 'inspection',
  FIX = 'fix',
  REVIEW = 'review'
}

export class RiskTimelineEvent {
  id: string = ''
  timestamp: number = 0
  action: string = ''
  actor: string = ''
  note: string = ''
}

export class RiskItem {
  id: string = ''
  title: string = ''
  type: RiskType = RiskType.OTHER
  level: RiskLevel = RiskLevel.LOW
  location: string = ''
  description: string = ''
  photos: string[] = []
  deadline: string = ''
  handler: string = ''
  reporter: string = ''
  status: RiskStatus = RiskStatus.PENDING
  createdAt: number = 0
  updatedAt: number = 0
  timeline: RiskTimelineEvent[] = []
  linkedInspectionId: string = ''
}

export class CheckItem {
  id: string = ''
  label: string = ''
  result: 'unchecked' | 'pass' | 'fail' = 'unchecked'
  note: string = ''
  photo: string = ''
}

export class InspectionTask {
  id: string = ''
  title: string = ''
  area: string = ''
  planDate: string = ''
  status: InspectionStatus = InspectionStatus.PLANNED
  checkItems: CheckItem[] = []
  inspector: string = ''
  startedAt: number | null = null
  completedAt: number | null = null
  note: string = ''
}

export class EmergencyContact {
  id: string = ''
  name: string = ''
  role: string = ''
  duty: string = ''
  phone: string = ''
}

export class Activity {
  id: string = ''
  type: ActivityType = ActivityType.RISK
  title: string = ''
  timestamp: number = 0
  status: string = ''
}

export class Profile {
  name: string = '安全员'
  role: string = '现场安全负责人'
  avatar: string = ''
}

export class StringMap {
  pending: string = ''
  inprogress: string = ''
  review: string = ''
  closed: string = ''
  rejected: string = ''
  low: string = ''
  medium: string = ''
  high: string = ''
  critical: string = ''
  fire: string = ''
  electrical: string = ''
  mechanical: string = ''
  environment: string = ''
  personnel: string = ''
  other: string = ''
  planned: string = ''
  ongoing: string = ''
  done: string = ''
}

export class HomeStats {
  todayInspectionCount: number = 0
  pendingRiskCount: number = 0
  overdueRiskCount: number = 0
  closedRate: string = '0%'
  riskDistribution: StringMap = new StringMap()
}
