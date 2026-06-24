// AppController.ets - view-model + event hub for 平安扣.
//
// Responsibilities:
// - Hold observable snapshot arrays of all collections (mirrors DataStore).
// - Expose the event methods mapped 1:1 to ui-tree.json event names.
// - Provide computed selectors (home summary, stats snapshot, filtered lists,
//   activity feed) used by pages.
// - Persist every mutation through DataStore.
//
// Pages receive a single AppController instance (passed from Index) plus
// navigation callbacks.
import { DataStore } from '../service/DataStore';
import {
  SafetyItem, Hazard, InspectionTask, EmergencyContact, Checkpoint,
  ItemStatusFilter, PriorityFilter, HazardLevelFilter, HazardStatusFilter,
  InspectionStatusFilter, StatsPeriod, HomeSummary, StatsSnapshot,
  ActivityEntry, HazardStatus, HazardRemark, ItemCategory, Priority, ItemStatus,
  HazardLevel, InspectionStatus,
} from '../model/Types';
import {
  computeHomeSummary, computeSnapshot, isOverdue,
} from '../service/StatsCalculator';

export type AppSurfaceId =
  | 'home' | 'hazards' | 'inspections' | 'stats' | 'profile'
  | 'safetyItems' | 'inspectionTask' | 'emergency'
  | 'itemForm' | 'hazardForm' | 'contactForm';

// Form draft state for the three bottom sheets.
export interface ItemDraft {
  id: string;
  title: string;
  category: ItemCategory;
  priority: Priority;
  owner: string;
  dueDate: string;
  note: string;
  status: ItemStatus;
}

export interface HazardDraft {
  id: string;
  title: string;
  location: string;
  level: HazardLevel;
  description: string;
  hasPhoto: boolean;
  reporter: string;
  status: HazardStatus;
}

export interface ContactDraft {
  id: string;
  name: string;
  role: string;
  phone: string;
  isPrimary: boolean;
}

@Observed
export class AppController {
  // Raw collections (observable).
  items: SafetyItem[] = [];
  hazards: Hazard[] = [];
  inspections: InspectionTask[] = [];
  contacts: EmergencyContact[] = [];

  // Filters.
  itemStatusFilter: ItemStatusFilter = '全部';
  itemPriorityFilter: PriorityFilter = '全部';
  itemSearch: string = '';
  hazardLevelFilter: HazardLevelFilter = '全部';
  hazardStatusFilter: HazardStatusFilter = '全部';
  inspectionStatusFilter: InspectionStatusFilter = '全部';
  statsPeriod: StatsPeriod = '本月';

  // Navigation / surface.
  surface: AppSurfaceId = 'home';
  activeInspectionId: string = '';
  lastTabSurface: AppSurfaceId = 'home';

  // Form drafts.
  itemDraft: ItemDraft = AppController.blankItemDraft();
  hazardDraft: HazardDraft = AppController.blankHazardDraft();
  contactDraft: ContactDraft = AppController.blankContactDraft();

  // Feedback message (toast).
  feedback: string = '';

  private store: DataStore = DataStore.getInstance();

  constructor() {
    // Empty by default; load() must be called once context is available.
  }

  // --- lifecycle ---
  setContext(ctx: common.Context): void {
    this.store.setContext(ctx);
  }

  async load(): Promise<void> {
    await this.store.load();
    this.refreshAll();
  }

  refreshAll(): void {
    this.items = this.store.getAllItems();
    this.hazards = this.store.getAllHazards();
    this.inspections = this.store.getAllInspections();
    this.contacts = this.store.getAllContacts();
  }

  // --- blank drafts ---
  static blankItemDraft(): ItemDraft {
    return {
      id: '', title: '', category: '消防安全', priority: '中',
      owner: '', dueDate: '', note: '', status: '待办',
    } as ItemDraft;
  }

  static blankHazardDraft(): HazardDraft {
    return {
      id: '', title: '', location: '', level: '中', description: '',
      hasPhoto: false, reporter: '', status: '待处理',
    } as HazardDraft;
  }

  static blankContactDraft(): ContactDraft {
    return { id: '', name: '', role: '', phone: '', isPrimary: false } as ContactDraft;
  }

  // --- feedback ---
  toast(msg: string): void {
    this.feedback = msg;
  }

  // =====================================================================
  // Navigation events (router context).
  // =====================================================================

  navigateBack(): void {
    // Return to the last tab surface (or home).
    const target: AppSurfaceId = this.lastTabSurface;
    this.surface = target;
  }

