// DataStore.ets
//
// 领域数据门面：在 Persistence 之上提供六个业务域的 CRUD，以及跨域联动。
// - 所有写操作以“新数组写回 AppStorage”方式进行，保证 UI @StorageLink 响应。
// - 跨域联动：对隐患发起整改、整改验收后回写源状态。
//
// 与 ui-behavior.json interactionFlows 一致。ArkTS strict-safe。

import { common } from '@kit.AbilityKit';
import { Persistence } from './Persistence';
import {
  SafetyRecord,
  Hazard,
  PatrolPoint,
  PatrolCheckin,
  Contact,
  Correction,
  RecordCategory,
  Priority,
  RecordStatus,
  HazardStatus,
  HazardLevel,
  PatrolStatus,
  ContactGroup,
  CorrectionSource,
  CorrectionStatus,
} from '../model/Types';
import { newRecordId, newHazardId, newPatrolPointId, newPatrolCheckinId, newContactId, newCorrectionId } from '../common/IdGen';

// 带最小 id 约束的泛型更新工具。
interface HasId {
  id: string;
}

function replaceById<T extends HasId>(list: T[], updated: T): T[] {
  const next: T[] = list.slice();
  for (let i = 0; i < next.length; i++) {
    if (next[i].id === updated.id) {
      next[i] = updated;
      break;
    }
  }
  return next;
}

function removeById<T extends HasId>(list: T[], id: string): T[] {
  const next: T[] = list.slice();
  for (let i = 0; i < next.length; i++) {
    if (next[i].id === id) {
      next.splice(i, 1);
      break;
    }
  }
  return next;
}

function nowTs(): number {
  return Date.now();
}

// 表单输入的结构化类型（避免在方法签名里散布内联索引类型）。
export interface RecordInput {
  title: string;
  category: RecordCategory;
  priority: Priority;
  description: string;
  photos: string[];
}

export interface HazardInput {
  title: string;
  location: string;
  level: HazardLevel;
  description: string;
  photos: string[];
}

export interface PatrolCheckinInput {
  pointId: string;
  photos: string[];
  note: string;
  abnormal: boolean;
}

export interface ContactInput {
  name: string;
  role: string;
  group: ContactGroup;
  phone: string;
  remark: string;
}

export interface CorrectionInput {
  title: string;
  responsible: string;
  dueDate: number;
  note: string;
  photos: string[];
}

// 整改任务的内部种子数据（手工/隐患/事项三种来源统一形态）。
export interface CorrectionSeed {
  sourceType: CorrectionSource;
  sourceId: string;
  title: string;
  responsible: string;
  dueDate: number;
  progress: number;
  status: CorrectionStatus;
  note: string;
  photos: string[];
}

export class DataStore {
  // ---------------- 初始化 ----------------

  static init(context: common.UIAbilityContext): void {
    // 由 EntryAbility.onCreate 调用。
    Persistence.init(context);
  }

  // ================ 安全事项 SafetyRecord ================

  static listRecords(): SafetyRecord[] {
    return Persistence.getRecords();
  }

