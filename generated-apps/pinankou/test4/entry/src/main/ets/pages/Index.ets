import { Theme } from '../common/Theme'
import { TabId } from '../common/TabTypes'
import { BottomTabBar } from '../components/BottomTabBar'
import { SafetyAppState, provideSafetyState } from '../viewmodels/SafetyAppState'
import { HomePage } from './HomePage'
import { PatrolPage } from './PatrolPage'
import { IssuesPage } from './IssuesPage'
import { ContactsPage } from './ContactsPage'
import { StatsPage } from './StatsPage'
import { IssueFormPage } from './IssueFormPage'
import { IssueDetailPage } from './IssueDetailPage'
import { ContactFormPage } from './ContactFormPage'
import { PatrolCheckinSheet } from '../components/sheets/PatrolCheckinSheet'
import { UIAbility, Want } from '@kit.AbilityKit'
import { window } from '@kit.ArkUI'

let gAbilityContext: import('@kit.AbilityKit').Context | null = null

export function setAbilityContext(ctx: import('@kit.AbilityKit').Context): void {
  gAbilityContext = ctx
}

function appContext(): import('@kit.AbilityKit').Context {
  return gAbilityContext as import('@kit.AbilityKit').Context
}

type AppSurface =
  | 'home'
  | 'patrol'
  | 'issues'
  | 'contacts'
  | 'stats'
  | 'issue-form'
  | 'issue-detail'
  | 'contact-form'

@Entry
@Component
struct Index {
  @State private surface: AppSurface = 'home'
  @State private activeTab: TabId = 'tab-home'
  @State private pendingIssueId: string = ''
  @State private pendingContactId: string = ''
  @State private lastTabBeforePush: TabId = 'tab-home'
  @State private showCheckin: boolean = false
  @State private appState: SafetyAppState = provideSafetyState(appContext())

  aboutToAppear(): void {
    this.appState.refreshAll()
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
          bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 8 : 0
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

      if (this.showCheckin) {
        Column() {
          Column() {
            PatrolCheckinSheet({
              state: this.appState,
              onCancel: (): void => {
                this.showCheckin = false
              },
              onReport: (pointId: string): void => {
                this.showCheckin = false
                this.openIssueForm(pointId)
              }
            })
          }
          .width('100%')
          .margin({ top: 'auto' })
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0,0,0,0.35)')
        .justifyContent(FlexAlign.End)
        .onClick(() => this.showCheckin = false)
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
        state: this.appState,
        goToTab: (tab: TabId): void => this.goToTab(tab),
        onReport: (): void => this.openIssueForm(),
        onIssueDetail: (id: string): void => this.openIssueDetail(id),
        onNotifications: (): void => {}
      })
    } else if (this.surface === 'patrol') {
      PatrolPage({
        state: this.appState,
        onCheckin: (id: string): void => this.openCheckin(id),
        onReportWithPoint: (id: string): void => this.openIssueForm(id)
      })
    } else if (this.surface === 'issues') {
      IssuesPage({
        state: this.appState,
        onAdd: (): void => this.openIssueForm(),
        onDetail: (id: string): void => this.openIssueDetail(id)
      })
    } else if (this.surface === 'contacts') {
      ContactsPage({
        state: this.appState,
        onAdd: (): void => this.openContactForm(),
        onEdit: (id: string): void => this.openContactForm(id),
        onCall: (id: string): void => {
          let c = this.appState.contacts.find((x: import('../models/SafetyTypes').Contact) => x.id === id)
          if (c) {
            this.appState.callContact(c)
          }
        }
      })
    } else if (this.surface === 'stats') {
      StatsPage({
        state: this.appState,
        onExport: (): void => {}
      })
    } else if (this.surface === 'issue-form') {
      IssueFormPage({
        state: this.appState,
        mode: this.pendingIssueId ? 'edit' : 'create',
        editIssueId: this.pendingIssueId,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush)
      })
    } else if (this.surface === 'issue-detail') {
      IssueDetailPage({
        state: this.appState,
        issueId: this.pendingIssueId,
        onBack: (): void => this.returnToTab(this.lastTabBeforePush),
        onEdit: (id: string): void => {
          let issue = this.appState.service.getIssue(id)
          if (issue) {
            this.appState.prepareIssueFormForEdit(issue)
            this.surface = 'issue-form'
          }
        }
      })
    } else if (this.surface === 'contact-form') {
      ContactFormPage({
        state: this.appState,
        mode: this.pendingContactId ? 'edit' : 'create',
        onBack: (): void => this.returnToTab(this.lastTabBeforePush)
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'patrol' || s === 'issues' || s === 'contacts' || s === 'stats'
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab
    if (tab === 'tab-home') {
      this.surface = 'home'
    } else if (tab === 'tab-patrol') {
      this.surface = 'patrol'
    } else if (tab === 'tab-issues') {
      this.surface = 'issues'
    } else if (tab === 'tab-contacts') {
      this.surface = 'contacts'
    } else if (tab === 'tab-stats') {
      this.surface = 'stats'
    }
  }

  private returnToTab(tab: TabId): void {
    this.goToTab(tab)
    this.pendingIssueId = ''
    this.pendingContactId = ''
  }

  private openIssueForm(pointId?: string): void {
    this.lastTabBeforePush = this.activeTab
    this.pendingIssueId = ''
    this.appState.resetIssueForm()
    if (pointId) {
      this.appState.issueForm.linkedPointId = pointId
      this.appState.issueForm.location = this.appState.service.getPatrolPoint(pointId)?.area ?? ''
    }
    this.surface = 'issue-form'
  }

  private openIssueDetail(id: string): void {
    this.lastTabBeforePush = this.activeTab
    this.pendingIssueId = id
    this.surface = 'issue-detail'
  }

  private openContactForm(id?: string): void {
    this.lastTabBeforePush = this.activeTab
    this.appState.resetContactForm()
    this.pendingContactId = id ?? ''
    if (id) {
      let c = this.appState.service.getContact(id)
      if (c) {
        this.appState.prepareContactFormForEdit(c)
      }
    }
    this.surface = 'contact-form'
  }

  private openCheckin(pointId: string): void {
    this.appState.openPatrolCheckin(pointId)
    this.showCheckin = true
  }
}
