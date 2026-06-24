// BottomTabBar.ets
//
// 固定底部 Tab 浮岛（DESIGN2: 玻璃质感、顶部圆角、选中 Tomato）。
// 公共 API 不变: activeTab + onTap。SVG gate: 选中/未选中切换 rawfile 变体，
// 不对 stroke 图标做 fillColor 着色。

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  inactiveVariant: string;
  activeVariant: string;
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '决策', inactiveVariant: 'tab-home', activeVariant: 'tab-home-active' },
  { id: 'tab-pantry', label: '食材', inactiveVariant: 'tab-pantry', activeVariant: 'tab-pantry-active' },
  { id: 'tab-check-in', label: '打卡', inactiveVariant: 'tab-check-in-inactive', activeVariant: 'tab-check-in' },
  { id: 'tab-profile', label: '我的', inactiveVariant: 'tab-profile', activeVariant: 'tab-profile-active' },
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
            variant: this.activeTab === tab.id ? tab.activeVariant : tab.inactiveVariant,
            iconSize: 24,
          })
          Text(tab.label)
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.tomato : Theme.textTertiary)
            .margin({ top: 4 })
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
    .padding({ top: 12, bottom: 12 })
    .backgroundColor('rgba(255,248,240,0.94)')
    .backdropBlur(24)
    .borderRadius({ topLeft: Theme.radiusHero, topRight: Theme.radiusHero })
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .shadow({ radius: 24, color: 'rgba(46,43,40,0.08)', offsetY: -6 })
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }
}
