// DataStore.ets - local persistence for 平安扣.
//
// Strategy (spec §5):
// - First run is EMPTY (no seeded data).
// - In-memory arrays are the single source of truth for UI.
// - On every mutation we persist a JSON blob per collection to HarmonyOS
//   preferences (@kit.ArkData). load() hydrates arrays at startup.
// - IDs are generated as <prefix>-<timestamp>-<random>.
import dataPreferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';
import {
  SafetyItem,
  Hazard,
  InspectionTask,
  EmergencyContact,
} from '../model/Types';

const STORE_NAME: string = 'pinankou_store.json';
const KEY_ITEMS: string = 'items';
const KEY_HAZARDS: string = 'hazards';
const KEY_INSPECTIONS: string = 'inspections';
const KEY_CONTACTS: string = 'contacts';

// Singleton.
let gInstance: DataStore | null = null;

export class DataStore {
  private items: SafetyItem[] = [];
  private hazards: Hazard[] = [];
  private inspections: InspectionTask[] = [];
  private contacts: EmergencyContact[] = [];
  private prefs: dataPreferences.Preferences | null = null;
  private loaded: boolean = false;
  private context: common.Context | null = null;

  static getInstance(): DataStore {
    if (gInstance === null) {
      gInstance = new DataStore();
    }
    return gInstance;
  }

  // Bind a UI context (ability context) for preferences access.
  setContext(ctx: common.Context): void {
    this.context = ctx;
  }

  private async ensurePrefs(): Promise<void> {
    if (this.prefs !== null) {
      return;
    }
    if (this.context === null) {
      return;
    }
    try {
      this.prefs = await dataPreferences.getPreferences(this.context, STORE_NAME);
    } catch (e) {
      // Preferences unavailable; degrade to in-memory only.
      this.prefs = null;
    }
  }

  // Load all collections from preferences. Safe to call multiple times.
  async load(): Promise<void> {
    if (this.loaded) {
      return;
    }
    await this.ensurePrefs();
    if (this.prefs === null) {
      this.loaded = true;
      return;
    }
    try {
      const itemsJson: string = (await this.prefs.get(KEY_ITEMS, '')).toString();
      const hazardsJson: string = (await this.prefs.get(KEY_HAZARDS, '')).toString();
      const inspectionsJson: string = (await this.prefs.get(KEY_INSPECTIONS, '')).toString();
      const contactsJson: string = (await this.prefs.get(KEY_CONTACTS, '')).toString();
      this.items = this.parseArray<SafetyItem>(itemsJson);
      this.hazards = this.parseArray<Hazard>(hazardsJson);
      this.inspections = this.parseArray<InspectionTask>(inspectionsJson);
      this.contacts = this.parseArray<EmergencyContact>(contactsJson);
    } catch (e) {
      // Keep empty arrays.
    }
    this.loaded = true;
  }

