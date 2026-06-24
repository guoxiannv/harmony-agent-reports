export type CraftTag =
  | 'pottery'
  | 'weaving'
  | 'woodwork'
  | 'leather'
  | 'dyeing'
  | 'paper'
  | 'metal'
  | 'others';

export interface CraftLabelMap {
  pottery: string;
  weaving: string;
  woodwork: string;
  leather: string;
  dyeing: string;
  paper: string;
  metal: string;
  others: string;
}

export const CRAFT_LABELS: CraftLabelMap = {
  pottery: '陶艺',
  weaving: '编织',
  woodwork: '木工',
  leather: '皮具',
  dyeing: '染织',
  paper: '纸艺',
  metal: '金工',
  others: '其他',
};

export function craftLabel(craft: string): string {
  const key: CraftTag = craft as CraftTag;
  if (key === 'pottery') {
    return CRAFT_LABELS.pottery;
  } else if (key === 'weaving') {
    return CRAFT_LABELS.weaving;
  } else if (key === 'woodwork') {
    return CRAFT_LABELS.woodwork;
  } else if (key === 'leather') {
    return CRAFT_LABELS.leather;
  } else if (key === 'dyeing') {
    return CRAFT_LABELS.dyeing;
  } else if (key === 'paper') {
    return CRAFT_LABELS.paper;
  } else if (key === 'metal') {
    return CRAFT_LABELS.metal;
  } else if (key === 'others') {
    return CRAFT_LABELS.others;
  }
  return craft;
}

export const ALL_CRAFTS: CraftTag[] = [
  'weaving',
  'woodwork',
  'leather',
  'dyeing',
  'paper',
  'metal',
  'others',
];

export class WorkImage {
  id: string = '';
  uri: string = '';
  caption: string = '';
}

export class Member {
  id: string = '';
  name: string = '';
  phone: string = '';
  avatarUri: string = '';
  crafts: string[] = [];
  workImages: WorkImage[] = [];
  pointsBalance: number = 0;
  lastVisitAt: number = 0;
  createdAt: number = 0;
}

export type PointRecordType = 'earn' | 'redeem';

export class PointRecord {
  id: string = '';
  memberId: string = '';
  type: PointRecordType = 'earn';
  source: string = '';
  amount: number = 0;
  relatedId: string = '';
  note: string = '';
  createdAt: number = 0;
}

export class CourseMaterial {
  itemId: string = '';
  name: string = '';
  quantityPerStudent: number = 0;
  unit: string = '';
}

export type CourseStatus = 'draft' | 'open' | 'closed' | 'completed';

export class Course {
  id: string = '';
  title: string = '';
  teacher: string = '';
  startTime: number = 0;
  durationMinutes: number = 60;
  capacity: number = 8;
  status: CourseStatus = 'open';
  materials: CourseMaterial[] = [];
}

export type BookingStatus = 'pending' | 'confirmed' | 'cancelled' | 'completed';

export class Booking {
  id: string = '';
  courseId: string = '';
  memberId: string = '';
  status: BookingStatus = 'pending';
  createdAt: number = 0;
}

export class InventoryItem {
  id: string = '';
  name: string = '';
  category: string = '';
  unit: string = '';
  currentStock: number = 0;
  safeStock: number = 0;
  note: string = '';
}

export type InventoryLogType = 'in' | 'out' | 'auto-deduct';

export class InventoryLog {
  id: string = '';
  itemId: string = '';
  type: InventoryLogType = 'out';
  quantity: number = 0;
  courseId: string = '';
  memberId: string = '';
  note: string = '';
  createdAt: number = 0;
}

export class AppSettings {
  dormantThresholdDays: number = 60;
  pointsRatio: number = 1;
  checkinPoints: number = 10;
  reminderHour: number = 10;
}

export class MemberBookingsParams {
  memberId: string = '';
}

export class CourseDetailParams {
  courseId: string = '';
}

export class MemberDetailParams {
  memberId: string = '';
}

export class MemberFormParams {
  memberId: string = '';
}

export class CourseFormParams {
  courseId: string = '';
}

export class InventoryFormParams {
  itemId: string = '';
}

export class PointsHistoryParams {
  memberId: string = '';
}
