// Domain models for 手作·印记.
// ArkTS strict-safe: named interfaces only, no spreads, no utility types.

export interface Member {
  id: string;
  name: string;
  phone: string;
  nickname: string;
  birthday: string; // yyyy-mm-dd, '' when unset
  crafts: string[]; // craft names
  notes: string;
  allergy: string;
  workImages: string[]; // local file uri, max 6
  points: number; // balance mirror (== last tx balanceAfter)
  totalSpend: number;
  lastVisitAt: number; // ms, 0 when never visited
  createdAt: number;
}

export interface CourseMaterial {
  materialId: string;
  quantity: number; // consumed per booking
}

export interface Course {
  id: string;
  title: string;
  startAt: number; // ms
  durationMin: number;
  capacity: number;
  price: number;
  location: string;
  materials: CourseMaterial[];
  notes: string;
  createdAt: number;
}

export type BookingStatus = 'active' | 'cancelled';

export interface Booking {
  id: string;
  courseId: string;
  memberId: string;
  remark: string;
  usePoints: boolean;
  status: BookingStatus;
  createdAt: number;
}

export type PointTxType = 'earn' | 'spend' | 'checkin' | 'adjust';

export interface PointTransaction {
  id: string;
  memberId: string;
  type: PointTxType;
  amount: number; // signed
  balanceAfter: number;
  reason: string;
  refType: string; // '' when none
  refId: string; // '' when none
  createdAt: number;
}

export interface Material {
  id: string;
  name: string;
  spec: string;
  unit: string;
  stock: number;
  safeStock: number;
  notes: string;
  createdAt: number;
}

export type InventoryTxType = 'in' | 'out' | 'adjust' | 'courseConsume' | 'bookingCancel';

export interface InventoryTransaction {
  id: string;
  materialId: string;
  type: InventoryTxType;
  quantity: number; // signed
  balanceAfter: number;
  reason: string;
  refType: string;
  refId: string;
  createdAt: number;
}

export interface AppSettings {
  pointsPerYuan: number;
  checkinPoints: number;
  sleepingThresholdDays: number;
}

// Reactive slice shown on home / list rows.
export interface MemberRow {
  id: string;
  name: string;
  phone: string;
  nickname: string;
  craftsLabel: string;
  points: number;
  isSleeping: boolean;
  lastVisitLabel: string;
}

export interface CourseRow {
  id: string;
  title: string;
  startLabel: string;
  timeLabel: string;
  booked: number;
  capacity: number;
  price: number;
  isFull: boolean;
  startAt: number;
}

export interface MaterialRow {
  id: string;
  name: string;
  spec: string;
  unit: string;
  stock: number;
  safeStock: number;
  isLow: boolean;
}

export interface PointRow {
  id: string;
  type: PointTxType;
  amount: number;
  balanceAfter: number;
  reason: string;
  createdAt: number;
  memberName: string;
}

// Validation outcome used by services and pages.
export class ServiceResult {
  ok: boolean = false;
  message: string = '';
  id: string = '';

  constructor(ok: boolean, message: string, id: string) {
    this.ok = ok;
    this.message = message;
    this.id = id;
  }
}

export const CRAFT_PRESETS: string[] = ['陶艺', '木工', '皮具', '布艺', '金工', '编织', '扎染', '其他'];

// AppStorage keys — single source of truth.
export const KEY_MEMBERS = 'members';
export const KEY_COURSES = 'courses';
export const KEY_BOOKINGS = 'bookings';
export const KEY_POINT_TX = 'pointTx';
export const KEY_MATERIALS = 'materials';
export const KEY_INV_TX = 'invTx';
export const KEY_SETTINGS = 'settings';
