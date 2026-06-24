// TabTypes.ets
//
// Shared tab-level types for the 今天吃什么 app. This is the single source of
// truth for TabId used by Index.ets and BottomTabBar.ets.
export type TabId =
  | 'tab-home'
  | 'tab-fridge'
  | 'tab-mood'
  | 'tab-log';

// Tab surface ids mirror the surfaceId values in ui-tree.json.
export type AppSurface =
  | 'home'
  | 'fridge'
  | 'mood'
  | 'log'
  | 'share-card';

export const TAB_TO_SURFACE: Record<TabId, AppSurface> = {
  'tab-home': 'home',
  'tab-fridge': 'fridge',
  'tab-mood': 'mood',
  'tab-log': 'log',
};

export function isTabSurface(s: AppSurface): boolean {
  return s === 'home' || s === 'fridge' || s === 'mood' || s === 'log';
}
