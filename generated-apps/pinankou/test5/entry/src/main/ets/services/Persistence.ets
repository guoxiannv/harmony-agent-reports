// Persistence.ets
//
// 响应式本地持久化：基于 PersistentStorage + AppStorage（均为 ArkTS 全局 API，无需 import）。
// - PersistentStorage.persistProp 将集合挂载到 AppStorage 并自动落盘到应用沙箱。
// - AppStorage.get<T> / setOrCreate<T> 提供类型化读写，写操作触发 UI @StorageLink 响应。
//
// 设计原则：
// - 集合元素为纯数据（基本类型 + string[]），保证可序列化。
// - 所有变更以“新建数组再写回”的方式进行（slice + unshift/splice），保证引用变化触发响应。
//
// ArkTS strict-safe：无对象 spread、无动态索引；静态方法中使用类名而非 this。

import { common } from '@kit.AbilityKit';
import { SafetyRecord, Hazard, PatrolPoint, PatrolCheckin, Contact, Correction } from '../model/Types';

// AppStorage 键名常量（与 ui-behavior.json services.Persistence.collections 对齐）。
export class DataKeys {
  static readonly records: string = 'ds.records';
  static readonly hazards: string = 'ds.hazards';
  static readonly patrolPoints: string = 'ds.patrolPoints';
  static readonly patrolCheckins: string = 'ds.patrolCheckins';
  static readonly contacts: string = 'ds.contacts';
  static readonly corrections: string = 'ds.corrections';
}

export class Persistence {
  private static initialized: boolean = false;
  private static appContext: common.UIAbilityContext | null = null;

  // 在 EntryAbility.onCreate 调用一次。已初始化则跳过。
  static init(context: common.UIAbilityContext): void {
    Persistence.appContext = context;
    if (Persistence.initialized) {
      return;
    }
    // 挂载默认空集合；spec 要求首运行为真实空状态。
    PersistentStorage.persistProp<SafetyRecord[]>(DataKeys.records, []);
    PersistentStorage.persistProp<Hazard[]>(DataKeys.hazards, []);
    PersistentStorage.persistProp<PatrolPoint[]>(DataKeys.patrolPoints, []);
    PersistentStorage.persistProp<PatrolCheckin[]>(DataKeys.patrolCheckins, []);
    PersistentStorage.persistProp<Contact[]>(DataKeys.contacts, []);
    PersistentStorage.persistProp<Correction[]>(DataKeys.corrections, []);
    Persistence.initialized = true;
  }

  static isInitialized(): boolean {
    return Persistence.initialized;
  }

  static getContext(): common.UIAbilityContext | null {
    return Persistence.appContext;
  }

  // ---------------- 类型化集合访问 ----------------

  static getRecords(): SafetyRecord[] {
    const v: SafetyRecord[] | undefined = AppStorage.get<SafetyRecord[]>(DataKeys.records);
    return v !== undefined ? v : [];
  }

  static setRecords(list: SafetyRecord[]): void {
    AppStorage.setOrCreate<SafetyRecord[]>(DataKeys.records, list);
  }

  static getHazards(): Hazard[] {
    const v: Hazard[] | undefined = AppStorage.get<Hazard[]>(DataKeys.hazards);
    return v !== undefined ? v : [];
  }

  static setHazards(list: Hazard[]): void {
    AppStorage.setOrCreate<Hazard[]>(DataKeys.hazards, list);
  }

  static getPatrolPoints(): PatrolPoint[] {
    const v: PatrolPoint[] | undefined = AppStorage.get<PatrolPoint[]>(DataKeys.patrolPoints);
    return v !== undefined ? v : [];
  }

  static setPatrolPoints(list: PatrolPoint[]): void {
    AppStorage.setOrCreate<PatrolPoint[]>(DataKeys.patrolPoints, list);
  }

  static getPatrolCheckins(): PatrolCheckin[] {
    const v: PatrolCheckin[] | undefined = AppStorage.get<PatrolCheckin[]>(DataKeys.patrolCheckins);
    return v !== undefined ? v : [];
  }

  static setPatrolCheckins(list: PatrolCheckin[]): void {
    AppStorage.setOrCreate<PatrolCheckin[]>(DataKeys.patrolCheckins, list);
  }

  static getContacts(): Contact[] {
    const v: Contact[] | undefined = AppStorage.get<Contact[]>(DataKeys.contacts);
    return v !== undefined ? v : [];
  }

  static setContacts(list: Contact[]): void {
    AppStorage.setOrCreate<Contact[]>(DataKeys.contacts, list);
  }

  static getCorrections(): Correction[] {
    const v: Correction[] | undefined = AppStorage.get<Correction[]>(DataKeys.corrections);
    return v !== undefined ? v : [];
  }

  static setCorrections(list: Correction[]): void {
    AppStorage.setOrCreate<Correction[]>(DataKeys.corrections, list);
  }
}
