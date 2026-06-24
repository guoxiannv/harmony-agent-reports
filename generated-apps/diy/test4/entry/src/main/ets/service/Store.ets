import { relationalStore } from '@kit.ArkData';
import { Context } from '@kit.AbilityKit';
import {
  AppSettings, Course, InventoryDeduction, LessonBooking, Material,
  Member, PointsTransaction, WakeRecord, WorkPhoto,
} from '../models/Models';

const DB_NAME = 'shouzuo_yinji.db';

class SettingsRow {
  key: string = '';
  value: string = '';
}

const SCHEMA = `
CREATE TABLE IF NOT EXISTS members (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  avatar TEXT,
  crafts TEXT,
  bio TEXT,
  points INTEGER DEFAULT 0,
  level TEXT,
  lastActiveAt INTEGER,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS work_photos (
  id TEXT PRIMARY KEY,
  memberId TEXT NOT NULL,
  uri TEXT NOT NULL,
  caption TEXT,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS points_transactions (
  id TEXT PRIMARY KEY,
  memberId TEXT NOT NULL,
  type TEXT NOT NULL,
  amount INTEGER NOT NULL,
  source TEXT NOT NULL,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS courses (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  durationMinutes INTEGER,
  recipe TEXT
);
CREATE TABLE IF NOT EXISTS materials (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  unit TEXT,
  stock INTEGER,
  lowStockThreshold INTEGER
);
CREATE TABLE IF NOT EXISTS bookings (
  id TEXT PRIMARY KEY,
  memberId TEXT NOT NULL,
  courseId TEXT NOT NULL,
  date TEXT NOT NULL,
  timeSlot TEXT NOT NULL,
  status TEXT NOT NULL,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS deductions (
  id TEXT PRIMARY KEY,
  materialId TEXT NOT NULL,
  amount INTEGER NOT NULL,
  reason TEXT,
  bookingId TEXT,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS wake_records (
  id TEXT PRIMARY KEY,
  memberId TEXT NOT NULL,
  createdAt INTEGER
);
CREATE TABLE IF NOT EXISTS settings (
  key TEXT PRIMARY KEY,
  value TEXT
);
`;

export class AppStore {
  private rdb: relationalStore.RdbStore | null = null;

  async init(context: Context): Promise<void> {
    if (this.rdb) return;
    const config: relationalStore.StoreConfig = {
      name: DB_NAME,
      securityLevel: relationalStore.SecurityLevel.S1,
    };
    this.rdb = await relationalStore.getRdbStore(context, config);
    await this.execSchema();
  }

  private async execSchema(): Promise<void> {
    if (!this.rdb) return;
    const statements = SCHEMA.split(';').map(s => s.trim()).filter(Boolean);
    for (const stmt of statements) {
      await this.rdb.executeSql(stmt);
    }
  }

  // Members
  async saveMember(m: Member): Promise<void> {
    const values = this.memberToBucket(m);
    await this.upsert('members', values);
  }

  async deleteMember(id: string): Promise<void> {
    const predicates = new relationalStore.RdbPredicates('members');
    predicates.equalTo('id', id);
    await this.rdb?.delete(predicates);
  }