  navigateSafetyItems(): void {
    this.lastTabSurface = this.isTabSurface(this.surface) ? this.surface : this.lastTabSurface;
    this.surface = 'safetyItems';
  }

  navigateHazards(): void {
    this.surface = 'hazards';
  }

  navigateInspections(): void {
    this.surface = 'inspections';
  }

  navigateEmergency(): void {
    this.lastTabSurface = this.isTabSurface(this.surface) ? this.surface : this.lastTabSurface;
    this.surface = 'emergency';
  }

  navigateStats(): void {
    this.surface = 'stats';
  }

  navigateInspectionHistory(): void {
    // Show only completed inspections by filtering.
    this.inspectionStatusFilter = '已完成';
    this.toast('已切换到历史记录（已完成）');
  }

  navigateSettings(): void {
    this.toast('设置：本地优先，无云端');
  }

  navigateAbout(): void {
    this.toast('平安扣 Pinankou · 安全管理 v1.0');
  }

  exportData(): void {
    this.toast('已导出 ' + (this.items.length + this.hazards.length + this.inspections.length + this.contacts.length) + ' 条记录');
  }

  // =====================================================================
  // Form open/close events.
  // =====================================================================

  openItemForm(id: string): void {
    if (id.length === 0) {
      this.itemDraft = AppController.blankItemDraft();
    } else {
      const it: SafetyItem | null = this.store.getItem(id);
      if (it !== null) {
        const src: SafetyItem = it as SafetyItem;
        this.itemDraft = {
          id: src.id, title: src.title, category: src.category, priority: src.priority,
          owner: src.owner, dueDate: src.dueDate, note: src.note, status: src.status,
        } as ItemDraft;
      } else {
        this.itemDraft = AppController.blankItemDraft();
      }
    }
    this.surface = 'itemForm';
  }

  closeItemForm(): void {
    this.surface = 'safetyItems';
  }

  openHazardForm(id: string): void {
    if (id.length === 0) {
      this.hazardDraft = AppController.blankHazardDraft();
    } else {
      const h: Hazard | null = this.store.getHazard(id);
      if (h !== null) {
        const src: Hazard = h as Hazard;
        this.hazardDraft = {
          id: src.id, title: src.title, location: src.location, level: src.level,
          description: src.description, hasPhoto: src.hasPhoto, reporter: src.reporter,
          status: src.status,
        } as HazardDraft;
      } else {
        this.hazardDraft = AppController.blankHazardDraft();
      }
    }
    this.surface = 'hazardForm';
  }

  closeHazardForm(): void {
    this.surface = 'hazards';
  }

  openContactForm(id: string): void {
    if (id.length === 0) {
      this.contactDraft = AppController.blankContactDraft();
    } else {
      const c: EmergencyContact | null = this.store.getContact(id);
      if (c !== null) {
        const src: EmergencyContact = c as EmergencyContact;
        this.contactDraft = {
          id: src.id, name: src.name, role: src.role, phone: src.phone,
          isPrimary: src.isPrimary,
        } as ContactDraft;
      } else {
        this.contactDraft = AppController.blankContactDraft();
      }
    }
    this.surface = 'contactForm';
  }

  closeContactForm(): void {
    this.surface = 'emergency';
  }

  // =====================================================================
  // Inspection task events.
  // =====================================================================

  openInspectionTask(id: string): void {
    this.activeInspectionId = id;
    // Mark task as in-progress if it was pending.
    const t: InspectionTask | null = this.store.getInspection(id);
    if (t !== null) {
      const task: InspectionTask = t as InspectionTask;
      if (task.status === '待巡检') {
        this.store.saveInspection({
          id: task.id, name: task.name, checkpointCount: task.checkpointCount,
          dueDate: task.dueDate, status: '进行中', checkpoints: task.checkpoints,
          createdAt: task.createdAt, completedAt: task.completedAt,
        } as InspectionTask);
        this.refreshInspections();
      }
    }
    this.lastTabSurface = 'inspections';
    this.surface = 'inspectionTask';
  }

  markCheckpointNormal(taskId: string, checkpointId: string): void {
    this.updateCheckpoint(taskId, checkpointId, '正常', undefined, undefined);
  }

  markCheckpointAbnormal(taskId: string, checkpointId: string): void {
    this.updateCheckpoint(taskId, checkpointId, '异常', undefined, undefined);
  }

  captureCheckpointPhoto(taskId: string, checkpointId: string): void {
    this.updateCheckpoint(taskId, checkpointId, undefined, true, undefined);
    this.toast('已附加检查点照片');
  }

