import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

import { HomePage } from '../pages/HomePage';
import { MembersPage } from '../pages/MembersPage';
import { CoursesPage } from '../pages/CoursesPage';
import { InventoryPage } from '../pages/InventoryPage';
import { ProfilePage } from '../pages/ProfilePage';
import { MemberDetailPage } from '../pages/MemberDetailPage';
import { MemberEditorPage } from '../pages/MemberEditorPage';
import { PointsPage } from '../pages/PointsPage';
import { CourseDetailPage } from '../pages/CourseDetailPage';
import { CourseEditorPage } from '../pages/CourseEditorPage';
import { SleepingMembersPage } from '../pages/SleepingMembersPage';
import { CheckInPage } from '../pages/CheckInPage';
import { MaterialEditorPage } from '../pages/MaterialEditorPage';
import { RedeemSheetPage } from '../pages/RedeemSheetPage';

type AppSurface =
  | 'home'
  | 'members'
  | 'courses'
  | 'inventory'
  | 'profile'
  | 'member-detail'
  | 'member-editor'
  | 'points'
  | 'course-detail'
  | 'course-editor'
  | 'sleeping-members'
  | 'check-in'
  | 'material-editor'
  | 'redeem-sheet';

interface SurfaceState {
  surface: AppSurface;
  pendingMemberId: string;
  pendingCourseId: string;
  pendingMaterialId: string;
  lastTab: TabId;
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

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        this.CurrentSurface()
      }
      .width('100%')
      .height('100%')
      .padding({
        bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 8 : 0,
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
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.surface === 'home') {
      HomePage({
        onQuickCheckIn: (): void => this.push('check-in'),
        onOpenSleeping: (): void => this.push('sleeping-members'),
      })
    } else if (this.surface === 'members') {
      MembersPage({
        onAddMember: (): void => {
          this.pendingMemberId = '';
          this.push('member-editor');
        },
        onOpenMember: (id: string): void => {
          this.pendingMemberId = id;
          this.push('member-detail');
        },
      })
    } else if (this.surface === 'courses') {
      CoursesPage({
        onAddCourse: (): void => {
          this.pendingCourseId = '';
          this.push('course-editor');
        },
        onOpenCourse: (id: string): void => {
          this.pendingCourseId = id;
          this.push('course-detail');
        },
      })
    } else if (this.surface === 'inventory') {
      InventoryPage({
        onAddMaterial: (): void => {
          this.pendingMaterialId = '';
          this.push('material-editor');
        },
      })
    } else if (this.surface === 'profile') {
      ProfilePage({
        onOpenPoints: (): void => this.push('points'),
      })
    } else if (this.surface === 'member-detail') {
      MemberDetailPage({
        memberId: this.pendingMemberId,
        onBack: (): void => this.pop(),
        onEdit: (): void => this.push('member-editor'),
        onOpenPoints: (): void => this.push('points'),
      })
    } else if (this.surface === 'member-editor') {
      MemberEditorPage({
        memberId: this.pendingMemberId,
        onBack: (): void => this.pop(),
        onSaved: (): void => {
          if (this.lastTabBeforePush === 'tab-members') {
            this.pop();
          } else {
            this.returnToTab('tab-members');
          }
        },
      })
    } else if (this.surface === 'points') {
      PointsPage({
        onBack: (): void => this.pop(),
        onRedeem: (): void => this.push('redeem-sheet'),
      })
    } else if (this.surface === 'redeem-sheet') {
      RedeemSheetPage({
        onBack: (): void => this.pop(),
      })
    } else if (this.surface === 'course-detail') {
      CourseDetailPage({
        courseId: this.pendingCourseId,
        onBack: (): void => this.pop(),
      })
    } else if (this.surface === 'course-editor') {
      CourseEditorPage({
        courseId: this.pendingCourseId,
        onBack: (): void => this.pop(),
        onSaved: (): void => {
          if (this.lastTabBeforePush === 'tab-courses') {
            this.pop();
          } else {
            this.returnToTab('tab-courses');
          }
        },
      })
    } else if (this.surface === 'sleeping-members') {
      SleepingMembersPage({
        onBack: (): void => this.pop(),
      })
    } else if (this.surface === 'check-in') {
      CheckInPage({
        onBack: (): void => this.pop(),
      })
    } else if (this.surface === 'material-editor') {
      MaterialEditorPage({
        materialId: this.pendingMaterialId,
        onBack: (): void => this.pop(),
        onSaved: (): void => {
          if (this.lastTabBeforePush === 'tab-inventory') {
            this.pop();
          } else {
            this.returnToTab('tab-inventory');
          }
        },
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'members' || s === 'courses' || s === 'inventory' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-members') {
      this.surface = 'members';
    } else if (tab === 'tab-courses') {
      this.surface = 'courses';
    } else if (tab === 'tab-inventory') {
      this.surface = 'inventory';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
    }
  }

  private push(surface: AppSurface): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = surface;
  }

  private pop(): void {
    this.goToTab(this.lastTabBeforePush);
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }
}
