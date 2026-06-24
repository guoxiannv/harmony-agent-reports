import { StorageService } from '../services/StorageService';
import { Inspection, InspectionCheckItem, InspectionStatus, CheckResult } from '../model/Inspection';
import { Hazard, HazardStatus } from '../model/Hazard';

export class InspectionController {
  private storage = StorageService.getInstance();

  list(): Inspection[] {
    return this.storage.listInspections();
  }

  get(id: string): Inspection | undefined {
    return this.storage.getInspection(id);
  }

  createDraft(): Inspection {
    return new Inspection({
      title: '',
      location: '',
      date: Date.now(),
      status: InspectionStatus.PENDING,
      checklist: [
        new InspectionCheckItem({ text: '消防通道是否畅通' }),
        new InspectionCheckItem({ text: '灭火器是否有效' }),
        new InspectionCheckItem({ text: '用电线路是否规范' }),
        new InspectionCheckItem({ text: '安全标识是否清晰' })
      ]
    });
  }

  save(inspection: Inspection): Inspection {
    this.deriveStatus(inspection);
    return this.storage.saveInspection(inspection);
  }

  delete(id: string): void {
    this.storage.deleteInspection(id);
  }

  markCheckNormal(inspection: Inspection, itemId: string): void {
    this.updateCheckResult(inspection, itemId, CheckResult.NORMAL);
  }

  markCheckAbnormal(inspection: Inspection, itemId: string): void {
    this.updateCheckResult(inspection, itemId, CheckResult.ABNORMAL);
  }

  private updateCheckResult(inspection: Inspection, itemId: string, result: CheckResult): void {
    const item = inspection.checklist.find(ci => ci.id === itemId);
    if (item) {
      item.result = result;
      item.remark = '';
    }
  }

  private deriveStatus(inspection: Inspection): void {
    if (inspection.checklist.length === 0) {
      inspection.status = InspectionStatus.PENDING;
      return;
    }
    const abnormal = inspection.checklist.some(ci => ci.result === CheckResult.ABNORMAL);
    const allDone = inspection.checklist.every(ci => ci.result !== null);
    if (abnormal) {
      inspection.status = InspectionStatus.ABNORMAL;
    } else if (allDone) {
      inspection.status = InspectionStatus.COMPLETED;
    } else {
      inspection.status = InspectionStatus.IN_PROGRESS;
    }
  }

  convertToHazard(inspection: Inspection): Hazard {
    const hazard = new Hazard({
      title: `巡检异常: ${inspection.title || '未命名巡检'}`,
      location: inspection.location,
      status: HazardStatus.PENDING,
      description: inspection.checklist
        .filter(ci => ci.result === CheckResult.ABNORMAL)
        .map(ci => ci.text)
        .join('\n')
    });
    return this.storage.saveHazard(hazard);
  }
}
