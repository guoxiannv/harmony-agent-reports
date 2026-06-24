import { AppSettings, Course, InventoryDeduction, LessonBooking, Material, Member, PointsTransaction, WorkPhoto } from '../models/Models';
import { Repository, MemberUpdateRequest } from '../service/Repository';
import { AppStore } from '../service/Store';
import { LevelResolver } from '../utils/AppUtils';

@Observed
export class AppState {
  members: Member[] = [];
  courses: Course[] = [];
  materials: Material[] = [];
  bookings: LessonBooking[] = [];
  deductions: InventoryDeduction[] = [];
  currentPoints: PointsTransaction[] = [];
  currentWorks: WorkPhoto[] = [];

  settings: AppSettings = new AppSettings();
  currentMemberId: string = '';

  ready: boolean = false;
  error: string = '';

  currentMember(): Member | null {
    return this.members.find(m => m.id === this.currentMemberId) ?? null;
  }

  balance(memberId: string): number {
    return this.members.find(m => m.id === memberId)?.points ?? 0;
  }

  levelName(memberId: string): string {
    const m = this.members.find(x => x.id === memberId);
    return m ? LevelResolver.fromPoints(m.points) : '陶坯';
  }

  dormantMembers(): Member[] {
    const cutoff = Date.now() - this.settings.dormantThresholdDays * 24 * 60 * 60 * 1000;
    return this.members.filter(m => m.lastActiveAt < cutoff).sort((a, b) => a.lastActiveAt - b.lastActiveAt);
  }

  bookingsForDate(date: string): LessonBooking[] {
    return this.bookings.filter(b => b.date === date && b.status === 'confirmed');
  }

  lowStockCount(): number {
    return this.materials.filter(m => m.stock <= m.lowStockThreshold).length;
  }
}

export class MemberUpdateInput {
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

export class MaterialSeed {
  name: string = '';
  unit: string = '';
  stock: number = 0;
  low: number = 0;
}

export class AppController {
  private repo: Repository;
  state: AppState = new AppState();

  static makeRepo(): Repository {
    const store = new AppStore();
    return new Repository(store);
  }

  constructor(repo: Repository, state: AppState) {
    this.repo = repo;
    this.state = state;
  }

  async init(): Promise<void> {
    try {
      this.state.settings = await this.repo.getSettings();
      this.state.currentMemberId = this.state.settings.currentMemberId ?? '';
      await this.refreshAll();
      this.state.ready = true;
    } catch (err) {
      this.state.error = String(err);
    }
  }

  async refreshAll(): Promise<void> {
    const members = await this.repo.getMembers();
    const courses = await this.repo.getCourses();
    const materials = await this.repo.getMaterials();
    const bookings = await this.repo.getBookings();
    const deductions = await this.repo.getDeductions();
    this.state.members = members;
    this.state.courses = courses;
    this.state.materials = materials;
    this.state.bookings = bookings;
    this.state.deductions = deductions;
    if (this.state.currentMemberId.length > 0) {
      this.state.currentPoints = await this.repo.getPoints(this.state.currentMemberId);
      this.state.currentWorks = await this.repo.getWorkPhotos(this.state.currentMemberId);
    } else {
      this.state.currentPoints = [];
      this.state.currentWorks = [];
    }
  }

  async setCurrentMember(id: string): Promise<void> {
    this.state.currentMemberId = id;
    this.state.settings.currentMemberId = id;
    await this.repo.saveSettings(this.state.settings);
    await this.refreshAll();
  }

  async checkinCurrent(): Promise<string | void> {
    const id = this.state.currentMemberId;
    if (id.length === 0) return '请先选择会员';
    await this.repo.addPoints(id, this.state.settings.checkinPoints, '每日签到');
    await this.refreshAll();
  }

  async addMember(name: string, phone: string, crafts: string[], bio: string, avatar?: string): Promise<void> {
    const m = await this.repo.createMember(name, phone, crafts, bio, avatar);
    if (this.state.currentMemberId.length === 0) {
      await this.setCurrentMember(m.id);
    } else {
      await this.refreshAll();
    }
  }

