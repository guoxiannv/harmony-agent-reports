// TabTypes.ets
// Shared TabId contract for the 今天吃什么 bottom-tab shell.
// Tabs: home, recommend, checkin, profile. Update BottomTabBar + Index together.
export type TabId =
  | 'tab-home'
  | 'tab-recommend'
  | 'tab-checkin'
  | 'tab-profile';
