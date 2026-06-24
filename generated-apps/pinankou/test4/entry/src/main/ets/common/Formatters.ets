export function formatDateLabel(timestamp: number): string {
  if (timestamp === 0) {
    return '-'
  }
  let date: Date = new Date(timestamp)
  let y: number = date.getFullYear()
  let m: number = date.getMonth() + 1
  let d: number = date.getDate()
  let pad = (n: number): string => (n < 10 ? '0' + n : String(n))
  return `${y}-${pad(m)}-${pad(d)}`
}

export function formatDateTime(timestamp: number): string {
  if (timestamp === 0) {
    return '-'
  }
  let date: Date = new Date(timestamp)
  let pad = (n: number): string => (n < 10 ? '0' + n : String(n))
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`
}

export function riskLabel(level: string): string {
  if (level === 'low') {
    return '低'
  } else if (level === 'medium') {
    return '中'
  } else if (level === 'high') {
    return '高'
  } else if (level === 'critical') {
    return '重大'
  }
  return level
}

export function statusLabel(status: string): string {
  if (status === 'pending') {
    return '待处理'
  } else if (status === 'processing') {
    return '处理中'
  } else if (status === 'awaiting-review') {
    return '待验收'
  } else if (status === 'completed') {
    return '已完成'
  } else if (status === 'closed') {
    return '已关闭'
  }
  return status
}

export function typeLabel(type: string): string {
  if (type === 'hazard') {
    return '隐患'
  } else if (type === 'routine') {
    return '日常事项'
  } else if (type === 'rectification') {
    return '整改督办'
  }
  return type
}

export function groupLabel(group: string): string {
  if (group === 'fire') {
    return '消防'
  } else if (group === 'security') {
    return '安保'
  } else if (group === 'medical') {
    return '医疗'
  } else if (group === 'manager') {
    return '主管'
  }
  return '其他'
}
