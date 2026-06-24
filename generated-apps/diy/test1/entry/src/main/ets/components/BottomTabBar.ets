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
  { id: 'tab-members', label: '会员', icon: 'members' },
  { id: 'tab-calendar', label: '课程', icon: 'calendar' },
  { id: 'tab-points', label: '积分', icon: 'points' },
  { id: 'tab-inventory', label: '库存', icon: 'inventory' },
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
            Column()
              .width(20)
              .height(3)
              .borderRadius(1.5)
              .backgroundColor(Theme.terracotta)
              .margin({ bottom: 4 })
          } else {
            Column()
              .width(20)
              .height(3)
              .margin({ bottom: 4 })
          }
          SvgIcon({
            variant: tab.icon,
            iconSize: 24,
            color: this.activeTab === tab.id ? Theme.terracotta : Theme.clayGray,
            strokeWidth: 2,
          })
          Text(tab.label)
            .fontSize(Theme.microSize)
            .fontWeight(this.activeTab === tab.id ? FontWeight.Bold : FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.terracotta : Theme.clayGray)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 8, right: 8, top: 6, bottom: 6 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor(Theme.tabBarBg)
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .shadow({ radius: 24, color: Theme.shadowDeep, offsetY: -6 })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
