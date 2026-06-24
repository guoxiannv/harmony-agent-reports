// Shared tab-level types for the 平安扣 shell.
//
// TabId is the 5 primary tabs per ui-tree.json / design-alignment.md:
//   首页 / 隐患 / 巡检 / 统计 / 我的
export type TabId =
  | 'tab-home'
  | 'tab-hazards'
  | 'tab-inspections'
  | 'tab-stats'
  | 'tab-profile';
