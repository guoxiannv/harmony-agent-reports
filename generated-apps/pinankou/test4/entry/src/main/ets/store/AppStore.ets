// AppStore: central controller/state-machine for Pinankou.
// Owns repositories, exposes event methods + computed getters that mirror
// ui-behavior.json. UI wiring (reactive state) is added in the visual phase;
// this module is framework-decoupled and unit-checkable.

import { PersistenceService } from '../service/PersistenceService';
import {
  RecordRepository, RiskRepository, InspectionRepository, ContactRepository, RectificationRepository
} from '../service/Repositories';
import { IdGenerator } from '../service/IdGenerator';
import {
  SafetyRecord, RiskReport, InspectionRound, Contact, RectificationTask, InspectionStop,
  ChartPoint, RecordCategory, RectificationStatus,
  riskSeverityWeight, recordCategoryLabel
} from '../model/Models';

const DEFAULT_STOP_NAMES: string[] = ['入口区域', '生产区域', '仓储区域', '消防通道'];

export class Outcome {
  ok: boolean = false;
  message: string = '';

  constructor(ok: boolean, message: string) {
    this.ok = ok;
    this.message = message;
  }
}

export class Summary {
  openRisks: number = 0;
  pendingRectifications: number = 0;
  todayInspections: number = 0;
  completionRate: number = 0;
}

export class DashboardStats {
  totalRecords: number = 0;
  openRisks: number = 0;
  completedInspections: number = 0;
  completionRate: number = 0;
}

export class AppStore {
  records: RecordRepository = new RecordRepository();
  risks: RiskRepository = new RiskRepository();
  inspections: InspectionRepository = new InspectionRepository();
  contacts: ContactRepository = new ContactRepository();
  rectifications: RectificationRepository = new RectificationRepository();

  // Drafts (form state).
  recordDraft: SafetyRecord = new SafetyRecord();
  riskDraft: RiskReport = new RiskReport();
  contactDraft: Contact = new Contact();
  inspectionNotesDraft: string = '';

  // Update-progress sheet target.
  activeRectificationId: string = '';

  private static instance: AppStore | null = null;

  static get(): AppStore {
    if (AppStore.instance === null) {
      AppStore.instance = new AppStore();
    }
    return AppStore.instance;
  }

  async init(context: Context): Promise<void> {
    PersistenceService.init(context);
    await this.records.load();
    await this.risks.load();
    await this.inspections.load();
    await this.contacts.load();
    await this.rectifications.load();
  }

  // ---- Record events ----
  resetRecordDraft(): void {
    this.recordDraft = new SafetyRecord();
  }

  saveRecord(): Outcome {
    const r: SafetyRecord = this.recordDraft;
    if (r.title.trim().length === 0) {
      return new Outcome(false, '请填写记录标题');
    }
    const now: number = Date.now();
    r.id = IdGenerator.next('rec');
    r.createdAt = now;
    r.updatedAt = now;
    r.status = 'open';
    this.records.add(r);
    this.resetRecordDraft();
    return new Outcome(true, '记录已保存');
  }

  // ---- Risk report events ----
  resetRiskDraft(): void {
    this.riskDraft = new RiskReport();
  }

  submitRiskReport(): Outcome {
    const r: RiskReport = this.riskDraft;
    if (r.title.trim().length === 0) {
      return new Outcome(false, '请填写隐患标题');
    }
    if (r.description.trim().length === 0) {
      return new Outcome(false, '请填写隐患描述');
    }
    const now: number = Date.now();
    r.id = IdGenerator.next('risk');
    r.createdAt = now;
    r.status = 'open';

    // Auto-create linked rectification task.
    const task: RectificationTask = new RectificationTask();
    task.id = IdGenerator.next('rect');
    task.title = r.title;
    task.sourceRiskId = r.id;
    task.status = 'pending';
    task.progress = 0;
    task.dueDate = r.dueDate;
    task.assignee = r.assignee;
    task.createdAt = now;
    task.closedAt = 0;
    this.rectifications.add(task);
    r.linkedRectificationId = task.id;

    this.risks.add(r);
    this.resetRiskDraft();
    return new Outcome(true, '隐患已上报');
  }

  // ---- Inspection events ----
  startInspectionRound(routeName: string): InspectionRound {
    if (routeName.trim().length === 0) {
      return this.inspections.startRound('日常巡检', DEFAULT_STOP_NAMES);
    }
    return this.inspections.startRound(routeName, DEFAULT_STOP_NAMES);
  }

  checkinInspectionStop(notes: string): InspectionRound | null {
    const merged: string = notes.length > 0 ? notes : this.inspectionNotesDraft;
    return this.inspections.checkinNextStop(merged);
  }

  updateInspectionNotes(notes: string): void {
    this.inspectionNotesDraft = notes;
    this.inspections.updateNotes(notes);
  }

  finishInspectionRound(): InspectionRound | null {
    return this.inspections.finishRound();
  }

  // ---- Contact events ----
  resetContactDraft(): void {
    this.contactDraft = new Contact();
  }

