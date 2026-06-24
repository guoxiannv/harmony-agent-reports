import { TabId } from '../common/TabTypes'
import { Theme } from '../common/Theme'

interface TabDescriptor {
  id: TabId
  label: string
  icon: string
}

const TABS: TabDescriptor[] = [
  { id: 'tab-home', label: '首页', icon: 'home' },
  { id: 'tab-patrol', label: '巡检', icon: 'patrol' },
  { id: 'tab-issues', label: '隐患', icon: 'issues' },
  { id: 'tab-contacts', label: '联系人', icon: 'contacts' },
  { id: 'tab-stats', label: '统计', icon: 'stats' }
]

@Component
export struct BottomTabBar {
  @Prop activeTab: TabId
  onTap: (tab: TabId) => void = () => {}

  build() {
    Row() {
      ForEach(TABS, (tab: TabDescriptor) => {
        Column({ space: 3 }) {
          this.TabIcon(tab.icon, this.activeTab === tab.id)
          Text(tab.label)
            .fontSize(10)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.activeTab === tab.id ? Theme.brandPrimary : Theme.textTertiary)
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
    .backgroundColor('rgba(255,255,255,0.85)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
    .backdropBlur(24)
    .justifyContent(FlexAlign.SpaceAround)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  TabIcon(icon: string, active: boolean) {
    Column() {
      Text(this.iconLabel(icon))
        .fontSize(active ? 16 : 14)
        .fontWeight(FontWeight.Bold)
        .fontColor(active ? '#FFFFFF' : Theme.textTertiary)
    }
    .width(26)
    .height(26)
    .borderRadius(10)
    .backgroundColor(active ? Theme.brandPrimary : Color.Transparent)
    .linearGradient(active ? {
      angle: 135,
      direction: GradientDirection.RightTop,
      colors: [[Theme.brandPrimary, 0.0], [Theme.brandBright, 1.0]]
    } : undefined)
    .justifyContent(FlexAlign.Center)
  }

  private iconLabel(icon: string): string {
    if (icon === 'home') {
      return 'H'
    } else if (icon === 'patrol') {
      return 'P'
    } else if (icon === 'issues') {
      return '!'
    } else if (icon === 'contacts') {
      return 'C'
    } else if (icon === 'stats') {
      return 'S'
    }
    return '?'
  }
}
