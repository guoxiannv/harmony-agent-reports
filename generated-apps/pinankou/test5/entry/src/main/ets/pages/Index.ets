import { Theme } from '../common/Theme';
import { AppSurface, TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { HomePage } from './HomePage';
import { InspectionPage } from './InspectionPage';
import { InspectionDetailPage } from './InspectionDetailPage';
import { RiskPage } from './RiskPage';
import { RiskDetailPage } from './RiskDetailPage';
import { ReportRiskPage } from './ReportRiskPage';
import { EmergencyPage } from './EmergencyPage';
import { AddContactSheet } from './AddContactSheet';
import { ProfilePage } from './ProfilePage';
import { AboutPage } from './AboutPage';
import { AddInspectionSheet } from './AddInspectionSheet';
import { AppServices } from '../services/AppServices';
import { HomeController } from '../viewmodels/HomeController';
import { InspectionController } from '../viewmodels/InspectionController';
import { RiskController } from '../viewmodels/RiskController';
import { EmergencyController } from '../viewmodels/EmergencyController';
import { ProfileController } from '../viewmodels/ProfileController';
import { InspectionTask, RiskItem } from '../models/Models';
import { Context } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';

function appContext(): Context {
  return getContext() as Context
}

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State pendingItemId: string = '';
  @State lastTabBeforePush: TabId = 'tab-home';
  @State refreshTick: number = 0;

  private services: AppServices = new AppServices(appContext());
  private homeController: HomeController = new HomeController(this.services);
  private inspectionController: InspectionController = new InspectionController(this.services);
  private riskController: RiskController = new RiskController(this.services);
  private emergencyController: EmergencyController = new EmergencyController(this.services);
  private profileController: ProfileController = new ProfileController(this.services);

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
            onFabTap: (): void => this.openReportRisk()
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
        stats: this.homeController.stats(),
        activities: this.homeController.activities(),
        onReportRisk: (): void => this.openReportRisk(),
        onNavigateInspection: (): void => this.goToTab('tab-inspection'),
        onNavigateEmergency: (): void => this.goToTab('tab-emergency')
      })
    } else if (this.surface === 'inspection') {
      InspectionPage({
        tasks: this.inspectionController.tasks(),
        activeSegment: this.inspectionController.activeSegment,
        onSwitchSegment: (segment: 'today' | 'pending' | 'history'): void => {
          this.inspectionController.switchSegment(segment)
          this.refreshTick++
        },
        onStartTask: (id: string): void => this.openInspectionDetail(id),
        onAddTask: (): void => this.openAddInspection()
      })
    } else if (this.surface === 'inspection-detail') {
      InspectionDetailPage({
        task: this.inspectionController.getTask(this.pendingItemId) ?? new InspectionTask(),
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onMarkPass: (checkItemId: string): void => {
          this.inspectionController.markCheckItem(this.pendingItemId, checkItemId, 'pass')
          this.refreshTick++
        },
        onMarkFail: (checkItemId: string): void => {
          this.inspectionController.markCheckItem(this.pendingItemId, checkItemId, 'fail')
          this.refreshTick++
        },
        onNoteChange: (checkItemId: string, note: string): void => {
          this.inspectionController.setCheckItemNote(this.pendingItemId, checkItemId, note)
        },
        onSubmit: (): void => {
          if (this.inspectionController.submitResult(this.pendingItemId)) {
            this.showToast('巡检结果已提交')
            this.returnToTab(this.lastTabBeforePush)
          } else {
            this.showToast('请完成所有检查项')
          }
        }
      })
    } else if (this.surface === 'risk') {
      RiskPage({
        risks: this.riskController.filteredRisks(),
        activeFilter: this.riskController.activeFilter,
        searchQuery: this.riskController.searchQuery,
        onFilterChange: (filter): void => {
          this.riskController.setFilter(filter)
          this.refreshTick++
        },
        onSearchChange: (query: string): void => {
          this.riskController.setSearchQuery(query)
          this.refreshTick++
        },
        onAddRisk: (): void => this.openReportRisk(),
        onOpenDetail: (id: string): void => this.openRiskDetail(id)
      })
    } else if (this.surface === 'risk-detail') {
      RiskDetailPage({
        risk: this.riskController.get(this.pendingItemId) ?? new RiskItem(),
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onAssign: (): void => {
          this.riskController.assign(this.pendingItemId, '张师傅')
          this.refreshTick++
          this.showToast('已指派整改人')
        },
        onRemind: (): void => {
          this.riskController.remind(this.pendingItemId)
          this.refreshTick++
          this.showToast('已催办')
        },
        onSubmitFix: (): void => {
          this.riskController.submitFix(this.pendingItemId, '已完成整改')
          this.refreshTick++
          this.showToast('已提交整改')
        },
        onReviewPass: (): void => {
          this.riskController.reviewPass(this.pendingItemId, '复核通过')
          this.refreshTick++
          this.showToast('隐患已关闭')
          this.returnToTab(this.lastTabBeforePush)
        },
        onReviewReject: (): void => {
          this.riskController.reviewReject(this.pendingItemId, '整改不到位')
          this.refreshTick++
          this.showToast('已退回整改')
        }
      })
    } else if (this.surface === 'report-risk') {
      ReportRiskPage({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onSubmit: (title, type, level, location, description, deadline, handler): void => {
          this.riskController.report(title, type, level, location, description, deadline, handler, '当前用户')
          this.showToast('隐患已上报')
          this.returnToTab('tab-risk')
        }
      })
    } else if (this.surface === 'emergency') {
      EmergencyPage({
        contacts: this.emergencyController.contacts(),
        searchQuery: this.emergencyController.searchQuery,
        onSearchChange: (query: string): void => {
          this.emergencyController.setSearchQuery(query)
          this.refreshTick++
        },
        onAddContact: (): void => this.openAddContact(),
        onDial: async (phone: string): Promise<void> => {
          let ok: boolean = await this.emergencyController.dial(phone)
          if (!ok) {
            this.showToast('拨号失败')
          }
        }
      })
    } else if (this.surface === 'add-contact') {
      AddContactSheet({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onSubmit: (name, role, duty, phone): void => {
          this.emergencyController.addContact(name, role, duty, phone)
          this.showToast('联系人已添加')
          this.returnToTab('tab-emergency')
        }
      })
    } else if (this.surface === 'profile') {
      ProfilePage({
        profile: this.profileController.profile,
        onExport: (): void => {
          this.profileController.exportData()
          this.showToast('数据已导出')
        },
        onAbout: (): void => this.openAbout()
      })
    } else if (this.surface === 'about') {
      AboutPage({
        onBack: (): void => this.returnToTab('tab-profile')
      })
    } else if (this.surface === 'add-inspection') {
      AddInspectionSheet({
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onSubmit: (title, area, planDate, inspector, items): void => {
          this.inspectionController.addTask(title, area, planDate.length > 0 ? planDate : this.today(), inspector, items)
          this.showToast('巡检任务已创建')
          this.returnToTab('tab-inspection')
        }
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'inspection' || s === 'risk' || s === 'emergency' || s === 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    this.lastTabBeforePush = tab;
    if (tab === 'tab-home') {
      this.surface = 'home';
    } else if (tab === 'tab-inspection') {
      this.surface = 'inspection';
    } else if (tab === 'tab-risk') {
      this.surface = 'risk';
    } else if (tab === 'tab-emergency') {
      this.surface = 'emergency';
    } else if (tab === 'tab-profile') {
      this.surface = 'profile';
    }
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab);
  }

  private openReportRisk(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'report-risk';
  }

  private openRiskDetail(itemId: string): void {
    this.pendingItemId = itemId;
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'risk-detail';
  }

  private openInspectionDetail(itemId: string): void {
    this.pendingItemId = itemId;
    this.lastTabBeforePush = this.activeTab;
    this.inspectionController.startTask(itemId)
    this.surface = 'inspection-detail';
  }

  private openAddContact(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'add-contact';
  }

  private openAddInspection(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'add-inspection';
  }

  private openAbout(): void {
    this.lastTabBeforePush = this.activeTab;
    this.surface = 'about';
  }

  private today(): string {
    let d: Date = new Date()
    return `${d.getFullYear()}-${this.pad(d.getMonth() + 1)}-${this.pad(d.getDate())}`
  }

  private pad(n: number): string {
    return n < 10 ? `0${n}` : String(n)
  }

  private async showToast(message: string): Promise<void> {
    try {
      promptAction.showToast({ message: message, duration: 2000 })
    } catch (err) {
    }
  }
}
