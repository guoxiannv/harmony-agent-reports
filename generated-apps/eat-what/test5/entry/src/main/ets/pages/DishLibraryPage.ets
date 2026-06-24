// DishLibraryPage.ets
// 菜品管理: search, list (avatar + tags + edit), add/edit form sheet with tags/ingredients/moods/times.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionTitle, EmptyState, SelectableChip, GradientButton, SecondaryButton } from '../components/UiKit';
import { Store } from '../services/Store';
import { Dish } from '../model/Models';
import { MOOD_OPTIONS, TIME_SLOT_OPTIONS, ChipOption } from '../common/AppConstants';
import { toast } from '../common/Feedback';

const AVATAR_GRADIENTS: LinearGradient[] = [
  { angle: 135, direction: GradientDirection.RightTop, colors: [['#FF8C42', 0.0], ['#FF7043', 1.0]] } as LinearGradient,
  { angle: 135, direction: GradientDirection.RightTop, colors: [['#4ECB9C', 0.0], ['#5A6B58', 1.0]] } as LinearGradient,
  { angle: 135, direction: GradientDirection.RightTop, colors: [['#8FA897', 0.0], ['#6B8E7B', 1.0]] } as LinearGradient,
  { angle: 135, direction: GradientDirection.RightTop, colors: [['#5A6B58', 0.0], ['#3D4A3C', 1.0]] } as LinearGradient,
];

@Component
export struct DishLibraryPage {
  onBack: () => void = () => {};

  @State keyword: string = '';
  @State dishes: Dish[] = [];
  @State formOpen: boolean = false;
  @State editingId: string = '';
  @State formName: string = '';
  @State formTags: string = '';
  @State formIngredients: string = '';
  @State formMoods: string[] = [];
  @State formTimes: string[] = [];

  async aboutToAppear() {
    await Store.ensureLoaded();
    this.refresh();
  }

