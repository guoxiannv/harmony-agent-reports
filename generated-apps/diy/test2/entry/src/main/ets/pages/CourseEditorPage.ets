import { Theme } from '../common/Theme';
import { AppController } from '../viewmodel/AppController';
import { ServiceRegistry } from '../service/ServiceRegistry';
import { Course, CourseMaterialRef, Material } from '../model/Models';
import promptAction from '@ohos.promptAction';

interface MaterialRow {
  rowKey: string;
  materialId: string;
  quantity: number;
}

interface MaterialOption {
  id: string;
  label: string;
}

@Component
export struct CourseEditorPage {
  courseId: string = '';
  onBack: () => void = () => {};
  onSaved: () => void = () => {};

  @State private controller: AppController | null = null;
  @State private isEdit: boolean = false;
  @State private title: string = '';
  @State private startDateText: string = '';
  @State private startTs: number = 0;
  @State private capacityText: string = '';
  @State private priceText: string = '';
  @State private rewardPointsText: string = '';
  @State private materialRows: MaterialRow[] = [];
  @State private materialOptions: MaterialOption[] = [];
  @State private materialNameCache: Record<string, string> = {};
  @State private showDatePicker: boolean = false;
  @State private saving: boolean = false;
  @State private errorMessage: string = '';

  private pickerDate: Date = new Date();

  async aboutToAppear(): Promise<void> {
    const registry = await ServiceRegistry.get(getContext(this));
    const controller = new AppController(registry);
    await controller.loadSettings();
    this.controller = controller;

    const all: Material[] = await controller.listMaterials();
    const opts: MaterialOption[] = [];
    const nameCache: Record<string, string> = {};
    for (const m of all) {
      opts.push({ id: m.id, label: m.name && m.name.length > 0 ? m.name : '未命名材料' });
      nameCache[m.id] = m.name && m.name.length > 0 ? m.name : '未命名材料';
    }
    this.materialOptions = opts;
    this.materialNameCache = nameCache;

    if (this.courseId && this.courseId.length > 0) {
      this.isEdit = true;
      const c: Course | undefined = await controller.getCourse(this.courseId);
      if (c) {
        this.title = c.title;
        this.startTs = c.startTime;
        this.startDateText = this.formatDateTime(c.startTime);
        this.pickerDate = new Date(c.startTime);
        this.capacityText = c.capacity.toString();
        this.priceText = c.price.toString();
        this.rewardPointsText = c.rewardPoints.toString();
        const rows: MaterialRow[] = [];
        for (const ref of c.materials) {
          rows.push({
            rowKey: `row_${ref.materialId}_${rows.length}`,
            materialId: ref.materialId,
            quantity: ref.quantity,
          });
        }
        this.materialRows = rows;
      }
    } else {
      const now: Date = new Date();
      now.setMinutes(0, 0, 0);
      now.setHours(now.getHours() + 1);
      this.startTs = now.getTime();
      this.pickerDate = now;
      this.startDateText = this.formatDateTime(now.getTime());
    }
  }

  private formatDateTime(ts: number): string {
    const d: Date = new Date(ts);
    const yyyy: number = d.getFullYear();
    const mm: string = (d.getMonth() + 1).toString().padStart(2, '0');
    const dd: string = d.getDate().toString().padStart(2, '0');
    const hh: string = d.getHours().toString().padStart(2, '0');
    const mi: string = d.getMinutes().toString().padStart(2, '0');
    return `${yyyy}-${mm}-${dd} ${hh}:${mi}`;
  }

  private addMaterialRow(): void {
    const next: MaterialRow[] = this.materialRows.slice();
    next.push({ rowKey: `row_${Date.now()}_${next.length}`, materialId: '', quantity: 1 });
    this.materialRows = next;
  }

  private removeMaterialRow(rowKey: string): void {
    const next: MaterialRow[] = this.materialRows.filter((r: MaterialRow) => r.rowKey !== rowKey);
    this.materialRows = next;
  }

