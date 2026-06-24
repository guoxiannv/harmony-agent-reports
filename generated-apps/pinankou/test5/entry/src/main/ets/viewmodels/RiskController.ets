import { AppServices } from '../services/AppServices';
import { RiskItem, RiskStatus, RiskType, RiskLevel } from '../models/Models';

export class RiskController {
  private services: AppServices
  activeFilter: RiskStatus | 'all' = 'all'
  searchQuery: string = ''

  constructor(services: AppServices) {
    this.services = services
  }

  filteredRisks(): RiskItem[] {
    let byStatus: RiskItem[] = this.services.riskRepo.filterByStatus(this.activeFilter)
    let query: string = this.searchQuery.trim().toLowerCase()
    if (query.length === 0) {
      return byStatus
    }
    return byStatus.filter((item: RiskItem) => {
      return item.title.toLowerCase().includes(query) ||
        item.location.toLowerCase().includes(query) ||
        item.handler.toLowerCase().includes(query)
    })
  }

  setFilter(filter: RiskStatus | 'all'): void {
    this.activeFilter = filter
  }

  setSearchQuery(query: string): void {
    this.searchQuery = query
  }

  get(id: string): RiskItem | undefined {
    return this.services.riskRepo.get(id)
  }

  report(title: string, type: RiskType, level: RiskLevel, location: string, description: string, deadline: string, handler: string, reporter: string): void {
    let risk: RiskItem = new RiskItem()
    risk.title = title
    risk.type = type
    risk.level = level
    risk.location = location
    risk.description = description
    risk.deadline = deadline
    risk.handler = handler
    risk.reporter = reporter
    this.services.riskRepo.add(risk)
  }

  assign(id: string, handler: string): void {
    this.services.riskRepo.assign(id, handler)
  }

  submitFix(id: string, note: string): void {
    this.services.riskRepo.submitFix(id, note)
  }

  reviewPass(id: string, note: string): void {
    this.services.riskRepo.reviewPass(id, note)
  }

  reviewReject(id: string, note: string): void {
    this.services.riskRepo.reviewReject(id, note)
  }

  remind(id: string): void {
    this.services.riskRepo.remind(id)
  }
}
