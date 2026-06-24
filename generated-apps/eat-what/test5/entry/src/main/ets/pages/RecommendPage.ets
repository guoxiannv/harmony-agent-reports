// RecommendPage.ets
// 推荐页: segment control (转盘/食材/筛选) switching WheelPanel / IngredientPanel / FilterPanel.
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { RecommendSegment } from '../model/Enums';
import { WheelPanel } from '../components/WheelPanel';
import { IngredientPanel } from '../components/IngredientPanel';
import { FilterPanel } from '../components/FilterPanel';

@Component
export struct RecommendPage {
  @Prop segment: RecommendSegment = 'wheel';
  onSegmentChange: (s: RecommendSegment) => void = () => {};
  goToDishLibrary: () => void = () => {};
  checkinWithResult: (dish: string) => void = () => {};
  goToCheckin: () => void = () => {};

  build() {
    Column() {
      // Header
      Row() {
        Text('推荐')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)

        Row() {
          SvgIcon({ variant: 'dish-library', iconSize: 22 })
        }
        .width(44)
        .height(44)
        .borderRadius(Theme.radiusTiny)
        .backgroundColor(Theme.lightGray)
        .justifyContent(FlexAlign.Center)
        .onClick(() => this.goToDishLibrary())
      }
      .width('100%')
      .margin({ bottom: 24 })

      // Segment control
      Row() {
        this.SegmentItem('转盘', 'wheel', 'recommend-segment-wheel')
        this.SegmentItem('食材', 'ingredient', 'recommend-segment-ingredient')
        this.SegmentItem('筛选', 'filter', 'recommend-segment-filter')
      }
      .width('100%')
      .padding(4)
      .borderRadius(Theme.radiusHero)
      .backgroundColor(Theme.lightGray)
      .margin({ bottom: 24 })

      // Active panel
      if (this.segment === 'wheel') {
        WheelPanel({ checkinWithResult: (dish: string): void => this.checkinWithResult(dish) })
      } else if (this.segment === 'ingredient') {
        IngredientPanel()
      } else {
        FilterPanel()
      }
    }
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  SegmentItem(label: string, seg: RecommendSegment, id: string) {
    Text(label)
      .id(id)
      .layoutWeight(1)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.segment === seg ? Theme.white : Theme.warmGray)
      .textAlign(TextAlign.Center)
      .padding({ top: 12, bottom: 12 })
      .borderRadius(Theme.radiusButton)
      .backgroundColor(this.segment === seg ? Theme.dark : 'rgba(0,0,0,0)')
      .onClick(() => this.onSegmentChange(seg))
  }
}
