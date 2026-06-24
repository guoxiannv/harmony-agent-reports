// Domain models and enums for Pinankou (平安扣) safety management app.
// ArkTS strict-mode safe: no spreads, no indexed object access, no utility types.

// ---- Enum-style string literal types ----
export type RecordCategory = 'fire' | 'electrical' | 'mechanical' | 'environment' | 'personnel' | 'other';
export type RecordStatus = 'open' | 'closed';
export type RiskSeverity = 'high' | 'medium' | 'low';
export type RiskStatus = 'open' | 'in-progress' | 'closed';
export type InspectionStatus = 'in-progress' | 'completed';
export type RectificationStatus = 'pending' | 'in-progress' | 'closed' | 'verified';
export type SyncStatus = 'local' | 'synced';

// ---- Label helpers (no indexed object access) ----
export function recordCategoryLabel(c: RecordCategory): string {
  if (c === 'fire') {
    return '消防安全';
  } else if (c === 'electrical') {
    return '电气安全';
  } else if (c === 'mechanical') {
    return '机械设备';
  } else if (c === 'environment') {
    return '环境设施';
  } else if (c === 'personnel') {
    return '人员行为';
  }
  return '其他';
}

export function riskSeverityLabel(s: RiskSeverity): string {
  if (s === 'high') {
    return '高风险';
  } else if (s === 'medium') {
    return '中风险';
  }
  return '低风险';
}

export function riskStatusLabel(s: RiskStatus): string {
  if (s === 'open') {
    return '待处理';
  } else if (s === 'in-progress') {
    return '整改中';
  }
  return '已关闭';
}

export function rectificationStatusLabel(s: RectificationStatus): string {
  if (s === 'pending') {
    return '待整改';
  } else if (s === 'in-progress') {
    return '整改中';
  } else if (s === 'closed') {
    return '已关闭';
  }
  return '已验收';
}

export function inspectionStatusLabel(s: InspectionStatus): string {
  if (s === 'in-progress') {
    return '进行中';
  }
  return '已完成';
}

// Severity weight used for sorting top risks (higher = more urgent).
export function riskSeverityWeight(s: RiskSeverity): number {
  if (s === 'high') {
    return 3;
  } else if (s === 'medium') {
    return 2;
  }
  return 1;
}

// ---- Entity classes ----
export class InspectionStop {
  id: string = '';
  name: string = '';
  checkedInAt: number = 0;
  notes: string = '';

  constructor(id: string, name: string) {
    this.id = id;
    this.name = name;
  }
}

export class SafetyRecord {
  id: string = '';
  title: string = '';
  category: RecordCategory = 'other';
  description: string = '';
  location: string = '';
  status: RecordStatus = 'open';
  createdAt: number = 0;
  updatedAt: number = 0;
  syncStatus: SyncStatus = 'local';
}

export class RiskReport {
  id: string = '';
  title: string = '';
  severity: RiskSeverity = 'medium';
  location: string = '';
  description: string = '';
  dueDate: number = 0;
  photoUris: string[] = [];
  assignee: string = '';
  status: RiskStatus = 'open';
  createdAt: number = 0;
  linkedRectificationId: string = '';
  syncStatus: SyncStatus = 'local';
}

export class InspectionRound {
  id: string = '';
  routeName: string = '';
  startedAt: number = 0;
  finishedAt: number = 0;
  status: InspectionStatus = 'in-progress';
  notes: string = '';
  stops: InspectionStop[] = [];
  syncStatus: SyncStatus = 'local';
}

export class Contact {
  id: string = '';
  name: string = '';
  role: string = '';
  phone: string = '';
  syncStatus: SyncStatus = 'local';
}

export class RectificationTask {
  id: string = '';
  title: string = '';
  sourceRiskId: string = '';
  status: RectificationStatus = 'pending';
  progress: number = 0;
  dueDate: number = 0;
  assignee: string = '';
  createdAt: number = 0;
  closedAt: number = 0;
  syncStatus: SyncStatus = 'local';
}

export function isRectificationOpen(t: RectificationTask): boolean {
  return t.status === 'pending' || t.status === 'in-progress';
}

export function isRiskOpen(r: RiskReport): boolean {
  return r.status !== 'closed';
}

// Chart point for dashboard trends / distributions.
export class ChartPoint {
  label: string = '';
  value: number = 0;

  constructor(label: string, value: number) {
    this.label = label;
    this.value = value;
  }
}
