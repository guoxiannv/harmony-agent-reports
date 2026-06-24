// Index.ets
//
// App shell for "今天吃什么". Owns the active tab + current surface and
// hosts the fixed BottomTabBar. Tab surfaces (home/ingredients/records) are
// rendered together with the bar; secondary surfaces (wheel/filter/
// record-form/share-card) replace the tab view as full pages.

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { ShareCardData } from '../common/Models';

import { HomePage } from '../pages/HomePage';
import { IngredientsPage } from '../pages/IngredientsPage';
import { RecordsPage } from '../pages/RecordsPage';
import { WheelPage } from '../pages/WheelPage';
import { FilterPage } from '../pages/FilterPage';
import { RecordFormPage } from '../pages/RecordFormPage';
import { ShareCardPage } from '../pages/ShareCardPage';

type AppSurface =
  | 'home'
  | 'ingredients'
  | 'records'
  | 'wheel'
  | 'filter'
  | 'record-form'
  | 'share-card';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State lastTabBeforePush: TabId = 'tab-home';
  @State shareData: ShareCardData | null = null;

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          this.CurrentSurface()
        }
        .width('100%')
        .height('100%')
        .padding({
          bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight : 0,
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
    .backgroundColor(this.surface === 'wheel' ? Theme.wheelBg : Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.surface === 'home') {
      HomePage({
        goToWheel: (): void => { this.surface = 'wheel'; },
        goToFilter: (): void => { this.rememberTab(); this.surface = 'filter'; },
        openAddRecord: (): void => { this.rememberTab(); this.surface = 'record-form'; },
      })
    } else if (this.surface === 'ingredients') {
      IngredientsPage({
        goToFilter: (): void => { this.rememberTab(); this.surface = 'filter'; },
      })
    } else if (this.surface === 'records') {
      RecordsPage({
        openAddRecord: (): void => { this.rememberTab(); this.surface = 'record-form'; },
        openShare: (data: ShareCardData): void => { this.shareData = data; this.surface = 'share-card'; },
      })
    } else if (this.surface === 'wheel') {
      WheelPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onShare: (data: ShareCardData): void => { this.shareData = data; this.surface = 'share-card'; },
      })
    } else if (this.surface === 'filter') {
      FilterPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'record-form') {
      RecordFormPage({
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
        onCancel: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'share-card') {
      ShareCardPage({
        data: this.shareData,
        onClose: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'ingredients' || s === 'records';
  }

  private rememberTab(): void {
    this.lastTabBeforePush = this.activeTab;
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-ingredients') {
      this.surface = 'ingredients';
    } else if (tab === 'tab-records') {
      this.surface = 'records';
    }
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }
}
