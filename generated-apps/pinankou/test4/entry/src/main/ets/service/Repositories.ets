// Per-domain repositories. Each owns an in-memory collection, hydrates from
// PersistenceService on load(), and persists on mutation. Serialization rebuilds
// class instances field-by-field (no spreads, no indexed object access).

import { PersistenceService } from './PersistenceService';
import {
  SafetyRecord, RiskReport, InspectionRound, InspectionStop, Contact, RectificationTask,
  RecordCategory, RiskSeverity, RiskStatus, InspectionStatus, RectificationStatus,
  RecordStatus, isRectificationOpen, isRiskOpen
} from '../model/Models';

// ---- Serialization shapes ----
interface RecordData {
  id: string; title: string; category: RecordCategory; description: string;
  location: string; status: RecordStatus; createdAt: number; updatedAt: number;
}
interface RiskData {
  id: string; title: string; severity: RiskSeverity; location: string; description: string;
  dueDate: number; photoUris: string[]; assignee: string; status: RiskStatus;
  createdAt: number; linkedRectificationId: string;
}
interface StopData { id: string; name: string; checkedInAt: number; notes: string; }
interface InspectionData {
  id: string; routeName: string; startedAt: number; finishedAt: number;
  status: InspectionStatus; notes: string; stops: StopData[];
}
interface ContactData { id: string; name: string; role: string; phone: string; }
interface RectificationData {
  id: string; title: string; sourceRiskId: string; status: RectificationStatus;
  progress: number; dueDate: number; assignee: string; createdAt: number; closedAt: number;
}

function emptyArrayGuard<T>(parsed: Object): T[] {
  if (Array.isArray(parsed)) {
    return parsed as T[];
  }
  return [] as T[];
}

// ---- SafetyRecord ----
export class RecordRepository {
  private items: SafetyRecord[] = [];

  async load(): Promise<void> {
    const raw: string = await PersistenceService.loadString(PersistenceService.keyRecords());
    if (raw.length === 0) {
      this.items = [];
      return;
    }
    const data: RecordData[] = emptyArrayGuard<RecordData>(JSON.parse(raw));
    const out: SafetyRecord[] = [];
    for (const d of data) {
      const r: SafetyRecord = new SafetyRecord();
      r.id = d.id;
      r.title = d.title;
      r.category = d.category;
      r.description = d.description;
      r.location = d.location;
      r.status = d.status;
      r.createdAt = d.createdAt;
      r.updatedAt = d.updatedAt;
      out.push(r);
    }
    this.items = out;
  }

  all(): SafetyRecord[] {
    return this.items;
  }

  recent(limit: number): SafetyRecord[] {
    const sorted: SafetyRecord[] = this.items.slice().sort((a: SafetyRecord, b: SafetyRecord): number => {
      return b.createdAt - a.createdAt;
    });
    const out: SafetyRecord[] = [];
    const n: number = Math.min(limit, sorted.length);
    for (let i = 0; i < n; i++) {
      out.push(sorted[i]);
    }
    return out;
  }

  search(query: string, statusFilter: RecordStatus | 'all'): SafetyRecord[] {
    const q: string = query.trim();
    const out: SafetyRecord[] = [];
    for (const r of this.items) {
      if (statusFilter !== 'all' && r.status !== statusFilter) {
        continue;
      }
      if (q.length > 0) {
        const hay: string = `${r.title} ${r.description} ${r.location}`;
        if (hay.indexOf(q) < 0) {
          continue;
        }
      }
      out.push(r);
    }
    return out;
  }

  add(r: SafetyRecord): void {
    this.items.push(r);
    this.persist();
  }

  update(r: SafetyRecord): void {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === r.id) {
        r.updatedAt = Date.now();
        this.items[i] = r;
        break;
      }
    }
    this.persist();
  }

  count(): number {
    return this.items.length;
  }

  private persist(): void {
    const data: RecordData[] = [];
    for (const r of this.items) {
      data.push({
        id: r.id, title: r.title, category: r.category, description: r.description,
        location: r.location, status: r.status, createdAt: r.createdAt, updatedAt: r.updatedAt
      });
    }
    PersistenceService.saveString(PersistenceService.keyRecords(), JSON.stringify(data));
  }
}