  saveContact(): Outcome {
    const c: Contact = this.contactDraft;
    if (c.name.trim().length === 0) {
      return new Outcome(false, '请填写联系人姓名');
    }
    if (c.phone.trim().length === 0) {
      return new Outcome(false, '请填写联系电话');
    }
    if (c.id.length === 0) {
      c.id = IdGenerator.next('ct');
      this.contacts.add(c);
    } else {
      this.contacts.update(c);
    }
    this.resetContactDraft();
    return new Outcome(true, '联系人已保存');
  }

  // ---- Rectification events ----
  openUpdateProgress(taskId: string): RectificationTask | null {
    this.activeRectificationId = taskId;
    return this.rectifications.findById(taskId);
  }

  saveRectificationProgress(progress: number, status: RectificationStatus): Outcome {
    const task: RectificationTask | null = this.rectifications.findById(this.activeRectificationId);
    if (task === null) {
      return new Outcome(false, '未找到整改任务');
    }
    let clamped: number = progress;
    if (clamped < 0) {
      clamped = 0;
    }
    if (clamped > 100) {
      clamped = 100;
    }
    task.progress = clamped;
    task.status = status;
    if (status === 'verified' || status === 'closed') {
      task.closedAt = Date.now();
      // Close linked risk report when rectification is verified.
      if (task.sourceRiskId.length > 0) {
        this.closeLinkedRisk(task.sourceRiskId);
      }
    }
    this.rectifications.update(task);
    this.activeRectificationId = '';
    return new Outcome(true, '进度已更新');
  }

  private closeLinkedRisk(riskId: string): void {
    const list: RiskReport[] = this.risks.all();
    for (const r of list) {
      if (r.id === riskId && r.status !== 'closed') {
        r.status = 'closed';
        this.risks.update(r);
        break;
      }
    }
  }

  // ---- Computed: summary ----
  summary(): Summary {
    const s: Summary = new Summary();
    s.openRisks = this.risks.openCount();
    s.pendingRectifications = this.rectifications.openCount();
    s.todayInspections = this.inspections.countToday();
    s.completionRate = this.rectifications.completionRate();
    return s;
  }

  // ---- Computed: dashboard ----
  dashboardStats(): DashboardStats {
    const d: DashboardStats = new DashboardStats();
    d.totalRecords = this.records.count();
    d.openRisks = this.risks.openCount();
    d.completedInspections = this.inspections.completedCount();
    d.completionRate = this.rectifications.completionRate();
    return d;
  }

  // Risk creation counts over the last `days` days (oldest first).
  riskTrend(days: number): ChartPoint[] {
    const now: number = Date.now();
    const dayMs: number = 86400000;
    const buckets: number[] = [];
    const labels: string[] = [];
    for (let i = days - 1; i >= 0; i--) {
      buckets.push(0);
      const d: Date = new Date(now - i * dayMs);
      labels.push(`${d.getMonth() + 1}/${d.getDate()}`);
    }
    const startWindow: number = now - days * dayMs;
    const list: RiskReport[] = this.risks.all();
    for (const r of list) {
      if (r.createdAt < startWindow) {
        continue;
      }
      const ageDays: number = Math.floor((now - r.createdAt) / dayMs);
      const idx: number = days - 1 - ageDays;
      if (idx >= 0 && idx < days) {
        buckets[idx] += 1;
      }
    }
    const out: ChartPoint[] = [];
    for (let i = 0; i < days; i++) {
      out.push(new ChartPoint(labels[i], buckets[i]));
    }
    return out;
  }

  // Record counts grouped by category.
  categoryDistribution(): ChartPoint[] {
    const categories: RecordCategory[] = ['fire', 'electrical', 'mechanical', 'environment', 'personnel', 'other'];
    const counts: number[] = [];
    for (let i = 0; i < categories.length; i++) {
      counts.push(0);
    }
    const list: SafetyRecord[] = this.records.all();
    for (const r of list) {
      const idx: number = categories.indexOf(r.category);
      if (idx >= 0) {
        counts[idx] += 1;
      }
    }
    const out: ChartPoint[] = [];
    for (let i = 0; i < categories.length; i++) {
      if (counts[i] > 0) {
        out.push(new ChartPoint(recordCategoryLabel(categories[i]), counts[i]));
      }
    }
    return out;
  }

  topRisks(limit: number): RiskReport[] {
    const list: RiskReport[] = this.risks.all().slice().sort((a: RiskReport, b: RiskReport): number => {
      const w: number = riskSeverityWeight(b.severity) - riskSeverityWeight(a.severity);
      if (w !== 0) {
        return w;
      }
      return b.createdAt - a.createdAt;
    });
    const out: RiskReport[] = [];
    const n: number = Math.min(limit, list.length);
    for (let i = 0; i < n; i++) {
      out.push(list[i]);
    }
    return out;
  }

  urgentRectifications(limit: number): RectificationTask[] {
    return this.rectifications.urgent(limit);
  }

  recentRecords(limit: number): SafetyRecord[] {
    return this.records.recent(limit);
  }

  // Convenience for inspection progress display.
  checkedInStopCount(round: InspectionRound): number {
    let n: number = 0;
    for (const s of round.stops) {
      if (s.checkedInAt > 0) {
        n += 1;
      }
    }
    return n;
  }

  nextUncheckedStop(round: InspectionRound): InspectionStop | null {
    for (const s of round.stops) {
      if (s.checkedInAt === 0) {
        return s;
      }
    }
    return null;
  }
}
