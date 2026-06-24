// DataStore.ets — 手作·印记 中央数据服务
//
// 数据源策略(spec): 以本地 AppStorage / PersistentStorage 为第一数据源，离线可用。
// 本文件为唯一持久化边界；页面只读取快照并调用变更方法。
//
// 注意: 为支持「构建 + 运行验证」可被演示，课程目录与库存为店主初始供给数据，
// 当前会员与会员活动记录从真实空态起步(详见 handoff 说明)。
// 沉睡会员列表含 2 名「店主示例」客户用于验证自动提醒逻辑。

import {
  Member, WorkImage, PointRecord, ConsumptionRecord, ClassSlot,
  InventoryItem, DormantMember, ActivityItem, OpResult
} from '../model/Models';
import { DateUtil } from './DateUtil';

interface AppStateBlob {
  members: Member[];
  pointRecords: PointRecord[];
  consumption: ConsumptionRecord[];
  classes: ClassSlot[];
  inventory: InventoryItem[];
  balance: number;
  lifetime: number;
  streakDays: number;
  lastCheckInDate: string;
  dormantThreshold: number;
  currentMemberId: string;
}

const STORE_KEY = 'sm_state_v1';

export class DataStore {
  private static ready: boolean = false;
  private static state: AppStateBlob;

  // ---- 初始化 / 持久化 ----
  static init(): void {
    if (DataStore.ready) {
      return;
    }
    // 注册持久化键(默认空串)。必须在读写前完成。
    try {
      PersistentStorage.persistProp<string>(STORE_KEY, '');
    } catch (e) {
      // 已注册或环境异常时忽略，仍可内存运行
    }
    let loaded: boolean = false;
    try {
      const raw = AppStorage.get<string>(STORE_KEY);
      if (raw && raw.length > 0) {
        const obj: AppStateBlob = JSON.parse(raw) as AppStateBlob;
        if (obj && obj.members) {
          DataStore.state = obj;
          loaded = true;
        }
      }
    } catch (e) {
      loaded = false;
    }
    if (!loaded) {
      DataStore.state = DataStore.seed();
      DataStore.persist();
    }
    DataStore.ready = true;
  }

  private static persist(): void {
    try {
      AppStorage.set<string>(STORE_KEY, JSON.stringify(DataStore.state));
    } catch (e) {
      // 持久化失败不阻塞内存逻辑
    }
  }

  private static newId(prefix: string): string {
    return `${prefix}_${Date.now().toString(36)}_${Math.floor(Math.random() * 100000).toString(36)}`;
  }

  private static clone<T>(v: T): T {
    return JSON.parse(JSON.stringify(v)) as T;
  }

