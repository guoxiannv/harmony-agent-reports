// DataStore.ets — single source of truth (observable + persisted).
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import {
  HazardItem, HazardProgress, PatrolRoute, PatrolCheckpoint, CheckinRecord,
  ContactItem, ContactGroup, SafetyTodo, HazardForm, HazardStatus, ProgressType, NewContact,
} from '../model/Types';

const PREF_NAME = 'pinankou_store';
const PREF_KEY = 'state';

function uid(prefix: string): string {
  return `${prefix}_${Date.now().toString(36)}_${Math.floor(Math.random() * 1000000).toString(36)}`;
}

function makeCheckpoint(routeId: string, name: string, order: number): PatrolCheckpoint {
  return { id: `${routeId}-cp${order}`, routeId, name, order };
}

function defaultRoutes(): PatrolRoute[] {
  const a: PatrolRoute = {
    id: 'route-a', name: '厂区A线日间巡检', description: '主车间 + 仓储区',
    checkpoints: [
      makeCheckpoint('route-a', '配电室', 1),
      makeCheckpoint('route-a', '主车间A', 2),
      makeCheckpoint('route-a', '危化品仓库', 3),
      makeCheckpoint('route-a', '消防通道', 4),
      makeCheckpoint('route-a', '门卫室', 5),
    ],
  };
  const b: PatrolRoute = {
    id: 'route-b', name: '罐区夜间巡检', description: '储罐区及装卸站台',
    checkpoints: [
      makeCheckpoint('route-b', '1号储罐', 1),
      makeCheckpoint('route-b', '装卸站台', 2),
      makeCheckpoint('route-b', '防溢围堰', 3),
      makeCheckpoint('route-b', '应急物资柜', 4),
    ],
  };
  return [a, b];
}

interface PersistPayload {
  hazards: HazardItem[];
  routes: PatrolRoute[];
  patrolRecords: CheckinRecord[];
  contacts: ContactItem[];
  profileName: string;
  profileRole: string;
}

@Observed
export class DataStore {
  hazards: HazardItem[] = [];
  routes: PatrolRoute[] = [];
  patrolRecords: CheckinRecord[] = [];
  contacts: ContactItem[] = [];
  todosSeed: SafetyTodo[] = [];

  activeRouteId: string = '';
  checkedCheckpoints: string[] = [];

  profileName: string = '安全员';
  profileRole: string = 'user';

  private ctx: common.Context | null = null;
  private seeded: boolean = false;

  attachContext(context: common.Context): void {
    this.ctx = context;
  }

  async load(context: common.Context): Promise<void> {
    this.ctx = context;
    try {
      const pref = await preferences.getPreferences(context, PREF_NAME);
      const raw = await pref.get(PREF_KEY, '') as string;
      if (raw && raw.length > 0) {
        const obj = JSON.parse(raw) as PersistPayload;
        this.hazards = obj.hazards ?? [];
        this.routes = obj.routes ?? [];
        this.patrolRecords = obj.patrolRecords ?? [];
        this.contacts = obj.contacts ?? [];
        this.profileName = obj.profileName ?? '安全员';
        this.profileRole = obj.profileRole === 'admin' ? 'admin' : 'user';
        this.seeded = true;
      }
    } catch (e) {
      // keep defaults
    }
    this.seedRoutesIfEmpty();
  }

  private async persist(): Promise<void> {
    if (!this.ctx) {
      return;
    }
    try {
      const pref = await preferences.getPreferences(this.ctx, PREF_NAME);
      const payload: PersistPayload = {
        hazards: this.hazards,
        routes: this.routes,
        patrolRecords: this.patrolRecords,
        contacts: this.contacts,
        profileName: this.profileName,
        profileRole: this.profileRole,
      };
      await pref.put(PREF_KEY, JSON.stringify(payload));
      await pref.flush();
    } catch (e) {
      // best-effort
    }
  }

  seedRoutesIfEmpty(): void {
    if (this.routes.length === 0 && !this.seeded) {
      this.routes = defaultRoutes();
      this.seeded = true;
      this.persist();
    }
  }

