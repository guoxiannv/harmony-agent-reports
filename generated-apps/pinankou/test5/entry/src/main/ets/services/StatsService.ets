import { Activity, ActivityType, HomeStats, InspectionStatus, RiskStatus, StringMap } from '../models/Models';
import { InspectionRepository } from './InspectionRepository';
import { RiskRepository } from './RiskRepository';

export class StatsService {
  private riskRepo: RiskRepository
  private inspectionRepo: InspectionRepository

  constructor(riskRepo: RiskRepository, inspectionRepo: InspectionRepository) {
    this.riskRepo = riskRepo
    this.inspectionRepo = inspectionRepo
  }

  compute(): HomeStats {
    let stats: HomeStats = new HomeStats()
    let todayStr: string = this.dateString(Date.now())
    let inspections = this.inspectionRepo.list()
    let risks = this.riskRepo.list()

    stats.todayInspectionCount = inspections.filter((it) => it.planDate === todayStr).length
    stats.pendingRiskCount = risks.filter((it) => it.status === RiskStatus.PENDING || it.status === RiskStatus.INPROGRESS || it.status === RiskStatus.REJECTED).length
    stats.overdueRiskCount = risks.filter((it) => {
      return (it.status === RiskStatus.PENDING || it.status === RiskStatus.INPROGRESS || it.status === RiskStatus.REJECTED) &&
        it.deadline.length > 0 && it.deadline < todayStr
    }).length

    let closedCount: number = risks.filter((it) => it.status === RiskStatus.CLOSED).length
    let total: number = risks.length
    stats.closedRate = total === 0 ? '0%' : `${Math.round((closedCount / total) * 100)}%`

    let distribution: StringMap = new StringMap()
    distribution.pending = String(risks.filter((it) => it.status === RiskStatus.PENDING).length)
    distribution.inprogress = String(risks.filter((it) => it.status === RiskStatus.INPROGRESS).length)
    distribution.review = String(risks.filter((it) => it.status === RiskStatus.REVIEW).length)
    distribution.closed = String(closedCount)
    distribution.rejected = String(risks.filter((it) => it.status === RiskStatus.REJECTED).length)
    stats.riskDistribution = distribution

    return stats
  }

  recentActivities(): Activity[] {
    let activities: Activity[] = []
    this.riskRepo.list().slice(0, 5).forEach((risk) => {
      let a: Activity = new Activity()
      a.id = `A-${risk.id}`
      a.type = ActivityType.RISK
      a.title = `隐患：${risk.title}`
      a.timestamp = risk.createdAt
      a.status = risk.status
      activities.push(a)
    })
    this.inspectionRepo.list().slice(0, 5).forEach((task) => {
      let a: Activity = new Activity()
      a.id = `A-${task.id}`
      a.type = ActivityType.INSPECTION
      a.title = `巡检：${task.title}`
      a.timestamp = task.completedAt ?? task.startedAt ?? Date.now()
      a.status = task.status === InspectionStatus.DONE ? '已完成' : '进行中'
      activities.push(a)
    })
    activities.sort((a, b) => b.timestamp - a.timestamp)
    return activities.slice(0, 10)
  }

  private dateString(ts: number): string {
    let d: Date = new Date(ts)
    let y: number = d.getFullYear()
    let m: number = d.getMonth() + 1
    let day: number = d.getDate()
    return `${y}-${this.pad(m)}-${this.pad(day)}`
  }

  private pad(n: number): string {
    return n < 10 ? `0${n}` : String(n)
  }
}
