// OptionLists.ets
//
// 下拉/选择器使用的选项元数据（value + 显示文案 + 副色）。
// 由表单 picker、状态徽章、统计分组等复用。与 Types.ets 枚举一一对应。
// ArkTS strict-safe：export interface + const 数组。

import {
  RecordCategory,
  Priority,
  RecordStatus,
  HazardLevel,
  HazardStatus,
  PatrolStatus,
  ContactGroup,
  CorrectionStatus,
  StatisticsPeriod,
} from './Types';

export interface SelectOption<T> {
  value: T;
  label: string;
}

// 分类
export const RECORD_CATEGORY_OPTIONS: SelectOption<RecordCategory>[] = [
  { value: RecordCategory.Production, label: '生产安全' },
  { value: RecordCategory.Equipment, label: '设备设施' },
  { value: RecordCategory.Environment, label: '作业环境' },
  { value: RecordCategory.Fire, label: '消防' },
  { value: RecordCategory.Electrical, label: '电气' },
  { value: RecordCategory.Behavior, label: '行为规范' },
  { value: RecordCategory.Other, label: '其他' },
];

// 优先级
export const PRIORITY_OPTIONS: SelectOption<Priority>[] = [
  { value: Priority.Low, label: '低' },
  { value: Priority.Medium, label: '中' },
  { value: Priority.High, label: '高' },
  { value: Priority.Urgent, label: '紧急' },
];

// 事项状态
export const RECORD_STATUS_OPTIONS: SelectOption<RecordStatus>[] = [
  { value: RecordStatus.Open, label: '待处理' },
  { value: RecordStatus.Processing, label: '处理中' },
  { value: RecordStatus.Closed, label: '已关闭' },
];

// 隐患等级
export const HAZARD_LEVEL_OPTIONS: SelectOption<HazardLevel>[] = [
  { value: HazardLevel.Minor, label: '一般' },
  { value: HazardLevel.General, label: '较大' },
  { value: HazardLevel.Major, label: '重大' },
  { value: HazardLevel.Critical, label: '特大' },
];

// 隐患状态
export const HAZARD_STATUS_OPTIONS: SelectOption<HazardStatus>[] = [
  { value: HazardStatus.Reported, label: '已上报' },
  { value: HazardStatus.Correcting, label: '整改中' },
  { value: HazardStatus.Corrected, label: '已整改' },
  { value: HazardStatus.Closed, label: '已关闭' },
];

// 巡检状态
export const PATROL_STATUS_OPTIONS: SelectOption<PatrolStatus>[] = [
  { value: PatrolStatus.Pending, label: '待巡检' },
  { value: PatrolStatus.Done, label: '正常' },
  { value: PatrolStatus.Abnormal, label: '异常' },
];

// 联系人分组
export const CONTACT_GROUP_OPTIONS: SelectOption<ContactGroup>[] = [
  { value: ContactGroup.Emergency, label: '应急救援' },
  { value: ContactGroup.Manager, label: '管理人员' },
  { value: ContactGroup.Maintenance, label: '维修保障' },
  { value: ContactGroup.Medical, label: '医疗急救' },
  { value: ContactGroup.Other, label: '其他' },
];

// 整改状态
export const CORRECTION_STATUS_OPTIONS: SelectOption<CorrectionStatus>[] = [
  { value: CorrectionStatus.Pending, label: '待整改' },
  { value: CorrectionStatus.InProgress, label: '整改中' },
  { value: CorrectionStatus.Completed, label: '已完成' },
  { value: CorrectionStatus.Verified, label: '已验收' },
  { value: CorrectionStatus.Overdue, label: '已逾期' },
];

// 统计周期
export const STATISTICS_PERIOD_OPTIONS: SelectOption<StatisticsPeriod>[] = [
  { value: StatisticsPeriod.Day, label: '日' },
  { value: StatisticsPeriod.Week, label: '周' },
  { value: StatisticsPeriod.Month, label: '月' },
];

// ---------------- Label 查找（避免动态索引） ----------------

export function recordCategoryLabel(v: RecordCategory): string {
  const list: SelectOption<RecordCategory>[] = RECORD_CATEGORY_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function priorityLabel(v: Priority): string {
  const list: SelectOption<Priority>[] = PRIORITY_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function hazardLevelLabel(v: HazardLevel): string {
  const list: SelectOption<HazardLevel>[] = HAZARD_LEVEL_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function hazardStatusLabel(v: HazardStatus): string {
  const list: SelectOption<HazardStatus>[] = HAZARD_STATUS_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function recordStatusLabel(v: RecordStatus): string {
  const list: SelectOption<RecordStatus>[] = RECORD_STATUS_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function patrolStatusLabel(v: PatrolStatus): string {
  const list: SelectOption<PatrolStatus>[] = PATROL_STATUS_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function contactGroupLabel(v: ContactGroup): string {
  const list: SelectOption<ContactGroup>[] = CONTACT_GROUP_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}

export function correctionStatusLabel(v: CorrectionStatus): string {
  const list: SelectOption<CorrectionStatus>[] = CORRECTION_STATUS_OPTIONS;
  for (let i = 0; i < list.length; i++) {
    if (list[i].value === v) {
      return list[i].label;
    }
  }
  return '';
}
