// Models.ets
//
// Domain types for 平安扣 Pinankou (headless logic phase).
// Explicit classes + string-literal unions only — no `any`, no spreads,
// no dynamic indexed access, no const-enum (keeps ArkTS strict happy).

export type SafetyLevel = 'low' | 'medium' | 'high';

export type HazardStatus = 'pending' | 'in_progress' | 'rectified' | 'overdue';

export type PatrolPointStatus = 'pending' | 'checked' | 'abnormal';

export const SAFETY_LEVELS: SafetyLevel[] = ['low', 'medium', 'high'];

export const HAZARD_STATUSES: HazardStatus[] = ['pending', 'in_progress', 'rectified', 'overdue'];

export const PATROL_POINT_STATUSES: PatrolPointStatus[] = ['pending', 'checked', 'abnormal'];

export class SafetyItem {
  id: string = '';
  title: string = '';
  description: string = '';
  level: SafetyLevel = 'medium';
  owner: string = '';
  completed: boolean = false;
  createdAt: number = 0;
  updatedAt: number = 0;

  constructor(id: string, title: string, level: SafetyLevel, owner: string) {
    this.id = id;
    this.title = title;
    this.level = level;
    this.owner = owner;
    const now: number = currentTimeMillis();
    this.createdAt = now;
    this.updatedAt = now;
  }
}

export class Hazard {
  id: string = '';
  title: string = '';
  description: string = '';
  level: SafetyLevel = 'medium';
  location: string = '';
  photoUri: string = '';
  owner: string = '';
  deadline: number = 0;
  status: HazardStatus = 'pending';
  note: string = '';
  createdAt: number = 0;
  updatedAt: number = 0;

  constructor(id: string, title: string, level: SafetyLevel, owner: string, deadline: number) {
    this.id = id;
    this.title = title;
    this.level = level;
    this.owner = owner;
    this.deadline = deadline;
    const now: number = currentTimeMillis();
    this.createdAt = now;
    this.updatedAt = now;
  }
}

export class PatrolPoint {
  id: string = '';
  name: string = '';
  location: string = '';
  status: PatrolPointStatus = 'pending';
  checkedAt: number = 0;

  constructor(id: string, name: string, location: string) {
    this.id = id;
    this.name = name;
    this.location = location;
  }
}

export class PatrolTask {
  id: string = '';
  title: string = '';
  points: PatrolPoint[] = [];
  createdAt: number = 0;

  constructor(id: string, title: string) {
    this.id = id;
    this.title = title;
    this.createdAt = currentTimeMillis();
  }
}

export class EmergencyContact {
  id: string = '';
  name: string = '';
  phone: string = '';
  role: string = '';

  constructor(id: string, name: string, phone: string, role: string) {
    this.id = id;
    this.name = name;
    this.phone = phone;
    this.role = role;
  }
}

// Single time source; overridable in tests by re-evaluating usage at call sites.
export function currentTimeMillis(): number {
  return Date.now();
}

// Stable label maps used by future UI layers; kept in the model layer so logic
// and presentation agree on status/level vocabulary.
export function hazardStatusLabel(status: HazardStatus): string {
  if (status === 'pending') {
    return '待处理';
  } else if (status === 'in_progress') {
    return '整改中';
  } else if (status === 'rectified') {
    return '已整改';
  }
  return '已逾期';
}

export function safetyLevelLabel(level: SafetyLevel): string {
  if (level === 'high') {
    return '高';
  } else if (level === 'medium') {
    return '中';
  }
  return '低';
}
