// DataStore.ets
//
// Reactive local repository for 平安扣 Pinankou. Backed by AppStorage (a
// global built-in) so visual layers (@StorageLink) can bind to live
// collections, with best-effort local persistence through PersistenceService.
//
// Headless phase: full in-memory behavior (CRUD, overdue derivation, patrol
// state machine). PersistenceService.init(context) wiring is deferred to
// visual integration; until then persistence is a safe no-op and the store is
// fully functional in-memory.

import { SafetyItem, Hazard, PatrolTask, EmergencyContact, HazardStatus } from '../common/Models';
import { PersistenceService } from './PersistenceService';

const KEY_SAFETY: string = 'pinankou.safety';
const KEY_HAZARDS: string = 'pinankou.hazards';
const KEY_PATROL: string = 'pinankou.patrol';
const KEY_CONTACTS: string = 'pinankou.contacts';

export class DataStore {
  static ensureInit(): void {
    if (AppStorage.get<SafetyItem[]>(KEY_SAFETY) === undefined) {
      AppStorage.SetOrCreate<SafetyItem[]>(KEY_SAFETY, []);
    }
    if (AppStorage.get<Hazard[]>(KEY_HAZARDS) === undefined) {
      AppStorage.SetOrCreate<Hazard[]>(KEY_HAZARDS, []);
    }
    if (AppStorage.get<PatrolTask[]>(KEY_PATROL) === undefined) {
      AppStorage.SetOrCreate<PatrolTask[]>(KEY_PATROL, []);
    }
    if (AppStorage.get<EmergencyContact[]>(KEY_CONTACTS) === undefined) {
      AppStorage.SetOrCreate<EmergencyContact[]>(KEY_CONTACTS, []);
    }
  }

  // ---- Safety ----
  static getSafetyItems(): SafetyItem[] {
    return AppStorage.get<SafetyItem[]>(KEY_SAFETY) ?? [];
  }

  static setSafetyItems(items: SafetyItem[]): void {
    AppStorage.SetOrCreate<SafetyItem[]>(KEY_SAFETY, items);
    DataStore.persist();
  }

  static upsertSafety(item: SafetyItem): void {
    DataStore.setSafetyItems(upsertById(DataStore.getSafetyItems(), item));
  }

  static removeSafety(id: string): void {
    DataStore.setSafetyItems(removeById(DataStore.getSafetyItems(), id));
  }

  static findSafety(id: string): SafetyItem | undefined {
    return findById(DataStore.getSafetyItems(), id);
  }

  // ---- Hazards ----
  static getHazards(): Hazard[] {
    return AppStorage.get<Hazard[]>(KEY_HAZARDS) ?? [];
  }

  static setHazards(items: Hazard[]): void {
    const normalized: Hazard[] = deriveHazardOverdue(items);
    AppStorage.SetOrCreate<Hazard[]>(KEY_HAZARDS, normalized);
    DataStore.persist();
  }

  static upsertHazard(item: Hazard): void {
    DataStore.setHazards(upsertById(DataStore.getHazards(), item));
  }

  static removeHazard(id: string): void {
    DataStore.setHazards(removeById(DataStore.getHazards(), id));
  }

  static findHazard(id: string): Hazard | undefined {
    return findById(DataStore.getHazards(), id);
  }

  static seedHazardFromPatrol(hazard: Hazard): void {
    DataStore.upsertHazard(hazard);
  }

  // ---- Patrol ----
  static getPatrolTasks(): PatrolTask[] {
    return AppStorage.get<PatrolTask[]>(KEY_PATROL) ?? [];
  }

  static setPatrolTasks(items: PatrolTask[]): void {
    AppStorage.SetOrCreate<PatrolTask[]>(KEY_PATROL, items);
    DataStore.persist();
  }

  static upsertPatrolTask(task: PatrolTask): void {
    DataStore.setPatrolTasks(upsertById(DataStore.getPatrolTasks(), task));
  }

  static removePatrolTask(id: string): void {
    DataStore.setPatrolTasks(removeById(DataStore.getPatrolTasks(), id));
  }

  // ---- Contacts ----
  static getContacts(): EmergencyContact[] {
    return AppStorage.get<EmergencyContact[]>(KEY_CONTACTS) ?? [];
  }

  static setContacts(items: EmergencyContact[]): void {
    AppStorage.SetOrCreate<EmergencyContact[]>(KEY_CONTACTS, items);
    DataStore.persist();
  }

  static upsertContact(contact: EmergencyContact): void {
    DataStore.setContacts(upsertById(DataStore.getContacts(), contact));
  }

  static removeContact(id: string): void {
    DataStore.setContacts(removeById(DataStore.getContacts(), id));
  }

  static findContact(id: string): EmergencyContact | undefined {
    return findById(DataStore.getContacts(), id);
  }

  // ---- persistence hook (best-effort) ----
  private static persist(): void {
    PersistenceService.trySave(KEY_SAFETY, DataStore.getSafetyItems());
    PersistenceService.trySave(KEY_HAZARDS, DataStore.getHazards());
    PersistenceService.trySave(KEY_PATROL, DataStore.getPatrolTasks());
    PersistenceService.trySave(KEY_CONTACTS, DataStore.getContacts());
  }
}

// ---- pure helpers (generic over a shared `{ id: string }` shape) ----

interface HasId {
  id: string;
}

function upsertById<T extends HasId>(list: T[], item: T): T[] {
  const out: T[] = [];
  let found: boolean = false;
  for (const existing of list) {
    if (existing.id === item.id) {
      out.push(item);
      found = true;
    } else {
      out.push(existing);
    }
  }
  if (!found) {
    out.push(item);
  }
  return out;
}

function removeById<T extends HasId>(list: T[], id: string): T[] {
  const out: T[] = [];
  for (const existing of list) {
    if (existing.id !== id) {
      out.push(existing);
    }
  }
  return out;
}

function findById<T extends HasId>(list: T[], id: string): T | undefined {
  for (const existing of list) {
    if (existing.id === id) {
      return existing;
    }
  }
  return undefined;
}

// Derive `overdue` status for non-rectified hazards whose deadline has passed.
export function deriveHazardOverdue(items: Hazard[]): Hazard[] {
  const now: number = Date.now();
  const out: Hazard[] = [];
  for (const h of items) {
    if (h.status !== 'rectified' && h.deadline > 0 && h.deadline < now) {
      out.push(cloneHazardWithStatus(h, 'overdue'));
    } else {
      out.push(h);
    }
  }
  return out;
}

function cloneHazardWithStatus(src: Hazard, status: HazardStatus): Hazard {
  const c: Hazard = new Hazard(src.id, src.title, src.level, src.owner, src.deadline);
  c.description = src.description;
  c.location = src.location;
  c.photoUri = src.photoUri;
  c.note = src.note;
  c.status = status;
  c.createdAt = src.createdAt;
  c.updatedAt = src.updatedAt;
  return c;
}
