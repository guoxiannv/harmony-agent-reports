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
import { AppRepository } from '../services/AppRepository';
import { NotificationBadgeService } from '../services/NotificationBadgeService';

function uuid(): string {
  const arr: Uint8Array = new Uint8Array(16);
  for (let i: number = 0; i < 16; i++) {
    arr[i] = Math.floor(Math.random() * 256);
  }
  arr[6] = (arr[6] & 0x0f) | 0x40;
  arr[8] = (arr[8] & 0x3f) | 0x80;
  const hex: string[] = [];
  for (let i: number = 0; i < 16; i++) {
    hex.push(arr[i].toString(16).padStart(2, '0'));
  }
  return `${hex.slice(0, 4).join('')}-${hex.slice(4, 6).join('')}-${hex.slice(6, 8).join('')}-${hex.slice(8, 10).join('')}-${hex.slice(10, 16).join('')}`;
}

function nowMs(): number {
  return Date.now();
}

function startOfDayMs(ts: number): number {
  const d: Date = new Date(ts);
  d.setHours(0, 0, 0, 0);
  return d.getTime();
}

function endOfDayMs(ts: number): number {
  const d: Date = new Date(ts);
  d.setHours(23, 59, 59, 999);
  return d.getTime();
}

@Observed
export class AppController {
  private repository: AppRepository;
  private badgeService: NotificationBadgeService = new NotificationBadgeService();

  members: Member[] = [];
  pointRecords: PointRecord[] = [];
  courses: Course[] = [];
  bookings: Booking[] = [];
  inventory: InventoryItem[] = [];
  inventoryLogs: InventoryLog[] = [];
  settings: AppSettings = new AppSettings();

  constructor(context: Context) {
    this.repository = new AppRepository(context);
  }

  async loadAll(): Promise<void> {
    this.members = await this.repository.loadMembers();
    this.pointRecords = await this.repository.loadPointRecords();
    this.courses = await this.repository.loadCourses();
    this.bookings = await this.repository.loadBookings();
    this.inventory = await this.repository.loadInventory();
    this.inventoryLogs = await this.repository.loadInventoryLogs();
    this.settings = await this.repository.loadSettings();
    await this.updateBadge();
  }

  // Settings
  async updateSettings(patch: AppSettings): Promise<void> {
    this.settings = patch;
    await this.repository.saveSettings(this.settings);
    await this.updateBadge();
  }

  // Members
  getMemberById(id: string): Member | undefined {
    return this.members.find((m: Member) => m.id === id);
  }

  async upsertMember(draft: Member): Promise<void> {
    if (!draft.id) {
      draft.id = uuid();
      draft.createdAt = nowMs();
      this.members.push(draft);
    } else {
      const idx: number = this.members.findIndex((m: Member) => m.id === draft.id);
      if (idx >= 0) {
        this.members[idx] = draft;
      } else {
        this.members.push(draft);
      }
    }
    await this.repository.saveMembers(this.members);
  }

  async deleteMember(id: string): Promise<void> {
    this.members = this.members.filter((m: Member) => m.id !== id);
    this.pointRecords = this.pointRecords.filter((r: PointRecord) => r.memberId !== id);
    this.bookings = this.bookings.filter((b: Booking) => b.memberId !== id);
    await this.repository.saveMembers(this.members);
    await this.repository.savePointRecords(this.pointRecords);
    await this.repository.saveBookings(this.bookings);
    await this.updateBadge();
  }

  async checkin(memberId: string): Promise<void> {
    const m: Member | undefined = this.getMemberById(memberId);
    if (!m) {
      return;
    }
    m.lastVisitAt = nowMs();
    const points: number = this.settings.checkinPoints;
    m.pointsBalance += points;
    await this.addPointRecord(memberId, 'earn', 'checkin', points, '', `签到奖励 +${points}`);
    await this.repository.saveMembers(this.members);
    await this.updateBadge();
  }

  // Points
  async earnPoints(memberId: string, amount: number, source: string, relatedId: string, note: string): Promise<void> {
    if (amount <= 0) {
      return;
    }
    const m: Member | undefined = this.getMemberById(memberId);
    if (!m) {
      return;
    }
    m.pointsBalance += amount;
    await this.addPointRecord(memberId, 'earn', source, amount, relatedId, note);
    await this.repository.saveMembers(this.members);
  }

  async redeemPoints(memberId: string, amount: number, source: string, relatedId: string, note: string): Promise<boolean> {
    if (amount <= 0) {
      return false;
    }
    const m: Member | undefined = this.getMemberById(memberId);
    if (!m || m.pointsBalance < amount) {
      return false;
    }
    m.pointsBalance -= amount;
    await this.addPointRecord(memberId, 'redeem', source, amount, relatedId, note);
    await this.repository.saveMembers(this.members);
    return true;
  }