  private refresh(): void {
    this.dishes = Store.searchDishes(this.keyword);
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // Header
        Row({ space: 12 }) {
          Row() {
            SvgIcon({ variant: 'back', iconSize: 22 })
          }
          .width(44)
          .height(44)
          .borderRadius(Theme.radiusTiny)
          .backgroundColor(Theme.lightGray)
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.onBack())

          Text('菜品管理')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ bottom: 20 })

        // Search + add
        Row({ space: 10 }) {
          Row({ space: 8 }) {
            SvgIcon({ variant: 'filter', iconSize: 18 })
            TextInput({ text: this.keyword, placeholder: '搜索菜品' })
              .id('dish-search-input')
              .layoutWeight(1)
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .backgroundColor('rgba(0,0,0,0)')
              .onChange((v: string) => { this.keyword = v; this.refresh(); })
          }
          .layoutWeight(1)
          .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.lightGray)

          Row() {
            SvgIcon({ variant: 'add', iconSize: 22 })
          }
          .id('dish-add-button')
          .width(48)
          .height(48)
          .borderRadius(Theme.radiusSmall)
          .linearGradient(BrandGradient.orange)
          .justifyContent(FlexAlign.Center)
          .onClick(() => this.openAdd())
        }
        .width('100%')
        .margin({ bottom: 20 })

        // List
        if (this.dishes.length === 0) {
          EmptyState({ title: '还没有菜品', desc: '点击右上角加号添加你的第一道菜', iconVariant: 'dish-library' })
            .id('dish-empty')
        } else {
          Scroll() {
            Column({ space: 12 }) {
              ForEach(this.dishes, (d: Dish, idx: number) => {
                Row({ space: 14 }) {
                  Text(d.name.length > 0 ? d.name.substring(0, 1) : '菜')
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.white)
                    .width(48)
                    .height(48)
                    .borderRadius(24)
                    .textAlign(TextAlign.Center)
                    .linearGradient(AVATAR_GRADIENTS[idx % 4])

                  Column() {
                    Text(d.name)
                      .fontSize(17)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Theme.textPrimary)
                      .margin({ bottom: 6 })
                    this.TagRow(d)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .layoutWeight(1)

                  Row() {
                    SvgIcon({ variant: 'settings', iconSize: 18 })
                  }
                  .width(36)
                  .height(36)
                  .borderRadius(10)
                  .backgroundColor(Theme.lightGray)
                  .justifyContent(FlexAlign.Center)
                  .onClick(() => this.openEdit(d))
                }
                .id('dish-item-' + d.id)
                .width('100%')
                .padding(16)
                .borderRadius(Theme.radiusCard)
                .backgroundColor(Theme.paper)
                .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
                .alignItems(VerticalAlign.Center)
              }, (d: Dish) => d.id)
            }
            .width('100%')
            .padding({ bottom: 20 })
          }
          .id('dish-list')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
      .alignItems(HorizontalAlign.Start)

      // Form sheet overlay
      if (this.formOpen) {
        Column() {
          Column() {
            SectionTitle({ text: this.editingId.length > 0 ? '编辑菜品' : '添加菜品' })

            TextInput({ text: this.formName, placeholder: '菜品名称' })
              .id('dish-form-name-input')
              .width('100%')
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.paper)
              .border({ width: 1.5, color: Theme.border })
              .margin({ bottom: 12 })
              .onChange((v: string) => { this.formName = v; })

            TextInput({ text: this.formTags, placeholder: '标签，用逗号分隔（如 家常,快手）' })
              .id('dish-form-tags-input')
              .width('100%')
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.paper)
              .border({ width: 1.5, color: Theme.border })
              .margin({ bottom: 12 })
              .onChange((v: string) => { this.formTags = v; })

            TextInput({ text: this.formIngredients, placeholder: '主要食材，逗号分隔（用于食材推荐）' })
              .width('100%')
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.paper)
              .border({ width: 1.5, color: Theme.border })
              .margin({ bottom: 14 })
              .onChange((v: string) => { this.formIngredients = v; })

            Text('心情标签')
              .fontSize(13)
              .fontColor(Theme.warmGray)
              .margin({ bottom: 8 })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(MOOD_OPTIONS, (opt: ChipOption) => {
                SelectableChip({
                  label: opt.label,
                  selected: this.arrHas(this.formMoods, opt.label),
                  onTap: () => this.toggleArr(this.formMoods, opt.label, true),
                })
                  .margin({ right: 10, bottom: 10 })
              }, (opt: ChipOption) => opt.label)
            }
            .width('100%')
            .margin({ bottom: 14 })

            Text('用餐时段')
              .fontSize(13)
              .fontColor(Theme.warmGray)
              .margin({ bottom: 8 })
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(TIME_SLOT_OPTIONS, (opt: ChipOption) => {
                SelectableChip({
                  label: opt.label,
                  selected: this.arrHas(this.formTimes, opt.label),
                  onTap: () => this.toggleArr(this.formTimes, opt.label, false),
                })
                  .margin({ right: 10, bottom: 10 })
              }, (opt: ChipOption) => opt.label)
            }
            .width('100%')
            .margin({ bottom: 18 })

            Row({ space: 12 }) {
              if (this.editingId.length > 0) {
                SecondaryButton({ label: '删除', onTap: () => this.remove() })
                  .id('dish-form-delete-button')
                  .layoutWeight(1)
              }
              GradientButton({ label: '保存', onTap: () => this.save() })
                .id('dish-form-save-button')
                .layoutWeight(1)
            }
            .width('100%')

            Text('关闭')
              .fontSize(14)
              .fontColor(Theme.warmGray)
              .margin({ top: 16 })
              .onClick(() => this.closeForm())
          }
          .width('100%')
          .padding(20)
          .borderRadius({ topLeft: 28, topRight: 28 })
          .backgroundColor(Theme.paper)
        }
        .width('100%')
        .justifyContent(FlexAlign.End)
        .height('100%')
        .backgroundColor('rgba(46,42,37,0.35)')
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TagRow(d: Dish) {
    Flex({ wrap: FlexWrap.Wrap }) {
      ForEach(this.allTags(d), (t: string) => {
        Text(t)
          .fontSize(11)
          .fontColor(Theme.warmGray)
          .backgroundColor(Theme.lightGray)
          .borderRadius(10)
          .padding({ left: 8, right: 8, top: 3, bottom: 3 })
          .margin({ right: 6, bottom: 4 })
      }, (t: string, idx: number) => t + idx)
    }
    .width('100%')
  }

  private allTags(d: Dish): string[] {
    const out: string[] = [];
    for (const t of d.tags) {
      out.push(t);
    }
    for (const m of d.moods) {
      out.push(m);
    }
    for (const tm of d.times) {
      out.push(tm);
    }
    return out;
  }

  private arrHas(arr: string[], v: string): boolean {
    for (const x of arr) {
      if (x === v) {
        return true;
      }
    }
    return false;
  }

  private toggleArr(arr: string[], v: string, isMood: boolean): void {
    const next: string[] = [];
    let found = false;
    for (const x of arr) {
      if (x === v) {
        found = true;
      } else {
        next.push(x);
      }
    }
    if (!found) {
      next.push(v);
    }
    if (isMood) {
      this.formMoods = next;
    } else {
      this.formTimes = next;
    }
  }

  private openAdd(): void {
    this.editingId = '';
    this.formName = '';
    this.formTags = '';
    this.formIngredients = '';
    this.formMoods = [];
    this.formTimes = [];
    this.formOpen = true;
  }

  private openEdit(d: Dish): void {
    this.editingId = d.id;
    this.formName = d.name;
    this.formTags = d.tags.join(',');
    this.formIngredients = d.ingredients.join(',');
    this.formMoods = d.moods;
    this.formTimes = d.times;
    this.formOpen = true;
  }

  private closeForm(): void {
    this.formOpen = false;
  }

  private save(): void {
    const name = this.formName.trim();
    if (name.length === 0) {
      toast('请输入菜品名称');
      return;
    }
    const tags = this.parseCsv(this.formTags);
    const ingredients = this.parseCsv(this.formIngredients);
    const moods = this.formMoods;
    const times = this.formTimes;
    if (this.editingId.length > 0) {
      Store.updateDish({
        id: this.editingId, name: name, tags: tags, ingredients: ingredients,
        moods: moods, times: times, createdAt: Date.now(),
      });
      toast('已更新');
    } else {
      Store.addDish(name, tags, ingredients, moods, times);
      toast('已添加');
    }
    this.closeForm();
    this.refresh();
  }

  private remove(): void {
    if (this.editingId.length > 0) {
      Store.removeDish(this.editingId);
      toast('已删除');
    }
    this.closeForm();
    this.refresh();
  }

  private parseCsv(text: string): string[] {
    const parts = text.split(',');
    const out: string[] = [];
    for (const p of parts) {
      const t = p.trim();
      if (t.length > 0) {
        out.push(t);
      }
    }
    return out;
  }
}