  private setRowMaterial(rowKey: string, materialId: string): void {
    const next: MaterialRow[] = this.materialRows.map((r: MaterialRow) =>
      r.rowKey === rowKey ? { rowKey: r.rowKey, materialId, quantity: r.quantity } : r);
    this.materialRows = next;
  }

  private setRowQuantity(rowKey: string, qty: number): void {
    const safe: number = qty < 0 ? 0 : qty;
    const next: MaterialRow[] = this.materialRows.map((r: MaterialRow) =>
      r.rowKey === rowKey ? { rowKey: r.rowKey, materialId: r.materialId, quantity: safe } : r);
    this.materialRows = next;
  }

  private rowQuantityText(rowKey: string): string {
    for (const r of this.materialRows) {
      if (r.rowKey === rowKey) {
        return r.quantity.toString();
      }
    }
    return '0';
  }

  private rowMaterialLabel(materialId: string): string {
    if (!materialId) {
      return '请选择材料';
    }
    const name: string = this.materialNameCache[materialId];
    return name && name.length > 0 ? name : '未命名材料';
  }

  private rowMaterialIndex(rowKey: string): number {
    let targetId: string = '';
    for (const r of this.materialRows) {
      if (r.rowKey === rowKey) {
        targetId = r.materialId;
        break;
      }
    }
    if (!targetId) {
      return -1;
    }
    for (let i = 0; i < this.materialOptions.length; i++) {
      if (this.materialOptions[i].id === targetId) {
        return i;
      }
    }
    return -1;
  }

  private openDatePicker(): void {
    this.showDatePicker = true;
  }

  private closeDatePicker(): void {
    this.showDatePicker = false;
  }

  private onPickerDateChange(value: Date): void {
    if (!value) {
      return;
    }
    const picked: Date = new Date(value.getTime());
    this.pickerDate = new Date(picked.getFullYear(), picked.getMonth(), picked.getDate(),
      this.pickerDate.getHours(), this.pickerDate.getMinutes());
  }

  private confirmPicker(): void {
    const ts: number = this.pickerDate.getTime();
    this.startTs = ts;
    this.startDateText = this.formatDateTime(ts);
    this.showDatePicker = false;
  }

  private addPickerHour(delta: number): void {
    const d: Date = new Date(this.pickerDate.getTime());
    d.setHours(d.getHours() + delta);
    this.pickerDate = d;
  }

  private addPickerMinute(delta: number): void {
    const d: Date = new Date(this.pickerDate.getTime());
    d.setMinutes(d.getMinutes() + delta);
    this.pickerDate = d;
  }

  private pickerTimeLabel(): string {
    const hh: string = this.pickerDate.getHours().toString().padStart(2, '0');
    const mm: string = this.pickerDate.getMinutes().toString().padStart(2, '0');
    return `${hh}:${mm}`;
  }

  private async onSave(): Promise<void> {
    if (this.saving) {
      return;
    }
    const titleTrim: string = this.title.trim();
    if (titleTrim.length === 0) {
      this.errorMessage = '请填写课程名称';
      return;
    }
    if (this.startTs <= 0) {
      this.errorMessage = '请选择开课时间';
      return;
    }
    const capacity: number = this.parseIntSafe(this.capacityText);
    if (capacity <= 0) {
      this.errorMessage = '容量需大于 0';
      return;
    }

    this.saving = true;
    this.errorMessage = '';

    const refs: CourseMaterialRef[] = [];
    for (const r of this.materialRows) {
      if (r.materialId && r.materialId.length > 0 && r.quantity > 0) {
        const ref: CourseMaterialRef = new CourseMaterialRef();
        ref.materialId = r.materialId;
        ref.quantity = r.quantity;
        refs.push(ref);
      }
    }

    const course: Course = new Course();
    course.id = this.isEdit ? this.courseId : '';
    course.title = titleTrim;
    course.startTime = this.startTs;
    course.capacity = capacity;
    course.price = Math.max(0, this.parseIntSafe(this.priceText));
    course.rewardPoints = Math.max(0, this.parseIntSafe(this.rewardPointsText));
    course.materials = refs;
    course.status = 'upcoming';

    try {
      if (!this.controller) {
        const registry = await ServiceRegistry.get(getContext(this));
        this.controller = new AppController(registry);
        await this.controller.loadSettings();
      }
      if (this.isEdit) {
        const existing: Course | undefined = await this.controller.getCourse(this.courseId);
        if (existing) {
          course.status = existing.status;
        }
      }
      await this.controller.saveCourse(course);
      this.saving = false;
      promptAction.showToast({ message: this.isEdit ? '课程已更新' : '课程已创建', duration: 2000 });
      this.onSaved();
    } catch (e) {
      this.saving = false;
      this.errorMessage = '保存失败，请重试';
    }
  }

