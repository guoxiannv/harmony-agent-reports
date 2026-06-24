// Index — app shell for 今天吃什么.
//
// Preserves the scaffold shell contract: tab surfaces render together with the
// fixed BottomTabBar inside one Stack; non-tab surfaces (dish-detail,
// share-card) replace the tab view; overlays (checkin-form, wheel-settings)
// render on top with a scrim. Tab/surface state lives in the observable
// AppController (V2 @Trace). Content is centered to Theme.contentMaxWidth and
// the BottomTabBar is constrained to the same width and docked to the bottom.

import { AppController, AppSurface, AppTab } from '../controller/AppController';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';
import { BottomTabBar } from '../components/BottomTabBar';
import { HomePage } from './HomePage';
import { IngredientsPage } from './IngredientsPage';
import { DiscoverPage } from './DiscoverPage';
import { CheckinPage } from './CheckinPage';
import { ProfilePage } from './ProfilePage';
import { DishDetailPage } from './DishDetailPage';
import { ShareCardPage } from './ShareCardPage';
import { CheckinFormSheet } from './CheckinFormSheet';
import { WheelSettingsSheet } from './WheelSettingsSheet';

@Entry
@Component
struct Index {
  controller: AppController = AppController.getInstance();

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        this.CurrentSurface()
      }
      .width(Theme.contentMaxWidth)
      .height('100%')
      .padding({
        bottom: this.controller.isTabSurface() ? Theme.bottomTabHeight + 24 : 0,
      })

      if (this.controller.isTabSurface()) {
        BottomTabBar({
          activeTab: this.controller.activeTab as TabId,
          onTap: (tab: TabId) => this.controller.goToTab(tab as AppTab),
        })
      }

      if (this.controller.checkinFormVisible) {
        this.overlayScrim(() => this.controller.cancelCheckinForm())
        CheckinFormSheet({ controller: this.controller })
          .height('auto')
      }

      if (this.controller.wheelSettingsVisible) {
        this.overlayScrim(() => this.controller.closeWheelSettings())
        WheelSettingsSheet({ controller: this.controller })
          .height('auto')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
    .alignContent(this.overlayActive() ? Alignment.Bottom : Alignment.Bottom)
  }

  private overlayActive(): boolean {
    return this.controller.checkinFormVisible || this.controller.wheelSettingsVisible;
  }

  @Builder
  CurrentSurface() {
    if (this.controller.surface === 'home') {
      HomePage({ controller: this.controller })
    } else if (this.controller.surface === 'ingredients') {
      IngredientsPage({ controller: this.controller })
    } else if (this.controller.surface === 'discover') {
      DiscoverPage({ controller: this.controller })
    } else if (this.controller.surface === 'checkin') {
      CheckinPage({ controller: this.controller })
    } else if (this.controller.surface === 'profile') {
      ProfilePage({ controller: this.controller })
    } else if (this.controller.surface === 'dish-detail') {
      DishDetailPage({ controller: this.controller })
    } else if (this.controller.surface === 'share-card') {
      ShareCardPage({ controller: this.controller })
    }
  }

  @Builder
  overlayScrim(onTap: () => void) {
    Column()
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(26,26,26,0.45)')
      .onClick(() => onTap())
  }
}
