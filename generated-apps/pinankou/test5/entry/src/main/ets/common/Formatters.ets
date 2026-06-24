import { Theme } from '../common/Theme';

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

export class Formatters {
  static riskStatusLabel(status: string): string {
    let map: StringMap = Formatters.makeStatusMap()
    return Formatters.getString(map, status)
  }

  static riskLevelLabel(level: string): string {
    let map: StringMap = Formatters.makeLevelMap()
    return Formatters.getString(map, level)
  }

  static riskLevelColor(level: string): string {
    let map: StringMap = Formatters.makeLevelColorMap()
    return Formatters.getString(map, level)
  }

  static riskTypeLabel(type: string): string {
    let map: StringMap = Formatters.makeTypeMap()
    return Formatters.getString(map, type)
  }

  static inspectionStatusLabel(status: string): string {
    let map: StringMap = Formatters.makeInspectionMap()
    return Formatters.getString(map, status)
  }

  private static getString(map: StringMap, key: string): string {
    if (key === 'pending') return map.pending
    if (key === 'inprogress') return map.inprogress
    if (key === 'review') return map.review
    if (key === 'closed') return map.closed
    if (key === 'rejected') return map.rejected
    if (key === 'low') return map.low
    if (key === 'medium') return map.medium
    if (key === 'high') return map.high
    if (key === 'critical') return map.critical
    if (key === 'fire') return map.fire
    if (key === 'electrical') return map.electrical
    if (key === 'mechanical') return map.mechanical
    if (key === 'environment') return map.environment
    if (key === 'personnel') return map.personnel
    if (key === 'other') return map.other
    if (key === 'planned') return map.planned
    if (key === 'ongoing') return map.ongoing
    if (key === 'done') return map.done
    return key
  }

  private static makeStatusMap(): StringMap {
    let map: StringMap = new StringMap()
    map.pending = '待整改'
    map.inprogress = '整改中'
    map.review = '待复核'
    map.closed = '已关闭'
    map.rejected = '已退回'
    return map
  }

  private static makeLevelMap(): StringMap {
    let map: StringMap = new StringMap()
    map.low = '低'
    map.medium = '中'
    map.high = '高'
    map.critical = '重大'
    return map
  }

  private static makeLevelColorMap(): StringMap {
    let map: StringMap = new StringMap()
    map.low = Theme.safeBlue
    map.medium = Theme.warnOrange
    map.high = Theme.dangerRed
    map.critical = Theme.criticalPurple
    return map
  }

  private static makeTypeMap(): StringMap {
    let map: StringMap = new StringMap()
    map.fire = '消防'
    map.electrical = '电气'
    map.mechanical = '机械'
    map.environment = '环境'
    map.personnel = '人员'
    map.other = '其他'
    return map
  }

  private static makeInspectionMap(): StringMap {
    let map: StringMap = new StringMap()
    map.planned = '未开始'
    map.ongoing = '进行中'
    map.done = '已完成'
    return map
  }

  static dateString(ts: number): string {
    let d: Date = new Date(ts)
    let y: number = d.getFullYear()
    let m: number = d.getMonth() + 1
    let day: number = d.getDate()
    return `${y}-${Formatters.pad(m)}-${Formatters.pad(day)}`
  }

  static dateTimeString(ts: number): string {
    let d: Date = new Date(ts)
    return `${Formatters.dateString(ts)} ${Formatters.pad(d.getHours())}:${Formatters.pad(d.getMinutes())}`
  }

  private static pad(n: number): string {
    return n < 10 ? `0${n}` : String(n)
  }
}
