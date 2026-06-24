import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { CRAFT_TAG_LABELS, CraftTag, Material } from '../model/Models';

interface CraftOption {
  tag: CraftTag;
  label: string;
}

const CRAFT_OPTIONS: CraftOption[] = [
  { tag: 'pottery', label: CRAFT_TAG_LABELS.pottery },
  { tag: 'woodwork', label: CRAFT_TAG_LABELS.woodwork },
  { tag: 'leather', label: CRAFT_TAG_LABELS.leather },
  { tag: 'floristry', label: CRAFT_TAG_LABELS.floristry },
  { tag: 'silver', label: CRAFT_TAG_LABELS.silver },
  { tag: 'textile', label: CRAFT_TAG_LABELS.textile },
  { tag: 'other', label: CRAFT_TAG_LABELS.other },
];

@Component
export struct MaterialEditorPage {
  materialId: string = '';
  onBack: () => void = () => {};
  onSaved: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private isEdit: boolean = false;
  @State private name: string = '';
  @State private spec: string = '';
  @State private unit: string = '';
  @State private stockText: string = '0';
  @State private safetyStockText: string = '0';
  @State private craftTags: CraftTag[] = [];
  @State private saving: boolean = false;
  @State private errorMessage: string = '';

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    if (this.materialId && this.materialId.length > 0) {
      this.isEdit = true;
      const m: Material | undefined = await controller.getMaterial(this.materialId);
      if (m) {
        this.name = m.name;
        this.spec = m.spec ?? '';
        this.unit = m.unit;
        this.stockText = m.stock.toString();
        this.safetyStockText = m.safetyStock.toString();
        this.craftTags = m.craftTags.slice();
      }
    }
  }

  private isCraftSelected(tag: CraftTag): boolean {
    return this.craftTags.indexOf(tag) >= 0;
  }

  private toggleCraft(tag: CraftTag): void {
    const idx: number = this.craftTags.indexOf(tag);
    if (idx >= 0) {
      const next: CraftTag[] = this.craftTags.slice();
      next.splice(idx, 1);
      this.craftTags = next;
    } else {
      const next: CraftTag[] = this.craftTags.slice();
      next.push(tag);
      this.craftTags = next;
    }
  }

  private parseNumber(raw: string): number {
    const n: number = parseInt(raw, 10);
    if (isNaN(n) || n < 0) {
      return 0;
    }
    return n;
  }

  private async onSave(): Promise<void> {
    if (this.saving) {
      return;
    }
    const nameTrim: string = this.name.trim();
    if (nameTrim.length === 0) {
      this.errorMessage = '请填写材料名称';
      return;
    }
    const unitTrim: string = this.unit.trim();
    if (unitTrim.length === 0) {
      this.errorMessage = '请填写计量单位';
      return;
    }

    this.saving = true;
    this.errorMessage = '';

    const material: Material = new Material();
    material.id = this.isEdit ? this.materialId : '';
    material.name = nameTrim;
    material.spec = this.spec.trim().length > 0 ? this.spec.trim() : undefined;
    material.unit = unitTrim;
    material.stock = this.parseNumber(this.stockText);
    material.safetyStock = this.parseNumber(this.safetyStockText);
    material.craftTags = this.craftTags.slice();

    try {
      if (!this.controller) {
        const registry = await ServiceRegistry.get(getContext(this));
        this.controller = new AppController(registry);
        await this.controller.loadSettings();
      }
      await this.controller.saveMaterial(material);
      this.saving = false;
      this.onSaved();
    } catch (e) {
      this.saving = false;
      this.errorMessage = '保存失败，请重试';
    }
  }

  build(): void {
    Column() {
      this.HeaderBar()
      Scroll() {
        Column() {
          this.FormBody()
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      this.FooterBar()
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
        Text('‹')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .id('material-back-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text(this.isEdit ? '编辑材料' : '新增材料')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textPrimary)
        .layoutWeight(1)
        .margin({ left: 12 })

      Text('取消')
        .fontSize(14)
        .fontColor(Theme.clay)
        .padding({ left: 8, right: 8, top: 8, bottom: 8 })
        .onClick(() => this.onBack())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ top: 48, bottom: 12, left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
  }

  @Builder
  FormBody(): void {
    Column() {
      this.SectionLabel('基本信息')
      this.FieldName()
      this.FieldSpec()
      this.FieldUnit()
      this.SectionLabel('库存')
      this.FieldStock()
      this.FieldSafetyStock()
      this.SectionLabel('关联工艺')
      this.CraftChips()

      if (this.errorMessage.length > 0) {
        Text(this.errorMessage)
          .fontSize(13)
          .fontColor(Theme.errorText)
          .backgroundColor(Theme.errorBg)
          .borderRadius(10)
          .padding({ left: 12, right: 12, top: 10, bottom: 10 })
          .margin({ top: 12 })
          .width('100%')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  SectionLabel(label: string): void {
    Text(label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .margin({ top: 20, bottom: 8 })
  }

  @Builder
  FieldName(): void {
    TextInput({ text: this.name, placeholder: '材料名称（必填，如 高白瓷土）' })
      .id('material-name-input')
      .width('100%')
      .height(50)
      .fontSize(14)
      .fontColor(Theme.textPrimary)
      .placeholderColor('#C8BBAF')
      .placeholderFont({ size: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })
      .padding({ left: 15, right: 15 })
      .onChange((v: string) => this.name = v)
  }

  @Builder
  FieldSpec(): void {
    TextInput({ text: this.spec, placeholder: '规格（可选，如 25kg/袋）' })
      .id('material-spec-input')
      .width('100%')
      .height(50)
      .fontSize(14)
      .fontColor(Theme.textPrimary)
      .placeholderColor('#C8BBAF')
      .placeholderFont({ size: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })
      .padding({ left: 15, right: 15 })
      .margin({ top: 10 })
      .onChange((v: string) => this.spec = v)
  }

  @Builder
  FieldUnit(): void {
    TextInput({ text: this.unit, placeholder: '计量单位（必填，如 袋、公斤）' })
      .id('material-unit-input')
      .width('100%')
      .height(50)
      .fontSize(14)
      .fontColor(Theme.textPrimary)
      .placeholderColor('#C8BBAF')
      .placeholderFont({ size: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })
      .padding({ left: 15, right: 15 })
      .margin({ top: 10 })
      .onChange((v: string) => this.unit = v)
  }

  @Builder
  FieldStock(): void {
    Column() {
      Text('当前库存数量')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .margin({ bottom: 6 })
      TextInput({ text: this.stockText, placeholder: '0' })
        .id('material-stock-input')
        .type(InputType.Number)
        .width('100%')
        .height(50)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .placeholderColor('#C8BBAF')
        .placeholderFont({ size: 14 })
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .padding({ left: 15, right: 15 })
        .onChange((v: string) => this.stockText = v)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FieldSafetyStock(): void {
    Column() {
      Text('安全库存（低于或等于此值将标记低库存）')
        .fontSize(13)
        .fontColor(Theme.textSecondary)
        .margin({ bottom: 6 })
      TextInput({ text: this.safetyStockText, placeholder: '0' })
        .id('material-safety-stock-input')
        .type(InputType.Number)
        .width('100%')
        .height(50)
        .fontSize(14)
        .fontColor(Theme.textPrimary)
        .placeholderColor('#C8BBAF')
        .placeholderFont({ size: 14 })
        .backgroundColor(Theme.cardBg)
        .borderRadius(14)
        .border({ width: 1.5, color: Theme.borderDefault })
        .padding({ left: 15, right: 15 })
        .onChange((v: string) => this.safetyStockText = v)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 10 })
  }

  @Builder
  CraftChips(): void {
    Flex({ wrap: FlexWrap.Wrap }) {
      ForEach(CRAFT_OPTIONS, (opt: CraftOption) => {
        Text(opt.label)
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.isCraftSelected(opt.tag) ? Theme.textLight : Theme.textPrimary)
          .backgroundColor(this.isCraftSelected(opt.tag) ? Theme.clay : Theme.clayLight)
          .borderRadius(Theme.radiusPill)
          .padding({ left: 12, right: 12, top: 7, bottom: 7 })
          .margin({ right: 8, bottom: 8 })
          .onClick(() => this.toggleCraft(opt.tag))
      }, (opt: CraftOption) => opt.tag)
    }
    .width('100%')
  }

  @Builder
  FooterBar(): void {
    Row() {
      Text('保存')
        .id('material-save-button')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(this.saving ? Theme.disabledBg : Theme.clay)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 26, right: 26, top: 14, bottom: 14 })
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .onClick(() => this.onSave())
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 12, bottom: 24 })
    .backgroundColor('rgba(251, 248, 245, 0.92)')
    .border({ width: { top: 1 }, color: { top: Theme.borderSoft } })
  }
}
