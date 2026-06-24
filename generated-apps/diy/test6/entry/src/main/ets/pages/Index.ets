// 手作·印记 — app shell.
// Owns tab state and non-tab surface replacement. Fixed bottom-tab shell contract:
// tab surfaces rendered inline with BottomTabBar; detail/edit/record pages replace
// the tab view. Preserves scaffold shell structure (do not rewrite into native Tabs).

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

import { HomePage } from '../pages/HomePage';
import { MembersPage } from '../pages/MembersPage';
import { CoursesPage } from '../pages/CoursesPage';
import { PointsPage } from '../pages/PointsPage';
import { InventoryPage } from '../pages/InventoryPage';

import { MemberDetailPage } from '../pages/MemberDetailPage';
import { MemberEditPage } from '../pages/MemberEditPage';
import { CourseDetailPage } from '../pages/CourseDetailPage';
import { CourseBookingPage } from '../pages/CourseBookingPage';
import { PointRecordPage } from '../pages/PointRecordPage';
import { InventoryEditPage } from '../pages/InventoryEditPage';
import { InventoryTransactionPage } from '../pages/InventoryTransactionPage';

export type AppSurface =
  | 'home'
  | 'members'
  | 'courses'
  | 'points'
  | 'inventory'
  | 'member-detail'
  | 'member-edit'
  | 'course-detail'
  | 'course-booking'
  | 'point-record'
  | 'inventory-edit'
  | 'inventory-transaction';

// Cross-page navigation request carried by callbacks.
export interface NavOpen {
  target: AppSurface;
  memberId?: string;
  courseId?: string;
  materialId?: string;
}

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingMemberId: string = '';
  @State pendingCourseId: string = '';
  @State pendingMaterialId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';
  // List filter presets pushed from home reminders.
  @State membersFilterSleeping: boolean = false;
  @State inventoryFilterLow: boolean = false;

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
        onOpen: (req: NavOpen): void => this.handleOpen(req),
        goToTab: (tab: TabId): void => this.goToTab(tab),
      })
    } else if (this.surface === 'members') {
      MembersPage({
        sleepingOnlyInit: this.membersFilterSleeping,
        onOpen: (req: NavOpen): void => this.handleOpen(req),
        onConsumedSleepingFilter: (): void => { this.membersFilterSleeping = false; },
      })
    } else if (this.surface === 'courses') {
      CoursesPage({
        onOpen: (req: NavOpen): void => this.handleOpen(req),
      })
    } else if (this.surface === 'points') {
      PointsPage({
        onOpen: (req: NavOpen): void => this.handleOpen(req),
      })
    } else if (this.surface === 'inventory') {
      InventoryPage({
        lowOnlyInit: this.inventoryFilterLow,
        onOpen: (req: NavOpen): void => this.handleOpen(req),
        onConsumedLowFilter: (): void => { this.inventoryFilterLow = false; },
      })
    } else if (this.surface === 'member-detail') {
      MemberDetailPage({
        memberId: this.pendingMemberId,
        onOpen: (req: NavOpen): void => this.handleOpen(req),
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'member-edit') {
      MemberEditPage({
        editingId: this.pendingMemberId,
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
        onCancel: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'course-detail') {
      CourseDetailPage({
        courseId: this.pendingCourseId,
        onOpen: (req: NavOpen): void => this.handleOpen(req),
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'course-booking') {
      CourseBookingPage({
        courseId: this.pendingCourseId,
        onDone: (): void => { this.surface = 'course-detail'; },
        onCancel: (): void => { this.surface = 'course-detail'; },
      })
    } else if (this.surface === 'point-record') {
      PointRecordPage({
        memberIdInit: this.pendingMemberId,
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
        onCancel: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'inventory-edit') {
      InventoryEditPage({
        editingId: this.pendingMaterialId,
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
        onCancel: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    } else if (this.surface === 'inventory-transaction') {
      InventoryTransactionPage({
        materialIdInit: this.pendingMaterialId,
        onDone: (): void => this.returnToTab(this.lastTabBeforePush),
        onCancel: (): void => this.returnToTab(this.lastTabBeforePush),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'members' || s === 'courses' || s === 'points' || s === 'inventory';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-members') {
      this.membersFilterSleeping = false;
      this.surface = 'members';
    } else if (tab === 'tab-courses') {
      this.surface = 'courses';
    } else if (tab === 'tab-points') {
      this.surface = 'points';
    } else if (tab === 'tab-inventory') {
      this.inventoryFilterLow = false;
      this.surface = 'inventory';
    }
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }

  private handleOpen(req: NavOpen): void {
    this.pendingMemberId = req.memberId !== undefined ? req.memberId : '';
    this.pendingCourseId = req.courseId !== undefined ? req.courseId : '';
    this.pendingMaterialId = req.materialId !== undefined ? req.materialId : '';

    if (req.target === 'members') {
      this.membersFilterSleeping = true;
      this.activeTab = 'tab-members';
      this.surface = 'members';
      return;
    }
    if (req.target === 'inventory') {
      this.inventoryFilterLow = true;
      this.activeTab = 'tab-inventory';
      this.surface = 'inventory';
      return;
    }
    if (req.target === 'points') {
      this.activeTab = 'tab-points';
      this.surface = 'points';
      return;
    }
    if (this.isTabSurface(this.surface)) {
      this.lastTabBeforePush = this.activeTab;
    }
    if (req.target === 'member-detail') {
      this.surface = 'member-detail';
    } else if (req.target === 'member-edit') {
      this.surface = 'member-edit';
    } else if (req.target === 'course-detail') {
      this.surface = 'course-detail';
    } else if (req.target === 'course-booking') {
      this.surface = 'course-booking';
    } else if (req.target === 'point-record') {
      this.surface = 'point-record';
    } else if (req.target === 'inventory-edit') {
      this.surface = 'inventory-edit';
    } else if (req.target === 'inventory-transaction') {
      this.surface = 'inventory-transaction';
    }
  }
}
