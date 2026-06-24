import { common } from '@kit.AbilityKit';
import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { AppServices } from '../services/AppServices';
import { AppViewModel } from '../viewmodels/AppViewModel';
import { AppSurface, ReminderDialogMode, SheetSurface } from '../models/AppTypes';
import { HomePage } from './HomePage';
import { RecordsPage } from './RecordsPage';
import { TrendsPage } from './TrendsPage';
import { CarePage } from './CarePage';
import { ProfilePage } from './ProfilePage';
import { PetEditorPage } from './PetEditorPage';
import { MedicalCaseEditorPage } from './MedicalCaseEditorPage';
import { ReminderDetailPage } from './ReminderDetailPage';
import { MedicalCasePage } from './MedicalCasePage';

@Entry
@Component
struct Index {
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext
  private services: AppServices = AppServices.get(this.context)
  private vm: AppViewModel = new AppViewModel(this.services)

  @State private surface: AppSurface = AppSurface.Home
  @State private activeTab: TabId = 'tab-home'
  @State private sheet: SheetSurface = SheetSurface.None

  aboutToAppear(): void {
    this.vm.load().then(() => {
      this.goToTab('tab-home')
    })
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

        if (this.isTabSurface()) {
          BottomTabBar({
            activeTab: this.activeTab,
            onTap: (tab: TabId): void => this.goToTab(tab)
          })
        }
      }
      .width('100%')
      .height('100%')

      if (this.sheet !== SheetSurface.None) {
        SheetOverlay({
          sheet: this.sheet,
          onClose: (): void => this.closeSheet()
        })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  CurrentSurface() {
    HomePageBuilder({
      surface: this.surface,
      vm: this.vm,
      onOpenSheet: (s: SheetSurface): void => this.openSheet(s),
      onGoToSurface: (s: AppSurface): void => this.goToSurface(s)
    })
  }

  private isTabSurface(surface: AppSurface = this.surface): boolean {
    return surface === AppSurface.Home ||
      surface === AppSurface.Records ||
      surface === AppSurface.Trends ||
      surface === AppSurface.Care ||
      surface === AppSurface.Profile
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab
    this.vm.setTab(tab)
    if (tab === 'tab-home') {
      this.surface = AppSurface.Home
    } else if (tab === 'tab-records') {
      this.surface = AppSurface.Records
    } else if (tab === 'tab-trends') {
      this.surface = AppSurface.Trends
    } else if (tab === 'tab-care') {
      this.surface = AppSurface.Care
    } else if (tab === 'tab-profile') {
      this.surface = AppSurface.Profile
    }
    this.vm.setSurface(this.surface as string)
  }

  private goToSurface(surface: AppSurface): void {
    this.surface = surface
    this.vm.setSurface(surface as string)
  }

  private openSheet(sheet: SheetSurface): void {
    this.sheet = sheet
    this.vm.openSheet(sheet)
  }

  private closeSheet(): void {
    this.sheet = SheetSurface.None
    this.vm.closeSheet()
  }
}

@Component
struct HomePageBuilder {
  @Prop surface: AppSurface
  vm: AppViewModel = new AppViewModel(AppServices.get(getContext(this) as common.UIAbilityContext))
  onOpenSheet: (sheet: SheetSurface) => void = () => {}
  onGoToSurface: (surface: AppSurface) => void = () => {}

  build() {
    if (this.surface === AppSurface.Home) {
      HomePage({
        vm: this.vm,
        onOpenPetPicker: (): void => this.onOpenSheet(SheetSurface.PetPicker),
        onOpenPetEditor: (): void => this.onGoToSurface(AppSurface.PetEditor),
        onOpenAddRecord: (): void => this.onOpenSheet(SheetSurface.AddRecord),
        onOpenRecordDiet: (): void => this.onOpenSheet(SheetSurface.RecordDiet),
        onOpenRecordStool: (): void => this.onOpenSheet(SheetSurface.RecordStool),
        onOpenRecordWeight: (): void => this.onOpenSheet(SheetSurface.RecordWeight),
        onOpenRecordMeds: (): void => this.onOpenSheet(SheetSurface.RecordMeds),
      })
    } else if (this.surface === AppSurface.Records) {
      RecordsPage({
        vm: this.vm,
        onOpenAddRecord: (): void => this.onOpenSheet(SheetSurface.AddRecord),
        onOpenRecordDiet: (): void => this.onOpenSheet(SheetSurface.RecordDiet),
        onOpenRecordStool: (): void => this.onOpenSheet(SheetSurface.RecordStool),
        onOpenRecordWeight: (): void => this.onOpenSheet(SheetSurface.RecordWeight),
        onOpenRecordMeds: (): void => this.onOpenSheet(SheetSurface.RecordMeds),
      })
    } else if (this.surface === AppSurface.Trends) {
      TrendsPage({ vm: this.vm })
    } else if (this.surface === AppSurface.Care) {
      CarePage({
        vm: this.vm,
        onOpenMedicalEditor: (): void => this.onGoToSurface(AppSurface.MedicalCaseEditor),
        onOpenReminderEditor: (reminderId?: string): void => {
          let mode: ReminderDialogMode = reminderId && reminderId.length > 0 ? ReminderDialogMode.Edit : ReminderDialogMode.Create
          this.vm.openReminderEditor(mode, reminderId ?? '')
        }
      })
    } else if (this.surface === AppSurface.Profile) {
      ProfilePage({
        vm: this.vm,
        onOpenPetEditor: (): void => this.onGoToSurface(AppSurface.PetEditor),
        onOpenFamilyInvite: (): void => this.onOpenSheet(SheetSurface.FamilyInvite),
      })
    } else if (this.surface === AppSurface.PetEditor) {
      PetEditorPage({
        vm: this.vm,
        onBack: (): void => this.onGoToSurface(AppSurface.Home),
      })
    } else if (this.surface === AppSurface.MedicalCaseEditor) {
      MedicalCaseEditorPage({
        vm: this.vm,
        onBack: (): void => this.onGoToSurface(AppSurface.Care),
      })
    } else if (this.surface === AppSurface.ReminderDetail) {
      ReminderDetailPage({
        vm: this.vm,
        onBack: (): void => this.onGoToSurface(AppSurface.Care),
      })
    } else if (this.surface === AppSurface.MedicalCase) {
      MedicalCasePage({
        vm: this.vm,
        onBack: (): void => this.onGoToSurface(AppSurface.Care),
        onOpenMedicalEditor: (): void => this.onGoToSurface(AppSurface.MedicalCaseEditor),
      })
    }
  }
}

@Component
struct SheetOverlay {
  @Prop sheet: SheetSurface
  onClose: () => void = () => {}

  build() {
    Stack() {
      Column() {
        Text('Sheet placeholder')
          .fontSize(16)
          .fontColor(Theme.textPrimary)
        Button('关闭')
          .onClick(() => this.onClose())
      }
      .width('100%')
      .height(300)
      .backgroundColor(Theme.cardBg)
      .borderRadius({ topLeft: 28, topRight: 28 })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(22,56,52,0.35)')
    .onClick(() => this.onClose())
    .align(Alignment.Bottom)
  }
}
