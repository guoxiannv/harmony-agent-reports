import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { SvgIcon } from '../common/SvgIcon';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', icon: 'home' },
  { id: 'tab-inspection', label: '巡检', icon: 'inspection' },
  { id: 'tab-risk', label: '隐患', icon: 'risk' },
  { id: 'tab-emergency', label: '应急', icon: 'emergency' },
  { id: 'tab-profile', label: '我的', icon: 'profile' }
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};
  onFabTap: () => void = () => {};

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Row() {
        ForEach(TABS, (tab: TabDescriptor, index: number) => {
          Column() {
            SvgIcon({
              variant: tab.icon,
              iconSize: 24,
              color: this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary,
              strokeWidth: 2
            })
            Text(tab.label)
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
              .margin({ top: 4 })
          }
          .id(tab.id)
          .padding({ left: 8, right: 8, top: 6, bottom: 6 })
          .onClick(() => this.onTap(tab.id))
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
          .margin({ left: index >= 2 ? 48 : 0 })
        }, (tab: TabDescriptor) => tab.id)
      }
      .width('100%')
      .height(Theme.bottomTabHeight)
      .padding({ bottom: 8 })
      .backgroundColor('rgba(255,255,255,0.94)')
      .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)

      Column() {
        SvgIcon({ variant: 'add', iconSize: 24, color: '#FFFFFF' })
      }
      .id('risk-add-button')
      .width(56)
      .height(56)
      .backgroundColor(Theme.brandPrimary)
      .borderRadius(28)
      .border({ width: 3, color: Theme.pageBg })
      .shadow({ radius: 12, color: 'rgba(13,148,136,0.32)' })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .position({ x: '50%', y: -22 })
      .markAnchor({ x: '50%' })
      .onClick(() => this.onFabTap())
    }
    .width('100%')
    .height(Theme.bottomTabHeight)
  }
}
