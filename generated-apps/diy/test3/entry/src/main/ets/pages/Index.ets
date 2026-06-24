// Index.ets — 手作·印记 应用外壳
// 保留固定底部 Tab 壳: tab surfaces 与 BottomTabBar 同处一个 Stack;
// 非 tab 二级页(class-detail / profile-edit / dormant / inventory)整页替换。
// 保持 CurrentSurface() 仅承载当前页面根, BottomTabBar 仍在同一 Stack 内。

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

import { HomePage } from './HomePage';
import { ClassesPage } from './ClassesPage';
import { PointsPage } from './PointsPage';
import { ProfilePage } from './ProfilePage';
import { ClassDetailPage } from './ClassDetailPage';
import { ProfileEditPage } from './ProfileEditPage';
import { DormantPage } from './DormantPage';
import { InventoryPage } from './InventoryPage';

type AppSurface =
  | 'home'
  | 'classes'
  | 'points'
  | 'profile'
  | 'class-detail'
  | 'profile-edit'
  | 'dormant'
  | 'inventory';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingClassId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';
  // 触发页面刷新的版本号(从二级页返回后刷新 tab 页)
  @State refreshTick: number = 0;

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
        refreshTick: this.refreshTick,
        goToTab: (tab: TabId): void => this.goToTab(tab),
        goDormant: (): void => this.openDormant(),
      })
    } else if (this.surface === 'classes') {
      ClassesPage({
        refreshTick: this.refreshTick,
        goToTab: (tab: TabId): void => this.goToTab(tab),
        openDetail: (classId: string): void => this.openClassDetail(classId),
      })
    } else if (this.surface === 'points') {
      PointsPage({ refreshTick: this.refreshTick })
    } else if (this.surface === 'profile') {
      ProfilePage({
        refreshTick: this.refreshTick,
        goToTab: (tab: TabId): void => this.goToTab(tab),
        openEdit: (): void => this.openProfileEdit(),
        openInventory: (): void => this.openInventory(),
        openDormant: (): void => this.openDormant(),
      })
    } else if (this.surface === 'class-detail') {
      ClassDetailPage({
        classId: this.pendingClassId,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'profile-edit') {
      ProfileEditPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'dormant') {
      DormantPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'inventory') {
      InventoryPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'classes' || s === 'points' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    this.refreshTick += 1; // 切回 tab 时刷新数据
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-classes') {
      this.surface = 'classes';
    } else if (tab === 'tab-points') {
      this.surface = 'points';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
    }
  }

  private returnToTab(tab: TabId): void {
    this.refreshTick += 1; // 二级页操作后刷新来源 tab
    this.goToTab(tab);
  }

  private openClassDetail(classId: string): void {
    this.pendingClassId = classId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'class-detail';
  }

  private openProfileEdit(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'profile-edit';
  }

  private openInventory(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'inventory';
  }

  private openDormant(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'dormant';
  }
}
