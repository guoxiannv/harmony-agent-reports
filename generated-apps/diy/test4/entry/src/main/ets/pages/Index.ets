import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { AppController, AppState } from '../viewmodel/AppState';
import { AppStore } from '../service/Store';
import { Repository } from '../service/Repository';
import { HomePage } from './HomePage';
import { CalendarPage } from './CalendarPage';
import { MembersPage } from './MembersPage';
import { MyPage } from './MyPage';
import { PointsPage } from './PointsPage';
import { BookingPage } from './BookingPage';
import { DormantPage } from './DormantPage';
import { InventoryPage } from './InventoryPage';
import { ProfilePage } from './ProfilePage';

type AppSurface =
  | 'home'
  | 'calendar'
  | 'members'
  | 'my'
  | 'points'
  | 'booking'
  | 'dormant'
  | 'inventory'
  | 'profile';

@Entry
@Component
struct Index {
  @State appState: AppState = new AppState();
  private store: AppStore = new AppStore();
  private repo: Repository = new Repository(this.store);
  private appCtrl: AppController = new AppController(this.repo, this.appState);

  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State lastTabBeforePush: TabId = 'tab-home';

  aboutToAppear(): void {
    this.store.init(getContext(this)).then(() => {
      this.appCtrl.init().then(() => {
        this.appCtrl.ensureSeedData();
      });
    });
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
        state: this.appState,
        ctrl: this.appCtrl,
        onPoints: (): void => this.openSurface('points', 'tab-home'),
        onBooking: (): void => this.openSurface('booking', 'tab-home'),
        onDormant: (): void => this.openSurface('dormant', 'tab-home'),
        onInventory: (): void => this.openSurface('inventory', 'tab-home'),
      })
    } else if (this.surface === 'calendar') {
      CalendarPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBooking: (): void => this.openSurface('booking', 'tab-calendar'),
      })
    } else if (this.surface === 'members') {
      MembersPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onProfile: (id: string): void => this.openProfile(id),
      })
    } else if (this.surface === 'my') {
      MyPage({ state: this.appState, ctrl: this.appCtrl })
    } else if (this.surface === 'points') {
      PointsPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'booking') {
      BookingPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'dormant') {
      DormantPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'inventory') {
      InventoryPage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'profile') {
      ProfilePage({
        state: this.appState,
        ctrl: this.appCtrl,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'calendar' || s === 'members' || s === 'my';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') this.surface = 'home';
    else if (tab === 'tab-calendar') this.surface = 'calendar';
    else if (tab === 'tab-members') this.surface = 'members';
    else if (tab === 'tab-my') this.surface = 'my';
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }

  private openSurface(surface: AppSurface, fromTab: TabId): void {
    this.lastTabBeforePush = fromTab;
    this.surface = surface;
  }

  private openProfile(id: string): void {
    this.appCtrl.setCurrentMember(id);
    this.openSurface('profile', 'tab-members');
  }
}
