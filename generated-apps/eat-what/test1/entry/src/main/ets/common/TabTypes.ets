// TemplateTabTypes.ets
//
// Shared tab-level types for scaffold components that should not depend on
// controller or page implementation files.
//
// Agent rules:
// - Keep TabId stable unless the app's primary tab model changes.
// - Update Index.ets and BottomTabBar.ets together when changing tab ids.
//
// Usage:
// - Add lightweight tab/navigation unions here when multiple scaffold files
// - need the same tab contract.
export type TabId =
  | 'tab-home'
  | 'tab-ingredients'
  | 'tab-discover'
  | 'tab-checkin'
  | 'tab-profile';