  // ---- 种子数据 ----
  private static seed(): AppStateBlob {
    const today = DateUtil.todayStr();
    const currentMember: Member = {
      id: 'me',
      name: '',
      avatar: '',
      level: '初识手作',
      crafts: [],
      works: [],
      lastActiveDate: today,
      joinDate: today,
    };
    // 店主示例客户(用于沉睡提醒逻辑验证)
    const demoA: Member = {
      id: 'cust_001', name: '林小染', avatar: '', level: '陶艺匠人',
      crafts: ['陶艺', '拉坯'], works: [],
      lastActiveDate: DateUtil.addDays(today, -46), joinDate: DateUtil.addDays(today, -200),
    };
    const demoB: Member = {
      id: 'cust_002', name: '苏木', avatar: '', level: '皮作学徒',
      crafts: ['皮具'], works: [],
      lastActiveDate: DateUtil.addDays(today, -62), joinDate: DateUtil.addDays(today, -160),
    };

    const inventory: InventoryItem[] = [
      { id: 'inv_clay', name: '陶土(高白)', quantity: 24, lowStockThreshold: 10, unit: 'kg' },
      { id: 'inv_glaze', name: '釉料(透明)', quantity: 6, lowStockThreshold: 8, unit: '瓶' },
      { id: 'inv_leather', name: '植鞣皮', quantity: 15, lowStockThreshold: 6, unit: '张' },
      { id: 'inv_thread', name: '蜡线', quantity: 30, lowStockThreshold: 12, unit: '卷' },
    ];

    const d1 = DateUtil.addDays(today, 1);
    const d2 = DateUtil.addDays(today, 3);
    const d3 = DateUtil.addDays(today, 5);
    const classes: ClassSlot[] = [
      {
        id: 'cls_001', title: '手捏陶碗入门', date: d1, time: '14:00-16:00',
        capacity: 8, booked: 3, description: '从揉泥到塑形，感受泥土的温度，做出属于自己的第一只陶碗。',
        pricePoint: 0, tagLabel: '零基础',
        materials: [
          { id: 'cm_1', name: '陶土', inventoryItemId: 'inv_clay', quantityPerSeat: 2 },
          { id: 'cm_2', name: '釉料', inventoryItemId: 'inv_glaze', quantityPerSeat: 1 },
        ],
      },
      {
        id: 'cls_002', title: '皮具卡套手作', date: d2, time: '10:00-12:30',
        capacity: 6, booked: 6, description: '裁切、打孔、缝线，手缝一只植鞣皮卡套。',
        pricePoint: 0, tagLabel: '进阶',
        materials: [
          { id: 'cm_3', name: '植鞣皮', inventoryItemId: 'inv_leather', quantityPerSeat: 1 },
          { id: 'cm_4', name: '蜡线', inventoryItemId: 'inv_thread', quantityPerSeat: 1 },
        ],
      },
      {
        id: 'cls_003', title: '釉下彩绘体验', date: d3, time: '15:00-17:00',
        capacity: 10, booked: 2, description: '在素坯上描绘属于你的纹样，烧制后可带走。',
        pricePoint: 0, tagLabel: '彩绘',
        materials: [
          { id: 'cm_5', name: '釉料', inventoryItemId: 'inv_glaze', quantityPerSeat: 2 },
        ],
      },
    ];

    return {
      members: [currentMember, demoA, demoB],
      pointRecords: [],
      consumption: [],
      classes: classes,
      inventory: inventory,
      balance: 0,
      lifetime: 0,
      streakDays: 0,
      lastCheckInDate: '',
      dormantThreshold: 30,
      currentMemberId: 'me',
    };
  }

  // ---- 读取 ----
  static getCurrentMember(): Member {
    DataStore.init();
    for (const m of DataStore.state.members) {
      if (m.id === DataStore.state.currentMemberId) {
        return DataStore.clone(m);
      }
    }
    return DataStore.clone(DataStore.state.members[0]);
  }

  static getBalance(): number {
    DataStore.init();
    return DataStore.state.balance;
  }

  static getLifetime(): number {
    DataStore.init();
    return DataStore.state.lifetime;
  }

  static getStreak(): number {
    DataStore.init();
    return DataStore.state.streakDays;
  }

  static getLastCheckIn(): string {
    DataStore.init();
    return DataStore.state.lastCheckInDate;
  }

  static getPointRecords(): PointRecord[] {
    DataStore.init();
    const arr = DataStore.clone(DataStore.state.pointRecords);
    arr.sort((a: PointRecord, b: PointRecord) => b.date.localeCompare(a.date));
    return arr;
  }

  static getConsumption(): ConsumptionRecord[] {
    DataStore.init();
    const arr = DataStore.clone(DataStore.state.consumption);
    arr.sort((a: ConsumptionRecord, b: ConsumptionRecord) => b.date.localeCompare(a.date));
    return arr;
  }

  static getClasses(): ClassSlot[] {
    DataStore.init();
    return DataStore.clone(DataStore.state.classes);
  }

  static getClass(id: string): ClassSlot | null {
    DataStore.init();
    for (const c of DataStore.state.classes) {
      if (c.id === id) {
        return DataStore.clone(c);
      }
    }
    return null;
  }

  static getInventory(): InventoryItem[] {
    DataStore.init();
    return DataStore.clone(DataStore.state.inventory);
  }

  static getDormantThreshold(): number {
    DataStore.init();
    return DataStore.state.dormantThreshold;
  }

