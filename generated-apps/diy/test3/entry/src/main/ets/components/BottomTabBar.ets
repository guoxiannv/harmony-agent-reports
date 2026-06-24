// BottomTabBar.ets — 手作·印记 固定底部 Tab(磨砂玻璃 + rawfile 图标激活态)
// 保留导出名 BottomTabBar 与公开 API: activeTab / onTap。

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
  { id: 'tab-classes', label: '课程', icon: 'classes' },
  { id: 'tab-points', label: '积分', icon: 'points' },
  { id: 'tab-profile', label: '我的', icon: 'profile' },
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
            iconSize: 24,
            active: this.activeTab === tab.id,
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(this.activeTab === tab.id ? FontWeight.Bold : FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.clay : Theme.textTertiary)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ top: 8 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .backgroundColor('rgba(250,246,241,0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderDefault } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
