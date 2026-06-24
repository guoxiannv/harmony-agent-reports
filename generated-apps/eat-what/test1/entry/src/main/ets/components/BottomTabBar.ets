// BottomTabBar — fixed bottom navigation for the 今天吃什么 app (5 tabs).
// Public API kept stable (activeTab + onTap). Tab ids align with TabId.

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', icon: 'home' },
  { id: 'tab-ingredients', label: '食材', icon: 'fridge' },
  { id: 'tab-discover', label: '发现', icon: 'search' },
  { id: 'tab-checkin', label: '打卡', icon: 'checkin' },
  { id: 'tab-profile', label: '我的', icon: 'user' },
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};

  build() {
    Row() {
      ForEach(TABS, (tab: TabDescriptor) => {
        Column() {
          SvgIcon({
            variant: tab.icon,
            iconSize: 26,
            color: this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary,
            strokeWidth: this.activeTab === tab.id ? 2.2 : 2,
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(this.activeTab === tab.id ? FontWeight.Bold : FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 10, right: 10, top: 8, bottom: 8 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 10 })
    .backgroundColor('rgba(255,255,255,0.92)')
    .border({ width: { top: 1 }, color: { top: '#0D000000' } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