  static getDormantMembers(): DormantMember[] {
    DataStore.init();
    const today = DateUtil.todayStr();
    const th = DataStore.state.dormantThreshold;
    const result: DormantMember[] = [];
    for (const m of DataStore.state.members) {
      if (m.id === DataStore.state.currentMemberId) {
        continue; // 店主自身不计入
      }
      const days = DateUtil.daysBetween(m.lastActiveDate, today);
      if (days > th) {
        result.push({ id: m.id, name: m.name, daysDormant: days, lastActiveDate: m.lastActiveDate });
      }
    }
    result.sort((a: DormantMember, b: DormantMember) => b.daysDormant - a.daysDormant);
    return result;
  }

  static getActivities(): ActivityItem[] {
    DataStore.init();
    const items: ActivityItem[] = [];
    for (const p of DataStore.state.pointRecords) {
      const sign = p.amount >= 0 ? '+' : '';
      items.push({
        id: p.id, title: p.reason,
        subtitle: `${sign}${p.amount} 积分`, date: p.date,
      });
    }
    for (const c of DataStore.state.consumption) {
      items.push({
        id: c.id, title: c.title,
        subtitle: c.amountPoint > 0 ? `-${c.amountPoint} 积分` : '已记录',
        date: c.date,
      });
    }
    items.sort((a: ActivityItem, b: ActivityItem) => b.date.localeCompare(a.date));
    return items;
  }

  // ---- 校验: 某课程是否可预约(名额 + 库存) ----
  static canBook(slotId: string): OpResult {
    DataStore.init();
    const slot = DataStore.state.classes.find((c: ClassSlot) => c.id === slotId);
    if (!slot) {
      return { success: false, message: '课程不存在' };
    }
    if (slot.booked >= slot.capacity) {
      return { success: false, message: '名额已满' };
    }
    for (const mat of slot.materials) {
      const inv = DataStore.state.inventory.find((i: InventoryItem) => i.id === mat.inventoryItemId);
      if (!inv || inv.quantity < mat.quantityPerSeat) {
        const nm = inv ? inv.name : mat.name;
        return { success: false, message: `耗材「${nm}」库存不足，无法预约` };
      }
    }
    return { success: true, message: '可预约' };
  }

  // ---- 变更 ----
  static checkIn(): OpResult {
    DataStore.init();
    const today = DateUtil.todayStr();
    if (DataStore.state.lastCheckInDate === today) {
      return { success: false, message: '今天已经签到过啦，明天再来吧' };
    }
    // 连续签到判定
    const yesterday = DateUtil.addDays(today, -1);
    if (DataStore.state.lastCheckInDate === yesterday) {
      DataStore.state.streakDays += 1;
    } else {
      DataStore.state.streakDays = 1;
    }
    DataStore.state.lastCheckInDate = today;
    const earn = 5 + Math.min(DataStore.state.streakDays - 1, 5); // 连签加成
    DataStore.state.balance += earn;
    DataStore.state.lifetime += earn;
    DataStore.state.pointRecords.push({
      id: DataStore.newId('pt'), type: 'checkin', amount: earn,
      reason: `每日签到 · 连续第${DataStore.state.streakDays}天`, date: today,
    });
    DataStore.touchCurrentActive(today);
    DataStore.persist();
    return { success: true, message: `签到成功 +${earn} 积分` };
  }

  static bookSlot(slotId: string): OpResult {
    DataStore.init();
    const check = DataStore.canBook(slotId);
    if (!check.success) {
      return check;
    }
    const slot = DataStore.state.classes.find((c: ClassSlot) => c.id === slotId);
    if (!slot) {
      return { success: false, message: '课程不存在' };
    }
    // 扣减库存
    for (const mat of slot.materials) {
      const inv = DataStore.state.inventory.find((i: InventoryItem) => i.id === mat.inventoryItemId);
      if (inv) {
        inv.quantity -= mat.quantityPerSeat;
      }
    }
    slot.booked += 1;
    DataStore.state.consumption.push({
      id: DataStore.newId('cs'), title: `预约 · ${slot.title}`,
      amountPoint: slot.pricePoint, date: DateUtil.todayStr(),
    });
    // 预约即得积分奖励
    const earn = 10;
    DataStore.state.balance += earn;
    DataStore.state.lifetime += earn;
    DataStore.state.pointRecords.push({
      id: DataStore.newId('pt'), type: 'book-earn', amount: earn,
      reason: `预约课程 · ${slot.title}`, date: DateUtil.todayStr(),
    });
    DataStore.touchCurrentActive(DateUtil.todayStr());
    DataStore.persist();
    return { success: true, message: `预约成功 · 名额与耗材已联动扣减，奖励 +${earn} 积分` };
  }

