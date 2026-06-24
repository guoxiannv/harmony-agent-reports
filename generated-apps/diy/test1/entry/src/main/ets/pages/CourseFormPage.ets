import { AppController } from '../viewmodel/AppController';
import { Course, CourseMaterial, InventoryItem } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct CourseFormPage {
  @ObjectLink ctrl: AppController;
  @Prop courseId: string;
  onBack: () => void = () => {};
  onSaved: () => void = () => {};
  @State title: string = '';
  @State teacher: string = '';
  @State dateStr: string = '';
  @State timeStr: string = '';
  @State capacity: string = '';
  @State selectedMaterials: CourseMaterial[] = [];
  @State showMaterialPicker: boolean = false;

  aboutToAppear(): void {
    const c: Course | undefined = this.ctrl.getCourseById(this.courseId);
    if (c) {
      this.title = c.title;
      this.teacher = c.teacher;
      const d: Date = new Date(c.startTime);
      this.dateStr = `${d.getFullYear()}-${(d.getMonth() + 1).toString().padStart(2, '0')}-${d.getDate().toString().padStart(2, '0')}`;
      this.timeStr = `${d.getHours().toString().padStart(2, '0')}:${d.getMinutes().toString().padStart(2, '0')}`;
      this.capacity = `${c.capacity}`;
      this.selectedMaterials = c.materials.map((m: CourseMaterial) => {
        const copy: CourseMaterial = new CourseMaterial();
        copy.itemId = m.itemId;
        copy.name = m.name;
        copy.quantityPerStudent = m.quantityPerStudent;
        copy.unit = m.unit;
        return copy;
      });
    } else {
      this.dateStr = this.todayDateStr();
      this.timeStr = '14:00';
      this.capacity = '8';
    }
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Button() {
            SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary })
          }
          .width(40)
          .height(40)
          .backgroundColor(Color.Transparent)
          .onClick(() => this.onBack())

          Text(this.courseId ? '编辑课程' : '新增课程')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)

          Blank().width(40)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        this.Field('课程标题', 'course-form-title-input', '请输入课程名称', this.title, (v: string) => this.title = v)
        this.Field('老师', 'course-form-teacher-input', '请输入老师姓名', this.teacher, (v: string) => this.teacher = v)

        Text('上课时间')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 6 })
        TextInput({ placeholder: 'YYYY-MM-DD', text: this.dateStr })
          .id('course-form-time-picker')
          .width('100%')
          .height(48)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 8 })
          .onChange((v: string) => this.dateStr = v)
        TextInput({ placeholder: 'HH:MM', text: this.timeStr })
          .width('100%')
          .height(48)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 16 })
          .onChange((v: string) => this.timeStr = v)

        Text('容量')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 6 })
        TextInput({ placeholder: '可报名人数', text: this.capacity })
          .id('course-form-capacity-input')
          .width('100%')
          .height(48)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 16 })
          .onChange((v: string) => this.capacity = v)

        // Materials
        Row() {
          Text('材料清单')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
          Blank()
          Button('添加')
            .fontSize(13)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .onClick(() => this.showMaterialPicker = true)
        }
        .width('100%')
        .margin({ bottom: 10 })

        Column({ space: 10 }) {
          if (this.selectedMaterials.length === 0) {
            Text('未添加材料')
              .fontSize(Theme.captionSize)
              .fontColor(Theme.textQuaternary)
              .width('100%')
          } else {
            ForEach(this.selectedMaterials, (mat: CourseMaterial, index: number) => {
              Row({ space: 10 }) {
                Text(mat.name)
                  .fontSize(Theme.bodySize)
                  .fontColor(Theme.textPrimary)
                  .layoutWeight(1)
                TextInput({ text: `${mat.quantityPerStudent}` })
                  .width(60)
                  .height(36)
                  .backgroundColor(Theme.inputBg)
                  .borderRadius(8)
                  .fontSize(13)
                  .onChange((v: string) => {
                    const n: number = parseFloat(v);
                    if (!isNaN(n) && index < this.selectedMaterials.length) {
                      this.selectedMaterials[index].quantityPerStudent = n;
                    }
                  })
                Text(mat.unit)
                  .fontSize(13)
                  .fontColor(Theme.textTertiary)
                Button() {
                  SvgIcon({ variant: 'trash', iconSize: 14, color: Theme.rust })
                }
                .width(28)
                .height(28)
                .backgroundColor(Color.Transparent)
                .onClick(() => this.removeMaterial(mat.itemId))
              }
              .width('100%')
              .padding(10)
              .backgroundColor(Theme.ricePaper)
              .borderRadius(12)
            }, (mat: CourseMaterial) => mat.itemId)
          }
        }
        .id('course-form-material-selector')
        .width('100%')
        .margin({ bottom: 32 })

        Button('保存')
          .id('course-form-save-button')
          .width('100%')
          .height(48)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(this.canSave() ? Theme.terracotta : Theme.sand)
          .borderRadius(999)
          .enabled(this.canSave())
          .onClick(() => this.save())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .bindSheet(
      this.showMaterialPicker,
      this.MaterialPicker(),
      {
        height: SheetSize.FIT_CONTENT,
        onWillDisappear: () => this.showMaterialPicker = false,
      }
    )
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

  @Builder
  MaterialPicker() {
    Column({ space: 16 }) {
      Text('选择材料')
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      List({ space: 8 }) {
        ForEach(this.ctrl.inventory, (item: InventoryItem) => {
          ListItem() {
            Row({ space: 12 }) {
              Column({ space: 2 }) {
                Text(item.name)
                  .fontSize(Theme.bodySize)
                  .fontColor(Theme.textPrimary)
                  .fontWeight(FontWeight.Bold)
                Text(`库存 ${item.currentStock}${item.unit}`)
                  .fontSize(Theme.captionSize)
                  .fontColor(Theme.textTertiary)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              if (this.selectedMaterials.find((m: CourseMaterial) => m.itemId === item.id)) {
                Text('已选')
                  .fontSize(12)
                  .fontColor(Theme.terracotta)
                  .padding({ left: 10, right: 10, top: 4, bottom: 4 })
                  .backgroundColor('rgba(198,123,92,0.10)')
                  .borderRadius(8)
              } else {
                Button('选择')
                  .fontSize(12)
                  .fontColor(Theme.textOnAccent)
                  .backgroundColor(Theme.terracotta)
                  .borderRadius(999)
                  .onClick(() => {
                    const mat: CourseMaterial = new CourseMaterial();
                    mat.itemId = item.id;
                    mat.name = item.name;
                    mat.quantityPerStudent = 1;
                    mat.unit = item.unit;
                    this.selectedMaterials.push(mat);
                    this.showMaterialPicker = false;
                  })
              }
            }
            .width('100%')
            .padding(12)
            .backgroundColor(Theme.ricePaper)
            .borderRadius(12)
          }
        }, (item: InventoryItem) => item.id)
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .padding(24)
  }

  private removeMaterial(itemId: string): void {
    this.selectedMaterials = this.selectedMaterials.filter((m: CourseMaterial) => m.itemId !== itemId);
  }

  private canSave(): boolean {
    return this.title.trim().length > 0 && this.teacher.trim().length > 0;
  }

  private async save(): Promise<void> {
    if (!this.canSave()) {
      return;
    }
    let c: Course | undefined = this.ctrl.getCourseById(this.courseId);
    if (!c) {
      c = new Course();
    }
    c.title = this.title.trim();
    c.teacher = this.teacher.trim();
    c.startTime = this.parseDateTime(this.dateStr, this.timeStr);
    c.capacity = parseInt(this.capacity, 10) || 8;
    c.materials = this.selectedMaterials.slice();
    await this.ctrl.upsertCourse(c);
    promptAction.showToast({ message: '保存成功' });
    this.onSaved();
  }

  private parseDateTime(date: string, time: string): number {
    const dateParts: string[] = date.split('-');
    const y: number = parseInt(dateParts[0], 10) || 2026;
    const mo: number = parseInt(dateParts[1], 10) || 1;
    const d: number = parseInt(dateParts[2], 10) || 1;
    const timeParts: string[] = time.split(':');
    const h: number = parseInt(timeParts[0], 10) || 0;
    const mi: number = parseInt(timeParts[1], 10) || 0;
    return new Date(y, mo - 1, d, h, mi).getTime();
  }

  private todayDateStr(): string {
    const d: Date = new Date();
    return `${d.getFullYear()}-${(d.getMonth() + 1).toString().padStart(2, '0')}-${d.getDate().toString().padStart(2, '0')}`;
  }
}