  private parseIntSafe(text: string): number {
    const t: string = text.trim();
    if (t.length === 0) {
      return 0;
    }
    const n: number = parseInt(t, 10);
    if (isNaN(n)) {
      return 0;
    }
    return n;
  }

  build(): void {
    Stack({ alignContent: Alignment.Center }) {
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

      if (this.showDatePicker) {
        this.DatePickerSheet()
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  DatePickerSheet(): void {
    Column() {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(58, 45, 40, 0.36)')
        .onClick(() => this.closeDatePicker())
    }
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })

    Column() {
      Row() {
        Text('选择开课时间')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Text('关闭')
          .fontSize(14)
          .fontColor(Theme.clay)
          .onClick(() => this.closeDatePicker())
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 12 })

      Row() {
        Text('时间')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .layoutWeight(1)
        Column() {
          Text(this.pickerTimeLabel())
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.textPrimary)
            .fontFamily('monospace')
        }
        .alignItems(HorizontalAlign.Center)
        Row() {
          Column() {
            Text('时 +')
              .fontSize(12)
              .fontColor(Theme.clay)
              .onClick(() => this.addPickerHour(1))
          }
          .padding(6)
          Column() {
            Text('时 -')
              .fontSize(12)
              .fontColor(Theme.clay)
              .onClick(() => this.addPickerHour(-1))
          }
          .padding(6)
          Column() {
            Text('分 +')
              .fontSize(12)
              .fontColor(Theme.clay)
              .onClick(() => this.addPickerMinute(15))
          }
          .padding(6)
          Column() {
            Text('分 -')
              .fontSize(12)
              .fontColor(Theme.clay)
              .onClick(() => this.addPickerMinute(-15))
          }
          .padding(6)
        }
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .padding({ top: 8, bottom: 12 })
      .border({ width: { bottom: 1 }, color: { bottom: Theme.borderSoft } })

      DatePicker({
        start: new Date(this.pickerDate.getTime() - 365 * 24 * 60 * 60 * 1000),
        end: new Date(this.pickerDate.getTime() + 365 * 24 * 60 * 60 * 1000),
        selected: this.pickerDate,
      })
        .id('course-editor-datepicker')
        .width('100%')
        .height(180)
        .onDateChange((value: Date) => this.onPickerDateChange(value))

      Text('确定')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textLight)
        .backgroundColor(Theme.clay)
        .borderRadius(Theme.radiusButton)
        .padding({ left: 26, right: 26, top: 14, bottom: 14 })
        .margin({ top: 16 })
        .width('100%')
        .textAlign(TextAlign.Center)
        .onClick(() => this.confirmPicker())
    }
    .width('86%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.shadowDarkCard())
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
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.onBack())

