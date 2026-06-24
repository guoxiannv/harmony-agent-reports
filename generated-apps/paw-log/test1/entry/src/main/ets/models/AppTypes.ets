import { RecordType } from './Record'
import { ChartMetric, ChartPeriod } from './ChartModels'
import { TabId } from '../common/TabTypes'

export type { TabId }

export type AppSurface = 'home' | 'records' | 'charts' | 'profile' | 'pets' | 'pet-detail' | 'reminders' | 'medical' | 'family'

export type RecordTypeFilter = RecordType | 'all'

export class RecordFilter {
  petId: string | 'all' = 'all'
  type: RecordTypeFilter = 'all'
  dateRange: '7' | '30' | '90' | 'all' = 'all'
}

export class ChartSelection {
  metric: ChartMetric = 'weight'
  period: ChartPeriod = 'week'
  petId: string = ''
}