// ---- RiskReport ----
export class RiskRepository {
  private items: RiskReport[] = [];

  async load(): Promise<void> {
    const raw: string = await PersistenceService.loadString(PersistenceService.keyRisks());
    if (raw.length === 0) {
      this.items = [];
      return;
    }
    const data: RiskData[] = emptyArrayGuard<RiskData>(JSON.parse(raw));
    const out: RiskReport[] = [];
    for (const d of data) {
      const r: RiskReport = new RiskReport();
      r.id = d.id;
      r.title = d.title;
      r.severity = d.severity;
      r.location = d.location;
      r.description = d.description;
      r.dueDate = d.dueDate;
      r.photoUris = d.photoUris;
      r.assignee = d.assignee;
      r.status = d.status;
      r.createdAt = d.createdAt;
      r.linkedRectificationId = d.linkedRectificationId;
      out.push(r);
    }
    this.items = out;
  }

  all(): RiskReport[] {
    return this.items;
  }

  add(r: RiskReport): void {
    this.items.push(r);
    this.persist();
  }

  update(r: RiskReport): void {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === r.id) {
        this.items[i] = r;
        break;
      }
    }
    this.persist();
  }

  openCount(): number {
    let n: number = 0;
    for (const r of this.items) {
      if (isRiskOpen(r)) {
        n += 1;
      }
    }
    return n;
  }

  private persist(): void {
    const data: RiskData[] = [];
    for (const r of this.items) {
      data.push({
        id: r.id, title: r.title, severity: r.severity, location: r.location,
        description: r.description, dueDate: r.dueDate, photoUris: r.photoUris,
        assignee: r.assignee, status: r.status, createdAt: r.createdAt,
        linkedRectificationId: r.linkedRectificationId
      });
    }
    PersistenceService.saveString(PersistenceService.keyRisks(), JSON.stringify(data));
  }
}

// ---- InspectionRound ----
export class InspectionRepository {
  private history: InspectionRound[] = [];
  private current: InspectionRound | null = null;

  async load(): Promise<void> {
    const histRaw: string = await PersistenceService.loadString(PersistenceService.keyInspections());
    if (histRaw.length > 0) {
      const data: InspectionData[] = emptyArrayGuard<InspectionData>(JSON.parse(histRaw));
      const out: InspectionRound[] = [];
      for (const d of data) {
        out.push(this.deserializeRound(d));
      }
      this.history = out;
    } else {
      this.history = [];
    }

    const curRaw: string = await PersistenceService.loadString(PersistenceService.keyCurrentInspection());
    if (curRaw.length > 0) {
      const parsed: Object = JSON.parse(curRaw);
      if (!Array.isArray(parsed)) {
        const single: InspectionData = parsed as InspectionData;
        this.current = this.deserializeRound(single);
      } else {
        this.current = null;
      }
    } else {
      this.current = null;
    }
  }

  private deserializeRound(d: InspectionData): InspectionRound {
    const r: InspectionRound = new InspectionRound();
    r.id = d.id;
    r.routeName = d.routeName;
    r.startedAt = d.startedAt;
    r.finishedAt = d.finishedAt;
    r.status = d.status;
    r.notes = d.notes;
    const stops: InspectionStop[] = [];
    for (const s of d.stops) {
      const stop: InspectionStop = new InspectionStop(s.id, s.name);
      stop.checkedInAt = s.checkedInAt;
      stop.notes = s.notes;
      stops.push(stop);
    }
    r.stops = stops;
    return r;
  }

  currentRound(): InspectionRound | null {
    return this.current;
  }

