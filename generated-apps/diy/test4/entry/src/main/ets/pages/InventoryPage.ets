import { AppController, AppState } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { Material, InventoryDeduction } from '../models/Models';
import { promptAction } from '@kit.ArkUI';

@Component
export struct InventoryPage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBack: () => void = () => {};

  @State showAdd: boolean = false;
  @State newName: string = '';
  @State newUnit: string = '';
  @State newStock: string = '';
  @State newLow: string = '';

  build() {
    Column() {
      this.Header('库存管理')

      Scroll() {
        Column({ space: 16 }) {
          if (this.state.lowStockCount() > 0) {
            Row({ space: 8 }) {
              Text('!')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textOnBrand)
              Text(`有 ${this.state.lowStockCount()} 项物料库存偏低`)
                .id('inventory-low-stock-alert')
                .fontSize(14)
                .fontColor(Theme.textOnBrand)
            }
            .width('100%')
            .padding(16)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.alert)
            .alignItems(VerticalAlign.Center)
          }

          Button('+ 新增物料', { type: ButtonType.Normal })
            .id('inventory-add-button')
            .width('100%')
            .height(44)
            .borderRadius(Theme.radiusSmall)
            .backgroundColor(Theme.brandPrimary)
            .fontColor(Theme.textOnBrand)
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .onClick(() => this.showAdd = true)

          Column({ space: 0 }) {
            ForEach(this.state.materials, (m: Material, index: number) => {
              this.MaterialItem(m, index)
            }, (m: Material) => m.id)
          }
          .id('inventory-list')
          .width('100%')
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.state.materials.length === 0) {
            Column({ space: 8 }) {
              Text('暂无物料')
                .id('inventory-empty-state')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.textPrimary)
            }
            .width('100%')
            .padding(32)
          }

          Text('最近扣减记录')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .width('100%')
            .margin({ top: 8 })

          Column({ space: 0 }) {
            ForEach(this.state.deductions.slice(0, 20), (d: InventoryDeduction, index: number) => {
              this.DeductionItem(d, index)
            }, (d: InventoryDeduction) => d.id)
          }
          .id('inventory-deduction-log')
          .width('100%')
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)

          if (this.state.deductions.length === 0) {
            Column({ space: 8 }) {
              Text('暂无扣减记录')
                .id('inventory-deductions-empty')
                .fontSize(14)
                .fontColor(Theme.textSecondary)
            }
            .width('100%')
            .padding(24)
          }
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      if (this.showAdd) {
        this.AddDialog()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header(title: string) {
    Stack({ alignContent: Alignment.Center }) {
      Column()
        .width('100%')
        .height(56)
        .linearGradient({
          angle: 180,
          direction: GradientDirection.Bottom,
          colors: [[Theme.headerGradientStart, 0.0], [Theme.headerGradientEnd, 1.0]]
        })
        .borderRadius({ bottomLeft: 28, bottomRight: 28 })

      Row() {
        Button({ type: ButtonType.Circle }) {
          Text('<')
            .fontSize(18)
            .fontColor(Theme.textOnBrand)
        }
        .id('back-button')
        .width(40)
        .height(40)
        .backgroundColor('rgba(255,255,255,0.16)')
        .onClick(() => this.onBack())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  MaterialItem(m: Material, index: number) {
    Row() {
      Column({ space: 4 }) {
        Text(m.name)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(`警戒：${m.lowStockThreshold}${m.unit}`)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text(`${m.stock}${m.unit}`)
        .id(`inventory-item-${m.id}`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(m.stock <= m.lowStockThreshold ? Theme.alert : Theme.brandPrimary)
    }
    .width('100%')
    .padding(16)
    .border({ width: { bottom: index < this.state.materials.length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  DeductionItem(d: InventoryDeduction, index: number) {
    Row() {
      Column({ space: 4 }) {
        Text(this.materialName(d.materialId))
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text(d.reason)
          .fontSize(12)
          .fontColor(Theme.textSecondary)
      }
      .alignItems(HorizontalAlign.Start)

      Text(`-${d.amount}${this.materialUnit(d.materialId)}`)
        .id(`inventory-deduction-${d.id}`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.alert)
    }
    .width('100%')
    .padding(16)
    .border({ width: { bottom: index < this.state.deductions.length - 1 ? 1 : 0 }, color: Theme.cardDivider })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  private materialName(id: string): string {
    return this.state.materials.find(m => m.id === id)?.name ?? '未知物料';
  }

  private materialUnit(id: string): string {
    return this.state.materials.find(m => m.id === id)?.unit ?? '';
  }

  @Builder
  AddDialog() {
    Column({ space: 12 }) {
      Text('新增物料')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)

      TextInput({ text: this.newName, placeholder: '物料名称' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newName = v)

      TextInput({ text: this.newUnit, placeholder: '单位' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.newUnit = v)

      TextInput({ text: this.newStock, placeholder: '初始库存' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .type(InputType.Number)
        .onChange((v) => this.newStock = v)

      TextInput({ text: this.newLow, placeholder: '低库存阈值' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .type(InputType.Number)
        .onChange((v) => this.newLow = v)

      Row({ space: 12 }) {
        Button('取消', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.borderDefault)
          .fontColor(Theme.textPrimary)
          .onClick(() => this.showAdd = false)

        Button('保存', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.brandPrimary)
          .fontColor(Theme.textOnBrand)
          .onClick(() => this.saveMaterial())
      }
      .width('100%')
    }
    .width('90%')
    .padding(20)
    .borderRadius(Theme.radiusCard)
    .backgroundColor(Theme.cardBg)
    .shadow({ radius: 10, color: Theme.cardShadow })
    .position({ x: '5%', y: '20%' })
  }

  private saveMaterial(): void {
    const stock = Number(this.newStock) || 0;
    const low = Number(this.newLow) || 0;
    this.ctrl.addMaterial(this.newName, this.newUnit, stock, low).then(() => {
      this.newName = '';
      this.newUnit = '';
      this.newStock = '';
      this.newLow = '';
      this.showAdd = false;
      promptAction.showToast({ message: '物料已添加' });
    });
  }
}
