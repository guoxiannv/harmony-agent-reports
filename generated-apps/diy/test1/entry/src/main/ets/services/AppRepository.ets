import {
  AppSettings,
  Booking,
  BookingStatus,
  Course,
  CourseMaterial,
  CourseStatus,
  InventoryItem,
  InventoryLog,
  InventoryLogType,
  Member,
  PointRecord,
  PointRecordType,
  WorkImage,
} from '../models/AppModels';
import { JsonPreferenceStore } from './JsonPreferenceStore';

export class AppRepository {
  private store: JsonPreferenceStore;

  constructor(context: Context) {
    this.store = new JsonPreferenceStore(context, 'craftmark_prefs');
  }

  // Members
  async loadMembers(): Promise<Member[]> {
    const json: string = this.store.getString('craft_members', '[]');
    try {
      return (JSON.parse(json) as Member[]).map((raw: Member) => this.toMember(raw));
    } catch (_) {
      return [];
    }
  }

  async saveMembers(items: Member[]): Promise<void> {
    await this.store.setJson('craft_members', items);
  }

  private toMember(raw: Member): Member {
    const m: Member = new Member();
    m.id = String(raw.id ?? '');
    m.name = String(raw.name ?? '');
    m.phone = String(raw.phone ?? '');
    m.avatarUri = String(raw.avatarUri ?? '');
    m.crafts = Array.isArray(raw.crafts) ? raw.crafts.map((c: string) => String(c)) : [];
    m.workImages = Array.isArray(raw.workImages) ? raw.workImages.map((w: WorkImage) => this.toWorkImage(w)) : [];
    m.pointsBalance = Number(raw.pointsBalance ?? 0);
    m.lastVisitAt = Number(raw.lastVisitAt ?? 0);
    m.createdAt = Number(raw.createdAt ?? 0);
    return m;
  }

  private toWorkImage(raw: WorkImage): WorkImage {
    const w: WorkImage = new WorkImage();
    w.id = String(raw.id ?? '');
    w.uri = String(raw.uri ?? '');
    w.caption = String(raw.caption ?? '');
    return w;
  }

  // Point records
  async loadPointRecords(): Promise<PointRecord[]> {
    const json: string = this.store.getString('craft_point_records', '[]');
    try {
      return (JSON.parse(json) as PointRecord[]).map((raw: PointRecord) => this.toPointRecord(raw));
    } catch (_) {
      return [];
    }
  }

  async savePointRecords(items: PointRecord[]): Promise<void> {
    await this.store.setJson('craft_point_records', items);
  }

  private toPointRecord(raw: PointRecord): PointRecord {
    const r: PointRecord = new PointRecord();
    r.id = String(raw.id ?? '');
    r.memberId = String(raw.memberId ?? '');
    r.type = (raw.type === 'redeem' ? 'redeem' : 'earn') as PointRecordType;
    r.source = String(raw.source ?? '');
    r.amount = Number(raw.amount ?? 0);
    r.relatedId = String(raw.relatedId ?? '');
    r.note = String(raw.note ?? '');
    r.createdAt = Number(raw.createdAt ?? 0);
    return r;
  }

  // Courses
  async loadCourses(): Promise<Course[]> {
    const json: string = this.store.getString('craft_courses', '[]');
    try {
      return (JSON.parse(json) as Course[]).map((raw: Course) => this.toCourse(raw));
    } catch (_) {
      return [];
    }
  }

  async saveCourses(items: Course[]): Promise<void> {
    await this.store.setJson('craft_courses', items);
  }

  private toCourse(raw: Course): Course {
    const c: Course = new Course();
    c.id = String(raw.id ?? '');
    c.title = String(raw.title ?? '');
    c.teacher = String(raw.teacher ?? '');
    c.startTime = Number(raw.startTime ?? 0);
    c.durationMinutes = Number(raw.durationMinutes ?? 60);
    c.capacity = Number(raw.capacity ?? 8);
    c.status = String(raw.status ?? 'open') as CourseStatus;
    c.materials = Array.isArray(raw.materials) ? raw.materials.map((m: CourseMaterial) => this.toCourseMaterial(m)) : [];
    return c;
  }

