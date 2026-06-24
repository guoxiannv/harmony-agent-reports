import { AppStore } from './Store';
import {
  AppSettings, Course, InventoryDeduction, LessonBooking, Material,
  Member, PointsTransaction, WakeRecord, WorkPhoto,
} from '../models/Models';
import { IdGen, LevelResolver } from '../utils/AppUtils';

export class MemberUpdateRequest {
  id: string = '';
  name?: string;
  phone?: string;
  avatar?: string;
  crafts?: string[];
  bio?: string;
  points?: number;
  level?: string;
  lastActiveAt?: number;
}

export class Repository {
  private store: AppStore;

  constructor(store: AppStore) {
    this.store = store;
  }

  private mergeMember(existing: Member, req: MemberUpdateRequest): Member {
    const next = new Member();
    next.id = req.id;
    next.name = req.name ?? existing.name;
    next.phone = req.phone ?? existing.phone;
    next.avatar = req.avatar ?? existing.avatar;
    next.crafts = req.crafts ?? existing.crafts;
    next.bio = req.bio ?? existing.bio;
    next.points = req.points ?? existing.points;
    next.level = req.level ?? existing.level;
    next.lastActiveAt = req.lastActiveAt ?? existing.lastActiveAt;
    next.createdAt = existing.createdAt;
    if (req.points !== undefined) {
      next.level = LevelResolver.fromPoints(next.points);
    }
    return next;
  }

  // Members
  async createMember(name: string, phone: string, crafts: string[], bio: string, avatar?: string): Promise<Member> {
    const m = new Member();
    m.id = IdGen.make();
    m.name = name;
    m.phone = phone;
    m.crafts = crafts;
    m.bio = bio;
    m.avatar = avatar;
    m.points = 0;
    m.level = '陶坯';
    m.lastActiveAt = Date.now();
    await this.store.saveMember(m);
    return m;
  }

  async updateMember(req: MemberUpdateRequest): Promise<void> {
    const existing = await this.store.getMember(req.id);
    if (!existing) return;
    const next = this.mergeMember(existing, req);
    await this.store.saveMember(next);
  }

  private makeUpdateRequest(id: string, lastActiveAt?: number, points?: number): MemberUpdateRequest {
    const req = new MemberUpdateRequest();
    req.id = id;
    req.lastActiveAt = lastActiveAt;
    req.points = points;
    return req;
  }

  async getMembers(): Promise<Member[]> {
    return this.store.getMembers();
  }

  async getMember(id: string): Promise<Member | null> {
    return this.store.getMember(id);
  }

  // Points
  async addPoints(memberId: string, amount: number, source: string, type: 'income' | 'expense' = 'income'): Promise<void> {
    const t = new PointsTransaction();
    t.id = IdGen.make();
    t.memberId = memberId;
    t.amount = amount;
    t.type = type;
    t.source = source;
    t.createdAt = Date.now();
    await this.store.addPointsTransaction(t);
    const member = await this.store.getMember(memberId);
    if (member) {
      const nextPoints = type === 'income' ? member.points + amount : Math.max(0, member.points - amount);
      await this.updateMember(this.makeUpdateRequest(member.id, Date.now(), nextPoints));
    }
  }

  async getPoints(memberId: string): Promise<PointsTransaction[]> {
    return this.store.getPoints(memberId);
  }

  async balance(memberId: string): Promise<number> {
    const list = await this.store.getPoints(memberId);
    return list.reduce((sum, t) => sum + (t.type === 'income' ? t.amount : -t.amount), 0);
  }

  // Work photos
  async addWorkPhoto(memberId: string, uri: string, caption: string = ''): Promise<WorkPhoto> {
    const p = new WorkPhoto();
    p.id = IdGen.make();
    p.memberId = memberId;
    p.uri = uri;
    p.caption = caption;
    p.createdAt = Date.now();
    await this.store.saveWorkPhoto(p);
    await this.updateMember(this.makeUpdateRequest(memberId, Date.now()));
    return p;
  }

  async getWorkPhotos(memberId: string): Promise<WorkPhoto[]> {
    return this.store.getWorkPhotos(memberId);
  }

  // Courses
  async saveCourse(course: Course): Promise<void> {
    await this.store.saveCourse(course);
  }

  async getCourses(): Promise<Course[]> {
    return this.store.getCourses();
  }

  // Materials
  async saveMaterial(material: Material): Promise<void> {
    await this.store.saveMaterial(material);
  }

  async getMaterials(): Promise<Material[]> {
    return this.store.getMaterials();
  }

  // Bookings
  async createBooking(memberId: string, courseId: string, date: string, timeSlot: string): Promise<LessonBooking | string> {
    const course = (await this.store.getCourses()).find(c => c.id === courseId);
    if (!course) return '课程不存在';

    const materials = await this.store.getMaterials();
    const deductions: InventoryDeduction[] = [];

    for (const r of course.recipe) {
      const mat = materials.find(m => m.id === r.materialId);
      if (!mat) return `缺少物料 ${r.materialId}`;
      if (mat.stock < r.amount) return `库存不足: ${mat.name} 仅剩 ${mat.stock}${mat.unit}`;
      const d = new InventoryDeduction();
      d.id = IdGen.make();
      d.materialId = mat.id;
      d.amount = r.amount;
      d.reason = `预约课程《${course.title}》`;
      d.createdAt = Date.now();
      deductions.push(d);
    }

    const b = new LessonBooking();
    b.id = IdGen.make();
    b.memberId = memberId;
    b.courseId = courseId;
    b.date = date;
    b.timeSlot = timeSlot;
    b.status = 'confirmed';
    b.createdAt = Date.now();

    for (const d of deductions) {
      d.bookingId = b.id;
      const mat = materials.find(m => m.id === d.materialId);
      if (mat) {
        mat.stock -= d.amount;
        await this.store.saveMaterial(mat);
      }
      await this.store.addDeduction(d);
    }

    await this.store.saveBooking(b);
    await this.updateMember(this.makeUpdateRequest(memberId, Date.now()));
    return b;
  }

  async cancelBooking(id: string): Promise<void> {
    const bookings = await this.store.getBookings();
    const b = bookings.find(x => x.id === id);
    if (!b || b.status === 'cancelled') return;
    b.status = 'cancelled';
    await this.store.saveBooking(b);
  }

  async getBookings(): Promise<LessonBooking[]> {
    return this.store.getBookings();
  }

  // Deductions
  async getDeductions(): Promise<InventoryDeduction[]> {
    return this.store.getDeductions();
  }

  // Dormant
  async getDormantMembers(thresholdDays: number): Promise<Member[]> {
    const members = await this.store.getMembers();
    const cutoff = Date.now() - thresholdDays * 24 * 60 * 60 * 1000;
    return members.filter(m => m.lastActiveAt < cutoff).sort((a, b) => a.lastActiveAt - b.lastActiveAt);
  }

  async wakeMember(memberId: string): Promise<void> {
    const r = new WakeRecord();
    r.id = IdGen.make();
    r.memberId = memberId;
    r.createdAt = Date.now();
    await this.store.addWakeRecord(r);
    await this.updateMember(this.makeUpdateRequest(memberId, Date.now()));
  }

  async wakeAll(memberIds: string[]): Promise<void> {
    for (const id of memberIds) {
      await this.wakeMember(id);
    }
  }

  // Settings
  async saveSettings(s: AppSettings): Promise<void> {
    await this.store.saveSettings(s);
  }

  async getSettings(): Promise<AppSettings> {
    return this.store.getSettings();
  }
}
