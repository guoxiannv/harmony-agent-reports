// Models.ets — 手作·印记 领域模型
// 所有数据结构显式定义，供 DataStore 与页面共享。

// 作品图
export interface WorkImage {
  id: string;
  uri: string;     // 本地 fileUri 或沙箱临时路径；空串表示占位
  title: string;
}

// 会员
export interface Member {
  id: string;
  name: string;
  avatar: string;
  level: string;
  crafts: string[];
  works: WorkImage[];
  lastActiveDate: string;  // yyyy-MM-dd
  joinDate: string;
}

// 积分记录
export interface PointRecord {
  id: string;
  type: string;     // 'checkin' | 'book-earn' | 'spend' | 'wake'
  amount: number;   // 正数为获得，负数为消耗
  reason: string;
  date: string;     // yyyy-MM-dd
}

// 消费记录
export interface ConsumptionRecord {
  id: string;
  title: string;
  amountPoint: number; // 消耗积分(可为0，仅记录活动)
  date: string;
}

// 课程耗材
export interface ClassMaterial {
  id: string;
  name: string;
  inventoryItemId: string;
  quantityPerSeat: number;
}

// 课程时段
export interface ClassSlot {
  id: string;
  title: string;
  date: string;        // yyyy-MM-dd
  time: string;        // 如 14:00-16:00
  capacity: number;
  booked: number;
  description: string;
  materials: ClassMaterial[];
  pricePoint: number;  // 预约所需积分(0 表示免费)
  tagLabel: string;    // 卡片辅助标签(如 零基础/进阶)
}

// 库存项
export interface InventoryItem {
  id: string;
  name: string;
  quantity: number;
  lowStockThreshold: number;
  unit: string;
}

// 沉睡会员(计算派生)
export interface DormantMember {
  id: string;
  name: string;
  daysDormant: number;
  lastActiveDate: string;
}

// 首页动态(计算派生)
export interface ActivityItem {
  id: string;
  title: string;
  subtitle: string;
  date: string;
}

// 业务结果
export interface OpResult {
  success: boolean;
  message: string;
}
