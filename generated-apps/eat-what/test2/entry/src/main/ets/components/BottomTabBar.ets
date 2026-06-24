// BottomTabBar.ets
//
// Fixed bottom-tab shell component. Three primary tabs: 今日 / 食材 / 打卡.
// Active tab switches between prepared -1/-2 SVG variants (no rawfile tinting,
// per the SVG gate); label color reflects active state.

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  idleIcon: string;
  activeIcon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '今日', idleIcon: 'tab-home', activeIcon: 'tab-home-active' },
  { id: 'tab-ingredients', label: '食材', idleIcon: 'tab-ingredients', activeIcon: 'tab-ingredients-active' },
  { id: 'tab-records', label: '打卡', idleIcon: 'tab-records', activeIcon: 'tab-records-active' },
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
            variant: this.activeTab === tab.id ? tab.activeIcon : tab.idleIcon,
            iconSize: 24,
            strokeWidth: 2,
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
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
    .backgroundColor(Theme.tabBarBg)
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
