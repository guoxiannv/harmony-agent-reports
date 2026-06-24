// BottomTabBar.ets - 平安扣 fixed bottom navigation (5 tabs).
//
// Contract honored:
// - Exported struct name BottomTabBar; public API activeTab + onTap.
// - Layout hierarchy Row + ForEach, fixed bottom, width-limited/centered (via Index constraint).
// - Selected tab uses sky color + pill background (rgba(224,242,254,0.8)).
// - Tab icons use prepared SVG rawfiles via SvgIcon (no emoji).

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', icon: 'tab-home' },
  { id: 'tab-hazards', label: '隐患', icon: 'tab-hazards' },
  { id: 'tab-inspections', label: '巡检', icon: 'tab-inspections' },
  { id: 'tab-stats', label: '统计', icon: 'tab-stats' },
  { id: 'tab-profile', label: '我的', icon: 'tab-profile' },
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
            color: this.activeTab === tab.id ? Theme.sky : Theme.slate400,
            strokeWidth: 2
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.sky : Theme.slate400)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 14, right: 14, top: 8, bottom: 8 })
        .borderRadius(16)
        .backgroundColor(this.activeTab === tab.id ? 'rgba(224,242,254,0.8)' : 'rgba(255,255,255,0)')
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor('rgba(255,255,255,0.92)')
    .border({ width: { top: 1 }, color: { top: 'rgba(226,232,240,0.6)' } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
