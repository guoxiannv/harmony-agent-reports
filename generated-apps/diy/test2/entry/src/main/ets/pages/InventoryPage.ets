import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CRAFT_TAG_LABELS, CraftTag, Material } from '../model/Models';

function craftTagLabelOf(tag: CraftTag): string {
  switch (tag) {
    case 'pottery': return CRAFT_TAG_LABELS.pottery;
    case 'woodwork': return CRAFT_TAG_LABELS.woodwork;
    case 'leather': return CRAFT_TAG_LABELS.leather;
    case 'floristry': return CRAFT_TAG_LABELS.floristry;
    case 'silver': return CRAFT_TAG_LABELS.silver;
    case 'textile': return CRAFT_TAG_LABELS.textile;
    case 'other': return CRAFT_TAG_LABELS.other;
    default: return CRAFT_TAG_LABELS.other;
  }
}

@Component
export struct InventoryPage {
  onAddMaterial: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private query: string = '';
  @State private materials: Material[] = [];
  @State private isReady: boolean = false;

  async aboutToAppear(): Promise<void> {
    await this.bootstrap();
  }

  private async bootstrap(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;
    await this.refresh();
  }

  private async refresh(): Promise<void> {
    if (!this.controller) {
      return;
    }
    const list: Material[] = await this.controller.listMaterials(this.query);
    this.materials = list;
    this.isReady = true;
  }

  private onSearchChange(value: string): void {
    this.query = value;
    this.refresh();
  }

  private isLowStock(m: Material): boolean {
    return m.stock <= m.safetyStock;
  }

  private lowStockCount(): number {
    let count: number = 0;
    for (const m of this.materials) {
      if (this.isLowStock(m)) {
        count += 1;
      }
    }
    return count;
  }

  private craftTagLabel(tag: CraftTag): string {
    return craftTagLabelOf(tag);
  }

  private async adjustStock(m: Material, delta: number): Promise<void> {
    if (!this.controller || !m.id) {
      return;
    }
    await this.controller.restockMaterial(m.id, delta);
    await this.refresh();
  }

  build(): void {
    Column() {
      this.HeaderBar()
      this.SearchBar()
      this.InventoryList()
    }
    .width('100%')
    .height('100%')
    .linearGradient({
      angle: 180,
      direction: GradientDirection.Bottom,
      colors: [[Theme.pageBgStart, 0.0], [Theme.pageBgMid, 0.55], [Theme.pageBgEnd, 1.0]],
    })
  }

  @Builder
  HeaderBar(): void {
    Row() {
      Column() {
        Text('库存')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
        Text('材料与低库存提醒')
          .fontSize(12)
          .fontColor(Theme.textSecondary)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Column() {
        SvgIcon({ variant: 'add', iconSize: 20 })
      }
      .id('inventory-add-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.clay)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .shadow(Theme.shadowButton())
      .onClick(() => this.onAddMaterial())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 8, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  SearchBar(): void {
    Row() {
      TextInput({ text: this.query, placeholder: '搜索材料名称或规格' })
        .id('inventory-search-input')
        .layoutWeight(1)
        .height(48)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .placeholderColor('#C8BBAF')
        .placeholderFont({ size: 14 })
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .padding({ left: 14, right: 14 })
        .onChange((value: string) => this.onSearchChange(value))

      Column() {
        Text(this.isReady ? this.lowStockCount().toString() : '0')
          .id('inventory-low-stock-badge')
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textLight)
          .fontFamily('monospace')
      }
      .width(44)
      .height(44)
      .borderRadius(12)
      .backgroundColor(this.lowStockCount() > 0 ? Theme.ochre : Theme.pageBgMid)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ left: 10 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 12, bottom: 16, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  InventoryList(): void {
    Scroll() {
      Column() {
        if (this.isReady && this.materials.length === 0) {
          this.EmptyState()
        } else {
          Column() {
            ForEach(this.materials, (m: Material) => {
              this.MaterialCard(m)
            }, (m: Material) => m.id)
          }
          .id('inventory-list')
          .width('100%')
          .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 140 })
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  @Builder
  MaterialCard(m: Material): void {
    Column() {
      Row() {
        Column() {
          Text(m.name || '未命名材料')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
          if (m.spec && m.spec.length > 0) {
            Text(`${m.spec} · 单位 ${m.unit || '—'}`)
              .fontSize(12)
              .fontColor(Theme.textSecondary)
              .margin({ top: 2 })
          } else {
            Text(`单位 ${m.unit || '—'}`)
              .fontSize(12)
              .fontColor(Theme.textSecondary)
              .margin({ top: 2 })
          }
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        if (this.isLowStock(m)) {
          Text('低库存')
            .fontSize(11)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textLight)
            .backgroundColor(Theme.ochre)
            .borderRadius(8)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .margin({ left: 8 })
        }
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(m.craftTags, (tag: CraftTag) => {
          Text(this.craftTagLabel(tag))
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
            .fontColor('#5D4237')
            .backgroundColor(Theme.clayLight)
            .borderRadius(Theme.radiusPill)
            .padding({ left: 10, right: 10, top: 4, bottom: 4 })
            .margin({ right: 6, top: 6 })
        }, (tag: CraftTag) => tag)
      }
      .width('100%')
      .margin({ top: 8 })

      Row() {
        Column() {
          Text('当前库存')
            .fontSize(11)
            .fontColor(Theme.textSecondary)
          Text(m.stock.toString())
            .fontSize(22)
            .fontWeight(FontWeight.Medium)
            .fontColor(this.isLowStock(m) ? Theme.ochre : Theme.textPrimary)
            .fontFamily('monospace')
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Row() {
          Column() {
            Text('－')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
          }
          .width(36)
          .height(36)
          .borderRadius(18)
          .backgroundColor(Theme.pageBgEnd)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick(() => this.adjustStock(m, -1))

          Column() {
            Text('＋')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textLight)
          }
          .width(36)
          .height(36)
          .borderRadius(18)
          .backgroundColor(Theme.clay)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .shadow(Theme.shadowButton())
          .margin({ left: 8 })
          .onClick(() => this.adjustStock(m, 1))
        }
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ top: 12 })

      Text(`安全库存 ${m.safetyStock}`)
        .fontSize(11)
        .fontColor(Theme.textSecondary)
        .margin({ top: 6 })
    }
    .id(`inventory-item-${m.id}`)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowCard())
    .margin({ bottom: 12 })
  }

  @Builder
  EmptyState(): void {
    Column() {
      Column() {
        SvgIcon({ variant: 'tab-inventory-inactive', iconSize: 56 })
      }
      .width(64)
      .height(64)
      .borderRadius(32)
      .backgroundColor(Theme.pageBgEnd)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 12 })

      Text('还没有材料库存')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textPrimary)
        .margin({ bottom: 6 })

      Text('点击右上角添加第一种材料，开始管理库存')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .textAlign(TextAlign.Center)
        .lineHeight(20)
    }
    .id('inventory-empty-state')
    .width('100%')
    .padding({ top: 48, bottom: 48, left: 20, right: 20 })
    .alignItems(HorizontalAlign.Center)
  }
}
