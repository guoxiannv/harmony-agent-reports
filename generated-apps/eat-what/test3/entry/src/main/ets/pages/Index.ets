// Index.ets
//
// App shell for '今天吃什么'. Owns tab state and surface switching.
// Preserves the fixed bottom-tab shell contract:
// - tab surfaces render together with BottomTabBar
// - non-tab surfaces (result / check-in-editor / share-card) are full-page overlays
//
// Pages own their data via AppController; Index only handles navigation between
// surfaces. Surface/page ids align with .arkpilot/designs/ui-tree.json.

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

import { HomePage } from '../pages/HomePage';
import { PantryPage } from '../pages/PantryPage';
import { CheckInPage } from '../pages/CheckInPage';
import { ProfilePage } from '../pages/ProfilePage';
import { ResultPage } from '../pages/ResultPage';
import { CheckInEditorPage } from '../pages/CheckInEditorPage';
import { ShareCardPage } from '../pages/ShareCardPage';

type AppSurface =
  | 'home'
  | 'pantry'
  | 'check-in'
  | 'profile'
  | 'result'
  | 'check-in-editor'
  | 'share-card';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State lastTabBeforePush: TabId = 'tab-home';

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          this.CurrentSurface()
        }
        .width('100%')
        .height('100%')
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
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.surface === 'home') {
      HomePage({
        goToPantry: (): void => this.goToTab('tab-pantry'),
        goToResult: (): void => this.pushNonTab('result'),
      })
    } else if (this.surface === 'pantry') {
      PantryPage({
        goToResult: (): void => this.pushNonTab('result'),
      })
    } else if (this.surface === 'check-in') {
      CheckInPage({
        goToEditor: (): void => this.pushNonTab('check-in-editor'),
        goToShare: (): void => this.pushNonTab('share-card'),
      })
    } else if (this.surface === 'profile') {
      ProfilePage()
    } else if (this.surface === 'result') {
      ResultPage({
        onBack: (): void => this.returnToTab(),
        goToEditor: (): void => this.pushNonTab('check-in-editor'),
        goToShare: (): void => this.pushNonTab('share-card'),
      })
    } else if (this.surface === 'check-in-editor') {
      CheckInEditorPage({
        onBack: (): void => this.returnToTab(),
        onSaved: (): void => this.returnToTab('tab-check-in'),
      })
    } else if (this.surface === 'share-card') {
      ShareCardPage({
        onBack: (): void => this.returnToTab(),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'pantry' || s === 'check-in' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-pantry') {
      this.surface = 'pantry';
    } else if (tab === 'tab-check-in') {
      this.surface = 'check-in';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
    }
  }

  private pushNonTab(target: AppSurface): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = target;
  }

  private returnToTab(preferredTab?: TabId): void {
    const tab: TabId = preferredTab !== undefined ? preferredTab : this.lastTabBeforePush;
    this.goToTab(tab);
  }
}
