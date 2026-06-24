import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', icon: 'home' },
  { id: 'tab-calendar', label: '课程', icon: 'calendar' },
  { id: 'tab-members', label: '会员', icon: 'members' },
  { id: 'tab-my', label: '我的', icon: 'my' },
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};

  build() {
    Row() {
      ForEach(TABS, (tab: TabDescriptor) => {
        Column() {
          this.TabIcon(tab.icon, this.activeTab === tab.id)
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textSecondary)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 12, right: 12, top: 6, bottom: 6 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor('rgba(248,243,238,0.94)')
    .border({ width: { top: 1 }, color: { top: Theme.borderDefault } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  TabIcon(name: string, active: boolean) {
    if (name === 'home') {
      this.HomeIcon(active)
    } else if (name === 'calendar') {
      this.CalendarIcon(active)
    } else if (name === 'members') {
      this.MembersIcon(active)
    } else {
      this.MyIcon(active)
    }
  }

  @Builder
  HomeIcon(active: boolean) {
    Stack() {
      Path()
        .commands('M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
      Path()
        .commands('M9 22 L9 12 L15 12 L15 22')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
    }
    .width(24)
    .height(24)
  }

  @Builder
  CalendarIcon(active: boolean) {
    Stack() {
      Path()
        .commands('M3 4 h18 a2 2 0 0 1 2 2 v14 a2 2 0 0 1 -2 2 H3 a2 2 0 0 1 -2 -2 V6 a2 2 0 0 1 2 -2 z')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
      Path()
        .commands('M16 2 v4 M8 2 v4 M3 10 h18')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
    }
    .width(24)
    .height(24)
  }

  @Builder
  MembersIcon(active: boolean) {
    Stack() {
      Circle({ width: 10, height: 10 })
        .fill(Color.Transparent)
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .position({ x: 4, y: 5 })
      Path()
        .commands('M17 21 v-2 a4 4 0 0 0 -4 -4 H5 a4 4 0 0 0 -4 4 v2')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
        .position({ x: 0, y: 0 })
      Circle({ width: 8, height: 8 })
        .fill(Color.Transparent)
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .position({ x: 14, y: 6 })
      Path()
        .commands('M23 21 v-2 a4 4 0 0 0 -3 -3.87')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
    }
    .width(24)
    .height(24)
  }

  @Builder
  MyIcon(active: boolean) {
    Stack() {
      Circle({ width: 10, height: 10 })
        .fill(Color.Transparent)
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .position({ x: 7, y: 4 })
      Path()
        .commands('M20 21 v-2 a4 4 0 0 0 -4 -4 H8 a4 4 0 0 0 -4 4 v2')
        .stroke(active ? Theme.brandPrimary : Theme.textSecondary)
        .strokeWidth(2)
        .fill(Color.Transparent)
    }
    .width(24)
    .height(24)
  }
}