  private toCourseMaterial(raw: CourseMaterial): CourseMaterial {
    const m: CourseMaterial = new CourseMaterial();
    m.itemId = String(raw.itemId ?? '');
    m.name = String(raw.name ?? '');
    m.quantityPerStudent = Number(raw.quantityPerStudent ?? 0);
    m.unit = String(raw.unit ?? '');
    return m;
  }

  // Bookings
  async loadBookings(): Promise<Booking[]> {
    const json: string = this.store.getString('craft_bookings', '[]');
    try {
      return (JSON.parse(json) as Booking[]).map((raw: Booking) => this.toBooking(raw));
    } catch (_) {
      return [];
    }
  }

  async saveBookings(items: Booking[]): Promise<void> {
    await this.store.setJson('craft_bookings', items);
  }

  private toBooking(raw: Booking): Booking {
    const b: Booking = new Booking();
    b.id = String(raw.id ?? '');
    b.courseId = String(raw.courseId ?? '');
    b.memberId = String(raw.memberId ?? '');
    b.status = String(raw.status ?? 'pending') as BookingStatus;
    b.createdAt = Number(raw.createdAt ?? 0);
    return b;
  }

  // Inventory
  async loadInventory(): Promise<InventoryItem[]> {
    const json: string = this.store.getString('craft_inventory', '[]');
    try {
      return (JSON.parse(json) as InventoryItem[]).map((raw: InventoryItem) => this.toInventoryItem(raw));
    } catch (_) {
      return [];
    }
  }

  async saveInventory(items: InventoryItem[]): Promise<void> {
    await this.store.setJson('craft_inventory', items);
  }

  private toInventoryItem(raw: InventoryItem): InventoryItem {
    const i: InventoryItem = new InventoryItem();
    i.id = String(raw.id ?? '');
    i.name = String(raw.name ?? '');
    i.category = String(raw.category ?? '');
    i.unit = String(raw.unit ?? '');
    i.currentStock = Number(raw.currentStock ?? 0);
    i.safeStock = Number(raw.safeStock ?? 0);
    i.note = String(raw.note ?? '');
    return i;
  }

  // Inventory logs
  async loadInventoryLogs(): Promise<InventoryLog[]> {
    const json: string = this.store.getString('craft_inventory_logs', '[]');
    try {
      return (JSON.parse(json) as InventoryLog[]).map((raw: InventoryLog) => this.toInventoryLog(raw));
    } catch (_) {
      return [];
    }
  }

  async saveInventoryLogs(items: InventoryLog[]): Promise<void> {
    await this.store.setJson('craft_inventory_logs', items);
  }

  private toInventoryLog(raw: InventoryLog): InventoryLog {
    const l: InventoryLog = new InventoryLog();
    l.id = String(raw.id ?? '');
    l.itemId = String(raw.itemId ?? '');
    l.type = String(raw.type ?? 'out') as InventoryLogType;
    l.quantity = Number(raw.quantity ?? 0);
    l.courseId = String(raw.courseId ?? '');
    l.memberId = String(raw.memberId ?? '');
    l.note = String(raw.note ?? '');
    l.createdAt = Number(raw.createdAt ?? 0);
    return l;
  }

  // Settings
  async loadSettings(): Promise<AppSettings> {
    const json: string = this.store.getString('craft_settings', '{}');
    try {
      const raw: AppSettings = JSON.parse(json) as AppSettings;
      const s: AppSettings = new AppSettings();
      s.dormantThresholdDays = Number(raw.dormantThresholdDays ?? 60);
      s.pointsRatio = Number(raw.pointsRatio ?? 1);
      s.checkinPoints = Number(raw.checkinPoints ?? 10);
      s.reminderHour = Number(raw.reminderHour ?? 10);
      return s;
    } catch (_) {
      return new AppSettings();
    }
  }

  async saveSettings(settings: AppSettings): Promise<void> {
    await this.store.setJson('craft_settings', settings);
  }
}
