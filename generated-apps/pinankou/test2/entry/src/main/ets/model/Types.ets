// Types.ets — domain models for 平安扣 Pinankou.
import { RiskLevel, HazardStatus } from '../common/Theme';
export type { RiskLevel, HazardStatus };

export type ProgressType = 'create' | 'rectify' | 'urge' | 'accept' | 'comment';

export interface HazardProgress {
  id: string;
  type: ProgressType;
  text: string;
  createdAt: number;
}

export interface HazardItem {
  id: string;
  title: string;
  location: string;
  level: RiskLevel;
  description: string;
  status: HazardStatus;
  assignee: string;
  deadline: number; // ms, 0 = none
  photoPath: string; // '' = none
  createdAt: number;
  updatedAt: number;
  progress: HazardProgress[];
}

export interface PatrolCheckpoint {
  id: string;
  routeId: string;
  name: string;
  order: number;
}

export interface PatrolRoute {
  id: string;
  name: string;
  description: string;
  checkpoints: PatrolCheckpoint[];
}

export interface CheckinRecord {
  id: string;
  routeId: string;
  checkpointId: string;
  time: number; // ms
  abnormal: boolean;
  note: string;
}

export type ContactGroup = '指挥' | '抢险' | '医疗' | '消防' | '其他';

export interface ContactItem {
  id: string;
  name: string;
  phone: string;
  group: ContactGroup;
  role: string;
  isPrimary: boolean;
}

export interface NewContact {
  name: string;
  phone: string;
  group: ContactGroup;
  role: string;
  isPrimary: boolean;
}

export type TodoType = 'hazard' | 'patrol' | 'review';

export interface SafetyTodo {
  id: string;
  title: string;
  type: TodoType;
  dueTime: number; // ms, 0 = none
  done: boolean;
}

export interface HazardForm {
  id: string; // '' when creating
  title: string;
  location: string;
  level: RiskLevel;
  description: string;
  assignee: string;
  deadline: number;
  photoPath: string;
}

export function emptyHazardForm(): HazardForm {
  return {
    id: '', title: '', location: '', level: 'medium',
    description: '', assignee: '', deadline: 0, photoPath: '',
  };
}

export type TimeRange = 'week' | 'month' | 'quarter' | 'all';

export interface TrendPoint {
  label: string;
  value: number;
}

export interface RankItem {
  label: string;
  value: number;
}

export interface StatsResult {
  hazardTotal: number;
  doneCount: number;
  pendingCount: number;
  completionRate: number; // 0..1
  patrolCoverage: number; // 0..1
  trend: TrendPoint[];
  rank: RankItem[];
}