  startRound(routeName: string, defaultStopNames: string[]): InspectionRound {
    const round: InspectionRound = new InspectionRound();
    round.id = '';
    round.routeName = routeName;
    round.startedAt = Date.now();
    round.status = 'in-progress';
    const stops: InspectionStop[] = [];
    for (let i = 0; i < defaultStopNames.length; i++) {
      stops.push(new InspectionStop(`stop_${i + 1}`, defaultStopNames[i]));
    }
    round.stops = stops;
    this.current = round;
    this.persistCurrent();
    return round;
  }

  checkinNextStop(notes: string): InspectionRound | null {
    if (this.current === null) {
      return null;
    }
    for (const stop of this.current.stops) {
      if (stop.checkedInAt === 0) {
        stop.checkedInAt = Date.now();
        stop.notes = notes;
        break;
      }
    }
    this.persistCurrent();
    return this.current;
  }

  updateNotes(notes: string): InspectionRound | null {
    if (this.current === null) {
      return null;
    }
    this.current.notes = notes;
    this.persistCurrent();
    return this.current;
  }

  finishRound(): InspectionRound | null {
    if (this.current === null) {
      return null;
    }
    this.current.status = 'completed';
    this.current.finishedAt = Date.now();
    const finished: InspectionRound = this.current;
    this.history.unshift(finished);
    this.current = null;
    this.persistHistory();
    PersistenceService.saveString(PersistenceService.keyCurrentInspection(), '');
    return finished;
  }

  historyList(): InspectionRound[] {
    return this.history;
  }

  countToday(): number {
    const startOfDay: number = this.startOfTodayMs();
    let n: number = 0;
    for (const r of this.history) {
      if (r.startedAt >= startOfDay) {
        n += 1;
      }
    }
    if (this.current !== null && this.current.startedAt >= startOfDay) {
      n += 1;
    }
    return n;
  }

  completedCount(): number {
    let n: number = 0;
    for (const r of this.history) {
      if (r.status === 'completed') {
        n += 1;
      }
    }
    return n;
  }

  private startOfTodayMs(): number {
    const now: Date = new Date();
    return new Date(now.getFullYear(), now.getMonth(), now.getDate()).getTime();
  }

  private persistCurrent(): void {
    if (this.current === null) {
      return;
    }
    const d: InspectionData = this.serializeRound(this.current);
    PersistenceService.saveString(PersistenceService.keyCurrentInspection(), JSON.stringify(d));
  }

  private persistHistory(): void {
    const data: InspectionData[] = [];
    for (const r of this.history) {
      data.push(this.serializeRound(r));
    }
    PersistenceService.saveString(PersistenceService.keyInspections(), JSON.stringify(data));
  }

  private serializeRound(r: InspectionRound): InspectionData {
    const stops: StopData[] = [];
    for (const s of r.stops) {
      stops.push({ id: s.id, name: s.name, checkedInAt: s.checkedInAt, notes: s.notes });
    }
    return {
      id: r.id, routeName: r.routeName, startedAt: r.startedAt, finishedAt: r.finishedAt,
      status: r.status, notes: r.notes, stops: stops
    };
  }
}

// ---- Contact ----
export class ContactRepository {
  private items: Contact[] = [];

  async load(): Promise<void> {
    const raw: string = await PersistenceService.loadString(PersistenceService.keyContacts());
    if (raw.length === 0) {
      this.items = [];
      return;
    }
    const data: ContactData[] = emptyArrayGuard<ContactData>(JSON.parse(raw));
    const out: Contact[] = [];
    for (const d of data) {
      const c: Contact = new Contact();
      c.id = d.id;
      c.name = d.name;
      c.role = d.role;
      c.phone = d.phone;
      out.push(c);
    }
    this.items = out;
  }

  all(): Contact[] {
    return this.items;
  }

  search(query: string): Contact[] {
    const q: string = query.trim();
    if (q.length === 0) {
      return this.items;
    }
    const out: Contact[] = [];
    for (const c of this.items) {
      const hay: string = `${c.name} ${c.role} ${c.phone}`;
      if (hay.indexOf(q) >= 0) {
        out.push(c);
      }
    }
    return out;
  }

