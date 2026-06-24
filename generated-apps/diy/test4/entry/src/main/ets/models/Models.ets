export class Member {
  id: string = '';
  name: string = '';
  phone: string = '';
  avatar?: string = undefined;
  crafts: string[] = [];
  bio: string = '';
  points: number = 0;
  level: string = '陶坯';
  lastActiveAt: number = Date.now();
  createdAt: number = Date.now();
}

export class WorkPhoto {
  id: string = '';
  memberId: string = '';
  uri: string = '';
  caption: string = '';
  createdAt: number = Date.now();
}

export type PointsType = 'income' | 'expense';

export class PointsTransaction {
  id: string = '';
  memberId: string = '';
  type: PointsType = 'income';
  amount: number = 0;
  source: string = '';
  createdAt: number = Date.now();
}

export class MaterialRecipe {
  materialId: string = '';
  amount: number = 0;
}

export class Course {
  id: string = '';
  title: string = '';
  durationMinutes: number = 60;
  recipe: MaterialRecipe[] = [];
}

export class Material {
  id: string = '';
  name: string = '';
  unit: string = '';
  stock: number = 0;
  lowStockThreshold: number = 10;
}

export type BookingStatus = 'confirmed' | 'cancelled';

export class LessonBooking {
  id: string = '';
  memberId: string = '';
  courseId: string = '';
  date: string = '';
  timeSlot: string = '';
  status: BookingStatus = 'confirmed';
  createdAt: number = Date.now();
}

export class InventoryDeduction {
  id: string = '';
  materialId: string = '';
  amount: number = 0;
  reason: string = '';
  bookingId?: string = undefined;
  createdAt: number = Date.now();
}

export class AppSettings {
  checkinPoints: number = 5;
  pointsPerYuan: number = 1;
  dormantThresholdDays: number = 30;
  currentMemberId?: string = undefined;
}

export class WakeRecord {
  id: string = '';
  memberId: string = '';
  createdAt: number = Date.now();
}
