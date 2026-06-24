// Enums.ets
//
// Domain enumerations for 平安扣 Pinankou. ArkTS strict mode forbids indexed
// access on object/interface fields (arkts-no-props-by-index), so all label
// lookups are switch-based functions, never map[status].

// ---- SafetyMatter ----
export type MatterCategory = 'equipment' | 'environment' | 'behavior' | 'management' | 'other';
export type MatterPriority = 'low' | 'medium' | 'high';
export type MatterStatus = 'open' | 'closed';

// ---- RiskReport ----
export type RiskSeverity = 'low' | 'medium' | 'high' | 'critical';
export type RiskStatus = 'reported' | 'assigned' | 'fixing' | 'resolved';

// ---- Patrol ----
export type PatrolStatus = 'pending' | 'in-progress' | 'completed';

// ---- Rectification ----
export type RectificationStatus = 'pending' | 'in-progress' | 'completed' | 'overdue';

// ---- Stats ----
export type StatsPeriod = '7d' | '30d' | 'all';

export function matterCategoryLabel(category: MatterCategory): string {
  if (category === 'equipment') {
    return '设备设施';
  } else if (category === 'environment') {
    return '环境';
  } else if (category === 'behavior') {
    return '人员行为';
  } else if (category === 'management') {
    return '管理';
  }
  return '其他';
}

export function matterPriorityLabel(priority: MatterPriority): string {
  if (priority === 'high') {
    return '高';
  } else if (priority === 'medium') {
    return '中';
  }
  return '低';
}

export function matterStatusLabel(status: MatterStatus): string {
  if (status === 'open') {
    return '待处理';
  }
  return '已关闭';
}

export function riskSeverityLabel(severity: RiskSeverity): string {
  if (severity === 'critical') {
    return '紧急';
  } else if (severity === 'high') {
    return '高';
  } else if (severity === 'medium') {
    return '中';
  }
  return '低';
}

export function riskStatusLabel(status: RiskStatus): string {
  if (status === 'reported') {
    return '已上报';
  } else if (status === 'assigned') {
    return '已指派';
  } else if (status === 'fixing') {
    return '整改中';
  }
  return '已解决';
}

export function patrolStatusLabel(status: PatrolStatus): string {
  if (status === 'pending') {
    return '待开始';
  } else if (status === 'in-progress') {
    return '巡检中';
  }
  return '已完成';
}

export function rectificationStatusLabel(status: RectificationStatus): string {
  if (status === 'pending') {
    return '待整改';
  } else if (status === 'in-progress') {
    return '整改中';
  } else if (status === 'completed') {
    return '已完成';
  }
  return '已逾期';
}

// Ordered progression helpers (used by controllers).
export function nextRiskStatus(status: RiskStatus): RiskStatus {
  if (status === 'reported') {
    return 'assigned';
  } else if (status === 'assigned') {
    return 'fixing';
  } else if (status === 'fixing') {
    return 'resolved';
  }
  return 'resolved';
}

export function nextRectificationStatus(status: RectificationStatus): RectificationStatus {
  if (status === 'pending') {
    return 'in-progress';
  } else if (status === 'in-progress') {
    return 'completed';
  }
  return 'completed';
}
