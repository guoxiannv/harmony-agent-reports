// FilterPanel.ets
// 筛选 panel: mood chips + time-slot chips + apply/reset + result grid.
import { Theme, BrandGradient } from '../common/Theme';
import { SectionTitle, EmptyState, GradientButton, SecondaryButton, SelectableChip } from './UiKit';
import { Store } from '../services/Store';
import { Dish } from '../model/Models';
import { MOOD_OPTIONS, TIME_SLOT_OPTIONS, ChipOption } from '../common/AppConstants';

const RESULT_TINTS: string[] = [Theme.tintOrange, Theme.tintGreen, Theme.tintSage];

@Component
export struct FilterPanel {
  @State selectedMoods: string[] = [];
  @State selectedTimes: string[] = [];
  @State results: Dish[] = [];
  @State hasSearched: boolean = false;

  build() {
    Column() {
      // Mood card
      Column() {
        SectionTitle({ text: '现在的心情' })
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(MOOD_OPTIONS, (opt: ChipOption) => {
            SelectableChip({
              label: opt.label,
              selected: this.isMoodSelected(opt.label),
              onTap: () => this.toggleMood(opt.label),
            })
              .margin({ right: 10, bottom: 10 })
          }, (opt: ChipOption) => opt.label)
        }
        .id('filter-mood-list')
        .width('100%')
      }
      .width('100%')
      .padding(20)
      .borderRadius(22)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 20 })

      // Time card
      Column() {
        SectionTitle({ text: '用餐时段' })
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(TIME_SLOT_OPTIONS, (opt: ChipOption) => {
            SelectableChip({
              label: opt.label,
              selected: this.isTimeSelected(opt.label),
              onTap: () => this.toggleTime(opt.label),
            })
              .margin({ right: 10, bottom: 10 })
          }, (opt: ChipOption) => opt.label)
        }
        .id('filter-time-list')
        .width('100%')
      }
      .width('100%')
      .padding(20)
      .borderRadius(22)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 20 })

      // Action row
      Row({ space: 12 }) {
        SecondaryButton({ label: '重置', onTap: () => this.reset() })
          .id('filter-reset-button')
          .layoutWeight(0.5)
        GradientButton({ label: '应用筛选', onTap: () => this.apply() })
          .id('filter-apply-button')
          .layoutWeight(1)
      }
      .width('100%')
      .margin({ bottom: 28 })

      SectionTitle({ text: '筛选结果' })
      if (this.hasSearched && this.results.length === 0) {
        EmptyState({ title: '没有匹配的菜品', desc: '调整心情或时段，或在菜品管理中补充标签', iconVariant: 'filter' })
          .id('filter-result-empty')
      } else if (this.results.length === 0) {
        Text('选择心情或时段后点击「应用筛选」')
          .fontSize(14)
          .fontColor(Theme.warmGray)
          .width('100%')
          .padding({ top: 16, bottom: 16 })
      } else {
        Grid() {
          ForEach(this.results, (d: Dish, idx: number) => {
            GridItem() {
              Column() {
                Row() {
                  Text(d.name.substring(0, 1))
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.white)
                }
                .width('100%')
                .height(64)
                .borderRadius(Theme.radiusSmall)
                .linearGradient(idx % 2 === 0 ? BrandGradient.orange : this.greenGradient())
                .justifyContent(FlexAlign.Center)
                .margin({ bottom: 12 })

                Text(d.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(Theme.textPrimary)
                  .margin({ bottom: 4 })
                Text(this.tagText(d))
                  .fontSize(12)
                  .fontColor(Theme.warmGray)
              }
              .id('filter-result-' + d.id)
              .padding(16)
              .borderRadius(Theme.radiusCard)
              .backgroundColor(Theme.paper)
              .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
              .alignItems(HorizontalAlign.Start)
            }
          }, (d: Dish) => d.id)
        }
        .id('filter-result-list')
        .columnsTemplate('1fr 1fr')
        .columnsGap(12)
        .rowsGap(12)
        .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  private greenGradient(): LinearGradient {
    return {
      angle: 135,
      direction: GradientDirection.RightTop,
      colors: [['#4ECB9C', 0.0], ['#5A6B58', 1.0]],
    } as LinearGradient;
  }

  private tagText(d: Dish): string {
    const tags: string[] = [];
    for (const t of d.times) {
      tags.push(t);
    }
    for (const m of d.moods) {
      tags.push(m);
    }
    if (tags.length === 0) {
      return '暂无标签';
    }
    return tags.join(' · ');
  }

  private isMoodSelected(label: string): boolean {
    for (const m of this.selectedMoods) {
      if (m === label) {
        return true;
      }
    }
    return false;
  }

  private isTimeSelected(label: string): boolean {
    for (const t of this.selectedTimes) {
      if (t === label) {
        return true;
      }
    }
    return false;
  }

  private toggleMood(label: string): void {
    const next: string[] = [];
    let found = false;
    for (const m of this.selectedMoods) {
      if (m === label) {
        found = true;
      } else {
        next.push(m);
      }
    }
    if (!found) {
      next.push(label);
    }
    this.selectedMoods = next;
  }

  private toggleTime(label: string): void {
    const next: string[] = [];
    let found = false;
    for (const t of this.selectedTimes) {
      if (t === label) {
        found = true;
      } else {
        next.push(t);
      }
    }
    if (!found) {
      next.push(label);
    }
    this.selectedTimes = next;
  }

  private apply(): void {
    this.results = Store.recommendByFilter(this.selectedMoods, this.selectedTimes);
    this.hasSearched = true;
  }

  private reset(): void {
    this.selectedMoods = [];
    this.selectedTimes = [];
    this.results = [];
    this.hasSearched = false;
  }
}
