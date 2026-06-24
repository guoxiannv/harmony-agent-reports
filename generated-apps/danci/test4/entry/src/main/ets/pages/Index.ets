// TemplateIndex.ets
//
// A model-friendly Index.ets skeleton for apps that use:
// 1. a fixed BottomTabBar component,
// 2. tab surfaces rendered inline,
// 3. non-tab surfaces rendered as full-page overlays/replacements.
//
// Usage:
// - Replace page imports with your own pages.
// - Keep BottomTabBar naming fixed.
// - Keep tab pages inside isTabSurface().
// - Put detail/cart/profile/editor/confirm pages into non-tab surfaces.

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

// Replace these imports with your real pages.
import { HomePage } from '../pages/HomePage';
import { ExplorePage } from '../pages/ExplorePage';
import { OrdersPage } from '../pages/OrdersPage';
import { RewardsPage } from '../pages/RewardsPage';
import { DetailPage } from '../pages/DetailPage';
import { EditorPage } from '../pages/EditorPage';
import { ProfilePage } from '../pages/ProfilePage'; 

// Split surfaces into:
// - tab surfaces: rendered together with BottomTabBar
// - non-tab surfaces: full pages that temporarily replace the tab view
type AppSurface =
  | 'home'
  | 'explore'
  | 'orders'
  | 'rewards'
  | 'detail'
  | 'editor'
  | 'profile';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingItemId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';

  build() {
    Stack() {
      // Keep the page content layer and BottomTabBar in this same Stack.
      // Do not move BottomTabBar outside this Stack.
      Stack({ alignContent: Alignment.Bottom }) {
        // This Column must contain only the current page root: this.CurrentSurface().
        // Do not add BottomTabBar, overlays, or extra siblings inside this Column.
        Column() {
          this.CurrentSurface()
        }  
        .width('100%')
        .height('100%')
        // Keep this exact contract: .padding({ bottom: ... }) only.
        // Do not add top/left/right padding here or replace this with another layout workaround.
        // This bottom padding is required to prevent page content from overlapping BottomTabBar.
        .padding({
          bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 24 : 0
        })

        if (this.isTabSurface(this.surface)) {
          BottomTabBar({
            activeTab: this.activeTab,
            onTap: (tab: TabId): void => this.goToTab(tab),
          })
        }
      }
      .width('100%')
      .height('100%')

      // Optional floating action layer.
      // Remove if your app does not need it.
      // this.FloatingAction()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.surface === 'home') {
      HomePage({
        goToTab: (tab: TabId): void => this.goToTab(tab),
        goToDetail: (itemId: string): void => this.openDetail(itemId),
      })
    } else if (this.surface === 'explore') {
      ExplorePage({
        goToDetail: (itemId: string): void => this.openDetail(itemId),
      })
    } else if (this.surface === 'orders') {
      OrdersPage()
    } else if (this.surface === 'rewards') {
      RewardsPage({
        goToProfile: (): void => this.openProfile(),
      })
    } else if (this.surface === 'detail') {
      DetailPage({
        itemId: this.pendingItemId,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onOpenEditor: (): void => this.openEditor(),
      })
    } else if (this.surface === 'editor') {
      EditorPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'profile') {
      ProfilePage({
        onBack: (): void => {
          this.surface = 'rewards';
          this.activeTab = 'tab-rewards';
        },
      })
    }
  }

  // Optional example of a floating action button.
  // Uncomment only when needed.
  //
  // @Builder
  // FloatingAction() {
  //   Column() {
  //     Text('+')
  //       .fontSize(24)
  //       .fontColor('#FFFFFF')
  //   }
  //   .width(56)
  //   .height(56)
  //   .borderRadius(28)
  //   .backgroundColor(Theme.brandPrimary)
  //   .justifyContent(FlexAlign.Center)
  //   .alignItems(HorizontalAlign.Center)
  //   .position({ x: '70%', y: '78%' })
  //   .onClick(() => this.openEditor())
  // }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'explore' || s === 'orders' || s === 'rewards';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;

    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-explore') {
      this.surface = 'explore';
    } else if (tab === 'tab-orders') {
      this.surface = 'orders';
    } else if (tab === 'tab-rewards') {
      this.surface = 'rewards';
    }
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }

  private openDetail(itemId: string): void {
    this.pendingItemId = itemId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'detail';
  }

  private openEditor(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'editor';
  }

  private openProfile(): void {
    this.surface = 'profile';
  }
}
