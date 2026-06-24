// 手作·印记 — 库存出入库 / InventoryTransaction surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppStore } from '../services/AppStore';
import { Ui } from '../common/Ui';
import { Material, InventoryTransaction, KEY_MATERIALS, KEY_INV_TX } from '../common/Models';

@Component
export struct InventoryTransactionPage {
  @Prop materialIdInit: string;
  @StorageLink(KEY_MATERIALS) materialsLink: Material[] = [];
  @StorageLink(KEY_INV_TX) invTxLink: InventoryTransaction[] = [];
  @State selectedMaterialId: string = '';
  @State type: string = 'in'; // in | out | adjust
  @State quantity: string = '';
  @State reason: string = '';
  onDone: () => void = () => {};
  onCancel: () => void = () => {};

  aboutToAppear(): void {
    if (this.materialIdInit.length > 0) {
      this.selectedMaterialId = this.materialIdInit;
    }
  }

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        Text('出入库')
          .fontSize(Theme.fontPageTitle)
          .fontColor(Theme.textTitle)
          .margin({ top: 6, bottom: 4 })
        Text('手动入库 / 出库 / 盘点调整')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .margin({ bottom: 18 })

        Text('选择物料 *')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ bottom: 6 })
          .alignSelf(ItemAlign.Start)
        this.MaterialList()

        Text('操作类型')
          .fontSize(Theme.fontCaption)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textTitle)
          .margin({ top: 12, bottom: 6 })
          .alignSelf(ItemAlign.Start)
        this.TypePicker()

        this.QuantityField()
        this.ReasonField()
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

      Text('出入库')
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
  MaterialList() {
    Column() {
      ForEach(AppStore.get().getMaterials(), (m: Material) => {
        Row() {
          Text(m.name)
            .fontSize(Theme.fontBody)
            .fontColor(Theme.textTitle)
            .layoutWeight(1)
          Text(`${m.stock} ${m.unit}`)
            .fontSize(Theme.fontCaption)
            .fontColor(this.selectedMaterialId === m.id ? Theme.brandPrimary : Theme.textMuted)
        }
        .width('100%')
        .padding({ left: 12, right: 12, top: 12, bottom: 12 })
        .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
        .backgroundColor(this.selectedMaterialId === m.id ? Theme.chipSoftBg : Color.Transparent)
        .borderRadius(Theme.radiusTiny)
        .onClick(() => { this.selectedMaterialId = m.id; })
      }, (m: Material) => m.id)
    }
    .width('100%')
    .padding({ top: 4, bottom: 4 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
    .id('inventory-transaction-material-picker')
  }

  @Builder
  TypePicker() {
    Row() {
      this.TypeChip('入库', 'in', Theme.success)
      this.TypeChip('出库', 'out', Theme.danger)
      this.TypeChip('盘点', 'adjust', Theme.accent)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
    .padding(4)
    .borderRadius(Theme.radiusSmall)
    .backgroundColor(Theme.pageBg)
    .border({ width: 1, color: Theme.borderSoft })
    .id('inventory-transaction-type-picker')
    .margin({ bottom: 14 })
  }

  @Builder
  TypeChip(label: string, value: string, color: string) {
    Text(label)
      .fontSize(Theme.fontBody)
      .fontColor(this.type === value ? Theme.textOnBrand : color)
      .padding({ left: 18, right: 18, top: 8, bottom: 8 })
      .borderRadius(Theme.radiusPill)
      .backgroundColor(this.type === value ? color : Color.Transparent)
      .onClick(() => { this.type = value; })
  }

  @Builder
  QuantityField() {
    Column() {
      Text(this.quantityLabel())
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      TextInput({ text: this.quantity, placeholder: '输入数量' })
        .width('100%')
        .height(50)
        .padding({ left: 15, right: 15 })
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textTitle)
        .placeholderColor(Theme.textMuted)
        .type(InputType.Number)
        .id('inventory-transaction-quantity-input')
        .onChange((v: string) => { this.quantity = v; })
    }
    .width('100%')
    .margin({ bottom: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  ReasonField() {
    Column() {
      Text('原因 / 说明')
        .fontSize(Theme.fontCaption)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .margin({ bottom: 6 })
        .alignSelf(ItemAlign.Start)
      TextInput({ text: this.reason, placeholder: '如：采购入库、损耗出库' })
        .width('100%')
        .height(50)
        .padding({ left: 15, right: 15 })
        .borderRadius(Theme.radiusInput)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1, color: 'rgba(158,79,44,0.12)' })
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textTitle)
        .placeholderColor(Theme.textMuted)
        .id('inventory-transaction-reason-input')
        .onChange((v: string) => { this.reason = v; })
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
      .id('inventory-transaction-cancel-button')
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
      .id('inventory-transaction-save-button')
      .margin({ left: 6 })
      .onClick(() => this.save())
    }
    .width('100%')
    .margin({ top: 16 })
  }

  private quantityLabel(): string {
    if (this.type === 'out') {
      return '出库数量 *';
    }
    if (this.type === 'adjust') {
      return '盘点后数量 *';
    }
    return '入库数量 *';
  }

  private save(): void {
    if (this.selectedMaterialId.length === 0) {
      Ui.toast('请选择物料');
      return;
    }
    const val = parseInt(this.quantity, 10);
    if (isNaN(val) || val < 0) {
      Ui.toast('请输入有效数量');
      return;
    }
    const store = AppStore.get();
    const reason = this.reason.trim().length > 0 ? this.reason.trim() : this.defaultReason();
    if (this.type === 'in') {
      store.applyInventoryTx(this.selectedMaterialId, 'in', val, reason, 'manual', '');
    } else if (this.type === 'out') {
      store.applyInventoryTx(this.selectedMaterialId, 'out', -val, reason, 'manual', '');
    } else {
      // adjust: set absolute. Compute delta from current.
      const current = store.materialStock(this.selectedMaterialId);
      const delta = val - current;
      store.applyInventoryTx(this.selectedMaterialId, 'adjust', delta, reason, 'manual', '');
    }
    Ui.toast('已记录');
    this.onDone();
  }

  private defaultReason(): string {
    if (this.type === 'in') {
      return '入库';
    }
    if (this.type === 'out') {
      return '出库';
    }
    return '盘点调整';
  }
}
