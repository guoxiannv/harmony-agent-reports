export class ChartPoint {
  dateLabel: string = ''
  value: number = 0
}

export class ChartInsight {
  summary: string = ''
  changePercent: number | null = null
  trend: 'up' | 'down' | 'flat' = 'flat'
}

export type ChartMetric = 'weight' | 'food' | 'waste' | 'medicine'

export type ChartPeriod = 'week' | 'month'