  async updateMember(req: MemberUpdateInput): Promise<void> {
    const request = new MemberUpdateRequest();
    request.id = req.id;
    request.name = req.name;
    request.phone = req.phone;
    request.avatar = req.avatar;
    request.crafts = req.crafts;
    request.bio = req.bio;
    request.points = req.points;
    request.level = req.level;
    request.lastActiveAt = req.lastActiveAt;
    await this.repo.updateMember(request);
    await this.refreshAll();
  }

  async addWorkPhoto(memberId: string, uri: string, caption: string = ''): Promise<void> {
    await this.repo.addWorkPhoto(memberId, uri, caption);
    await this.refreshAll();
  }

  async addPoints(memberId: string, amount: number, source: string, type: 'income' | 'expense' = 'income'): Promise<void> {
    await this.repo.addPoints(memberId, amount, source, type);
    await this.refreshAll();
  }

  async createBooking(memberId: string, courseId: string, date: string, timeSlot: string): Promise<LessonBooking | string> {
    const result = await this.repo.createBooking(memberId, courseId, date, timeSlot);
    await this.refreshAll();
    return result;
  }

  async cancelBooking(id: string): Promise<void> {
    await this.repo.cancelBooking(id);
    await this.refreshAll();
  }

  async addMaterial(name: string, unit: string, stock: number, lowStockThreshold: number): Promise<void> {
    const m = new Material();
    m.id = IdGen.makeStatic();
    m.name = name;
    m.unit = unit;
    m.stock = stock;
    m.lowStockThreshold = lowStockThreshold;
    await this.repo.saveMaterial(m);
    await this.refreshAll();
  }

  async saveMaterial(m: Material): Promise<void> {
    await this.repo.saveMaterial(m);
    await this.refreshAll();
  }

  async wakeMember(memberId: string): Promise<void> {
    await this.repo.wakeMember(memberId);
    await this.refreshAll();
  }

  async wakeAllDormant(): Promise<void> {
    const ids = this.state.dormantMembers().map(m => m.id);
    await this.repo.wakeAll(ids);
    await this.refreshAll();
  }

  async updateSettings(partial: AppSettingsPatch): Promise<void> {
    const next = new AppSettings();
    next.checkinPoints = partial.checkinPoints ?? this.state.settings.checkinPoints;
    next.pointsPerYuan = partial.pointsPerYuan ?? this.state.settings.pointsPerYuan;
    next.dormantThresholdDays = partial.dormantThresholdDays ?? this.state.settings.dormantThresholdDays;
    next.currentMemberId = partial.currentMemberId ?? this.state.settings.currentMemberId;
    this.state.settings = next;
    await this.repo.saveSettings(this.state.settings);
  }

  async ensureSeedData(): Promise<void> {
    if (this.state.courses.length === 0) {
      const titles = ['拉坯体验课', '釉下彩绘制', '手捏陶杯'];
      const durations = [90, 120, 90];
      for (let i = 0; i < titles.length; i++) {
        const c = new Course();
        c.id = IdGen.makeStatic();
        c.title = titles[i];
        c.durationMinutes = durations[i];
        c.recipe = [];
        await this.repo.saveCourse(c);
      }
    }

    if (this.state.materials.length === 0) {
      const seeds: MaterialSeed[] = [
        { name: '高岭土', unit: 'kg', stock: 50, low: 10 },
        { name: '釉料', unit: '瓶', stock: 20, low: 5 },
        { name: '素坯杯', unit: '个', stock: 30, low: 8 },
        { name: '彩料', unit: '套', stock: 12, low: 3 },
      ];
      for (const d of seeds) {
        const m = new Material();
        m.id = IdGen.makeStatic();
        m.name = d.name;
        m.unit = d.unit;
        m.stock = d.stock;
        m.lowStockThreshold = d.low;
        await this.repo.saveMaterial(m);
      }
    }

    await this.refreshAll();
  }
}

export class AppSettingsPatch {
  checkinPoints?: number;
  pointsPerYuan?: number;
  dormantThresholdDays?: number;
  currentMemberId?: string;
}

export class IdGen {
  static makeStatic(): string {
    return `${Date.now()}_${Math.floor(Math.random() * 1000000)}`;
  }
}
