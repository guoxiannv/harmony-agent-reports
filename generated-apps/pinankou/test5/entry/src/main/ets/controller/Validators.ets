// Validators.ets
//
// 各表单的校验逻辑（必填 / 基础格式）。
// 返回结构化结果，UI 内联展示错误。与 ui-behavior.json interactionFlows 的 error 路径对齐。
// 使用具名字段错误接口 + 原始类型入参，避免动态索引/对象字面量类型（ArkTS strict-safe）。

import { HazardLevel, CorrectionStatus } from '../model/Types';

function isBlank(s: string): boolean {
  return s.trim().length === 0;
}

// ---------------- 结果类型（错误为命名字段，便于 UI 精确定位） ----------------

export interface RecordFormErrors {
  title?: string;
}
export interface RecordFormResult {
  valid: boolean;
  errors: RecordFormErrors;
}

export interface HazardFormErrors {
  title?: string;
  level?: string;
}
export interface HazardFormResult {
  valid: boolean;
  errors: HazardFormErrors;
}

export interface PatrolCheckinErrors {
  pointId?: string;
}
export interface PatrolCheckinResult {
  valid: boolean;
  errors: PatrolCheckinErrors;
}

export interface ContactFormErrors {
  name?: string;
  phone?: string;
}
export interface ContactFormResult {
  valid: boolean;
  errors: ContactFormErrors;
}

export interface CorrectionFormErrors {
  status?: string;
  progress?: string;
}
export interface CorrectionFormResult {
  valid: boolean;
  errors: CorrectionFormErrors;
}

export class Validators {
  // 安全事项：标题必填。
  static validateRecord(title: string): RecordFormResult {
    const errors: RecordFormErrors = {};
    if (isBlank(title)) {
      errors.title = '请输入事项标题';
    }
    return { valid: errors.title === undefined, errors: errors };
  }

  // 风险隐患：标题必填、等级必填。
  static validateHazard(title: string, level: HazardLevel): HazardFormResult {
    const errors: HazardFormErrors = {};
    if (isBlank(title)) {
      errors.title = '请输入隐患标题';
    }
    // 等级为枚举，已选择即视为有效；空字符串视为缺失。
    if (level === undefined || level.length === 0) {
      errors.level = '请选择隐患等级';
    }
    return { valid: errors.title === undefined && errors.level === undefined, errors: errors };
  }

  // 巡检打卡：巡检点必填。
  static validatePatrolCheckin(pointId: string): PatrolCheckinResult {
    const errors: PatrolCheckinErrors = {};
    if (isBlank(pointId)) {
      errors.pointId = '请选择巡检点';
    }
    return { valid: errors.pointId === undefined, errors: errors };
  }

  // 应急联系人：姓名必填、电话必填且为数字串。
  static validateContact(name: string, phone: string): ContactFormResult {
    const errors: ContactFormErrors = {};
    if (isBlank(name)) {
      errors.name = '请输入联系人姓名';
    }
    if (isBlank(phone)) {
      errors.phone = '请输入联系电话';
    } else if (!Validators.isPhoneLike(phone)) {
      errors.phone = '请输入有效的电话号码';
    }
    return { valid: errors.name === undefined && errors.phone === undefined, errors: errors };
  }

  // 整改进度：状态必填、进度 0-100。
  static validateCorrection(status: CorrectionStatus, progress: number): CorrectionFormResult {
    const errors: CorrectionFormErrors = {};
    if (status === undefined || status.length === 0) {
      errors.status = '请选择整改状态';
    }
    if (progress < 0 || progress > 100) {
      errors.progress = '进度需在 0-100 之间';
    }
    return { valid: errors.status === undefined && errors.progress === undefined, errors: errors };
  }

  // 电话/手机号宽松校验：允许 +、空格、-，至少 6 位数字。
  static isPhoneLike(phone: string): boolean {
    const trimmed: string = phone.trim();
    if (trimmed.length === 0) {
      return false;
    }
    let digits: number = 0;
    for (let i = 0; i < trimmed.length; i++) {
      const ch: string = trimmed.charAt(i);
      const code: number = ch.charCodeAt(0);
      const isDigit: boolean = code >= 48 && code <= 57;
      if (isDigit) {
        digits += 1;
      } else if (ch !== '+' && ch !== '-' && ch !== ' ') {
        return false;
      }
    }
    return digits >= 6;
  }
}
