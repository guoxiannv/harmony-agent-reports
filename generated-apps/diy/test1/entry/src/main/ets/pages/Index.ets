import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { AppController } from '../viewmodel/AppController';
import { HomePage } from '../pages/HomePage';
import { MembersPage } from '../pages/MembersPage';
import { CalendarPage } from '../pages/CalendarPage';
import { PointsPage } from '../pages/PointsPage';
import { InventoryPage } from '../pages/InventoryPage';
import { MemberDetailPage } from '../pages/MemberDetailPage';
import { MemberFormPage } from '../pages/MemberFormPage';
import { CourseDetailPage } from '../pages/CourseDetailPage';
import { CourseFormPage } from '../pages/CourseFormPage';
import { InventoryLogPage } from '../pages/InventoryLogPage';
import { SettingsPage } from '../pages/SettingsPage';

type AppSurface =
  | 'home'
  | 'members'
  | 'calendar'
  | 'points'
  | 'inventory'
  | 'member-detail'
  | 'member-form'
  | 'course-detail'
  | 'course-form'
  | 'inventory-log'
  | 'settings';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';
  @State ctrl: AppController = new AppController(getContext(this) as Context);

  aboutToAppear(): void {
    this.ctrl.loadAll();
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
          bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 24 : 0,
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
        ctrl: this.ctrl,
        onCheckin: (): void => this.openCheckin(),
        onAddMember: (): void => this.openMemberForm(''),
        onBookCourse: (): void => this.goToTab('tab-calendar'),
        onInventory: (): void => this.goToTab('tab-inventory'),
        onDormantList: (): void => this.openDormantList(),
        onCourseDetail: (id: string): void => this.openCourseDetail(id),
      })
    } else if (this.surface === 'members') {
      MembersPage({
        ctrl: this.ctrl,
        onAddMember: (): void => this.openMemberForm(''),
        onMemberDetail: (id: string): void => this.openMemberDetail(id),
      })
    } else if (this.surface === 'calendar') {
      CalendarPage({
        ctrl: this.ctrl,
        onAddCourse: (): void => this.openCourseForm(''),
        onCourseDetail: (id: string): void => this.openCourseDetail(id),
      })
    } else if (this.surface === 'points') {
      PointsPage({
        ctrl: this.ctrl,
        onMemberDetail: (id: string): void => this.openMemberDetail(id),
      })
    } else if (this.surface === 'inventory') {
      InventoryPage({
        ctrl: this.ctrl,
        onAddItem: (): void => this.openInventoryForm(''),
        onInventoryLog: (): void => this.openInventoryLog(),
        onItemDetail: (id: string): void => this.openInventoryForm(id),
      })
    } else if (this.surface === 'member-detail') {
      MemberDetailPage({
        ctrl: this.ctrl,
        memberId: this.pendingId,
        onBack: (): void => this.returnToTab(),
        onEdit: (): void => this.openMemberForm(this.pendingId),
        onPointsHistory: (): void => this.openPointsHistory(this.pendingId),
        onBookings: (): void => this.openMemberBookings(this.pendingId),
      })
    } else if (this.surface === 'member-form') {
      MemberFormPage({
        ctrl: this.ctrl,
        memberId: this.pendingId,
        onBack: (): void => this.returnToTab(),
        onSaved: (): void => this.returnToTab(),
      })
    } else if (this.surface === 'course-detail') {
      CourseDetailPage({
        ctrl: this.ctrl,
        courseId: this.pendingId,
        onBack: (): void => this.returnToTab(),
        onEdit: (): void => this.openCourseForm(this.pendingId),
      })
    } else if (this.surface === 'course-form') {
      CourseFormPage({
        ctrl: this.ctrl,
        courseId: this.pendingId,
        onBack: (): void => this.returnToTab(),
        onSaved: (): void => this.returnToTab(),
      })
    } else if (this.surface === 'inventory-log') {
      InventoryLogPage({
        ctrl: this.ctrl,
        onBack: (): void => this.returnToTab(),
      })
    } else if (this.surface === 'settings') {
      SettingsPage({
        ctrl: this.ctrl,
        onBack: (): void => this.returnToTab(),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'members' || s === 'calendar' || s === 'points' || s === 'inventory';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-members') {
      this.surface = 'members';
    } else if (tab === 'tab-calendar') {
      this.surface = 'calendar';
    } else if (tab === 'tab-points') {
      this.surface = 'points';
    } else if (tab === 'tab-inventory') {
      this.surface = 'inventory';
    }
  }

  private returnToTab(): void {
    this.goToTab(this.lastTabBeforePush);
  }

  private pushSurface(surface: AppSurface, id: string = ''): void {
    this.lastTabBeforePush = this.activeTab;
    this.pendingId = id;
    this.surface = surface;
  }

  private openMemberDetail(id: string): void {
    this.pushSurface('member-detail', id);
  }

  private openMemberForm(id: string): void {
    this.pushSurface('member-form', id);
  }

  private openCourseDetail(id: string): void {
    this.pushSurface('course-detail', id);
  }

  private openCourseForm(id: string): void {
    this.pushSurface('course-form', id);
  }

  private openInventoryForm(id: string): void {
    this.pushSurface('inventory', id);
  }

  private openInventoryLog(): void {
    this.pushSurface('inventory-log');
  }

  private openPointsHistory(_memberId: string): void {
    // Surface reuse: navigate to points tab scoped to member via controller temp state not used; just open points tab.
    this.goToTab('tab-points');
  }

  private openMemberBookings(_memberId: string): void {
    this.goToTab('tab-calendar');
  }

  private openCheckin(): void {
    // Quick check-in opens member list for selection
    this.goToTab('tab-members');
  }

  private openDormantList(): void {
    this.goToTab('tab-members');
  }
}
