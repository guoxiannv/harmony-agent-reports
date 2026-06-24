// Models.ets
//
// Entity interfaces for 平安扣 Pinankou. These are the persisted record shapes;
// they are serialized to JSON strings by the Persistence service.

import {
  MatterCategory,
  MatterPriority,
  MatterStatus,
  RiskSeverity,
  RiskStatus,
  PatrolStatus,
  RectificationStatus,
} from './Enums';

export interface SafetyMatter {
  id: string;
  title: string;
  category: MatterCategory;
  priority: MatterPriority;
  description: string;
  status: MatterStatus;
  createdAt: number;
  updatedAt: number;
}

export interface RiskReport {
  id: string;
  title: string;
  severity: RiskSeverity;
  location: string;
  description: string;
  status: RiskStatus;
  mediaUri: string;
  relatedMatterId: string;
  reportedAt: number;
  updatedAt: number;
}

export interface Checkpoint {
  checkpointId: string;
  name: string;
  clockedAt: number;
  note: string;
}

export interface PatrolTask {
  id: string;
  name: string;
  scheduleDate: number;
  status: PatrolStatus;
  checkpoints: Checkpoint[];
}

export interface EmergencyContact {
  id: string;
  name: string;
  role: string;
  phone: string;
  isPriority: boolean;
  sortOrder: number;
  createdAt: number;
}

export interface RectificationStep {
  stepId: string;
  label: string;
  done: boolean;
  at: number;
}

export interface RectificationTask {
  id: string;
  riskId: string;
  title: string;
  assignee: string;
  deadline: number;
  status: RectificationStatus;
  steps: RectificationStep[];
  note: string;
  createdAt: number;
  completedAt: number;
}

// Lightweight dashboard summary (bindings /summary/* and /patrol/progress).
export interface DashboardSummary {
  openMatters: number;
  unresolvedRisks: number;
  todayCheckpoints: number;
  overdueRectifications: number;
  completionRate: number;
}

// Aggregated stats for the statistics page (bindings /stats/*).
export interface CategoryStat {
  category: string;
  count: number;
}

export interface TrendPoint {
  dayLabel: string;
  count: number;
}

export interface DashboardStats {
  riskTotal: number;
  riskResolved: number;
  patrolCompletion: number;
  avgResolutionDays: number;
  riskByCategory: CategoryStat[];
  trend: TrendPoint[];
}

// Per-page list item descriptor surfaced to the UI for urgent cards.
export type UrgentKind = 'risk' | 'rectification' | 'matter';

export interface UrgentItem {
  id: string;
  kind: UrgentKind;
  title: string;
  subtitle: string;
}
