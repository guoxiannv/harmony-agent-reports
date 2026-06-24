// DataStore.ets
//
// In-memory domain repository singleton for 平安扣 Pinankou. Loads typed arrays
// from Persistence on init, persists on every mutation, and signals change to
// the UI through AppStorage revision counters (matterRev / riskRev /
// patrolRev / contactRev / rectificationRev). UI pages will @StorageLink these
// counters to re-render on data change.

import { Persistence } from './Persistence';
import {
  SafetyMatter,
  RiskReport,
  PatrolTask,
  Checkpoint,
  EmergencyContact,
  RectificationTask,
  RectificationStep,
} from '../model/Models';
import {
  MatterCategory,
  MatterPriority,
  MatterStatus,
  RiskSeverity,
  RiskStatus,
  RectificationStatus,
  nextRectificationStatus,
} from '../model/Enums';
import { genId, nowMs, startOfToday } from '../model/IdUtil';

const KEY_MATTERS: string = 'matters';
const KEY_RISKS: string = 'risks';
const KEY_PATROL: string = 'patrol';
const KEY_CONTACTS: string = 'contacts';
const KEY_RECTIFICATIONS: string = 'rectifications';

const DEFAULT_CHECKPOINT_NAMES: string[] = [
  '门岗出入口',
  '消防通道',
  '配电间',
  '仓库货架区',
  '应急疏散点',
];

export class DataStore {
  private static instance: DataStore | null = null;

  static getInstance(): DataStore {
    if (DataStore.instance === null) {
      DataStore.instance = new DataStore();
    }
    return DataStore.instance;
  }

  private matters: SafetyMatter[] = [];
  private risks: RiskReport[] = [];
  private patrol: PatrolTask | null = null;
  private contacts: EmergencyContact[] = [];
  private rectifications: RectificationTask[] = [];

  private constructor() {
    // Seed AppStorage revision counters so UI can @StorageLink them safely.
    AppStorage.setOrCreate<number>('matterRev', 0);
    AppStorage.setOrCreate<number>('riskRev', 0);
    AppStorage.setOrCreate<number>('patrolRev', 0);
    AppStorage.setOrCreate<number>('contactRev', 0);
    AppStorage.setOrCreate<number>('rectificationRev', 0);
  }

  async init(): Promise<void> {
    await this.loadMatters();
    await this.loadRisks();
    await this.loadPatrol();
    await this.loadContacts();
    await this.loadRectifications();
    // Ensure there is always a today-task for the patrol page / dashboard.
    this.ensureTodayPatrol();
  }

  // ---------- Matters ----------
  getMatters(): SafetyMatter[] {
    return this.matters;
  }

  getMatterById(id: string): SafetyMatter | null {
    for (let i = 0; i < this.matters.length; i++) {
      if (this.matters[i].id === id) {
        return this.matters[i];
      }
    }
    return null;
  }

  upsertMatter(input: SafetyMatter): void {
    const idx: number = this.indexOfMatter(input.id);
    if (idx >= 0) {
      this.matters[idx] = input;
    } else {
      this.matters.unshift(input);
    }
    this.bump('matterRev');
    this.persistMatters();
  }

  deleteMatter(id: string): void {
    const next: SafetyMatter[] = [];
    for (let i = 0; i < this.matters.length; i++) {
      if (this.matters[i].id !== id) {
        next.push(this.matters[i]);
      }
    }
    this.matters = next;
    this.bump('matterRev');
    this.persistMatters();
  }

  // ---------- Risks ----------
  getRisks(): RiskReport[] {
    return this.risks;
  }

  getRiskById(id: string): RiskReport | null {
    for (let i = 0; i < this.risks.length; i++) {
      if (this.risks[i].id === id) {
        return this.risks[i];
      }
    }
    return null;
  }

  upsertRisk(input: RiskReport): void {
    const idx: number = this.indexOfRisk(input.id);
    if (idx >= 0) {
      this.risks[idx] = input;
    } else {
      this.risks.unshift(input);
    }
    this.bump('riskRev');
    this.persistRisks();
  }