  static getRecord(id: string): SafetyRecord | null {
    const list: SafetyRecord[] = Persistence.getRecords();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  static addRecord(input: RecordInput): SafetyRecord {
    const ts: number = nowTs();
    const item: SafetyRecord = {
      id: newRecordId(),
      title: input.title,
      category: input.category,
      priority: input.priority,
      description: input.description,
      photos: input.photos.slice(),
      status: RecordStatus.Open,
      createdAt: ts,
      updatedAt: ts,
    };
    const next: SafetyRecord[] = Persistence.getRecords().slice();
    next.unshift(item);
    Persistence.setRecords(next);
    return item;
  }

  static updateRecord(id: string, input: RecordInput, status?: RecordStatus): void {
    const current: SafetyRecord | null = DataStore.getRecord(id);
    if (current === null) {
      return;
    }
    const updated: SafetyRecord = {
      id: current.id,
      title: input.title,
      category: input.category,
      priority: input.priority,
      description: input.description,
      photos: input.photos.slice(),
      status: status !== undefined ? status : current.status,
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setRecords(replaceById<SafetyRecord>(Persistence.getRecords(), updated));
  }

  static setRecordStatus(id: string, status: RecordStatus): void {
    const current: SafetyRecord | null = DataStore.getRecord(id);
    if (current === null) {
      return;
    }
    const updated: SafetyRecord = {
      id: current.id,
      title: current.title,
      category: current.category,
      priority: current.priority,
      description: current.description,
      photos: current.photos.slice(),
      status: status,
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setRecords(replaceById<SafetyRecord>(Persistence.getRecords(), updated));
  }

  static removeRecord(id: string): void {
    Persistence.setRecords(removeById<SafetyRecord>(Persistence.getRecords(), id));
  }

  // ================ 风险隐患 Hazard ================

  static listHazards(): Hazard[] {
    return Persistence.getHazards();
  }

  static getHazard(id: string): Hazard | null {
    const list: Hazard[] = Persistence.getHazards();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  static addHazard(input: HazardInput): Hazard {
    const ts: number = nowTs();
    const item: Hazard = {
      id: newHazardId(),
      title: input.title,
      location: input.location,
      level: input.level,
      description: input.description,
      photos: input.photos.slice(),
      status: HazardStatus.Reported,
      correctionId: null,
      createdAt: ts,
      updatedAt: ts,
    };
    const next: Hazard[] = Persistence.getHazards().slice();
    next.unshift(item);
    Persistence.setHazards(next);
    return item;
  }

  static updateHazard(id: string, input: HazardInput): void {
    const current: Hazard | null = DataStore.getHazard(id);
    if (current === null) {
      return;
    }
    const updated: Hazard = {
      id: current.id,
      title: input.title,
      location: input.location,
      level: input.level,
      description: input.description,
      photos: input.photos.slice(),
      status: current.status,
      correctionId: current.correctionId,
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setHazards(replaceById<Hazard>(Persistence.getHazards(), updated));
  }

  // 内部：更新隐患状态与关联整改 id（不暴露给表单）。
  static setHazardCorrection(id: string, correctionId: string, status: HazardStatus): void {
    const current: Hazard | null = DataStore.getHazard(id);
    if (current === null) {
      return;
    }
    const updated: Hazard = {
      id: current.id,
      title: current.title,
      location: current.location,
      level: current.level,
      description: current.description,
      photos: current.photos.slice(),
      status: status,
      correctionId: correctionId,
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setHazards(replaceById<Hazard>(Persistence.getHazards(), updated));
  }

  static setHazardStatus(id: string, status: HazardStatus): void {
    const current: Hazard | null = DataStore.getHazard(id);
    if (current === null) {
      return;
    }
    const updated: Hazard = {
      id: current.id,
      title: current.title,
      location: current.location,
      level: current.level,
      description: current.description,
      photos: current.photos.slice(),
      status: status,
      correctionId: current.correctionId,
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setHazards(replaceById<Hazard>(Persistence.getHazards(), updated));
  }

  static removeHazard(id: string): void {
    Persistence.setHazards(removeById<Hazard>(Persistence.getHazards(), id));
  }

  // ================ 巡检点 / 巡检打卡 ================

  static listPatrolPoints(): PatrolPoint[] {
    return Persistence.getPatrolPoints();
  }

  static getPatrolPoint(id: string): PatrolPoint | null {
    const list: PatrolPoint[] = Persistence.getPatrolPoints();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  static addPatrolPoint(name: string, location: string): PatrolPoint {
    const item: PatrolPoint = {
      id: newPatrolPointId(),
      name: name,
      location: location,
    };
    const next: PatrolPoint[] = Persistence.getPatrolPoints().slice();
    next.unshift(item);
    Persistence.setPatrolPoints(next);
    return item;
  }

  static removePatrolPoint(id: string): void {
    Persistence.setPatrolPoints(removeById<PatrolPoint>(Persistence.getPatrolPoints(), id));
  }

  static listPatrolCheckins(): PatrolCheckin[] {
    return Persistence.getPatrolCheckins();
  }

  static addPatrolCheckin(input: PatrolCheckinInput): PatrolCheckin {
    const point: PatrolPoint | null = DataStore.getPatrolPoint(input.pointId);
    const item: PatrolCheckin = {
      id: newPatrolCheckinId(),
      pointId: input.pointId,
      pointName: point !== null ? point.name : '',
      photos: input.photos.slice(),
      note: input.note,
      status: input.abnormal ? PatrolStatus.Abnormal : PatrolStatus.Done,
      checkinAt: nowTs(),
    };
    const next: PatrolCheckin[] = Persistence.getPatrolCheckins().slice();
    next.unshift(item);
    Persistence.setPatrolCheckins(next);
    return item;
  }

  // ================ 应急联系人 Contact ================

  static listContacts(): Contact[] {
    return Persistence.getContacts();
  }

  static getContact(id: string): Contact | null {
    const list: Contact[] = Persistence.getContacts();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  static addContact(input: ContactInput): Contact {
    const item: Contact = {
      id: newContactId(),
      name: input.name,
      role: input.role,
      group: input.group,
      phone: input.phone,
      remark: input.remark,
    };
    const next: Contact[] = Persistence.getContacts().slice();
    next.unshift(item);
    Persistence.setContacts(next);
    return item;
  }

  static updateContact(id: string, input: ContactInput): void {
    const current: Contact | null = DataStore.getContact(id);
    if (current === null) {
      return;
    }
    const updated: Contact = {
      id: current.id,
      name: input.name,
      role: input.role,
      group: input.group,
      phone: input.phone,
      remark: input.remark,
    };
    Persistence.setContacts(replaceById<Contact>(Persistence.getContacts(), updated));
  }

  static removeContact(id: string): void {
    Persistence.setContacts(removeById<Contact>(Persistence.getContacts(), id));
  }

  // ================ 整改 Correction ================

  static listCorrections(): Correction[] {
    return Persistence.getCorrections();
  }

  static getCorrection(id: string): Correction | null {
    const list: Correction[] = Persistence.getCorrections();
    for (let i = 0; i < list.length; i++) {
      if (list[i].id === id) {
        return list[i];
      }
    }
    return null;
  }

  // 手工新增整改任务。
  static addCorrection(input: CorrectionInput): Correction {
    return DataStore.persistNewCorrection({
      sourceType: CorrectionSource.Manual,
      sourceId: '',
      title: input.title,
      responsible: input.responsible,
      dueDate: input.dueDate,
      progress: 0,
      status: CorrectionStatus.Pending,
      note: input.note,
      photos: input.photos,
    });
  }

  // 对隐患发起整改（start-correction 流程）。返回新建整改 id，并回写隐患状态。
  static startCorrectionFromHazard(hazardId: string): string | null {
    const hazard: Hazard | null = DataStore.getHazard(hazardId);
    if (hazard === null) {
      return null;
    }
    const ts: number = nowTs();
    // 默认截止日期：7 天后。
    const due: number = ts + 7 * 24 * 60 * 60 * 1000;
    const correction: Correction = DataStore.persistNewCorrection({
      sourceType: CorrectionSource.Hazard,
      sourceId: hazard.id,
      title: hazard.title,
      responsible: '',
      dueDate: due,
      progress: 0,
      status: CorrectionStatus.Pending,
      note: '',
      photos: [],
    });
    DataStore.setHazardCorrection(hazardId, correction.id, HazardStatus.Correcting);
    return correction.id;
  }

  private static persistNewCorrection(input: CorrectionSeed): Correction {
    const ts: number = nowTs();
    const item: Correction = {
      id: newCorrectionId(),
      sourceType: input.sourceType,
      sourceId: input.sourceId,
      title: input.title,
      responsible: input.responsible,
      dueDate: input.dueDate,
      progress: input.progress,
      status: input.status,
      note: input.note,
      photos: input.photos.slice(),
      createdAt: ts,
      updatedAt: ts,
    };
    const next: Correction[] = Persistence.getCorrections().slice();
    next.unshift(item);
    Persistence.setCorrections(next);
    return item;
  }

  // 更新整改进度。progress>=100 且未完成时自动置 completed；
  // status==verified 时回写源隐患/事项状态。
  static updateCorrection(id: string, status: CorrectionStatus, progress: number, note: string, photos: string[]): void {
    const current: Correction | null = DataStore.getCorrection(id);
    if (current === null) {
      return;
    }
    let nextStatus: CorrectionStatus = status;
    const clamped: number = progress < 0 ? 0 : (progress > 100 ? 100 : progress);
    if (clamped >= 100 && (nextStatus === CorrectionStatus.Pending || nextStatus === CorrectionStatus.InProgress)) {
      nextStatus = CorrectionStatus.Completed;
    }
    const updated: Correction = {
      id: current.id,
      sourceType: current.sourceType,
      sourceId: current.sourceId,
      title: current.title,
      responsible: current.responsible,
      dueDate: current.dueDate,
      progress: clamped,
      status: nextStatus,
      note: note,
      photos: photos.slice(),
      createdAt: current.createdAt,
      updatedAt: nowTs(),
    };
    Persistence.setCorrections(replaceById<Correction>(Persistence.getCorrections(), updated));

    // 验收完成 -> 回写源状态。
    if (nextStatus === CorrectionStatus.Verified) {
      if (updated.sourceType === CorrectionSource.Hazard && updated.sourceId.length > 0) {
        DataStore.setHazardStatus(updated.sourceId, HazardStatus.Corrected);
      } else if (updated.sourceType === CorrectionSource.Record && updated.sourceId.length > 0) {
        DataStore.setRecordStatus(updated.sourceId, RecordStatus.Closed);
      }
    }
  }

  static removeCorrection(id: string): void {
    Persistence.setCorrections(removeById<Correction>(Persistence.getCorrections(), id));
  }
}
