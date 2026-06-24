// Types.ets
//
// 平安扣 Pinankou — 领域模型与枚举。
// 共享类型契约：services / controller / pages 共用。保持字段稳定。
// ArkTS strict-safe：使用 export enum 与 interface；不做对象 spread / 动态索引。

// ---------------- 枚举 ----------------

export enum RecordCategory {
  Production = 'production',
  Equipment = 'equipment',
  Environment = 'environment',
  Fire = 'fire',
  Electrical = 'electrical',
  Behavior = 'behavior',
  Other = 'other',
}

export enum Priority {
  Low = 'low',
  Medium = 'medium',
  High = 'high',
  Urgent = 'urgent',
}

export enum RecordStatus {
  Open = 'open',
  Processing = 'processing',
  Closed = 'closed',
}

export enum HazardLevel {
  Minor = 'minor',
  General = 'general',
  Major = 'major',
  Critical = 'critical',
}

export enum HazardStatus {
  Reported = 'reported',
  Correcting = 'correcting',
  Corrected = 'corrected',
  Closed = 'closed',
}

export enum PatrolStatus {
  Pending = 'pending',
  Done = 'done',
  Abnormal = 'abnormal',
}

export enum ContactGroup {
  Emergency = 'emergency',
  Manager = 'manager',
  Maintenance = 'maintenance',
  Medical = 'medical',
  Other = 'other',
}

export enum CorrectionSource {
  Record = 'record',
  Hazard = 'hazard',
  Manual = 'manual',
}

export enum CorrectionStatus {
  Pending = 'pending',
  InProgress = 'in_progress',
  Completed = 'completed',
  Verified = 'verified',
  Overdue = 'overdue',
}

export enum StatisticsPeriod {
  Day = 'day',
  Week = 'week',
  Month = 'month',
}

// ---------------- 实体 ----------------

export interface SafetyRecord {
  id: string;
  title: string;
  category: RecordCategory;
  priority: Priority;
  description: string;
  photos: string[];
  status: RecordStatus;
  createdAt: number;
  updatedAt: number;
}

export interface Hazard {
  id: string;
  title: string;
  location: string;
  level: HazardLevel;
  description: string;
  photos: string[];
  status: HazardStatus;
  correctionId: string | null;
  createdAt: number;
  updatedAt: number;
}

export interface PatrolPoint {
  id: string;
  name: string;
  location: string;
}

export interface PatrolCheckin {
  id: string;
  pointId: string;
  pointName: string;
  photos: string[];
  note: string;
  status: PatrolStatus;
  checkinAt: number;
}

export interface Contact {
  id: string;
  name: string;
  role: string;
  group: ContactGroup;
  phone: string;
  remark: string;
}

export interface Correction {
  id: string;
  sourceType: CorrectionSource;
  sourceId: string;
  title: string;
  responsible: string;
  dueDate: number;
  progress: number;
  status: CorrectionStatus;
  note: string;
  photos: string[];
  createdAt: number;
  updatedAt: number;
}

export interface StatTrend {
  label: string;
  value: number;
}

// ---------------- 统计聚合结果 ----------------

export interface StatisticsSnapshot {
  hazardTotal: number;
  correctionRate: number;
  patrolCompletion: number;
  overdueCount: number;
  trendData: StatTrend[];
}

// ---------------- 通用校验结果 ----------------

export interface ValidationResult {
  valid: boolean;
  errors: Record<string, string>;
}
