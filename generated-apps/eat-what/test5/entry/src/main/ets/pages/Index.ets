// Index.ets
// App shell for 今天吃什么. Owns tab state, recommend segment, and pushed-surface
// (share / dish-library) switching. Preserves the fixed BottomTabBar shell contract.
import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { BottomTabBar } from '../components/BottomTabBar';
import { RecommendSegment } from '../model/Enums';

import { HomePage } from '../pages/HomePage';
import { RecommendPage } from '../pages/RecommendPage';
import { CheckinPage } from '../pages/CheckinPage';
import { ProfilePage } from '../pages/ProfilePage';
import { SharePage } from '../pages/SharePage';
import { DishLibraryPage } from '../pages/DishLibraryPage';

type AppSurface = 'home' | 'recommend' | 'checkin' | 'profile' | 'share' | 'dish';

@Entry
@Component
struct Index {
  @State surface: AppSurface = 'home';
  @State activeTab: TabId = 'tab-home';
  @State recommendSegment: RecommendSegment = 'wheel';
  @State pendingCheckinDish: string = '';
  @State shareTitle: string = '';
  @State shareSubtitle: string = '';

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          this.CurrentSurface()
        }
        .width('100%')
        .height('100%')
        .padding({ bottom: this.isTabSurface(this.surface) ? Theme.bottomTabHeight + 16 : 0 })

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
        goToWheel: (): void => this.openRecommend('wheel'),
        goToIngredient: (): void => this.openRecommend('ingredient'),
        goToFilter: (): void => this.openRecommend('filter'),
        goToCheckin: (): void => this.goToTab('tab-checkin'),
        goToSettings: (): void => this.goToTab('tab-profile'),
      })
    } else if (this.surface === 'recommend') {
      RecommendPage({
        segment: this.recommendSegment,
        onSegmentChange: (s: RecommendSegment): void => {
          this.recommendSegment = s;
        },
        goToDishLibrary: (): void => this.openDish(),
        checkinWithResult: (dish: string): void => this.openCheckinWithResult(dish),
        goToCheckin: (): void => this.goToTab('tab-checkin'),
      })
    } else if (this.surface === 'checkin') {
      CheckinPage({
        pendingDish: this.pendingCheckinDish,
        onConsumePending: (): void => {
          this.pendingCheckinDish = '';
        },
        goShare: (title: string, subtitle: string): void => this.openShare(title, subtitle),
      })
    } else if (this.surface === 'profile') {
      ProfilePage({
        goToDishLibrary: (): void => this.openDish(),
      })
    } else if (this.surface === 'share') {
      SharePage({
        title: this.shareTitle,
        subtitle: this.shareSubtitle,
        onBack: (): void => this.returnToTab(),
      })
    } else if (this.surface === 'dish') {
      DishLibraryPage({
        onBack: (): void => this.returnToTab(),
      })
    }
  }

  private isTabSurface(s: AppSurface): boolean {
    return s === 'home' || s === 'recommend' || s === 'checkin' || s === 'profile';
  }

  private surfaceForTab(tab: TabId): AppSurface {
    if (tab === 'tab-home') {
      return 'home';
    } else if (tab === 'tab-recommend') {
      return 'recommend';
    } else if (tab === 'tab-checkin') {
      return 'checkin';
    }
    return 'profile';
  }

  private goToTab(tab: TabId): void {
    this.activeTab = tab;
    this.surface = this.surfaceForTab(tab);
  }

  private openRecommend(segment: RecommendSegment): void {
    this.recommendSegment = segment;
    this.activeTab = 'tab-recommend';
    this.surface = 'recommend';
  }

  private openCheckinWithResult(dish: string): void {
    this.pendingCheckinDish = dish;
    this.activeTab = 'tab-checkin';
    this.surface = 'checkin';
  }

  private openShare(title: string, subtitle: string): void {
    this.shareTitle = title;
    this.shareSubtitle = subtitle;
    this.surface = 'share';
  }

  private openDish(): void {
    this.surface = 'dish';
  }

  private returnToTab(): void {
    this.surface = this.surfaceForTab(this.activeTab);
  }
}
