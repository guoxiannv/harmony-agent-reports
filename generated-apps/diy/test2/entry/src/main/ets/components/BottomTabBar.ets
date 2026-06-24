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
  { id: 'tab-home', label: '首页', iconActive: 'tab-home-active', iconInactive: 'tab-home-inactive' },
  { id: 'tab-members', label: '会员', iconActive: 'tab-members-active', iconInactive: 'tab-members-inactive' },
  { id: 'tab-courses', label: '课程', iconActive: 'tab-courses-active', iconInactive: 'tab-courses-inactive' },
  { id: 'tab-inventory', label: '库存', iconActive: 'tab-inventory-active', iconInactive: 'tab-inventory-inactive' },
  { id: 'tab-profile', label: '我的', iconActive: 'tab-profile-active', iconInactive: 'tab-profile-inactive' },
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};

  build() {
    Row() {
      ForEach(TABS, (tab: TabDescriptor) => {
        Column() {
          Stack({ alignContent: Alignment.Top }) {
            Column()
              .width(4)
              .height(4)
              .borderRadius(2)
              .backgroundColor(Theme.clay)
              .margin({ top: 4 })
              .visibility(this.activeTab === tab.id ? Visibility.Visible : Visibility.Hidden)
            SvgIcon({
              variant: this.activeTab === tab.id ? tab.iconActive : tab.iconInactive,
              iconSize: 22,
            })
              .margin({ top: 12 })
          }
          .width(32)
          .height(32)

          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.textPrimary : Theme.textSecondary)
            .margin({ top: 2 })
        }
        .id(tab.id)
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => this.onTap(tab.id))
      }, (tab: TabDescriptor) => tab.id)
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
    .padding({ bottom: 8 })
    .backgroundColor('rgba(251, 248, 245, 0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