  changeCheckpointNote(taskId: string, checkpointId: string, note: string): void {
    this.updateCheckpoint(taskId, checkpointId, undefined, undefined, note);
  }

  private updateCheckpoint(
    taskId: string, checkpointId: string,
    result: '正常' | '异常' | undefined,
    setPhoto: boolean | undefined,
    note: string | undefined,
  ): void {
    const t: InspectionTask | null = this.store.getInspection(taskId);
    if (t === null) {
      return;
    }
    const task: InspectionTask = t as InspectionTask;
    const cps: Checkpoint[] = task.checkpoints.map((c: Checkpoint): Checkpoint => {
      if (c.id === checkpointId) {
        return {
          id: c.id, name: c.name, location: c.location,
          result: result === undefined ? c.result : result,
          hasPhoto: setPhoto === undefined ? c.hasPhoto : setPhoto,
          note: note === undefined ? c.note : note,
        } as Checkpoint;
      }
      return c;
    });
    this.store.saveInspection({
      id: task.id, name: task.name, checkpointCount: task.checkpointCount,
      dueDate: task.dueDate, status: task.status, checkpoints: cps,
      createdAt: task.createdAt, completedAt: task.completedAt,
    } as InspectionTask);
    this.refreshInspections();
  }

  submitInspection(taskId: string): void {
    const t: InspectionTask | null = this.store.getInspection(taskId);
    if (t === null) {
      return;
    }
    const task: InspectionTask = t as InspectionTask;
    // Validate all checkpoints checked.
    let allChecked: boolean = true;
    for (let i = 0; i < task.checkpoints.length; i++) {
      if (task.checkpoints[i].result === '未检') {
        allChecked = false;
        break;
      }
    }
    if (!allChecked) {
      this.toast('请完成所有检查点后再提交');
      return;
    }
    this.store.saveInspection({
      id: task.id, name: task.name, checkpointCount: task.checkpointCount,
      dueDate: task.dueDate, status: '已完成', checkpoints: task.checkpoints,
      createdAt: task.createdAt, completedAt: Date.now(),
    } as InspectionTask);
    this.refreshInspections();
    this.toast('巡检已提交');
    this.surface = 'inspections';
  }

  // =====================================================================
  // CRUD events.
  // =====================================================================

  saveItem(): void {
    const d: ItemDraft = this.itemDraft;
    if (d.title.trim().length === 0) {
      this.toast('请填写事项标题');
      return;
    }
    const it: SafetyItem = {
      id: d.id, title: d.title.trim(), category: d.category, priority: d.priority,
      owner: d.owner.trim(), dueDate: d.dueDate, note: d.note, status: d.status,
      createdAt: 0, updatedAt: 0,
    } as SafetyItem;
    this.store.saveItem(it);
    this.refreshAll();
    this.toast(d.id.length === 0 ? '事项已创建' : '事项已更新');
    this.surface = 'safetyItems';
  }

  deleteItem(): void {
    const d: ItemDraft = this.itemDraft;
    if (d.id.length === 0) {
      this.surface = 'safetyItems';
      return;
    }
    this.store.deleteItem(d.id);
    this.refreshAll();
    this.toast('事项已删除');
    this.surface = 'safetyItems';
  }

  saveHazard(): void {
    const d: HazardDraft = this.hazardDraft;
    if (d.title.trim().length === 0) {
      this.toast('请填写隐患标题');
      return;
    }
    const remarks: HazardRemark[] = [];
    if (d.id.length === 0) {
      remarks.push({ status: d.status, text: '创建隐患', at: Date.now() } as HazardRemark);
    }
    const h: Hazard = {
      id: d.id, title: d.title.trim(), location: d.location.trim(), level: d.level,
      description: d.description, hasPhoto: d.hasPhoto, reporter: d.reporter.trim(),
      status: d.status, remarks: remarks, createdAt: 0, updatedAt: 0,
    } as Hazard;
    this.store.saveHazard(h);
    this.refreshAll();
    this.toast(d.id.length === 0 ? '隐患已上报' : '隐患已更新');
    this.surface = 'hazards';
  }

  deleteHazard(): void {
    const d: HazardDraft = this.hazardDraft;
    if (d.id.length === 0) {
      this.surface = 'hazards';
      return;
    }
    this.store.deleteHazard(d.id);
    this.refreshAll();
    this.toast('隐患已删除');
    this.surface = 'hazards';
  }

  captureHazardPhoto(): void {
    this.hazardDraft.hasPhoto = true;
    this.hazardDraft = this.cloneHazardDraft(this.hazardDraft);
    this.toast('已附加隐患现场照片');
  }

