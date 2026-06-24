// 手作·印记 — 编辑物料 / InventoryEdit surface (create + edit).
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Material, KEY_MATERIALS } from '../common/Models';

@Component
export struct InventoryEditPage {
  @Prop editingId: string;
  @StorageLink(KEY_MATERIALS) materialsLink: Material[] = [];
  @State name: string = '';
  @State spec: string = '';
  @State unit: string = '份';
  @State stock: string = '0';
  @State safeStock: string = '5';
  @State notes: string = '';
  @State currentStock: number = 0; // shown read-only in edit mode
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  aboutToAppear(): void {
    if (this.editingId.length > 0) {
      const m = AppStore.get().getMaterial(this.editingId);
      if (m !== null) {
        this.name = m.name;
        this.spec = m.spec;
        this.unit = m.unit;
        this.stock = `${m.stock}`;
        this.safeStock = `${m.safeStock}`;
        this.notes = m.notes;
        this.currentStock = m.stock;
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        Text(this.editingId.length > 0 ? '编辑物料' : '新增物料')
          .fontSize(Theme.fontPageTitle)
          .fontColor(Theme.textTitle)
          .margin({ top: 6, bottom: 4 })
        Text('记录工作室里的每一份原料')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .margin({ bottom: 18 })

        this.Field('物料名称 *', this.name, '如：陶土', (v: string) => { this.name = v; }, 'inventory-edit-name-input', false)
        this.Field('规格', this.spec, '如：5kg/包', (v: string) => { this.spec = v; }, 'inventory-edit-spec-input', false)
        this.Field('单位', this.unit, '份 / kg / 米', (v: string) => { this.unit = v; }, 'inventory-edit-unit-input', false)

        if (this.editingId.length === 0) {
          this.Field('初始库存', this.stock, '0', (v: string) => { this.stock = v; }, 'inventory-edit-stock-input', false)
        } else {
          this.ReadOnlyStock()
        }

        this.Field('安全库存', this.safeStock, '低于此值提醒', (v: string) => { this.safeStock = v; }, 'inventory-edit-safe-stock-input', false)
        this.Field('备注', this.notes, '供应商 / 保质期等', (v: string) => { this.notes = v; }, 'inventory-edit-notes-input', true)
        this.Buttons()
        Column().height(40)
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  TopNav() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 22 })
      }
      .width(40)
      .height(40)
      .borderRadius(Theme.radiusPill)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .onClick(() => this.onCancel())

      Text(this.editingId.length > 0 ? '编辑物料' : '新增物料')
        .fontSize(Theme.fontTopNav)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Column().width(40)
    }
    .width('100%')
    .padding({ top: 10, bottom: 6 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Field(label: string, value: string, placeholder: string, onChange: (v: string) => void, fieldId: string, multiLine: boolean) {
    Column() {
      Text(label)
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      if (multiLine) {
        TextArea({ text: value, placeholder: placeholder })
          .width('100%')
          .height(80)
          .padding(14)
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textTitle)
          .placeholderColor(Theme.textMuted)
          .id(fieldId)
          .onChange((v: string) => { onChange(v); })
      } else {
        TextInput({ text: value, placeholder: placeholder })
          .width('100%')
          .height(50)
          .padding({ left: 15, right: 15 })
          .borderRadius(Theme.radiusInput)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textTitle)
          .placeholderColor(Theme.textMuted)
          .id(fieldId)
          .onChange((v: string) => { onChange(v); })
      }
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  ReadOnlyStock() {
    Column() {
      Text('当前库存（通过出入库调整）')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      Row() {
        Text(`${this.currentStock}`)
          .fontSize(Theme.fontCardTitle)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textTitle)
          .id('inventory-edit-stock-input')
          .layoutWeight(1)
        Text('如需调整请使用出入库')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.textMuted)
      }
      .width('100%')
      .height(50)
      .padding({ left: 15, right: 15 })
      .borderRadius(Theme.radiusInput)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Buttons() {
    Row() {
      Column() {
        Text('取消')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.brandPrimary)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .border({ width: 1.5, color: Theme.brandSecondary })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('inventory-edit-cancel-button')
      .margin({ right: 6 })
      .onClick(() => this.onCancel())

      Column() {
        Text('保存')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textOnBrand)
      }
      .layoutWeight(1)
      .height(50)
      .borderRadius(Theme.radiusButton)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .id('inventory-edit-save-button')
      .margin({ left: 6 })
      .onClick(() => this.save())
    }
    .width('100%')
    .margin({ top: 16 })
  }

  private save(): void {
    if (this.name.trim().length === 0) {
      Ui.toast('请填写物料名称');
      return;
    }
    const stockVal = parseInt(this.stock, 10);
    const safeVal = parseInt(this.safeStock, 10);
    const form: Material = {
      id: this.editingId,
      name: this.name,
      spec: this.spec,
      unit: this.unit.length === 0 ? '份' : this.unit,
      stock: isNaN(stockVal) ? 0 : stockVal,
      safeStock: isNaN(safeVal) ? 0 : safeVal,
      notes: this.notes,
      createdAt: 0,
    };
    const res = AppStore.get().saveMaterial(form, this.editingId);
    if (res.ok) {
      Ui.toast(res.message);
      this.onDone();
    } else {
      Ui.toast(res.message);
    }
  }
}
