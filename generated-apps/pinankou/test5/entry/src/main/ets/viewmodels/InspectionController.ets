import { AppServices } from '../services/AppServices';
import { InspectionTask, CheckItem } from '../models/Models';

export class InspectionController {
  private services: AppServices
  activeSegment: 'today' | 'pending' | 'history' = 'today'

  constructor(services: AppServices) {
    this.services = services
  }

  tasks(): InspectionTask[] {
    return this.services.inspectionRepo.listBySegment(this.activeSegment)
  }

  switchSegment(segment: 'today' | 'pending' | 'history'): void {
    this.activeSegment = segment
  }

  startTask(id: string): InspectionTask | undefined {
    this.services.inspectionRepo.start(id)
    return this.services.inspectionRepo.get(id)
  }

  getTask(id: string): InspectionTask | undefined {
    return this.services.inspectionRepo.get(id)
  }

  markCheckItem(taskId: string, checkItemId: string, result: 'pass' | 'fail'): void {
    this.services.inspectionRepo.markCheckItem(taskId, checkItemId, result)
  }

  setCheckItemNote(taskId: string, checkItemId: string, note: string): void {
    this.services.inspectionRepo.setCheckItemNote(taskId, checkItemId, note)
  }

  submitResult(taskId: string): boolean {
    let task: InspectionTask | undefined = this.getTask(taskId)
    if (!task) {
      return false
    }
    if (task.checkItems.some((it: CheckItem) => it.result === 'unchecked')) {
      return false
    }
    this.services.inspectionRepo.submitResult(taskId)
    return true
  }

  addTask(title: string, area: string, planDate: string, inspector: string, items: string[]): void {
    let task: InspectionTask = new InspectionTask()
    task.title = title
    task.area = area
    task.planDate = planDate
    task.inspector = inspector
    task.checkItems = items.map((label: string, index: number) => {
      let ci: CheckItem = new CheckItem()
      ci.id = `CI-${Date.now()}-${index}`
      ci.label = label
      return ci
    })
    this.services.inspectionRepo.add(task)
  }
}
