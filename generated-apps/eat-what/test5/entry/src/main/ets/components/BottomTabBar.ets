// BottomTabBar.ets
// Fixed bottom-tab shell for 今天吃什么. Stable public API: activeTab + onTap.
// Active state switches between prepared SVG variants (Home-Tab-2 orange vs Home-Tab-1 gray),
// per the SVG gate (no fillColor tinting of stroke-mode rawfile icons).
import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  iconVariant: string;
  iconVariantActive: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', iconVariant: 'home', iconVariantActive: 'home-active' },
  { id: 'tab-recommend', label: '推荐', iconVariant: 'recommend', iconVariantActive: 'recommend-active' },
  { id: 'tab-checkin', label: '打卡', iconVariant: 'checkin', iconVariantActive: 'checkin-active' },
  { id: 'tab-profile', label: '我的', iconVariant: 'profile', iconVariantActive: 'profile-active' },
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
            variant: this.activeTab === tab.id ? tab.iconVariantActive : tab.iconVariant,
            iconSize: 24,
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
            .margin({ top: 4 })
          if (this.activeTab === tab.id) {
            Row()
              .width(4)
              .height(4)
              .borderRadius(2)
              .backgroundColor(Theme.brandPrimary)
              .margin({ top: 2 })
          }
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
    .padding({ bottom: 8 })
    .backgroundColor('rgba(255,252,250,0.94)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
