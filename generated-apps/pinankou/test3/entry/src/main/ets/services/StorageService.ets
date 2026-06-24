import { SafetyNote } from '../model/SafetyNote';
import { Hazard, HazardComment } from '../model/Hazard';
import { Inspection } from '../model/Inspection';
import { Contact } from '../model/Contact';
import { Activity, ActivityKind } from '../model/Activity';
import { generateId } from './IdGenerator';

const KEY_NOTES = 'pinankou_notes';
const KEY_HAZARDS = 'pinankou_hazards';
const KEY_COMMENTS = 'pinankou_comments';
const KEY_INSPECTIONS = 'pinankou_inspections';
const KEY_CONTACTS = 'pinankou_contacts';

export class StorageService {
  private static instance: StorageService;
  private notes: SafetyNote[] = [];
  private hazards: Hazard[] = [];
  private comments: HazardComment[] = [];
  private inspections: Inspection[] = [];
  private contacts: Contact[] = [];

  static getInstance(): StorageService {
    if (!StorageService.instance) {
      StorageService.instance = new StorageService();
    }
    return StorageService.instance;
  }

  private constructor() {
    this.loadAll();
  }

  // SafetyNote
  listNotes(): SafetyNote[] {
    return [...this.notes].sort((a, b) => b.updatedAt - a.updatedAt);
  }

  getNote(id: string): SafetyNote | undefined {
    return this.notes.find(n => n.id === id);
  }

  saveNote(note: SafetyNote): SafetyNote {
    const now = Date.now();
    if (!note.id) {
      note.id = generateId('note');
      note.createdAt = now;
    }
    note.updatedAt = now;
    const idx = this.notes.findIndex(n => n.id === note.id);
    if (idx >= 0) {
      this.notes[idx] = note;
    } else {
      this.notes.push(note);
    }
    this.persistNotes();
    return note;
  }

  deleteNote(id: string): void {
    this.notes = this.notes.filter(n => n.id !== id);
    this.persistNotes();
  }

  // Hazard
  listHazards(): Hazard[] {
    return [...this.hazards].sort((a, b) => b.updatedAt - a.updatedAt);
  }

  getHazard(id: string): Hazard | undefined {
    return this.hazards.find(h => h.id === id);
  }

  saveHazard(hazard: Hazard): Hazard {
    const now = Date.now();
    if (!hazard.id) {
      hazard.id = generateId('hazard');
      hazard.createdAt = now;
    }
    hazard.updatedAt = now;
    const idx = this.hazards.findIndex(h => h.id === hazard.id);
    if (idx >= 0) {
      this.hazards[idx] = hazard;
    } else {
      this.hazards.push(hazard);
    }
    this.persistHazards();
    return hazard;
  }

  deleteHazard(id: string): void {
    this.hazards = this.hazards.filter(h => h.id !== id);
    this.comments = this.comments.filter(c => c.hazardId !== id);
    this.persistHazards();
    this.persistComments();
  }

  // Comments
  listCommentsByHazard(hazardId: string): HazardComment[] {
    return this.comments
      .filter(c => c.hazardId === hazardId)
      .sort((a, b) => a.createdAt - b.createdAt);
  }

  addComment(hazardId: string, content: string): HazardComment {
    const comment = new HazardComment({
      id: generateId('comment'),
      hazardId,
      content: content.trim(),
      createdAt: Date.now()
    });
    this.comments.push(comment);
    this.persistComments();
    const hazard = this.getHazard(hazardId);
    if (hazard) {
      hazard.updatedAt = Date.now();
      this.persistHazards();
    }
    return comment;
  }

  // Inspection
  listInspections(): Inspection[] {
    return [...this.inspections].sort((a, b) => b.updatedAt - a.updatedAt);
  }

  getInspection(id: string): Inspection | undefined {
    return this.inspections.find(i => i.id === id);
  }

  saveInspection(inspection: Inspection): Inspection {
    const now = Date.now();
    if (!inspection.id) {
      inspection.id = generateId('inspection');
      inspection.createdAt = now;
    }
    inspection.updatedAt = now;
    const idx = this.inspections.findIndex(i => i.id === inspection.id);
    if (idx >= 0) {
      this.inspections[idx] = inspection;
    } else {
      this.inspections.push(inspection);
    }
    this.persistInspections();
    return inspection;
  }