  // ---------- Hazards ----------
  addHazard(form: HazardForm): HazardItem {
    const now = Date.now();
    const createProgress: HazardProgress = {
      id: uid('p'), type: 'create', text: '隐患已登记', createdAt: now,
    };
    const h: HazardItem = {
      id: uid('h'), title: form.title.trim(), location: form.location.trim(),
      level: form.level, description: form.description.trim(),
      status: 'pending', assignee: form.assignee.trim(), deadline: form.deadline,
      photoPath: form.photoPath, createdAt: now, updatedAt: now, progress: [createProgress],
    };
    const next: HazardItem[] = [h];
    for (const x of this.hazards) {
      next.push(x);
    }
    this.hazards = next;
    this.persist();
    return h;
  }

  updateHazard(form: HazardForm): void {
    const idx = this.findIndex(form.id);
    if (idx < 0) {
      return;
    }
    const h = this.hazards[idx];
    const updated: HazardItem = {
      id: h.id, title: form.title.trim(), location: form.location.trim(), level: form.level,
      description: form.description.trim(), assignee: form.assignee.trim(),
      deadline: form.deadline, photoPath: form.photoPath, status: h.status,
      createdAt: h.createdAt, updatedAt: Date.now(), progress: h.progress,
    };
    const next: HazardItem[] = [];
    for (let i = 0; i < this.hazards.length; i++) {
      next.push(i === idx ? updated : this.hazards[i]);
    }
    this.hazards = next;
    this.persist();
  }

  removeHazard(id: string): void {
    const next: HazardItem[] = [];
    for (const h of this.hazards) {
      if (h.id !== id) {
        next.push(h);
      }
    }
    this.hazards = next;
    this.persist();
  }

  getHazard(id: string): HazardItem | undefined {
    return this.hazards.find(h => h.id === id);
  }

