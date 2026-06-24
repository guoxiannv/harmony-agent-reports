import { Theme, BrandGradient } from '../common/Theme';
import { TabId, AppSurface } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';

import { HomePage } from '../pages/HomePage';
import { InspectionsPage } from '../pages/InspectionsPage';
import { InspectionDetailPage } from '../pages/InspectionDetailPage';
import { HazardsPage } from '../pages/HazardsPage';
import { HazardDetailPage } from '../pages/HazardDetailPage';
import { SafetyNotesPage } from '../pages/SafetyNotesPage';
import { SafetyNoteDetailPage } from '../pages/SafetyNoteDetailPage';
import { ContactsPage } from '../pages/ContactsPage';
import { ContactDetailPage } from '../pages/ContactDetailPage';
import { StatsPage } from '../pages/StatsPage';
import { ProfilePage } from '../pages/ProfilePage';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingId: string = '';
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
          bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 16 : 0
        })

        if (this.isTabSurface(this.surface)) {
          BottomTabBar({
            activeTab: this.activeTab,
            onTap: (tab: TabId): void => this.goToTab(tab)
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
        onNavigate: (target: AppSurface): void => this.openSurface(target),
        onOpenDetail: (target: AppSurface, id: string): void => this.openDetail(target, id)
      })
    } else if (this.surface === 'inspections') {
      InspectionsPage({
        onBack: (): void => this.goToTab('tab-home'),
        onOpenDetail: (id: string): void => this.openDetail('inspection-detail', id)
      })
    } else if (this.surface === 'hazards') {
      HazardsPage({
        onBack: (): void => this.goToTab('tab-home'),
        onOpenDetail: (id: string): void => this.openDetail('hazard-detail', id)
      })
    } else if (this.surface === 'stats') {
      StatsPage()
    } else if (this.surface === 'profile') {
      ProfilePage({
        onOpenDetail: (target: AppSurface): void => this.openSurface(target)
      })
    } else if (this.surface === 'safety-notes') {
      SafetyNotesPage({
        onBack: (): void => this.goToTab('tab-home'),
        onOpenDetail: (id: string): void => this.openDetail('safety-note-detail', id)
      })
    } else if (this.surface === 'safety-note-detail') {
      SafetyNoteDetailPage({
        noteId: this.pendingId,
        onBack: (): void => this.returnToLastTab()
      })
    } else if (this.surface === 'inspection-detail') {
      InspectionDetailPage({
        inspectionId: this.pendingId,
        onBack: (): void => this.returnToLastTab(),
        onOpenHazard: (id: string): void => this.openDetail('hazard-detail', id)
      })
    } else if (this.surface === 'hazard-detail') {
      HazardDetailPage({
        hazardId: this.pendingId,
        onBack: (): void => this.returnToLastTab()
      })
    } else if (this.surface === 'contacts') {
      ContactsPage({
        onBack: (): void => this.goToTab('tab-home'),
        onOpenDetail: (id: string): void => this.openDetail('contact-detail', id)
      })
    } else if (this.surface === 'contact-detail') {
      ContactDetailPage({
        contactId: this.pendingId,
        onBack: (): void => this.returnToLastTab()
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'inspections' || s === 'hazards' || s === 'stats' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    if (tab === 'tab-home') this.surface = 'home';
    else if (tab === 'tab-inspections') this.surface = 'inspections';
    else if (tab === 'tab-hazards') this.surface = 'hazards';
    else if (tab === 'tab-stats') this.surface = 'stats';
    else if (tab === 'tab-profile') this.surface = 'profile';
  }

  private openSurface(target: AppSurface): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = target;
  }

  private openDetail(target: AppSurface, id: string): void {
    this.lastTabBeforePush = this.activeTab;
    this.pendingId = id;
    this.surface = target;
  }

  private returnToLastTab(): void {
    this.goToTab(this.lastTabBeforePush);
    this.pendingId = '';
  }
}
