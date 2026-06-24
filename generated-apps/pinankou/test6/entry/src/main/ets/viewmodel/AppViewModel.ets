// AppViewModel.ets
//
// Application controller / view-model for 平安扣 Pinankou. Exposes the event
// methods named in ui-behavior.json and routes them to DataStore / StatsService
// / PhoneService. List-page filter state and the stats period are held in
// AppStorage so pages can @StorageLink them directly once visual integration
// arrives. This file is UI-free.

import { DataStore } from '../services/DataStore';
import { StatsService } from '../services/StatsService';
import { PhoneService } from '../services/PhoneService';
import {
  SafetyMatter,
  RiskReport,
  EmergencyContact,
  RectificationTask,
  PatrolTask,
  Checkpoint,
  DashboardSummary,
  DashboardStats,
  UrgentItem,
} from '../model/Models';
import {
  MatterFormPayload,
  RiskFormPayload,
  ContactFormPayload,
  SaveResult,
} from '../model/Forms';
import {
  MatterStatus,
  RiskStatus,
  StatsPeriod,
} from '../model/Enums';
import { genId, nowMs } from '../model/IdUtil';

const DEFAULT_DEADLINE_MS: number = 3 * 86400000;

export class AppViewModel {
  private static instance: AppViewModel | null = null;
  private readonly store: DataStore = DataStore.getInstance();

  static getInstance(): AppViewModel {
    if (AppViewModel.instance === null) {
      AppViewModel.instance = new AppViewModel();
    }
    return AppViewModel.instance;
  }

  private constructor() {
    AppStorage.setOrCreate<string>('matterFilterStatus', 'all');
    AppStorage.setOrCreate<string>('matterSearchQuery', '');
    AppStorage.setOrCreate<string>('riskFilterSeverity', 'all');
    AppStorage.setOrCreate<string>('riskFilterStatus', 'all');
    AppStorage.setOrCreate<string>('rectificationFilterStatus', 'all');
    AppStorage.setOrCreate<StatsPeriod>('statsPeriod', '7d');
  }

  // ---------- Matters ----------
  filteredMatters(): SafetyMatter[] {
    const status: string = AppStorage.get<string>('matterFilterStatus') ?? 'all';
    const query: string = (AppStorage.get<string>('matterSearchQuery') ?? '').trim();
    const all = this.store.getMatters();
    const out: SafetyMatter[] = [];
    for (let i = 0; i < all.length; i++) {
      const m = all[i];
      if (status !== 'all' && m.status !== status) {
        continue;
      }
      if (query.length > 0 && m.title.indexOf(query) < 0 && m.description.indexOf(query) < 0) {
        continue;
      }
      out.push(m);
    }
    return out;
  }

  setMatterFilterStatus(status: string): void {
    AppStorage.set<string>('matterFilterStatus', status);
  }

  setMatterSearchQuery(query: string): void {
    AppStorage.set<string>('matterSearchQuery', query);
  }

  saveMatter(payload: MatterFormPayload): SaveResult {
    const title: string = payload.title.trim();
    if (title.length === 0) {
      return { ok: false, error: '请填写事项标题', id: '' };
    }
    const now: number = nowMs();
    let id: string = payload.id;
    let createdAt: number = now;
    const existing: SafetyMatter | null = id.length > 0 ? this.store.getMatterById(id) : null;
    if (existing !== null) {
      createdAt = existing.createdAt;
    } else {
      id = genId('matter');
    }
    const matter: SafetyMatter = this.store.buildMatter(
      id,
      title,
      payload.category,
      payload.priority,
      payload.description.trim(),
      payload.status,
      createdAt,
    );
    this.store.upsertMatter(matter);
    return { ok: true, error: '', id: id };
  }

  toggleMatterStatus(id: string): void {
    const m: SafetyMatter | null = this.store.getMatterById(id);
    if (m === null) {
      return;
    }
    const nextStatus: MatterStatus = m.status === 'open' ? 'closed' : 'open';
    const matter: SafetyMatter = this.store.buildMatter(
      m.id,
      m.title,
      m.category,
      m.priority,
      m.description,
      nextStatus,
      m.createdAt,
    );
    this.store.upsertMatter(matter);
  }

  deleteMatter(id: string): void {
    this.store.deleteMatter(id);
  }

  // ---------- Risks ----------
  filteredRisks(): RiskReport[] {
    const severity: string = AppStorage.get<string>('riskFilterSeverity') ?? 'all';
    const status: string = AppStorage.get<string>('riskFilterStatus') ?? 'all';
    const all = this.store.getRisks();
    const out: RiskReport[] = [];
    for (let i = 0; i < all.length; i++) {
      const r = all[i];
      if (severity !== 'all' && r.severity !== severity) {
        continue;
      }
      if (status !== 'all' && r.status !== status) {
        continue;
      }
      out.push(r);
    }
    return out;
  }

  setRiskFilterSeverity(severity: string): void {
    AppStorage.set<string>('riskFilterSeverity', severity);
  }

  setRiskFilterStatus(status: string): void {
    AppStorage.set<string>('riskFilterStatus', status);
  }

