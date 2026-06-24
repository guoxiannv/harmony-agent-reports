// TemplateBottomTabBar.ets
//
// A model-friendly BottomTabBar template for apps that use a fixed bottom tab shell.
//
// Agent rules:
// - Keep the exported struct name as BottomTabBar.
// - Keep the public API stable: activeTab and onTap.
// - Do not change the layout hierarchy unless the user explicitly asks.
// - Only replace tab ids, labels, icons, or theme tokens as needed.
// - Keep tab ids aligned with the shared TabId union used by Index.ets.
//
// Usage:
// - Update import paths to match your project structure.
// - Replace the TABS data with your real tab set.
// - Keep the component contract unchanged so Index.ets can keep using it safely.
//
// Notes:
// - This file is intentionally conservative. It is a fixed shell component, not a free-form page.
// - If the user asks for a different navigation pattern, change TemplateIndex.ets and this file together.

import { SvgIcon } from '../common/SvgIcon';
import { TabId } from '../common/TabTypes';
import { Theme } from '../common/Theme';

interface TabDescriptor {
  id: TabId;
  label: string;
  icon: string;
}

// Replace only the data below to match your real tabs.
const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: 'Home', icon: 'home' },
  { id: 'tab-explore', label: 'Explore', icon: 'explore' },
  { id: 'tab-orders', label: 'Orders', icon: 'orders' },
  { id: 'tab-rewards', label: 'Rewards', icon: 'rewards' },
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
        .padding({ left: 12, right: 12, top: 6, bottom: 6 })
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
  }
}