  deleteInspection(id: string): void {
    this.inspections = this.inspections.filter(i => i.id !== id);
    this.persistInspections();
  }

  // Contact
  listContacts(): Contact[] {
    return [...this.contacts].sort((a, b) => b.createdAt - a.createdAt);
  }

  getContact(id: string): Contact | undefined {
    return this.contacts.find(c => c.id === id);
  }

  saveContact(contact: Contact): Contact {
    const now = Date.now();
    if (!contact.id) {
      contact.id = generateId('contact');
      contact.createdAt = now;
    }
    contact.updatedAt = now;
    const idx = this.contacts.findIndex(c => c.id === contact.id);
    if (idx >= 0) {
      this.contacts[idx] = contact;
    } else {
      this.contacts.push(contact);
    }
    this.persistContacts();
    return contact;
  }

  deleteContact(id: string): void {
    this.contacts = this.contacts.filter(c => c.id !== id);
    this.persistContacts();
  }

  searchContacts(query: string): Contact[] {
    const q = query.trim().toLowerCase();
    if (!q) return this.listContacts();
    return this.listContacts().filter(c =>
      c.name.toLowerCase().includes(q) ||
      c.role.toLowerCase().includes(q) ||
      c.department.toLowerCase().includes(q)
    );
  }

  // Reset
  resetAll(): void {
    this.notes = [];
    this.hazards = [];
    this.comments = [];
    this.inspections = [];
    this.contacts = [];
    this.persistAll();
  }

  // Activities feed
  recentActivities(limit: number = 20): Activity[] {
    const out: Activity[] = [];
    this.hazards.forEach(h => {
      out.push(new Activity({
        id: generateId('act'),
        kind: ActivityKind.HAZARD,
        entityId: h.id,
        title: h.title,
        subtitle: `风险等级: ${h.level}`,
        timestamp: h.updatedAt
      }));
    });
    this.inspections.forEach(i => {
      out.push(new Activity({
        id: generateId('act'),
        kind: ActivityKind.INSPECTION,
        entityId: i.id,
        title: i.title,
        subtitle: `状态: ${i.status}`,
        timestamp: i.updatedAt
      }));
    });
    this.notes.forEach(n => {
      out.push(new Activity({
        id: generateId('act'),
        kind: ActivityKind.SAFETY_NOTE,
        entityId: n.id,
        title: n.title,
        subtitle: n.isDone ? '已完成' : '待处理',
        timestamp: n.updatedAt
      }));
    });
    return out.sort((a, b) => b.timestamp - a.timestamp).slice(0, limit);
  }

  private loadAll(): void {
    try {
      this.notes = JSON.parse(AppStorage.get(KEY_NOTES) || '[]') as SafetyNote[];
      this.hazards = JSON.parse(AppStorage.get(KEY_HAZARDS) || '[]') as Hazard[];
      this.comments = JSON.parse(AppStorage.get(KEY_COMMENTS) || '[]') as HazardComment[];
      this.inspections = JSON.parse(AppStorage.get(KEY_INSPECTIONS) || '[]') as Inspection[];
      this.contacts = JSON.parse(AppStorage.get(KEY_CONTACTS) || '[]') as Contact[];
    } catch (e) {
      this.notes = [];
      this.hazards = [];
      this.comments = [];
      this.inspections = [];
      this.contacts = [];
    }
  }

  private persistAll(): void {
    this.persistNotes();
    this.persistHazards();
    this.persistComments();
    this.persistInspections();
    this.persistContacts();
  }

  private persistNotes(): void {
    AppStorage.setOrCreate(KEY_NOTES, JSON.stringify(this.notes));
  }

  private persistHazards(): void {
    AppStorage.setOrCreate(KEY_HAZARDS, JSON.stringify(this.hazards));
  }

  private persistComments(): void {
    AppStorage.setOrCreate(KEY_COMMENTS, JSON.stringify(this.comments));
  }

  private persistInspections(): void {
    AppStorage.setOrCreate(KEY_INSPECTIONS, JSON.stringify(this.inspections));
  }

  private persistContacts(): void {
    AppStorage.setOrCreate(KEY_CONTACTS, JSON.stringify(this.contacts));
  }
}