  saveRisk(payload: RiskFormPayload): SaveResult {
    const title: string = payload.title.trim();
    if (title.length === 0) {
      return { ok: false, error: '请填写隐患标题', id: '' };
    }
    const now: number = nowMs();
    let id: string = payload.id;
    let reportedAt: number = now;
    let status: RiskStatus = payload.status;
    const existing: RiskReport | null = id.length > 0 ? this.store.getRiskById(id) : null;
    if (existing !== null) {
      reportedAt = existing.reportedAt;
    } else {
      id = genId('risk');
      status = 'reported';
    }
    const risk: RiskReport = this.store.buildRisk(
      id,
      title,
      payload.severity,
      payload.location.trim(),
      payload.description.trim(),
      status,
      payload.mediaUri,
      payload.relatedMatterId,
      reportedAt,
    );
    this.store.upsertRisk(risk);
    return { ok: true, error: '', id: id };
  }

  deleteRisk(id: string): void {
    this.store.deleteRisk(id);
  }

  // ---------- Contacts ----------
  contacts(): EmergencyContact[] {
    return this.store.getContacts();
  }

  saveContact(payload: ContactFormPayload): SaveResult {
    const name: string = payload.name.trim();
    const phone: string = payload.phone.trim();
    if (name.length === 0) {
      return { ok: false, error: '请填写联系人姓名', id: '' };
    }
    if (phone.length === 0) {
      return { ok: false, error: '请填写联系电话', id: '' };
    }
    const now: number = nowMs();
    let id: string = payload.id;
    let createdAt: number = now;
    const existing: EmergencyContact | null = id.length > 0 ? this.store.getContactById(id) : null;
    if (existing !== null) {
      createdAt = existing.createdAt;
    } else {
      id = genId('contact');
    }
    const contact: EmergencyContact = this.store.buildContact(
      id,
      name,
      payload.role.trim(),
      phone,
      payload.isPriority,
      createdAt,
    );
    this.store.upsertContact(contact);
    return { ok: true, error: '', id: id };
  }

  deleteContact(id: string): void {
    this.store.deleteContact(id);
  }

  async callContact(id: string): Promise<boolean> {
    const c: EmergencyContact | null = this.store.getContactById(id);
    if (c === null) {
      return false;
    }
    return await PhoneService.dial(c.phone);
  }

  // ---------- Patrol ----------
  todayPatrol(): PatrolTask | null {
    return this.store.getTodayPatrol();
  }

  patrolCheckpoints(): Checkpoint[] {
    const p: PatrolTask | null = this.store.getTodayPatrol();
    if (p === null) {
      return [];
    }
    return p.checkpoints;
  }

  startPatrol(): void {
    this.store.startPatrol();
  }

  clockCheckpoint(checkpointId: string, note: string): void {
    this.store.clockCheckpoint(checkpointId, note);
  }

  completePatrol(): boolean {
    return this.store.completePatrol();
  }

  // ---------- Rectification ----------
  filteredRectifications(): RectificationTask[] {
    const status: string = AppStorage.get<string>('rectificationFilterStatus') ?? 'all';
    const all = this.store.getRectifications();
    const out: RectificationTask[] = [];
    for (let i = 0; i < all.length; i++) {
      const t = all[i];
      const eff: string = this.store.effectiveRectificationStatus(t);
      if (status !== 'all' && eff !== status) {
        continue;
      }
      out.push(t);
    }
    return out;
  }

  setRectificationFilterStatus(status: string): void {
    AppStorage.set<string>('rectificationFilterStatus', status);
  }

  overdueRectificationCount(): number {
    const all = this.store.getRectifications();
    let count: number = 0;
    for (let i = 0; i < all.length; i++) {
      if (this.store.effectiveRectificationStatus(all[i]) === 'overdue') {
        count = count + 1;
      }
    }
    return count;
  }

  advanceRectification(id: string, note: string): RectificationTask | null {
    return this.store.advanceRectification(id, note);
  }

  createRectificationForRiskId(riskId: string, assignee: string, deadlineMs: number): SaveResult {
    const risk: RiskReport | null = this.store.getRiskById(riskId);
    if (risk === null) {
      return { ok: false, error: '风险隐患不存在', id: '' };
    }
    const dl: number = deadlineMs > 0 ? deadlineMs : nowMs() + DEFAULT_DEADLINE_MS;
    const task: RectificationTask = this.store.createRectificationForRisk(risk, assignee.trim(), dl);
    return { ok: true, error: '', id: task.id };
  }

  deleteRectification(id: string): void {
    this.store.deleteRectification(id);
  }

  // ---------- Dashboard / stats ----------
  summary(): DashboardSummary {
    return StatsService.summary();
  }

  patrolProgress(): number {
    return StatsService.patrolProgress();
  }

  urgentItems(limit: number): UrgentItem[] {
    return StatsService.urgentItems(limit);
  }

  stats(): DashboardStats {
    const period: StatsPeriod = AppStorage.get<StatsPeriod>('statsPeriod') ?? '7d';
    return StatsService.stats(period);
  }

  setStatsPeriod(period: StatsPeriod): void {
    AppStorage.set<StatsPeriod>('statsPeriod', period);
  }
}
