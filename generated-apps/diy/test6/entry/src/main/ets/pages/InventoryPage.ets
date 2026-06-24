// 手作·印记 — 库存 / Inventory surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyHint } from '../components/Widgets';
import { AppStore } from '../services/AppStore';
import { Material, MaterialRow, InventoryTransaction, KEY_MATERIALS, KEY_INV_TX } from '../common/Models';
import { NavOpen } from './Index';

@Component
export struct InventoryPage {
  @StorageLink(KEY_MATERIALS) materialsLink: Material[] = [];
  @StorageLink(KEY_INV_TX) invTxLink: InventoryTransaction[] = [];
  @Prop lowOnlyInit: boolean = false;
  @State lowOnly: boolean = false;
  onOpen: (req: NavOpen) => void = () => {};
  onConsumedLowFilter: () => void = () => {};

  aboutToAppear(): void {
    if (this.lowOnlyInit) {
      this.lowOnly = true;
      this.onConsumedLowFilter();
    }
  }

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Scroll() {
        Column() {
          Text('库存')
            .fontSize(Theme.fontPageTitle)
            .fontColor(Theme.textTitle)
            .margin({ top: 8, bottom: 14 })

          this.LowStockBanner()
          this.FilterToggle()
          this.MaterialList()
          Column().height(120)
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 8 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // Add material FAB.
      Row() {
        SvgIcon({ variant: 'add-fab', iconSize: 26 })
      }
      .width(58)
      .height(58)
      .borderRadius(29)
      .linearGradient(BrandGradient.primary)
      .shadow({ radius: 28, color: 'rgba(158,79,44,0.34)', offsetX: 0, offsetY: 10 })
      .margin({ right: Theme.pageHorizontalPadding, bottom: Theme.bottomTabHeight + 26 })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('inventory-add-button')
      .onClick(() => this.onOpen({ target: 'inventory-edit' }))
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  LowStockBanner() {
    if (AppStore.get().lowStockCount() > 0) {
      Row() {
        Row() {
          SvgIcon({ variant: 'warning', iconSize: 18 })
        }
        .width(30)
        .height(30)
        .borderRadius(15)
        .backgroundColor('rgba(255,255,255,0.25)')
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)

        Column() {
          Text('低库存预警')
            .fontSize(Theme.fontBody)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textOnBrand)
          Text(`${AppStore.get().lowStockCount()} 项物料需要补货`)
            .fontSize(Theme.fontCaption)
            .fontColor('rgba(255,255,255,0.92)')
            .margin({ top: 2 })
        }
        .layoutWeight(1)
        .margin({ left: 12 })
        .alignItems(HorizontalAlign.Start)

        Text(`${AppStore.get().lowStockCount()}`)
          .fontSize(Theme.fontBigNumberSmall)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnBrand)
          .id('inventory-low-stock-count')
      }
      .width('100%')
      .padding(16)
      .borderRadius(Theme.radiusCard)
      .linearGradient(BrandGradient.alert)
      .shadow({ radius: 28, color: 'rgba(184,84,72,0.30)', offsetX: 0, offsetY: 10 })
      .margin({ bottom: 14 })
      .alignItems(VerticalAlign.Center)
      .id('inventory-low-stock-banner')
      .onClick(() => { this.lowOnly = true; })
    }
  }

  @Builder
  FilterToggle() {
    Row() {
      Row() {
        Text('出入库')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.brandPrimary)
          .margin({ left: 6 })
      }
      .padding({ left: 14, right: 14, top: 9, bottom: 9 })
      .borderRadius(Theme.radiusButton)
      .backgroundColor(Color.Transparent)
      .border({ width: 1.5, color: Theme.brandSecondary })
      .id('inventory-transaction-button')
      .onClick(() => this.onOpen({ target: 'inventory-transaction' }))

      Row() {
        Text(this.lowOnly ? '显示全部' : '只看低库存')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.brandPrimary)
          .margin({ left: 6 })
      }
      .padding({ left: 14, right: 14, top: 9, bottom: 9 })
      .borderRadius(Theme.radiusButton)
      .backgroundColor(this.lowOnly ? Theme.tagLowStockBg : Color.Transparent)
      .border({ width: 1.5, color: this.lowOnly ? Theme.danger : Theme.borderSoft })
      .onClick(() => { this.lowOnly = !this.lowOnly; })
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .margin({ bottom: 14 })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  MaterialList() {
    if (this.rows().length === 0) {
      EmptyHint({ title: this.lowOnly ? '没有低库存物料' : '还没有物料', caption: '点击右下角添加第一种物料' })
        .margin({ top: 40 })
    } else {
      Column() {
        ForEach(this.rows(), (m: MaterialRow) => {
          Column() {
            Row() {
              Text(m.name)
                .fontSize(Theme.fontBody)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
                .layoutWeight(1)
              Text(m.isLow ? '低库存' : '充足')
                .fontSize(Theme.fontCaption)
                .fontColor(m.isLow ? Theme.tagLowStockText : Theme.tagGreenText)
                .backgroundColor(m.isLow ? Theme.tagLowStockBg : Theme.tagGreenBg)
                .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                .borderRadius(Theme.radiusChip)
            }
            .width('100%')

            Row() {
              Text(`${m.stock} ${m.unit}`)
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Bold)
                .fontColor(m.isLow ? Theme.danger : Theme.textTitle)
              Text(` / 安全 ${m.safeStock}`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
            }
            .margin({ top: 6 })

            // Progress bar (stock vs 2x safeStock as upper bound for ratio).
            Row() {
              Column()
                .width(`${this.stockRatio(m)}%`)
                .height('100%')
                .borderRadius(3)
                .backgroundColor(m.isLow ? Theme.danger : Theme.brandSecondary)
            }
            .width('100%')
            .height(6)
            .borderRadius(3)
            .backgroundColor('rgba(158,79,44,0.10)')
            .margin({ top: 8 })

            if (m.spec.length > 0) {
              Text(`规格：${m.spec}`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 6 })
            }
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .border({ width: 1, color: Theme.borderSoft })
          .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
          .margin({ bottom: 12 })
          .id(`inventory-item-${m.id}`)
          .onClick(() => this.onOpen({ target: 'inventory-edit', materialId: m.id }))
        }, (m: MaterialRow) => m.id)
      }
      .width('100%')
      .id('inventory-list')
    }
  }

  private rows(): MaterialRow[] {
    return AppStore.get().materialRows(this.lowOnly);
  }

  private stockRatio(m: MaterialRow): number {
    const upper = m.safeStock * 2;
    if (upper <= 0) {
      return 100;
    }
    const r = Math.round((m.stock / upper) * 100);
    if (r > 100) {
      return 100;
    }
    if (r < 4) {
      return 4;
    }
    return r;
  }
}
