// PawLog fixed bottom tab bar.

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme, BrandGradient } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}
const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '今日', icon: 'home' },
  { id: 'tab-records', label: '记录', icon: 'records' },
  { id: 'tab-charts', label: '趋势', icon: 'charts' },
  { id: 'tab-profile', label: '我的', icon: 'profile' },
];

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId;
  onTap: (tab: TabId) => void = () => {};
  onFabTap: () => void = () => {};

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Row() {
        ForEach(TABS, (tab: TabDescriptor, index: number) => {
          Column() {
            if (index === 2) {
              // placeholder for central FAB spacing
              Column() {
              }
              .width(60)
              .height(Theme.bottomTabHeight)
            }
            SvgIcon({ variant: tab.icon, iconSize: 24 })
            Text(tab.label)
              .fontSize(11)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textQuaternary)
              .margin({ top: 4 })
          }
          .id(tab.id)
          .padding({ left: 12, right: 12, top: 10, bottom: 6 })
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
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)

      // Central FAB
      Column() {
        Column() {
          SvgIcon({ variant: 'fab-add', iconSize: 28 })
        }
        .width(56)
        .height(56)
        .borderRadius(28)
        .linearGradient(BrandGradient.fab)
        .shadow({ radius: 12, color: 'rgba(20,184,166,0.32)', offsetY: 4 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }
      .id('home-fab-add')
      .width(60)
      .height(60)
      .position({ x: '50%', y: 0 })
      .markAnchor({ x: '50%', y: 0 })
      .onClick(() => this.onFabTap())
    }
    .width('100%')
    .height(Theme.bottomTabHeight + 12)
  }
}
