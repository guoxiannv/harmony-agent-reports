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
  { id: 'tab-records', label: '记录', icon: 'records' },
  { id: 'tab-trends', label: '趋势', icon: 'trends' },
  { id: 'tab-care', label: '照护', icon: 'care' },
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
            color: this.activeTab === tab.id ? Theme.mint600 : Theme.forest500,
            strokeWidth: 2
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.mint600 : Theme.forest500)
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
    .backgroundColor('#FFFFFF')
    .border({ width: { top: 1 }, color: { top: Theme.forest100 } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
