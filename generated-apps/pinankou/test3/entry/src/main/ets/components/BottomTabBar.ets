import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
  activeIcon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '工作台', icon: 'home', activeIcon: 'home-active' },
  { id: 'tab-inspections', label: '巡检', icon: 'inspections', activeIcon: 'inspections-active' },
  { id: 'tab-hazards', label: '隐患', icon: 'hazards', activeIcon: 'hazards-active' },
  { id: 'tab-stats', label: '统计', icon: 'stats', activeIcon: 'stats-active' },
  { id: 'tab-profile', label: '我的', icon: 'profile', activeIcon: 'profile-active' }
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
              .width(18)
              .height(3)
              .borderRadius(2)
              .backgroundColor(Theme.brandPrimary)
              .margin({ bottom: 4 })
          } else {
            Blank()
              .width(18)
              .height(3)
              .margin({ bottom: 4 })
          }

          SvgIcon({
            variant: this.activeTab === tab.id ? tab.activeIcon : tab.icon,
            iconSize: 22
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
            .margin({ top: 4 })
        }
        .id(tab.id)
        .padding({ left: 10, right: 10, top: 6, bottom: 6 })
        .onClick(() => this.onTap(tab.id))
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor('rgba(255,255,255,0.94)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .shadow(Theme.tabShadow)
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