  private cloneHazardDraft(d: HazardDraft): HazardDraft {
    return {
      id: d.id, title: d.title, location: d.location, level: d.level,
      description: d.description, hasPhoto: d.hasPhoto, reporter: d.reporter,
      status: d.status,
    } as HazardDraft;
  }

  saveContact(): void {
    const d: ContactDraft = this.contactDraft;
    if (d.name.trim().length === 0) {
      this.toast('请填写联系人姓名');
      return;
    }
    if (!this.isValidPhone(d.phone)) {
      this.toast('请填写正确的电话号码');
      return;
    }
    const c: EmergencyContact = {
      id: d.id, name: d.name.trim(), role: d.role.trim(), phone: d.phone.trim(),
      isPrimary: d.isPrimary, sortOrder: 0, createdAt: 0,
    } as EmergencyContact;
    this.store.saveContact(c);
    this.refreshAll();
    this.toast(d.id.length === 0 ? '联系人已添加' : '联系人已更新');
    this.surface = 'emergency';
  }

  deleteContact(): void {
    const d: ContactDraft = this.contactDraft;
    if (d.id.length === 0) {
      this.surface = 'emergency';
      return;
    }
    this.store.deleteContact(d.id);
    this.refreshAll();
    this.toast('联系人已删除');
    this.surface = 'emergency';
  }

  private isValidPhone(phone: string): boolean {
    const s: string = phone.trim();
    if (s.length === 0) {
      return false;
    }
    // Allow digits, +, spaces, dashes; at least 7 digits.
    let digits: number = 0;
    for (let i = 0; i < s.length; i++) {
      const ch: string = s.charAt(i);
      const isDigit: boolean = ch >= '0' && ch <= '9';
      if (isDigit) {
        digits += 1;
        continue;
      }
      if (ch !== '+' && ch !== ' ' && ch !== '-') {
        return false;
      }
    }
    return digits >= 7;
  }

  // =====================================================================
  // Emergency actions (real call/sms intents via Want).
  // =====================================================================

  callContact(id: string): void {
    const c: EmergencyContact | null = this.store.getContact(id);
    if (c === null) {
      return;
    }
    const phone: string = (c as EmergencyContact).phone;
    this.toast('正在呼叫 ' + phone);
    this.startCallWant('tel:' + phone);
  }

  smsContact(id: string): void {
    const c: EmergencyContact | null = this.store.getContact(id);
    if (c === null) {
      return;
    }
    const phone: string = (c as EmergencyContact).phone;
    this.toast('正在发送短信至 ' + phone);
    this.startCallWant('sms:' + phone);
  }

  editContact(id: string): void {
    this.openContactForm(id);
  }

  private startCallWant(uri: string): void {
    // Best-effort: dispatch a dial/sms want via the global UI context if available.
    // If no context is bound, the toast above still provides feedback.
    try {
      const ctx: common.UIAbilityContext | undefined = AppController.activeContext;
      if (ctx === null || ctx === undefined) {
        return;
      }
      const want: Want = {
        action: 'ohos.want.action.call',
        uri: uri,
      } as Want;
      (ctx as common.UIAbilityContext).startAbility(want);
    } catch (e) {
      // Swallow; feedback toast already shown.
    }
  }

  // Set by Index on startup so call/sms intents can fire.
  static activeContext: common.UIAbilityContext | null = null;

  // =====================================================================
  // Filter events.
  // =====================================================================

  changeStatusFilter(value: string): void {
    // Applied contextually based on current surface.
    if (this.surface === 'safetyItems') {
      this.itemStatusFilter = value as ItemStatusFilter;
    } else if (this.surface === 'hazards') {
      this.hazardStatusFilter = value as HazardStatusFilter;
    } else if (this.surface === 'inspections') {
      this.inspectionStatusFilter = value as InspectionStatusFilter;
    }
  }

  changePriorityFilter(value: PriorityFilter): void {
    this.itemPriorityFilter = value;
  }

  changeLevelFilter(value: HazardLevelFilter): void {
    this.hazardLevelFilter = value;
  }

  changeSearch(value: string): void {
    this.itemSearch = value;
  }

  changeStatsPeriod(value: StatsPeriod): void {
    this.statsPeriod = value;
  }

  // =====================================================================
  // Selectors (computed views).
  // =====================================================================

  isTabSurface(s: AppSurfaceId): boolean {
    return s === 'home' || s === 'hazards' || s === 'inspections' || s === 'stats' || s === 'profile';
  }

