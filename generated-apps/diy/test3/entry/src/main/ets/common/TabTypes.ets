// TabTypes.ets — 手作·印记 共享 Tab 契约
// 保留 TabId 为共享 Tab 真值源。修改 tab id 需同步 Index.ets 与 BottomTabBar.ets。
export type TabId =
  | 'tab-home'
  | 'tab-classes'
  | 'tab-points'
  | 'tab-profile';
