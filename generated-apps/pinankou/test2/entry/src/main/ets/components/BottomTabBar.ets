// BottomTabBar.ets — fixed bottom-tab shell (6 tabs, label + active indicator).
// Public API stable: activeTab, onTap.
import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '工作台', icon: 'shield' },
  { id: 'tab-hazard', label: '隐患', icon: 'alert' },
  { id: 'tab-patrol', label: '巡检', icon: 'check' },
  { id: 'tab-contacts', label: '联系人', icon: 'phone' },
  { id: 'tab-stats', label: '统计', icon: 'chart' },
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
            iconSize: 22,
            color: this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary,
            strokeWidth: 2
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textTertiary)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 4, right: 4, top: 6, bottom: 6 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 6, top: 4 })
    .backgroundColor('rgba(255,255,255,0.96)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