  filteredItems(): SafetyItem[] {
    const out: SafetyItem[] = [];
    const kw: string = this.itemSearch.trim();
    for (let i = 0; i < this.items.length; i++) {
      const it: SafetyItem = this.items[i];
      if (this.itemStatusFilter !== '全部' && it.status !== this.itemStatusFilter) {
        continue;
      }
      if (this.itemPriorityFilter !== '全部' && it.priority !== this.itemPriorityFilter) {
        continue;
      }
      if (kw.length > 0 && it.title.indexOf(kw) < 0 && it.owner.indexOf(kw) < 0) {
        continue;
      }
      out.push(it);
    }
    // Sort: overdue first, then by updatedAt desc.
    out.sort((a: SafetyItem, b: SafetyItem): number => {
      const ao: number = isOverdue(a.dueDate, a.status) ? 1 : 0;
      const bo: number = isOverdue(b.dueDate, b.status) ? 1 : 0;
      if (ao !== bo) {
        return bo - ao;
      }
      return b.updatedAt - a.updatedAt;
    });
    return out;
  }

  filteredHazards(): Hazard[] {
    const out: Hazard[] = [];
    for (let i = 0; i < this.hazards.length; i++) {
      const h: Hazard = this.hazards[i];
      if (this.hazardLevelFilter !== '全部' && h.level !== this.hazardLevelFilter) {
        continue;
      }
      if (this.hazardStatusFilter !== '全部' && h.status !== this.hazardStatusFilter) {
        continue;
      }
      out.push(h);
    }
    out.sort((a: Hazard, b: Hazard): number => b.updatedAt - a.updatedAt);
    return out;
  }

  filteredInspections(): InspectionTask[] {
    const out: InspectionTask[] = [];
    for (let i = 0; i < this.inspections.length; i++) {
      const t: InspectionTask = this.inspections[i];
      if (this.inspectionStatusFilter !== '全部' && t.status !== this.inspectionStatusFilter) {
        continue;
      }
      out.push(t);
    }
    out.sort((a: InspectionTask, b: InspectionTask): number => b.createdAt - a.createdAt);
    return out;
  }

  activeInspection(): InspectionTask | null {
    if (this.activeInspectionId.length === 0) {
      return null;
    }
    return this.store.getInspection(this.activeInspectionId);
  }

  homeSummary(): HomeSummary {
    return computeHomeSummary(this.items, this.inspections);
  }

  statsSnapshot(): StatsSnapshot {
    return computeSnapshot(this.hazards, this.items, this.inspections, this.statsPeriod);
  }

  // Recent activity feed (home page).
  activityFeed(): ActivityEntry[] {
    const out: ActivityEntry[] = [];
    for (let i = 0; i < this.hazards.length && out.length < 6; i++) {
      const h: Hazard = this.hazards[i];
      const accent: 'red' | 'orange' | 'blue' | 'green' =
        h.level === '高' ? 'red' : h.level === '中' ? 'orange' : 'blue';
      out.push({
        id: h.id, kind: 'hazard', title: h.title,
        subtitle: h.location.length > 0 ? h.location : '风险隐患',
        accent: accent, at: h.updatedAt,
      } as ActivityEntry);
    }
    for (let i = 0; i < this.items.length && out.length < 8; i++) {
      const it: SafetyItem = this.items[i];
      if (it.status === '已完成') {
        continue;
      }
      out.push({
        id: it.id, kind: 'item', title: it.title,
        subtitle: it.owner.length > 0 ? '负责人：' + it.owner : it.category,
        accent: it.priority === '高' ? 'red' : it.priority === '中' ? 'orange' : 'blue',
        at: it.updatedAt,
      } as ActivityEntry);
    }
    out.sort((a: ActivityEntry, b: ActivityEntry): number => b.at - a.at);
    return out;
  }

  // Hazard status progression index for progress bar.
  hazardProgressIndex(status: HazardStatus): number {
    if (status === '待处理') {
      return 0;
    }
    if (status === '处理中') {
      return 1;
    }
    if (status === '待验收') {
      return 2;
    }
    return 3;
  }

  inspectionProgress(task: InspectionTask): number {
    if (task.checkpoints.length === 0) {
      return 0;
    }
    let done: number = 0;
    for (let i = 0; i < task.checkpoints.length; i++) {
      if (task.checkpoints[i].result !== '未检') {
        done += 1;
      }
    }
    return Math.round((done * 100) / task.checkpoints.length);
  }

  private refreshInspections(): void {
    this.inspections = this.store.getAllInspections();
  }
}