  async getMembers(): Promise<Member[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('members').orderByDesc('createdAt'));
    return this.readAll(result, this.rowToMember);
  }

  async getMember(id: string): Promise<Member | null> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('members').equalTo('id', id));
    const rows = this.readAll(result, this.rowToMember);
    return rows[0] ?? null;
  }

  // WorkPhotos
  async saveWorkPhoto(p: WorkPhoto): Promise<void> {
    await this.upsert('work_photos', this.workPhotoToBucket(p));
  }

  async getWorkPhotos(memberId: string): Promise<WorkPhoto[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('work_photos').equalTo('memberId', memberId).orderByDesc('createdAt'));
    return this.readAll(result, this.rowToWorkPhoto);
  }

  // Points
  async addPointsTransaction(t: PointsTransaction): Promise<void> {
    await this.upsert('points_transactions', this.pointsToBucket(t));
  }

  async getPoints(memberId: string): Promise<PointsTransaction[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('points_transactions').equalTo('memberId', memberId).orderByDesc('createdAt'));
    return this.readAll(result, this.rowToPoints);
  }

  // Courses
  async saveCourse(c: Course): Promise<void> {
    await this.upsert('courses', this.courseToBucket(c));
  }

  async getCourses(): Promise<Course[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('courses').orderByAsc('title'));
    return this.readAll(result, this.rowToCourse);
  }

  // Materials
  async saveMaterial(m: Material): Promise<void> {
    await this.upsert('materials', this.materialToBucket(m));
  }

  async getMaterials(): Promise<Material[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('materials').orderByAsc('name'));
    return this.readAll(result, this.rowToMaterial);
  }

  // Bookings
  async saveBooking(b: LessonBooking): Promise<void> {
    await this.upsert('bookings', this.bookingToBucket(b));
  }

  async getBookings(): Promise<LessonBooking[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('bookings').orderByDesc('createdAt'));
    return this.readAll(result, this.rowToBooking);
  }

  // Deductions
  async addDeduction(d: InventoryDeduction): Promise<void> {
    await this.upsert('deductions', this.deductionToBucket(d));
  }

  async getDeductions(): Promise<InventoryDeduction[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('deductions').orderByDesc('createdAt'));
    return this.readAll(result, this.rowToDeduction);
  }

  // Wake records
  async addWakeRecord(r: WakeRecord): Promise<void> {
    await this.upsert('wake_records', this.wakeToBucket(r));
  }

  async getWakeRecords(memberId: string): Promise<WakeRecord[]> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('wake_records').equalTo('memberId', memberId).orderByDesc('createdAt'));
    return this.readAll(result, this.rowToWake);
  }

  // Settings
  async saveSettings(s: AppSettings): Promise<void> {
    const values: relationalStore.ValuesBucket[] = [
      { key: 'checkinPoints', value: String(s.checkinPoints) },
      { key: 'pointsPerYuan', value: String(s.pointsPerYuan) },
      { key: 'dormantThresholdDays', value: String(s.dormantThresholdDays) },
      { key: 'currentMemberId', value: s.currentMemberId ?? '' },
    ];
    for (const v of values) {
      await this.upsert('settings', v);
    }
  }

  async getSettings(): Promise<AppSettings> {
    const result = await this.rdb?.query(new relationalStore.RdbPredicates('settings'));
    const rows = this.readAll(result, (r): SettingsRow => {
      const row = new SettingsRow();
      row.key = r.getString(0);
      row.value = r.getString(1);
      return row;
    });
    const settings = new AppSettings();
    for (const row of rows) {
      if (row.key === 'checkinPoints') settings.checkinPoints = Number(row.value) || 5;
      if (row.key === 'pointsPerYuan') settings.pointsPerYuan = Number(row.value) || 1;
      if (row.key === 'dormantThresholdDays') settings.dormantThresholdDays = Number(row.value) || 30;
      if (row.key === 'currentMemberId') settings.currentMemberId = row.value || undefined;
    }
    return settings;
  }

  private async upsert(table: string, values: relationalStore.ValuesBucket): Promise<void> {
    await this.rdb?.insert(table, values, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
  }

  private readAll<T>(result: relationalStore.ResultSet | undefined, mapper: (row: relationalStore.ResultSet) => T): T[] {
    if (!result) return [];
    const rows: T[] = [];
    while (result.goToNextRow()) {
      rows.push(mapper(result));
    }
    result.close();
    return rows;
  }

  private memberToBucket(m: Member): relationalStore.ValuesBucket {
    return {
      id: m.id, name: m.name, phone: m.phone, avatar: m.avatar ?? '', crafts: JSON.stringify(m.crafts), bio: m.bio,
      points: m.points, level: m.level, lastActiveAt: m.lastActiveAt, createdAt: m.createdAt,
    };
  }

  private rowToMember(r: relationalStore.ResultSet): Member {
    const m = new Member();
    m.id = r.getString(0); m.name = r.getString(1); m.phone = r.getString(2); m.avatar = r.getString(3) || undefined;
    try { m.crafts = JSON.parse(r.getString(4)); } catch { m.crafts = []; }
    m.bio = r.getString(5); m.points = r.getLong(6); m.level = r.getString(7);
    m.lastActiveAt = r.getLong(8); m.createdAt = r.getLong(9);
    return m;
  }

  private workPhotoToBucket(p: WorkPhoto): relationalStore.ValuesBucket {
    return { id: p.id, memberId: p.memberId, uri: p.uri, caption: p.caption, createdAt: p.createdAt };
  }

  private rowToWorkPhoto(r: relationalStore.ResultSet): WorkPhoto {
    const p = new WorkPhoto();
    p.id = r.getString(0); p.memberId = r.getString(1); p.uri = r.getString(2); p.caption = r.getString(3); p.createdAt = r.getLong(4);
    return p;
  }

  private pointsToBucket(t: PointsTransaction): relationalStore.ValuesBucket {
    return { id: t.id, memberId: t.memberId, type: t.type, amount: t.amount, source: t.source, createdAt: t.createdAt };
  }

  private rowToPoints(r: relationalStore.ResultSet): PointsTransaction {
    const t = new PointsTransaction();
    t.id = r.getString(0); t.memberId = r.getString(1); t.type = r.getString(2) as 'income' | 'expense';
    t.amount = r.getLong(3); t.source = r.getString(4); t.createdAt = r.getLong(5);
    return t;
  }

  private courseToBucket(c: Course): relationalStore.ValuesBucket {
    return { id: c.id, title: c.title, durationMinutes: c.durationMinutes, recipe: JSON.stringify(c.recipe) };
  }

  private rowToCourse(r: relationalStore.ResultSet): Course {
    const c = new Course();
    c.id = r.getString(0); c.title = r.getString(1); c.durationMinutes = r.getLong(2);
    try { c.recipe = JSON.parse(r.getString(3)); } catch { c.recipe = []; }
    return c;
  }

  private materialToBucket(m: Material): relationalStore.ValuesBucket {
    return { id: m.id, name: m.name, unit: m.unit, stock: m.stock, lowStockThreshold: m.lowStockThreshold };
  }

  private rowToMaterial(r: relationalStore.ResultSet): Material {
    const m = new Material();
    m.id = r.getString(0); m.name = r.getString(1); m.unit = r.getString(2);
    m.stock = r.getLong(3); m.lowStockThreshold = r.getLong(4);
    return m;
  }

  private bookingToBucket(b: LessonBooking): relationalStore.ValuesBucket {
    return { id: b.id, memberId: b.memberId, courseId: b.courseId, date: b.date, timeSlot: b.timeSlot, status: b.status, createdAt: b.createdAt };
  }

  private rowToBooking(r: relationalStore.ResultSet): LessonBooking {
    const b = new LessonBooking();
    b.id = r.getString(0); b.memberId = r.getString(1); b.courseId = r.getString(2);
    b.date = r.getString(3); b.timeSlot = r.getString(4); b.status = r.getString(5) as 'confirmed' | 'cancelled'; b.createdAt = r.getLong(6);
    return b;
  }

  private deductionToBucket(d: InventoryDeduction): relationalStore.ValuesBucket {
    return { id: d.id, materialId: d.materialId, amount: d.amount, reason: d.reason, bookingId: d.bookingId ?? '', createdAt: d.createdAt };
  }

  private rowToDeduction(r: relationalStore.ResultSet): InventoryDeduction {
    const d = new InventoryDeduction();
    d.id = r.getString(0); d.materialId = r.getString(1); d.amount = r.getLong(2);
    d.reason = r.getString(3); d.bookingId = r.getString(4) || undefined; d.createdAt = r.getLong(5);
    return d;
  }

  private wakeToBucket(r: WakeRecord): relationalStore.ValuesBucket {
    return { id: r.id, memberId: r.memberId, createdAt: r.createdAt };
  }

  private rowToWake(r: relationalStore.ResultSet): WakeRecord {
    const w = new WakeRecord();
    w.id = r.getString(0); w.memberId = r.getString(1); w.createdAt = r.getLong(2);
    return w;
  }
}
