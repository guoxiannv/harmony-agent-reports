// Types.ets - 平安扣 domain model.
//
// ArkTS-safe: string literal unions + explicit interfaces (no TS `enum`).
// Entity shape and enum values come from spec.md §6 + ui-tree.json bindings.

// --- Enums (string literal unions) ---

export type ItemCategory = '消防安全' | '设备安全' | '电气安全' | '其他';

export const ITEM_CATEGORIES: ItemCategory[] = ['消防安全', '设备安全', '电气安全', '其他'];

export type Priority = '高' | '中' | '低';

export const PRIORITIES: Priority[] = ['高', '中', '低'];

export type ItemStatus = '待办' | '进行中' | '已完成';

export const ITEM_STATUSES: ItemStatus[] = ['待办', '进行中', '已完成'];

// "全部" is a UI filter value; ItemStatus itself is the canonical status.
export type ItemStatusFilter = '全部' | ItemStatus;

export type PriorityFilter = '全部' | Priority;

export type HazardLevel = '高' | '中' | '低';

export const HAZARD_LEVELS: HazardLevel[] = ['高', '中', '低'];

export type HazardLevelFilter = '全部' | HazardLevel;

export type HazardStatus = '待处理' | '处理中' | '待验收' | '已完成';

export const HAZARD_STATUSES: HazardStatus[] = ['待处理', '处理中', '待验收', '已完成'];

export type HazardStatusFilter = '全部' | HazardStatus;

export type InspectionStatus = '待巡检' | '进行中' | '已完成';

export const INSPECTION_STATUSES: InspectionStatus[] = ['待巡检', '进行中', '已完成'];

export type InspectionStatusFilter = '全部' | InspectionStatus;

export type CheckpointResult = '未检' | '正常' | '异常';

export type StatsPeriod = '本周' | '本月' | '本季度';

export const STATS_PERIODS: StatsPeriod[] = ['本周', '本月', '本季度'];

// Filter value "全部" for inspection list filter.
export type StatusFilter = '全部' | string;

// --- Entities ---

export interface SafetyItem {
  id: string;
  title: string;
  category: ItemCategory;
  priority: Priority;
  owner: string;
  dueDate: string; // YYYY-MM-DD; '' when unset
  note: string;
  status: ItemStatus;
  createdAt: number;
  updatedAt: number;
}

export interface HazardRemark {
  status: HazardStatus;
  text: string;
  at: number;
}

export interface Hazard {
  id: string;
  title: string;
  location: string;
  level: HazardLevel;
  description: string;
  hasPhoto: boolean;
  reporter: string;
  status: HazardStatus;
  remarks: HazardRemark[];
  createdAt: number;
  updatedAt: number;
}

export interface Checkpoint {
  id: string;
  name: string;
  location: string;
  result: CheckpointResult;
  hasPhoto: boolean;
  note: string;
}

export interface InspectionTask {
  id: string;
  name: string;
  checkpointCount: number;
  dueDate: string; // YYYY-MM-DD; '' when unset
  status: InspectionStatus;
  checkpoints: Checkpoint[];
  createdAt: number;
  completedAt: number; // 0 when not completed
}

export interface EmergencyContact {
  id: string;
  name: string;
  role: string;
  phone: string;
  isPrimary: boolean;
  sortOrder: number;
  createdAt: number;
}

// --- Stats / computed shapes ---

export interface StatsTrendPoint {
  label: string; // e.g. '06-12'
  value: number;
}

export interface StatsDistributionSlice {
  label: string;
  value: number;
  color: string;
}

export interface StatsSnapshot {
  hazardTotal: number;
  pendingCount: number;
  completionRate: number; // 0..100
  inspectionRate: number; // 0..100
  overdueCount: number;
  trend: StatsTrendPoint[];
  distribution: StatsDistributionSlice[];
}

export interface HomeSummary {
  pendingCount: number;
  overdueCount: number;
  todayInspectionStatus: string;
}

export interface ActivityEntry {
  id: string;
  kind: 'hazard' | 'item';
  title: string;
  subtitle: string;
  accent: 'red' | 'orange' | 'blue' | 'green';
  at: number;
}
