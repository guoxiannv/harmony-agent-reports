import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { AppSurface } from '../models/AppTypes';
import { RecordType } from '../models/Record';
import { JsonPreferenceStore } from '../service/Store';
import { Repository } from '../service/Repository';
import { AppState, AppViewModel } from '../viewmodel/AppViewModel';

import { HomePage } from '../pages/HomePage';
import { RecordsPage } from '../pages/RecordsPage';
import { ChartsPage } from '../pages/ChartsPage';
import { ProfilePage } from '../pages/ProfilePage';
import { PetsPage } from '../pages/PetsPage';
import { PetDetailPage } from '../pages/PetDetailPage';
import { RemindersPage } from '../pages/RemindersPage';
import { MedicalPage } from '../pages/MedicalPage';
import { FamilyPage } from '../pages/FamilyPage';

import {
  RecordEditorSheet,
  PetEditorSheet,
  ReminderEditorSheet,
  MedicalEditorSheet,
  FamilyInviteSheet
} from '../components/SheetEditors';

@Entry
@Component
struct Index {
  private store: JsonPreferenceStore = new JsonPreferenceStore(getContext(this) as Context, 'pawlog')
  private repository: Repository = new Repository(this.store)
  private vm: AppViewModel = new AppViewModel(this.repository)
  @State private appState: AppState = this.vm.state

  aboutToAppear(): void {
    this.vm.load()
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
          bottom: this.isTabSurface(this.appState.currentSurface) ? Theme.bottomTabHeight + 16 : 0
        })

        if (this.isTabSurface(this.appState.currentSurface)) {
          BottomTabBar({
            activeTab: this.appState.activeTab,
            onTap: (tab: TabId): void => this.vm.switchTab(tab),
            onFabTap: (): void => this.vm.openRecordEditor(undefined, RecordType.FOOD, this.appState.selectedPetId)
          })
        }
      }
      .width('100%')
      .height('100%')

      // Sheet overlays
      if (this.appState.sheetMode === 'record-editor') {
        Column() {
          RecordEditorSheet({
            state: this.appState,
            vm: this.vm,
            onClose: (): void => this.vm.closeSheet()
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.40)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.vm.closeSheet())
      }
      if (this.appState.sheetMode === 'pet-editor') {
        Column() {
          PetEditorSheet({
            state: this.appState,
            vm: this.vm,
            onClose: (): void => this.vm.closeSheet()
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.40)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.vm.closeSheet())
      }
      if (this.appState.sheetMode === 'reminder-editor') {
        Column() {
          ReminderEditorSheet({
            state: this.appState,
            vm: this.vm,
            onClose: (): void => this.vm.closeSheet()
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.40)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.vm.closeSheet())
      }
      if (this.appState.sheetMode === 'medical-editor') {
        Column() {
          MedicalEditorSheet({
            state: this.appState,
            vm: this.vm,
            onClose: (): void => this.vm.closeSheet()
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.40)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.vm.closeSheet())
      }
      if (this.appState.sheetMode === 'family-invite') {
        Column() {
          FamilyInviteSheet({
            state: this.appState,
            vm: this.vm,
            onClose: (): void => this.vm.closeSheet()
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.40)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.vm.closeSheet())
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    if (this.appState.currentSurface === 'home') {
      HomePage({
        state: this.appState,
        repository: this.repository,
        onOpenRecordEditor: (recordId?: string, type?: RecordType, petId?: string): void => this.vm.openRecordEditor(recordId, type, petId),
        onOpenPetEditor: (petId?: string): void => this.vm.openPetEditor(petId),
        onSelectPet: (petId: string): void => this.vm.selectPet(petId),
        onNavigateRecords: (): void => this.vm.goToTabSurface('records', 'tab-records'),
        onOpenProfile: (): void => this.vm.switchTab('tab-profile')
      })
    } else if (this.appState.currentSurface === 'records') {
      RecordsPage({
        state: this.appState,
        repository: this.repository,
        onOpenRecordEditor: (recordId?: string): void => this.vm.openRecordEditor(recordId)
      })
    } else if (this.appState.currentSurface === 'charts') {
      ChartsPage({
        state: this.appState,
        repository: this.repository
      })
    } else if (this.appState.currentSurface === 'profile') {
      ProfilePage({
        state: this.appState,
        onNavigatePets: (): void => this.vm.goToNonTab('pets'),
        onNavigateReminders: (): void => this.vm.goToNonTab('reminders'),
        onNavigateMedical: (): void => this.vm.goToNonTab('medical'),
        onNavigateFamily: (): void => this.vm.goToNonTab('family'),
        onNavigateSettings: (): void => {}
      })
    } else if (this.appState.currentSurface === 'pets') {
      PetsPage({
        state: this.appState,
        repository: this.repository,
        onBack: (): void => this.vm.goBack(),
        onOpenPetEditor: (petId?: string): void => this.vm.openPetEditor(petId),
        onNavigatePetDetail: (petId: string): void => {
          this.appState.currentSurface = 'pet-detail'
          this.appState.lastTabBeforePush = this.appState.activeTab
        }
      })
    } else if (this.appState.currentSurface === 'pet-detail') {
      PetDetailPage({
        state: this.appState,
        repository: this.repository,
        petId: this.appState.selectedPetId,
        onBack: (): void => this.vm.goBack(),
        onOpenPetEditor: (petId?: string): void => this.vm.openPetEditor(petId),
        onOpenReminderEditor: (reminderId?: string, petId?: string): void => this.vm.openReminderEditor(reminderId, petId),
        onOpenMedicalEditor: (medicalId?: string, petId?: string): void => this.vm.openMedicalEditor(medicalId, petId)
      })
    } else if (this.appState.currentSurface === 'reminders') {
      RemindersPage({
        state: this.appState,
        repository: this.repository,
        onBack: (): void => this.vm.goBack(),
        onOpenReminderEditor: (reminderId?: string, petId?: string): void => this.vm.openReminderEditor(reminderId, petId)
      })
    } else if (this.appState.currentSurface === 'medical') {
      MedicalPage({
        state: this.appState,
        onBack: (): void => this.vm.goBack(),
        onOpenMedicalEditor: (medicalId?: string, petId?: string): void => this.vm.openMedicalEditor(medicalId, petId)
      })
    } else if (this.appState.currentSurface === 'family') {
      FamilyPage({
        state: this.appState,
        vm: this.vm,
        onBack: (): void => this.vm.goBack(),
        onOpenInvite: (): void => this.vm.openFamilyInvite()
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'records' || s === 'charts' || s === 'profile'
  }
}