  private findIndex(id: string): number {
    for (let i = 0; i < this.hazards.length; i++) {
      if (this.hazards[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  private appendProgress(id: string, type: ProgressType, text: string, newStatus?: HazardStatus): void {
    const idx = this.findIndex(id);
    if (idx < 0) {
      return;
    }
    const h = this.hazards[idx];
    const entry: HazardProgress = { id: uid('p'), type, text, createdAt: Date.now() };
    const nextProgress: HazardProgress[] = [];
    for (const p of h.progress) {
      nextProgress.push(p);
    }
    nextProgress.push(entry);
    const updated: HazardItem = {
      id: h.id, title: h.title, location: h.location, level: h.level,
      description: h.description, status: newStatus ?? h.status, assignee: h.assignee,
      deadline: h.deadline, photoPath: h.photoPath, createdAt: h.createdAt,
      updatedAt: Date.now(), progress: nextProgress,
    };
    const next: HazardItem[] = [];
    for (let i = 0; i < this.hazards.length; i++) {
      next.push(i === idx ? updated : this.hazards[i]);
    }
    this.hazards = next;
    this.persist();
  }

  urgeHazard(id: string): void {
    const h = this.getHazard(id);
    if (!h) {
      return;
    }
    const newStatus: HazardStatus = h.status === 'pending' ? 'rectifying' : h.status;
    this.appendProgress(id, 'urge', `已催办${h.assignee ? '：' + h.assignee : ''}`, newStatus);
  }

  rectifyHazard(id: string): void {
    this.appendProgress(id, 'rectify', '整改人反馈：整改中', 'rectifying');
  }

  acceptHazard(id: string): void {
    this.appendProgress(id, 'accept', '验收通过，隐患闭环', 'done');
  }

  // ---------- Patrol ----------
  startPatrol(routeId: string): void {
    this.activeRouteId = routeId;
    this.checkedCheckpoints = [];
    this.persist();
  }

  isActiveRoute(routeId: string): boolean {
    return this.activeRouteId === routeId && routeId.length > 0;
  }

  checkinCheckpoint(checkpointId: string, abnormal: boolean, note: string): void {
    if (this.activeRouteId.length === 0) {
      return;
    }
    const rec: CheckinRecord = {
      id: uid('ck'), routeId: this.activeRouteId, checkpointId,
      time: Date.now(), abnormal, note,
    };
    const nextRecords: CheckinRecord[] = [rec];
    for (const r of this.patrolRecords) {
      nextRecords.push(r);
    }
    this.patrolRecords = nextRecords;
    if (!this.checkedCheckpoints.includes(checkpointId)) {
      const nextChecked: string[] = [];
      for (const c of this.checkedCheckpoints) {
        nextChecked.push(c);
      }
      nextChecked.push(checkpointId);
      this.checkedCheckpoints = nextChecked;
    }
    this.persist();
  }

  isCheckpointChecked(checkpointId: string): boolean {
    return this.checkedCheckpoints.includes(checkpointId);
  }

  completePatrol(): void {
    this.activeRouteId = '';
    this.checkedCheckpoints = [];
    this.persist();
  }

  getRoute(id: string): PatrolRoute | undefined {
    return this.routes.find(r => r.id === id);
  }

  todayCheckinCount(): number {
    const start = new Date();
    start.setHours(0, 0, 0, 0);
    const t0 = start.getTime();
    let n = 0;
    for (const r of this.patrolRecords) {
      if (r.time >= t0) {
        n += 1;
      }
    }
    return n;
  }

  totalCheckpointsToday(): number {
    const start = new Date();
    start.setHours(0, 0, 0, 0);
    const t0 = start.getTime();
    const set = new Set<string>();
    for (const r of this.patrolRecords) {
      if (r.time >= t0) {
        set.add(r.checkpointId);
      }
    }
    return set.size;
  }

  // ---------- Contacts ----------
  addContact(c: NewContact): void {
    const item: ContactItem = {
      id: uid('c'), name: c.name, phone: c.phone, group: c.group,
      role: c.role, isPrimary: c.isPrimary,
    };
    if (item.isPrimary) {
      this.contacts = this.contacts.map((x: ContactItem): ContactItem => {
        return { id: x.id, name: x.name, phone: x.phone, group: x.group, role: x.role, isPrimary: false };
      });
    }
    const next: ContactItem[] = [item];
    for (const x of this.contacts) {
      next.push(x);
    }
    this.contacts = next;
    this.persist();
  }

  removeContact(id: string): void {
    const next: ContactItem[] = [];
    for (const c of this.contacts) {
      if (c.id !== id) {
        next.push(c);
      }
    }
    this.contacts = next;
    this.persist();
  }

  setPrimaryContact(id: string): void {
    this.contacts = this.contacts.map((c: ContactItem): ContactItem => {
      return {
        id: c.id, name: c.name, phone: c.phone, group: c.group,
        role: c.role, isPrimary: c.id === id,
      };
    });
    this.persist();
  }

  primaryContact(): ContactItem | undefined {
    const primary = this.contacts.find(c => c.isPrimary);
    return primary ?? this.contacts[0];
  }

  // ---------- Derived ----------
  derivedTodos(): SafetyTodo[] {
    const now = Date.now();
    const soon = now + 24 * 3600 * 1000;
    const todos: SafetyTodo[] = [];
    if (this.activeRouteId.length > 0) {
      const route = this.getRoute(this.activeRouteId);
      if (route) {
        todos.push({
          id: `todo-patrol-${route.id}`, title: `巡检进行中：${route.name}`,
          type: 'patrol', dueTime: 0, done: false,
        });
      }
    }
    for (const h of this.hazards) {
      if (h.status === 'done') {
        continue;
      }
      if (h.deadline > 0 && h.deadline <= soon) {
        todos.push({
          id: `todo-${h.id}`, title: `隐患即将到期：${h.title}`,
          type: 'hazard', dueTime: h.deadline, done: false,
        });
      } else if (h.status === 'pending') {
        todos.push({
          id: `todo-${h.id}`, title: `待整改：${h.title}`,
          type: 'hazard', dueTime: h.deadline, done: false,
        });
      } else if (h.status === 'rectifying') {
        todos.push({
          id: `todo-${h.id}`, title: `跟进整改：${h.title}`,
          type: 'review', dueTime: h.deadline, done: false,
        });
      }
    }
    return todos;
  }

  pendingHazardsCount(): number {
    let n = 0;
    for (const h of this.hazards) {
      if (h.status !== 'done') {
        n += 1;
      }
    }
    return n;
  }

  completionRate(): number {
    if (this.hazards.length === 0) {
      return 0;
    }
    let done = 0;
    for (const h of this.hazards) {
      if (h.status === 'done') {
        done += 1;
      }
    }
    return done / this.hazards.length;
  }
}

export const appStore: DataStore = new DataStore();
export const CONTACT_GROUPS: ContactGroup[] = ['指挥', '抢险', '医疗', '消防', '其他'];
