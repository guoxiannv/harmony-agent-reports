export type CraftTag =
  | 'pottery'
  | 'woodwork'
  | 'leather'
  | 'floristry'
  | 'silver'
  | 'textile'
  | 'other';

export interface CraftTagLabelMap {
  pottery: string;
  woodwork: string;
  leather: string;
  floristry: string;
  silver: string;
  textile: string;
  other: string;
}

export const CRAFT_TAG_LABELS: CraftTagLabelMap = {
  pottery: '陶艺',
  woodwork: '木作',
  leather: '皮具',
  floristry: '花艺',
  silver: '银饰',
  textile: '布艺',
  other: '其他',
};

export class Member {
  id: string = '';
  name: string = '';
  phone: string = '';
  birthday?: string = undefined;
  craftTags: CraftTag[] = [];
  interestTags: string[] = [];
  notes?: string = undefined;
  gallery: string[] = [];
  points: number = 0;
  lastVisitAt?: number = undefined;
  createdAt: number = Date.now();
}

export class CourseMaterialRef {
  materialId: string = '';
  quantity: number = 0;
}

export type CourseStatus = 'upcoming' | 'ongoing' | 'completed' | 'cancelled';

export class Course {
  id: string = '';
  title: string = '';
  startTime: number = 0;
  endTime?: number = undefined;
  capacity: number = 0;
  price: number = 0;
  rewardPoints: number = 0;
  materials: CourseMaterialRef[] = [];
  status: CourseStatus = 'upcoming';
}

export type ReservationStatus = 'booked' | 'completed' | 'cancelled';

export class Reservation {
  id: string = '';
  courseId: string = '';
  memberId: string = '';
  status: ReservationStatus = 'booked';
  createdAt: number = Date.now();
  cancelledAt?: number = undefined;
}

export class Material {
  id: string = '';
  name: string = '';
  spec?: string = undefined;
  unit: string = '';
  stock: number = 0;
  safetyStock: number = 0;
  craftTags: CraftTag[] = [];
}

export type PointsType = 'check-in' | 'spend' | 'course' | 'redeem' | 'manual' | 'wake';

export class PointsRecord {
  id: string = '';
  memberId?: string = undefined;
  type: PointsType = 'manual';
  value: number = 0;
  balanceAfter: number = 0;
  description?: string = undefined;
  relatedCourseId?: string = undefined;
  relatedMaterialId?: string = undefined;
  createdAt: number = Date.now();
}

export class Settings {
  checkInPoints: number = 5;
  spendRatio: number = 1;
  sleepThresholdDays: number = 45;
  notificationsEnabled: boolean = true;
}

export class CheckInForm {
  selectedMemberId?: string = undefined;
  type: 'check-in' | 'spend' = 'check-in';
  amount: number = 0;
  points: number = 0;
  selectedCourseId?: string = undefined;
}

export class MemberFilter {
  query: string = '';
  selectedCraftTag?: CraftTag = undefined;
}

export function isCraftTag(value: string): boolean {
  const tags: string[] = ['pottery', 'woodwork', 'leather', 'floristry', 'silver', 'textile', 'other'];
  return tags.includes(value);
}