  deleteRisk(id: string): void {
    const next: RiskReport[] = [];
    for (let i = 0; i < this.risks.length; i++) {
      if (this.risks[i].id !== id) {
        next.push(this.risks[i]);
      }
    }
    this.risks = next;
    this.bump('riskRev');
    this.persistRisks();
  }

  // ---------- Patrol ----------
  getTodayPatrol(): PatrolTask | null {
    return this.patrol;
  }

  ensureTodayPatrol(): void {
    const today: number = startOfToday(nowMs());
    if (this.patrol === null || this.patrol.scheduleDate !== today) {
      const checkpoints: Checkpoint[] = [];
      for (let i = 0; i < DEFAULT_CHECKPOINT_NAMES.length; i++) {
        checkpoints.push({
          checkpointId: 'cp_' + (i + 1),
          name: DEFAULT_CHECKPOINT_NAMES[i],
          clockedAt: 0,
          note: '',
        });
      }
      const task: PatrolTask = {
        id: genId('patrol'),
        name: '今日巡检',
        scheduleDate: today,
        status: 'pending',
        checkpoints: checkpoints,
      };
      this.patrol = task;
      this.bump('patrolRev');
      this.persistPatrol();
    }
  }

  startPatrol(): void {
    if (this.patrol === null) {
      this.ensureTodayPatrol();
    }
    if (this.patrol !== null && this.patrol.status === 'pending') {
      this.patrol.status = 'in-progress';
      this.bump('patrolRev');
      this.persistPatrol();
    }
  }

  clockCheckpoint(checkpointId: string, note: string): void {
    if (this.patrol === null) {
      return;
    }
    const cps: Checkpoint[] = this.patrol.checkpoints;
    for (let i = 0; i < cps.length; i++) {
      if (cps[i].checkpointId === checkpointId) {
        cps[i].clockedAt = nowMs();
        cps[i].note = note;
        break;
      }
    }
    this.bump('patrolRev');
    this.persistPatrol();
  }

  completePatrol(): boolean {
    if (this.patrol === null) {
      return false;
    }
    if (!this.allCheckpointsClocked(this.patrol)) {
      return false;
    }
    this.patrol.status = 'completed';
    this.bump('patrolRev');
    this.persistPatrol();
    return true;
  }

  allCheckpointsClocked(task: PatrolTask): boolean {
    const cps: Checkpoint[] = task.checkpoints;
    for (let i = 0; i < cps.length; i++) {
      if (cps[i].clockedAt === 0) {
        return false;
      }
    }
    return true;
  }

  // ---------- Contacts ----------
  getContacts(): EmergencyContact[] {
    return this.contacts;
  }