  add(c: Contact): void {
    this.items.push(c);
    this.persist();
  }

  update(c: Contact): void {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === c.id) {
        this.items[i] = c;
        break;
      }
    }
    this.persist();
  }

  private persist(): void {
    const data: ContactData[] = [];
    for (const c of this.items) {
      data.push({ id: c.id, name: c.name, role: c.role, phone: c.phone });
    }
    PersistenceService.saveString(PersistenceService.keyContacts(), JSON.stringify(data));
  }
}

// ---- RectificationTask ----
export class RectificationRepository {
  private items: RectificationTask[] = [];

  async load(): Promise<void> {
    const raw: string = await PersistenceService.loadString(PersistenceService.keyRectifications());
    if (raw.length === 0) {
      this.items = [];
      return;
    }
    const data: RectificationData[] = emptyArrayGuard<RectificationData>(JSON.parse(raw));
    const out: RectificationTask[] = [];
    for (const d of data) {
      const t: RectificationTask = new RectificationTask();
      t.id = d.id;
      t.title = d.title;
      t.sourceRiskId = d.sourceRiskId;
      t.status = d.status;
      t.progress = d.progress;
      t.dueDate = d.dueDate;
      t.assignee = d.assignee;
      t.createdAt = d.createdAt;
      t.closedAt = d.closedAt;
      out.push(t);
    }
    this.items = out;
  }

  all(): RectificationTask[] {
    return this.items;
  }

  // explicit overload style: provide filtered accessor
  listByStatus(status: RectificationStatus | 'open'): RectificationTask[] {
    const out: RectificationTask[] = [];
    for (const t of this.items) {
      if (status === 'open') {
        if (isRectificationOpen(t)) {
          out.push(t);
        }
      } else if (t.status === status) {
        out.push(t);
      }
    }
    return out;
  }

  urgent(limit: number): RectificationTask[] {
    const now: number = Date.now();
    const open: RectificationTask[] = this.listByStatus('open');
    open.sort((a: RectificationTask, b: RectificationTask): number => {
      const aOver: number = (a.dueDate > 0 && a.dueDate < now) ? 0 : 1;
      const bOver: number = (b.dueDate > 0 && b.dueDate < now) ? 0 : 1;
      if (aOver !== bOver) {
        return aOver - bOver;
      }
      return a.dueDate - b.dueDate;
    });
    const out: RectificationTask[] = [];
    const n: number = Math.min(limit, open.length);
    for (let i = 0; i < n; i++) {
      out.push(open[i]);
    }
    return out;
  }

  add(t: RectificationTask): void {
    this.items.push(t);
    this.persist();
  }

  update(t: RectificationTask): void {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === t.id) {
        this.items[i] = t;
        break;
      }
    }
    this.persist();
  }

  findById(id: string): RectificationTask | null {
    for (const t of this.items) {
      if (t.id === id) {
        return t;
      }
    }
    return null;
  }

  openCount(): number {
    return this.listByStatus('open').length;
  }

  closedCount(): number {
    let n: number = 0;
    for (const t of this.items) {
      if (t.status === 'closed' || t.status === 'verified') {
        n += 1;
      }
    }
    return n;
  }

  totalCount(): number {
    return this.items.length;
  }

  completionRate(): number {
    const total: number = this.items.length;
    if (total === 0) {
      return 0;
    }
    const closed: number = this.closedCount();
    return Math.round((closed * 100) / total);
  }

  private persist(): void {
    const data: RectificationData[] = [];
    for (const t of this.items) {
      data.push({
        id: t.id, title: t.title, sourceRiskId: t.sourceRiskId, status: t.status,
        progress: t.progress, dueDate: t.dueDate, assignee: t.assignee,
        createdAt: t.createdAt, closedAt: t.closedAt
      });
    }
    PersistenceService.saveString(PersistenceService.keyRectifications(), JSON.stringify(data));
  }
}