  private async addPointRecord(
    memberId: string,
    type: PointRecordType,
    source: string,
    amount: number,
    relatedId: string,
    note: string
  ): Promise<void> {
    const r: PointRecord = new PointRecord();
    r.id = uuid();
    r.memberId = memberId;
    r.type = type;
    r.source = source;
    r.amount = amount;
    r.relatedId = relatedId;
    r.note = note;
    r.createdAt = nowMs();
    this.pointRecords.unshift(r);
    await this.repository.savePointRecords(this.pointRecords);
  }

  pointsHistoryFor(memberId: string): PointRecord[] {
    return this.pointRecords
      .filter((r: PointRecord) => r.memberId === memberId)
      .sort((a: PointRecord, b: PointRecord) => b.createdAt - a.createdAt);
  }

  totalIssued(): number {
    return this.pointRecords
      .filter((r: PointRecord) => r.type === 'earn')
      .reduce((sum: number, r: PointRecord) => sum + r.amount, 0);
  }

  totalRedeemed(): number {
    return this.pointRecords
      .filter((r: PointRecord) => r.type === 'redeem')
      .reduce((sum: number, r: PointRecord) => sum + r.amount, 0);
  }

  // Courses
  async upsertCourse(draft: Course): Promise<void> {
    if (!draft.id) {
      draft.id = uuid();
      this.courses.push(draft);
    } else {
      const idx: number = this.courses.findIndex((c: Course) => c.id === draft.id);
      if (idx >= 0) {
        this.courses[idx] = draft;
      } else {
        this.courses.push(draft);
      }
    }
    await this.repository.saveCourses(this.courses);
  }

  async deleteCourse(id: string): Promise<void> {
    this.courses = this.courses.filter((c: Course) => c.id !== id);
    this.bookings = this.bookings.filter((b: Booking) => b.courseId !== id);
    await this.repository.saveCourses(this.courses);
    await this.repository.saveBookings(this.bookings);
  }

  getCourseById(id: string): Course | undefined {
    return this.courses.find((c: Course) => c.id === id);
  }

  coursesForDay(ts: number): Course[] {
    const start: number = startOfDayMs(ts);
    const end: number = endOfDayMs(ts);
    return this.courses
      .filter((c: Course) => c.startTime >= start && c.startTime <= end)
      .sort((a: Course, b: Course) => a.startTime - b.startTime);
  }

  // Bookings
  async bookCourse(courseId: string, memberId: string): Promise<'ok' | 'full' | 'exists'> {
    const existing: Booking | undefined = this.bookings.find(
      (b: Booking) => b.courseId === courseId && b.memberId === memberId && b.status !== 'cancelled'
    );
    if (existing) {
      return 'exists';
    }
    const confirmedCount: number = this.bookings.filter(
      (b: Booking) => b.courseId === courseId && b.status === 'confirmed'
    ).length;
    const course: Course | undefined = this.getCourseById(courseId);
    if (course && confirmedCount >= course.capacity) {
      return 'full';
    }
    const b: Booking = new Booking();
    b.id = uuid();
    b.courseId = courseId;
    b.memberId = memberId;
    b.status = 'confirmed';
    b.createdAt = nowMs();
    this.bookings.push(b);
    await this.repository.saveBookings(this.bookings);
    return 'ok';
  }

  async cancelBooking(bookingId: string): Promise<void> {
    const b: Booking | undefined = this.bookings.find((item: Booking) => item.id === bookingId);
    if (b) {
      b.status = 'cancelled';
      await this.repository.saveBookings(this.bookings);
    }
  }

  bookingsForCourse(courseId: string): Booking[] {
    return this.bookings.filter((b: Booking) => b.courseId === courseId && b.status !== 'cancelled');
  }

  bookingsForMember(memberId: string): Booking[] {
    return this.bookings.filter((b: Booking) => b.memberId === memberId && b.status !== 'cancelled');
  }

  // Inventory
  async upsertInventoryItem(draft: InventoryItem): Promise<void> {
    if (!draft.id) {
      draft.id = uuid();
      this.inventory.push(draft);
    } else {
      const idx: number = this.inventory.findIndex((i: InventoryItem) => i.id === draft.id);
      if (idx >= 0) {
        this.inventory[idx] = draft;
      } else {
        this.inventory.push(draft);
      }
    }
    await this.repository.saveInventory(this.inventory);
  }