  getContactById(id: string): EmergencyContact | null {
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id === id) {
        return this.contacts[i];
      }
    }
    return null;
  }

  upsertContact(input: EmergencyContact): void {
    const idx: number = this.indexOfContact(input.id);
    if (idx >= 0) {
      this.contacts[idx] = input;
    } else {
      this.contacts.unshift(input);
    }
    this.sortContacts();
    this.bump('contactRev');
    this.persistContacts();
  }

  deleteContact(id: string): void {
    const next: EmergencyContact[] = [];
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id !== id) {
        next.push(this.contacts[i]);
      }
    }
    this.contacts = next;
    this.sortContacts();
    this.bump('contactRev');
    this.persistContacts();
  }

  // ---------- Rectification ----------
  getRectifications(): RectificationTask[] {
    return this.rectifications;
  }

  getRectificationById(id: string): RectificationTask | null {
    for (let i = 0; i < this.rectifications.length; i++) {
      if (this.rectifications[i].id === id) {
        return this.rectifications[i];
      }
    }
    return null;
  }

  // Effective status folds in the derived 'overdue' state without persisting it.
  effectiveRectificationStatus(task: RectificationTask): RectificationStatus {
    if (task.status === 'completed') {
      return 'completed';
    }
    if (task.deadline < nowMs()) {
      return 'overdue';
    }
    return task.status;
  }

  upsertRectification(input: RectificationTask): void {
    const idx: number = this.indexOfRectification(input.id);
    if (idx >= 0) {
      this.rectifications[idx] = input;
    } else {
      this.rectifications.unshift(input);
    }
    this.bump('rectificationRev');
    this.persistRectifications();
  }

  // Create a rectification task from a risk report.
  createRectificationForRisk(risk: RiskReport, assignee: string, deadlineMs: number): RectificationTask {
    const task: RectificationTask = {
      id: genId('rect'),
      riskId: risk.id,
      title: '整改：' + risk.title,
      assignee: assignee,
      deadline: deadlineMs,
      status: 'pending',
      steps: this.defaultSteps(),
      note: '',
      createdAt: nowMs(),
      completedAt: 0,
    };
    this.upsertRectification(task);
    return task;
  }

  advanceRectification(id: string, note: string): RectificationTask | null {
    const task: RectificationTask | null = this.getRectificationById(id);
    if (task === null) {
      return null;
    }
    const eff: RectificationStatus = this.effectiveRectificationStatus(task);
    const next: RectificationStatus = nextRectificationStatus(eff);
    task.status = next;
    if (next === 'completed') {
      task.completedAt = nowMs();
    }
    if (note.length > 0) {
      task.note = note;
    }
    this.bump('rectificationRev');
    this.persistRectifications();
    return task;
  }

  deleteRectification(id: string): void {
    const next: RectificationTask[] = [];
    for (let i = 0; i < this.rectifications.length; i++) {
      if (this.rectifications[i].id !== id) {
        next.push(this.rectifications[i]);
      }
    }
    this.rectifications = next;
    this.bump('rectificationRev');
    this.persistRectifications();
  }

  // ---------- Mutation result factory helpers ----------
  // Builder helpers used by AppViewModel to construct validated records without
  // spreading (arkts-no-spread) or untyped literals at call sites.

  buildMatter(
    id: string,
    title: string,
    category: MatterCategory,
    priority: MatterPriority,
    description: string,
    status: MatterStatus,
    createdAt: number,
  ): SafetyMatter {
    return {
      id: id,
      title: title,
      category: category,
      priority: priority,
      description: description,
      status: status,
      createdAt: createdAt,
      updatedAt: nowMs(),
    };
  }

  buildRisk(
    id: string,
    title: string,
    severity: RiskSeverity,
    location: string,
    description: string,
    status: RiskStatus,
    mediaUri: string,
    relatedMatterId: string,
    reportedAt: number,
  ): RiskReport {
    return {
      id: id,
      title: title,
      severity: severity,
      location: location,
      description: description,
      status: status,
      mediaUri: mediaUri,
      relatedMatterId: relatedMatterId,
      reportedAt: reportedAt,
      updatedAt: nowMs(),
    };
  }

  buildContact(
    id: string,
    name: string,
    role: string,
    phone: string,
    isPriority: boolean,
    createdAt: number,
  ): EmergencyContact {
    return {
      id: id,
      name: name,
      role: role,
      phone: phone,
      isPriority: isPriority,
      sortOrder: this.nextContactOrder(),
      createdAt: createdAt,
    };
  }

  // ---------- internals ----------
  private defaultSteps(): RectificationStep[] {
    const steps: RectificationStep[] = [];
    steps.push({ stepId: genId('step'), label: '现场核实', done: false, at: 0 });
    steps.push({ stepId: genId('step'), label: '制定措施', done: false, at: 0 });
    steps.push({ stepId: genId('step'), label: '整改执行', done: false, at: 0 });
    steps.push({ stepId: genId('step'), label: '复查验收', done: false, at: 0 });
    return steps;
  }

  private nextContactOrder(): number {
    let max: number = 0;
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].sortOrder > max) {
        max = this.contacts[i].sortOrder;
      }
    }
    return max + 1;
  }

  private sortContacts(): void {
    // Priority contacts first, then by sortOrder ascending. Simple stable
    // two-bucket copy (no Array.sort comparator to keep it strict-friendly).
    const priority: EmergencyContact[] = [];
    const normal: EmergencyContact[] = [];
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].isPriority) {
        priority.push(this.contacts[i]);
      } else {
        normal.push(this.contacts[i]);
      }
    }
    this.sortByOrder(priority);
    this.sortByOrder(normal);
    const merged: EmergencyContact[] = [];
    for (let i = 0; i < priority.length; i++) {
      merged.push(priority[i]);
    }
    for (let i = 0; i < normal.length; i++) {
      merged.push(normal[i]);
    }
    this.contacts = merged;
  }

  private sortByOrder(arr: EmergencyContact[]): void {
    // Insertion sort by sortOrder (small arrays, avoids comparator pitfalls).
    for (let i = 1; i < arr.length; i++) {
      const cur: EmergencyContact = arr[i];
      let j: number = i - 1;
      while (j >= 0 && arr[j].sortOrder > cur.sortOrder) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = cur;
    }
  }

  private indexOfMatter(id: string): number {
    for (let i = 0; i < this.matters.length; i++) {
      if (this.matters[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  private indexOfRisk(id: string): number {
    for (let i = 0; i < this.risks.length; i++) {
      if (this.risks[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  private indexOfContact(id: string): number {
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  private indexOfRectification(id: string): number {
    for (let i = 0; i < this.rectifications.length; i++) {
      if (this.rectifications[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  private bump(key: string): void {
    const cur: number | undefined = AppStorage.get<number>(key);
    const next: number = cur === undefined ? 1 : cur + 1;
    AppStorage.set<number>(key, next);
  }

  // ---------- persistence load/save ----------
  private async loadMatters(): Promise<void> {
    const raw: string = await Persistence.getString(KEY_MATTERS);
    if (raw.length === 0) {
      this.matters = [];
      return;
    }
    this.matters = JSON.parse(raw) as SafetyMatter[];
  }

  private persistMatters(): void {
    Persistence.setString(KEY_MATTERS, JSON.stringify(this.matters));
  }

  private async loadRisks(): Promise<void> {
    const raw: string = await Persistence.getString(KEY_RISKS);
    if (raw.length === 0) {
      this.risks = [];
      return;
    }
    this.risks = JSON.parse(raw) as RiskReport[];
  }

  private persistRisks(): void {
    Persistence.setString(KEY_RISKS, JSON.stringify(this.risks));
  }

  private async loadPatrol(): Promise<void> {
    const raw: string = await Persistence.getString(KEY_PATROL);
    if (raw.length === 0) {
      this.patrol = null;
      return;
    }
    this.patrol = JSON.parse(raw) as PatrolTask;
  }

  private persistPatrol(): void {
    if (this.patrol === null) {
      Persistence.setString(KEY_PATROL, '');
    } else {
      Persistence.setString(KEY_PATROL, JSON.stringify(this.patrol));
    }
  }

  private async loadContacts(): Promise<void> {
    const raw: string = await Persistence.getString(KEY_CONTACTS);
    if (raw.length === 0) {
      this.contacts = [];
      return;
    }
    this.contacts = JSON.parse(raw) as EmergencyContact[];
  }

  private persistContacts(): void {
    Persistence.setString(KEY_CONTACTS, JSON.stringify(this.contacts));
  }

  private async loadRectifications(): Promise<void> {
    const raw: string = await Persistence.getString(KEY_RECTIFICATIONS);
    if (raw.length === 0) {
      this.rectifications = [];
      return;
    }
    this.rectifications = JSON.parse(raw) as RectificationTask[];
  }

  private persistRectifications(): void {
    Persistence.setString(KEY_RECTIFICATIONS, JSON.stringify(this.rectifications));
  }
}
