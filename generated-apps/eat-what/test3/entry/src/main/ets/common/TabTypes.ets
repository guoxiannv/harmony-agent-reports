// TabTypes.ets
//
// Shared tab-level types for scaffold components that should not depend on
// controller or page implementation files.
//
// Agent rules:
// - Keep TabId stable unless the app's primary tab model changes.
// - Update Index.ets and BottomTabBar.ets together when changing tab ids.

// 底部 Tab 唯一标识（spec 第5节 Navigation Model / ui-tree.json testTargets.tabIds）。
export type TabId =
  | 'tab-home'
  | 'tab-pantry'
  | 'tab-check-in'
  | 'tab-profile';