  async deleteInventoryItem(id: string): Promise<void> {
    this.inventory = this.inventory.filter((i: InventoryItem) => i.id !== id);
    await this.repository.saveInventory(this.inventory);
  }

  getInventoryItemById(id: string): InventoryItem | undefined {
    return this.inventory.find((i: InventoryItem) => i.id === id);
  }

  async adjustStock(itemId: string, delta: number, note: string): Promise<void> {
    const item: InventoryItem | undefined = this.getInventoryItemById(itemId);
    if (!item) {
      return;
    }
    item.currentStock += delta;
    const log: InventoryLog = new InventoryLog();
    log.id = uuid();
    log.itemId = itemId;
    log.type = delta >= 0 ? 'in' : 'out';
    log.quantity = Math.abs(delta);
    log.note = note;
    log.createdAt = nowMs();
    this.inventoryLogs.unshift(log);
    await this.repository.saveInventory(this.inventory);
    await this.repository.saveInventoryLogs(this.inventoryLogs);
  }

  async deductCourseMaterials(courseId: string): Promise<void> {
    const course: Course | undefined = this.getCourseById(courseId);
    if (!course || course.status === 'completed') {
      return;
    }
    const students: Booking[] = this.bookingsForCourse(courseId).filter(
      (b: Booking) => b.status === 'confirmed' || b.status === 'completed'
    );
    const count: number = students.length || 0;
    if (count === 0 || course.materials.length === 0) {
      course.status = 'completed';
      await this.repository.saveCourses(this.courses);
      return;
    }
    for (const mat of course.materials) {
      const item: InventoryItem | undefined = this.getInventoryItemById(mat.itemId);
      if (!item) {
        continue;
      }
      const deductQty: number = mat.quantityPerStudent * count;
      item.currentStock = Math.max(0, item.currentStock - deductQty);
      const log: InventoryLog = new InventoryLog();
      log.id = uuid();
      log.itemId = item.id;
      log.type = 'auto-deduct';
      log.quantity = deductQty;
      log.courseId = courseId;
      log.note = `课程「${course.title}」消耗 ${mat.name}`;
      log.createdAt = nowMs();
      this.inventoryLogs.unshift(log);
    }
    course.status = 'completed';
    for (const b of students) {
      b.status = 'completed';
    }
    await this.repository.saveInventory(this.inventory);
    await this.repository.saveInventoryLogs(this.inventoryLogs);
    await this.repository.saveBookings(this.bookings);
    await this.repository.saveCourses(this.courses);
  }

  logsForItem(itemId: string): InventoryLog[] {
    return this.inventoryLogs
      .filter((l: InventoryLog) => l.itemId === itemId)
      .sort((a: InventoryLog, b: InventoryLog) => b.createdAt - a.createdAt);
  }

  logsByType(type: InventoryLogType | 'all'): InventoryLog[] {
    if (type === 'all') {
      return this.inventoryLogs.sort((a: InventoryLog, b: InventoryLog) => b.createdAt - a.createdAt);
    }
    return this.inventoryLogs
      .filter((l: InventoryLog) => l.type === type)
      .sort((a: InventoryLog, b: InventoryLog) => b.createdAt - a.createdAt);
  }

  // Derived
  dormantMembers(): Member[] {
    const thresholdMs: number = this.settings.dormantThresholdDays * 24 * 60 * 60 * 1000;
    const now: number = nowMs();
    return this.members
      .filter((m: Member) => now - m.lastVisitAt > thresholdMs)
      .sort((a: Member, b: Member) => a.lastVisitAt - b.lastVisitAt);
  }

  lowStockItems(): InventoryItem[] {
    return this.inventory.filter((i: InventoryItem) => i.currentStock <= i.safeStock);
  }

  filteredMembers(query: string, craft?: string): Member[] {
    const q: string = query.trim().toLowerCase();
    return this.members
      .filter((m: Member) => {
        const matchesQuery: boolean =
          !q || m.name.toLowerCase().includes(q) || m.phone.includes(q);
        const matchesCraft: boolean = !craft || m.crafts.includes(craft);
        return matchesQuery && matchesCraft;
      })
      .sort((a: Member, b: Member) => b.createdAt - a.createdAt);
  }

  memberName(id: string): string {
    return this.getMemberById(id)?.name ?? '';
  }

  courseTitle(id: string): string {
    return this.getCourseById(id)?.title ?? '';
  }

  inventoryName(id: string): string {
    return this.getInventoryItemById(id)?.name ?? '';
  }

  private async updateBadge(): Promise<void> {
    const count: number = this.dormantMembers().length + this.lowStockItems().length;
    await this.badgeService.setBadge(count);
  }
}