  static cancelSlot(slotId: string): OpResult {
    DataStore.init();
    const slot = DataStore.state.classes.find((c: ClassSlot) => c.id === slotId);
    if (!slot) {
      return { success: false, message: '课程不存在' };
    }
    if (slot.booked <= 0) {
      return { success: false, message: '该课程当前无人预约' };
    }
    // 规则: 课前 24 小时可取消，回滚名额与耗材
    const nowTs = Date.now();
    const classTs = DateUtil.parseStr(slot.date).getTime();
    if (classTs - nowTs < 24 * 60 * 60 * 1000) {
      return { success: false, message: '距开课不足 24 小时，无法取消' };
    }
    slot.booked -= 1;
    for (const mat of slot.materials) {
      const inv = DataStore.state.inventory.find((i: InventoryItem) => i.id === mat.inventoryItemId);
      if (inv) {
        inv.quantity += mat.quantityPerSeat;
      }
    }
    DataStore.persist();
    return { success: true, message: '已取消 · 名额与耗材已回滚' };
  }

  static restock(itemId: string, qty: number): OpResult {
    DataStore.init();
    const inv = DataStore.state.inventory.find((i: InventoryItem) => i.id === itemId);
    if (!inv) {
      return { success: false, message: '库存项不存在' };
    }
    if (qty <= 0) {
      return { success: false, message: '补货数量需大于 0' };
    }
    inv.quantity += qty;
    DataStore.persist();
    return { success: true, message: `已补货 +${qty}${inv.unit}` };
  }

  static wakeMember(memberId: string): OpResult {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === memberId);
    if (!m) {
      return { success: false, message: '会员不存在' };
    }
    m.lastActiveDate = DateUtil.todayStr();
    DataStore.persist();
    return { success: true, message: `已标记「${m.name}」为已唤醒` };
  }

  static setDormantThreshold(days: number): OpResult {
    DataStore.init();
    if (days < 1 || days > 365) {
      return { success: false, message: '天数需在 1-365 之间' };
    }
    DataStore.state.dormantThreshold = days;
    DataStore.persist();
    return { success: true, message: `沉睡阈值已更新为 ${days} 天` };
  }

  // ---- 档案编辑 ----
  static saveName(name: string): void {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (m) {
      m.name = name;
    }
    DataStore.persist();
  }

  static addCraft(craft: string): OpResult {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (!m) {
      return { success: false, message: '会员不存在' };
    }
    const v = craft.trim();
    if (v.length === 0) {
      return { success: false, message: '工艺名称不能为空' };
    }
    if (m.crafts.indexOf(v) >= 0) {
      return { success: false, message: '该工艺已添加' };
    }
    m.crafts.push(v);
    DataStore.persist();
    return { success: true, message: '已添加工艺' };
  }

  static removeCraft(craft: string): void {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (m) {
      const idx = m.crafts.indexOf(craft);
      if (idx >= 0) {
        m.crafts.splice(idx, 1);
      }
    }
    DataStore.persist();
  }

  static addWork(uri: string, title: string): OpResult {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (!m) {
      return { success: false, message: '会员不存在' };
    }
    const w: WorkImage = {
      id: DataStore.newId('work'),
      uri: uri,
      title: title.trim().length > 0 ? title.trim() : '我的作品',
    };
    m.works.push(w);
    DataStore.persist();
    return { success: true, message: '作品已添加' };
  }

  static removeWork(workId: string): void {
    DataStore.init();
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (m) {
      const idx = m.works.findIndex((w: WorkImage) => w.id === workId);
      if (idx >= 0) {
        m.works.splice(idx, 1);
      }
    }
    DataStore.persist();
  }

  private static touchCurrentActive(dateStr: string): void {
    const m = DataStore.state.members.find((x: Member) => x.id === DataStore.state.currentMemberId);
    if (m) {
      m.lastActiveDate = dateStr;
    }
  }
}
