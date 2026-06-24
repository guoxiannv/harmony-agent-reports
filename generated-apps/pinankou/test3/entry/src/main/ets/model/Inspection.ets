export enum InspectionStatus {
  PENDING = 'pending',
  IN_PROGRESS = 'in_progress',
  COMPLETED = 'completed',
  ABNORMAL = 'abnormal'
}

export enum CheckResult {
  NORMAL = 'normal',
  ABNORMAL = 'abnormal'
}

export interface InspectionCheckItemInit {
  id?: string;
  text?: string;
  result?: CheckResult | null;
  remark?: string;
}

export class InspectionCheckItem {
  id: string = '';
  text: string = '';
  result: CheckResult | null = null;
  remark: string = '';

  constructor(init: InspectionCheckItemInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.text !== undefined) this.text = init.text;
    if (init.result !== undefined) this.result = init.result;
    if (init.remark !== undefined) this.remark = init.remark;
  }
}

export interface InspectionInit {
  id?: string;
  title?: string;
  location?: string;
  date?: number;
  status?: InspectionStatus;
  checklist?: InspectionCheckItem[];
  createdAt?: number;
  updatedAt?: number;
}

export class Inspection {
  id: string = '';
  title: string = '';
  location: string = '';
  date: number = Date.now();
  status: InspectionStatus = InspectionStatus.PENDING;
  checklist: InspectionCheckItem[] = [];
  createdAt: number = Date.now();
  updatedAt: number = Date.now();

  constructor(init: InspectionInit = {}) {
    if (init.id !== undefined) this.id = init.id;
    if (init.title !== undefined) this.title = init.title;
    if (init.location !== undefined) this.location = init.location;
    if (init.date !== undefined) this.date = init.date;
    if (init.status !== undefined) this.status = init.status;
    if (init.checklist !== undefined) this.checklist = init.checklist;
    if (init.createdAt !== undefined) this.createdAt = init.createdAt;
    if (init.updatedAt !== undefined) this.updatedAt = init.updatedAt;
  }

  static from(other: Inspection): Inspection {
    const i = new Inspection();
    i.id = other.id;
    i.title = other.title;
    i.location = other.location;
    i.date = other.date;
    i.status = other.status;
    i.checklist = other.checklist.map(c => new InspectionCheckItem({ id: c.id, text: c.text, result: c.result, remark: c.remark }));
    i.createdAt = other.createdAt;
    i.updatedAt = other.updatedAt;
    return i;
  }
}