  private parseArray<T>(json: string): T[] {
    if (json === null || json === undefined || json.length === 0) {
      return [];
    }
    try {
      const parsed: object = JSON.parse(json);
      if (Array.isArray(parsed)) {
        return parsed as T[];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  private async persist(key: string, payload: object): Promise<void> {
    await this.ensurePrefs();
    if (this.prefs === null) {
      return;
    }
    try {
      await this.prefs.put(key, JSON.stringify(payload));
      await this.prefs.flush();
    } catch (e) {
      // Persistence failed; in-memory state remains authoritative for the session.
    }
  }

  private genId(prefix: string): string {
    const t: number = Date.now();
    const r: number = Math.floor(Math.random() * 100000);
    return `${prefix}-${t}-${r}`;
  }

  // --- Items ---
  getAllItems(): SafetyItem[] {
    return this.items.slice();
  }

  getItem(id: string): SafetyItem | null {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        return this.items[i];
      }
    }
    return null;
  }

  saveItem(item: SafetyItem): SafetyItem {
    const now: number = Date.now();
    if (item.id === '' ) {
      const created: SafetyItem = {
        id: this.genId('item'),
        title: item.title,
        category: item.category,
        priority: item.priority,
        owner: item.owner,
        dueDate: item.dueDate,
        note: item.note,
        status: item.status,
        createdAt: now,
        updatedAt: now,
      };
      this.items.unshift(created);
      this.persist(KEY_ITEMS, this.items);
      return created;
    }
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === item.id) {
        const updated: SafetyItem = {
          id: item.id,
          title: item.title,
          category: item.category,
          priority: item.priority,
          owner: item.owner,
          dueDate: item.dueDate,
          note: item.note,
          status: item.status,
          createdAt: this.items[i].createdAt,
          updatedAt: now,
        };
        this.items[i] = updated;
        this.persist(KEY_ITEMS, this.items);
        return updated;
      }
    }
    return item;
  }

  deleteItem(id: string): void {
    const next: SafetyItem[] = [];
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id !== id) {
        next.push(this.items[i]);
      }
    }
    this.items = next;
    this.persist(KEY_ITEMS, this.items);
  }

  // --- Hazards ---
  getAllHazards(): Hazard[] {
    return this.hazards.slice();
  }

  getHazard(id: string): Hazard | null {
    for (let i = 0; i < this.hazards.length; i++) {
      if (this.hazards[i].id === id) {
        return this.hazards[i];
      }
    }
    return null;
  }

  saveHazard(hazard: Hazard): Hazard {
    const now: number = Date.now();
    if (hazard.id === '') {
      const created: Hazard = {
        id: this.genId('hazard'),
        title: hazard.title,
        location: hazard.location,
        level: hazard.level,
        description: hazard.description,
        hasPhoto: hazard.hasPhoto,
        reporter: hazard.reporter,
        status: hazard.status,
        remarks: hazard.remarks.slice(),
        createdAt: now,
        updatedAt: now,
      };
      this.hazards.unshift(created);
      this.persist(KEY_HAZARDS, this.hazards);
      return created;
    }
    for (let i = 0; i < this.hazards.length; i++) {
      if (this.hazards[i].id === hazard.id) {
        const remarks: object[] = hazard.remarks.slice();
        const updated: Hazard = {
          id: hazard.id,
          title: hazard.title,
          location: hazard.location,
          level: hazard.level,
          description: hazard.description,
          hasPhoto: hazard.hasPhoto,
          reporter: hazard.reporter,
          status: hazard.status,
          remarks: remarks as Hazard['remarks'],
          createdAt: this.hazards[i].createdAt,
          updatedAt: now,
        };
        this.hazards[i] = updated;
        this.persist(KEY_HAZARDS, this.hazards);
        return updated;
      }
    }
    return hazard;
  }

  deleteHazard(id: string): void {
    const next: Hazard[] = [];
    for (let i = 0; i < this.hazards.length; i++) {
      if (this.hazards[i].id !== id) {
        next.push(this.hazards[i]);
      }
    }
    this.hazards = next;
    this.persist(KEY_HAZARDS, this.hazards);
  }

  // --- Inspections ---
  getAllInspections(): InspectionTask[] {
    return this.inspections.slice();
  }

  getInspection(id: string): InspectionTask | null {
    for (let i = 0; i < this.inspections.length; i++) {
      if (this.inspections[i].id === id) {
        return this.inspections[i];
      }
    }
    return null;
  }

  saveInspection(task: InspectionTask): InspectionTask {
    const now: number = Date.now();
    if (task.id === '') {
      const created: InspectionTask = {
        id: this.genId('insp'),
        name: task.name,
        checkpointCount: task.checkpointCount,
        dueDate: task.dueDate,
        status: task.status,
        checkpoints: task.checkpoints.map((c): object => c),
        createdAt: now,
        completedAt: task.completedAt,
      } as InspectionTask;
      this.inspections.unshift(created);
      this.persist(KEY_INSPECTIONS, this.inspections);
      return created;
    }
    for (let i = 0; i < this.inspections.length; i++) {
      if (this.inspections[i].id === task.id) {
        const updated: InspectionTask = {
          id: task.id,
          name: task.name,
          checkpointCount: task.checkpointCount,
          dueDate: task.dueDate,
          status: task.status,
          checkpoints: task.checkpoints.map((c): object => c),
          createdAt: this.inspections[i].createdAt,
          completedAt: task.completedAt,
        } as InspectionTask;
        this.inspections[i] = updated;
        this.persist(KEY_INSPECTIONS, this.inspections);
        return updated;
      }
    }
    return task;
  }

  // --- Contacts ---
  getAllContacts(): EmergencyContact[] {
    // Sort: primary first, then sortOrder, then createdAt.
    const list: EmergencyContact[] = this.contacts.slice();
    list.sort((a: EmergencyContact, b: EmergencyContact): number => {
      if (a.isPrimary !== b.isPrimary) {
        return a.isPrimary ? -1 : 1;
      }
      if (a.sortOrder !== b.sortOrder) {
        return a.sortOrder - b.sortOrder;
      }
      return a.createdAt - b.createdAt;
    });
    return list;
  }

  getContact(id: string): EmergencyContact | null {
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id === id) {
        return this.contacts[i];
      }
    }
    return null;
  }

  saveContact(contact: EmergencyContact): EmergencyContact {
    const now: number = Date.now();
    if (contact.id === '') {
      const created: EmergencyContact = {
        id: this.genId('contact'),
        name: contact.name,
        role: contact.role,
        phone: contact.phone,
        isPrimary: contact.isPrimary,
        sortOrder: contact.sortOrder,
        createdAt: now,
      };
      this.contacts.push(created);
      this.persist(KEY_CONTACTS, this.contacts);
      return created;
    }
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id === contact.id) {
        const updated: EmergencyContact = {
          id: contact.id,
          name: contact.name,
          role: contact.role,
          phone: contact.phone,
          isPrimary: contact.isPrimary,
          sortOrder: contact.sortOrder,
          createdAt: this.contacts[i].createdAt,
        };
        this.contacts[i] = updated;
        this.persist(KEY_CONTACTS, this.contacts);
        return updated;
      }
    }
    return contact;
  }

  deleteContact(id: string): void {
    const next: EmergencyContact[] = [];
    for (let i = 0; i < this.contacts.length; i++) {
      if (this.contacts[i].id !== id) {
        next.push(this.contacts[i]);
      }
    }
    this.contacts = next;
    this.persist(KEY_CONTACTS, this.contacts);
  }
}
