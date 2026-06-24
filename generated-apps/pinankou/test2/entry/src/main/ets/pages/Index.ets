// Index.ets — app shell. Owns tab state + surface switching.
import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { DataStore } from '../services/DataStore';
import { PhoneService } from '../services/PhoneService';

import { HomePage } from '../pages/Home';
import { HazardPage } from '../pages/Hazard';
import { HazardDetailPage } from '../pages/HazardDetail';
import { HazardEditPage } from '../pages/HazardEdit';
import { PatrolPage } from '../pages/Patrol';
import { ContactsPage } from '../pages/Contacts';
import { StatsPage } from '../pages/Stats';
import { ProfilePage } from '../pages/Profile';

type AppSurface =
  | 'home'
  | 'hazard'
  | 'hazard-detail'
  | 'hazard-edit'
  | 'patrol'
  | 'contacts'
  | 'stats'
  | 'profile';

@Entry
@Component
struct Index {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingHazardId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'hazard' || s === 'patrol' || s === 'contacts' || s === 'stats' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-hazard') {
      this.surface = 'hazard';
    } else if (tab === 'tab-patrol') {
      this.surface = 'patrol';
    } else if (tab === 'tab-contacts') {
      this.surface = 'contacts';
    } else if (tab === 'tab-stats') {
      this.surface = 'stats';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
    }
  }

  private openHazardEdit(hazardId: string): void {
    this.pendingHazardId = hazardId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'hazard-edit';
  }

  private openHazardDetail(hazardId: string): void {
    this.pendingHazardId = hazardId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'hazard-detail';
  }

  private returnToTab(): void {
    this.goToTab(this.lastTabBeforePush);
  }

  private openPatrol(): void {
    this.goToTab('tab-patrol');
  }

  private emergencyCall(): void {
    const c = this.store.primaryContact();
    if (c) {
      PhoneService.call(c.phone);
    } else {
      PhoneService.call('120');
    }
  }

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          this.CurrentSurface()
        }
        .width('100%')
        .height('100%')
        .padding({ bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight : 0 })

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
        goToTab: (tab: TabId): void => this.goToTab(tab),
        openHazardEdit: (hazardId: string): void => this.openHazardEdit(hazardId),
        openPatrol: (): void => this.openPatrol(),
        emergencyCall: (): void => this.emergencyCall(),
      })
    } else if (this.surface === 'hazard') {
      HazardPage({
        openDetail: (hazardId: string): void => this.openHazardDetail(hazardId),
        openCreate: (): void => this.openHazardEdit(''),
      })
    } else if (this.surface === 'hazard-detail') {
      HazardDetailPage({
        hazardId: this.pendingHazardId,
        onBack: (): void => this.returnToTab(),
        openEdit: (hazardId: string): void => this.openHazardEdit(hazardId),
      })
    } else if (this.surface === 'hazard-edit') {
      HazardEditPage({
        hazardId: this.pendingHazardId,
        onBack: (): void => this.returnToTab(),
        onSaved: (): void => {
          this.returnToTab();
        },
      })
    } else if (this.surface === 'patrol') {
      PatrolPage()
    } else if (this.surface === 'contacts') {
      ContactsPage()
    } else if (this.surface === 'stats') {
      StatsPage()
    } else if (this.surface === 'profile') {
      ProfilePage()
    }
  }
}
