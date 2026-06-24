import { AppController } from '../viewmodel/AppController';
import { InventoryItem } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct InventoryFormSheet {
  @ObjectLink ctrl: AppController;
  @Prop itemId: string;
  @State name: string = '';
  @State category: string = '';
  @State unit: string = '';
  @State currentStock: string = '';
  @State safeStock: string = '';
  @State note: string = '';
  @State adjustDelta: string = '';
  @State adjustNote: string = '';
  onDone: () => void = () => {};

  aboutToAppear(): void {
    const item: InventoryItem | undefined = this.ctrl.getInventoryItemById(this.itemId);
    if (item) {
      this.name = item.name;
      this.category = item.category;
      this.unit = item.unit;
      this.currentStock = `${item.currentStock}`;
      this.safeStock = `${item.safeStock}`;
      this.note = item.note;
    }
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        Row() {
          Text(this.itemId ? '编辑材料' : '新增材料')
            .fontSize(Theme.sectionTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Blank()
        }
        .width('100%')
        .margin({ bottom: 16 })

        this.Field('名称', 'inventory-form-name', '例如：陶土', this.name, (v: string) => this.name = v)
        this.Field('分类', 'inventory-form-category', '例如：陶土', this.category, (v: string) => this.category = v)
        this.Field('单位', 'inventory-form-unit', '例如：kg', this.unit, (v: string) => this.unit = v)
        this.Field('当前库存', 'inventory-form-stock', '0', this.currentStock, (v: string) => this.currentStock = v)
        this.Field('安全库存', 'inventory-form-safe', '0', this.safeStock, (v: string) => this.safeStock = v)
        this.Field('备注', 'inventory-form-note', '可选', this.note, (v: string) => this.note = v)

        if (this.itemId) {
          Row({ space: 8 }) {
            TextInput({ placeholder: '调整数量（正数入库/负数出库）', text: this.adjustDelta })
              .layoutWeight(1)
              .height(44)
              .backgroundColor(Theme.inputBg)
              .borderRadius(Theme.radiusSmall)
              .placeholderColor(Theme.textPlaceholder)
              .fontSize(Theme.bodySize)
              .padding({ left: 12, right: 12 })
              .onChange((v: string) => this.adjustDelta = v)
            Button('调整')
              .height(44)
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnAccent)
              .backgroundColor(Theme.terracotta)
              .borderRadius(999)
              .padding({ left: 14, right: 14 })
              .onClick(async () => {
                const delta: number = parseFloat(this.adjustDelta);
                if (isNaN(delta) || delta === 0) {
                  return;
                }
                await this.ctrl.adjustStock(this.itemId, delta, this.adjustNote || '手动调整');
                const item: InventoryItem | undefined = this.ctrl.getInventoryItemById(this.itemId);
                this.currentStock = item ? `${item.currentStock}` : '0';
                this.adjustDelta = '';
                this.adjustNote = '';
                promptAction.showToast({ message: '库存已调整' });
              })
          }
          .width('100%')
          .margin({ bottom: 16 })
        }

        Button('保存')
          .id('inventory-form-save-button')
          .width('100%')
          .height(48)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(this.canSave() ? Theme.terracotta : Theme.sand)
          .borderRadius(999)
          .enabled(this.canSave())
          .onClick(async () => {
            let item: InventoryItem | undefined = this.ctrl.getInventoryItemById(this.itemId);
            if (!item) {
              item = new InventoryItem();
            }
            item.name = this.name.trim();
            item.category = this.category.trim();
            item.unit = this.unit.trim();
            item.currentStock = parseFloat(this.currentStock) || 0;
            item.safeStock = parseFloat(this.safeStock) || 0;
            item.note = this.note;
            await this.ctrl.upsertInventoryItem(item);
            promptAction.showToast({ message: '保存成功' });
            this.onDone();
          })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }

  @Builder
  Field(label: string, id: string, placeholder: string, value: string, onChange: (v: string) => void) {
    Text(label)
      .fontSize(Theme.captionSize)
      .fontColor(Theme.textTertiary)
      .width('100%')
      .margin({ bottom: 6 })
    TextInput({ placeholder: placeholder, text: value })
      .id(id)
      .width('100%')
      .height(48)
      .backgroundColor(Theme.inputBg)
      .borderRadius(Theme.radiusSmall)
      .placeholderColor(Theme.textPlaceholder)
      .fontSize(Theme.bodySize)
      .padding({ left: 16, right: 16 })
      .margin({ bottom: 16 })
      .onChange(onChange)
  }

  private canSave(): boolean {
    return this.name.trim().length > 0 && this.unit.trim().length > 0;
  }
}
