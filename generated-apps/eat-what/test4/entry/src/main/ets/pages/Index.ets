// Index.ets
//
// App shell for 今天吃什么. Owns tab state and surface switching across the
// four tab surfaces (home / fridge / mood / log) plus the share-card overlay.
// Preserves the fixed BottomTabBar shell contract from the scaffold.

import { Theme } from '../common/Theme';
import { TabId, AppSurface, TAB_TO_SURFACE, isTabSurface } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { HomePage } from './HomePage';
import { FridgePage } from './FridgePage';
import { MoodPage } from './MoodPage';
import { LogPage } from './LogPage';
import { ShareCardSheet } from './ShareCardSheet';
import { shareCardController } from '../controller/ShareCardController';
import { logController } from '../controller/LogController';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State shareOpen: boolean = false;

  aboutToAppear(): void {
    shareCardController.onChange = () => {
      this.shareOpen = shareCardController.state === 'open';
    };
    logController.refresh();
  }

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          this.CurrentSurface()
        }
        .width('100%')
        .height('100%')
        .padding({
          bottom: isTabSurface(this.surface) ? Theme.bottomTabHeight + 24 : 0,
        })

        if (isTabSurface(this.surface)) {
          BottomTabBar({
            activeTab: this.activeTab,
            onTap: (tab: TabId): void => this.goToTab(tab),
          })
        }
      }
      .width('100%')
      .height('100%')

      if (this.shareOpen) {
        ShareCardSheet()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.surface === 'home') {
      HomePage()
    } else if (this.surface === 'fridge') {
      FridgePage()
    } else if (this.surface === 'mood') {
      MoodPage()
    } else if (this.surface === 'log') {
      LogPage()
    }
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    const next: AppSurface = TAB_TO_SURFACE[tab];
    this.surface = next;
    if (next === 'log') {
      logController.refresh();
    }
  }
}
