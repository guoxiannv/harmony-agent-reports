// Fixed bottom-tab bar for 手作·印记 (5 tabs).
// Public API stable: activeTab + onTap. Uses active/inactive rawfile icon
// variants (stroke SVGs) — no .fillColor() tinting (SVG gate).

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  iconActive: string;
  iconInactive: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', iconActive: 'tab-home-active', iconInactive: 'tab-home' },
  { id: 'tab-members', label: '会员', iconActive: 'tab-members-active', iconInactive: 'tab-members' },
  { id: 'tab-courses', label: '课程', iconActive: 'tab-courses-active', iconInactive: 'tab-courses' },
  { id: 'tab-points', label: '积分', iconActive: 'tab-points-active', iconInactive: 'tab-points' },
  { id: 'tab-inventory', label: '库存', iconActive: 'tab-inventory-active', iconInactive: 'tab-inventory' },
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};

  build() {
    Row() {
      ForEach(TABS, (tab: TabDescriptor) => {
        Column() {
          if (this.activeTab === tab.id) {
            // Active indicator dot above the icon.
            Circle({ width: 4, height: 4 })
              .fill(Theme.brandPrimary)
              .margin({ bottom: 4 })
          }
          SvgIcon({
            variant: this.activeTab === tab.id ? tab.iconActive : tab.iconInactive,
            iconSize: 24,
          })
          Text(tab.label)
            .fontSize(Theme.fontTab)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textMuted)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 8, right: 8, top: this.activeTab === tab.id ? 4 : 8, bottom: 6 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor('rgba(247,243,237,0.88)')
    .backdropBlur(22)
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