      Text(this.isEdit ? '编辑课程' : '新增课程')
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
  SectionLabel(label: string): void {
    Text(label)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.textPrimary)
      .margin({ top: 20, bottom: 8 })
  }

  @Builder
  FormBody(): void {
    Column() {
      this.SectionLabel('课程名称')
      TextInput({ text: this.title, placeholder: '如：拉坯入门体验' })
        .id('course-editor-title-input')
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
        .onChange((v: string) => this.title = v)

      this.SectionLabel('开课时间')
      Row() {
        Text(this.startDateText.length > 0 ? this.startDateText : '点击选择开课时间')
          .id('course-editor-start-time')
          .fontSize(14)
          .fontColor(this.startDateText.length > 0 ? Theme.textPrimary : '#C8BBAF')
          .layoutWeight(1)
        Text('选择')
          .fontSize(13)
          .fontColor(Theme.clay)
          .padding({ left: 10, right: 10, top: 6, bottom: 6 })
          .backgroundColor(Theme.clayLight)
          .borderRadius(10)
          .onClick(() => this.openDatePicker())
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .padding({ left: 15, right: 15, top: 14, bottom: 14 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(14)
      .border({ width: 1.5, color: Theme.borderDefault })

      this.SectionLabel('容量')
      TextInput({ text: this.capacityText, placeholder: '人数上限（必填）' })
        .id('course-editor-capacity-input')
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
        .onChange((v: string) => this.capacityText = v)

      Row() {
        Column() {
          this.SectionLabel('单价（元）')
          TextInput({ text: this.priceText, placeholder: '0' })
            .id('course-editor-price-input')
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
            .onChange((v: string) => this.priceText = v)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)

        Column() {
          this.SectionLabel('奖励积分')
          TextInput({ text: this.rewardPointsText, placeholder: '0' })
            .id('course-editor-points-input')
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
            .onChange((v: string) => this.rewardPointsText = v)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)

      this.SectionLabel('耗材清单')
      this.MaterialRows()

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
  MaterialRows(): void {
    Column() {
      if (this.materialRows.length === 0) {
        Text('暂未添加耗材，点击下方添加')
          .id('course-editor-materials-empty')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
          .padding({ top: 12, bottom: 12 })
          .width('100%')
          .textAlign(TextAlign.Center)
      } else {
        ForEach(this.materialRows, (row: MaterialRow) => {
          this.MaterialRowItem(row)
        }, (row: MaterialRow) => row.rowKey)
      }

      Text('+ 添加耗材')
        .id('course-editor-add-material')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.clay)
        .backgroundColor(Theme.clayLight)
        .borderRadius(12)
        .padding({ left: 16, right: 16, top: 10, bottom: 10 })
        .margin({ top: 8 })
        .onClick(() => this.addMaterialRow())
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1.5, color: Theme.borderDefault })
  }

  @Builder
  MaterialRowItem(row: MaterialRow): void {
    Column() {
      Row() {
        Select(this.materialOptions.map((opt: MaterialOption) => ({
          value: opt.label,
          icon: '',
        } as SelectOption)))
          .id(`course-editor-material-select-${row.rowKey}`)
          .selected(this.rowMaterialIndex(row.rowKey))
          .value(this.rowMaterialLabel(row.materialId))
          .font({ size: 14 })
          .selectedOptionFont({ size: 14, weight: FontWeight.Medium })
          .selectedOptionBgColor(Theme.clayLight)
          .optionFont({ size: 14 })
          .optionBgColor(Theme.cardBg)
          .layoutWeight(1)
          .height(50)
          .backgroundColor(Theme.cardBg)
          .borderRadius(12)
          .border({ width: 1.5, color: Theme.borderSoft })
          .onSelect((index: number) => {
            if (index >= 0 && index < this.materialOptions.length) {
              this.setRowMaterial(row.rowKey, this.materialOptions[index].id);
            }
          })

        TextInput({ text: this.rowQuantityText(row.rowKey), placeholder: '数量' })
          .id(`course-editor-material-qty-${row.rowKey}`)
          .type(InputType.Number)
          .width(80)
          .height(50)
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .placeholderColor('#C8BBAF')
          .placeholderFont({ size: 14 })
          .backgroundColor(Theme.cardBg)
          .borderRadius(12)
          .border({ width: 1.5, color: Theme.borderSoft })
          .padding({ left: 12, right: 12 })
          .margin({ left: 10 })
          .onChange((v: string) => this.setRowQuantity(row.rowKey, this.parseIntSafe(v)))

        Text('删除')
          .id(`course-editor-material-remove-${row.rowKey}`)
          .fontSize(13)
          .fontColor(Theme.ochre)
          .padding({ left: 8, right: 8, top: 14, bottom: 14 })
          .onClick(() => this.removeMaterialRow(row.rowKey))
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 10 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  FooterBar(): void {
    Row() {
      Text('保存课程')
        .id('course-editor-save-button')
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
