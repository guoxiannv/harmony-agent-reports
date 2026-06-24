import { Theme, BrandGradient } from '../common/Theme';
import { InspectionController } from '../controllers/InspectionController';
import { Inspection, InspectionCheckItem, CheckResult } from '../model/Inspection';
import { PageHeader, FormField, PrimaryButton, DangerButton, GhostButton } from '../components/CommonUi';
import { formatDate, parseDate } from '../services/IdGenerator';
import { promptAction } from '@kit.ArkUI';

@Component
export struct InspectionDetailPage {
  inspectionId: string = '';
  onBack?: () => void;
  onOpenHazard?: (id: string) => void;
  @State draft: Inspection = new Inspection();
  @State selectedCheckId: string = '';
  private controller = new InspectionController();

  aboutToAppear(): void {
    if (this.inspectionId) {
      const found = this.controller.get(this.inspectionId);
      if (found) {
        this.draft = new Inspection();
        this.draft.id = found.id;
        this.draft.title = found.title;
        this.draft.location = found.location;
        this.draft.date = found.date;
        this.draft.status = found.status;
        this.draft.checklist = found.checklist.map(c => new InspectionCheckItem({ id: c.id, text: c.text, result: c.result, remark: c.remark }));
        this.draft.createdAt = found.createdAt;
        this.draft.updatedAt = found.updatedAt;
      } else {
        this.draft = this.controller.createDraft();
      }
    } else {
      this.draft = this.controller.createDraft();
    }
  }

  private save(): void {
    this.controller.save(this.draft);
    promptAction.showToast({ message: '已保存' });
    if (this.onBack) this.onBack();
  }

  private delete(): void {
    if (this.inspectionId) {
      this.controller.delete(this.inspectionId);
      if (this.onBack) this.onBack();
    }
  }

  private markNormal(item: InspectionCheckItem): void {
    item.result = CheckResult.NORMAL;
    this.selectedCheckId = '';
    const d = this.draft;
    this.draft = new Inspection();
    this.draft.id = d.id;
    this.draft.title = d.title;
    this.draft.location = d.location;
    this.draft.date = d.date;
    this.draft.status = d.status;
    this.draft.checklist = d.checklist.map(c => new InspectionCheckItem({ id: c.id, text: c.text, result: c.result, remark: c.remark }));
    this.draft.createdAt = d.createdAt;
    this.draft.updatedAt = d.updatedAt;
  }

  private markAbnormal(item: InspectionCheckItem): void {
    item.result = CheckResult.ABNORMAL;
    this.selectedCheckId = item.id;
    const d = this.draft;
    this.draft = new Inspection();
    this.draft.id = d.id;
    this.draft.title = d.title;
    this.draft.location = d.location;
    this.draft.date = d.date;
    this.draft.status = d.status;
    this.draft.checklist = d.checklist.map(c => new InspectionCheckItem({ id: c.id, text: c.text, result: c.result, remark: c.remark }));
    this.draft.createdAt = d.createdAt;
    this.draft.updatedAt = d.updatedAt;
  }

  private convertToHazard(): void {
    const hazard = this.controller.convertToHazard(this.draft);
    promptAction.showToast({ message: '已转为隐患' });
    if (this.onOpenHazard) this.onOpenHazard(hazard.id);
  }

  private hasAbnormal(): boolean {
    return this.draft.checklist.some(ci => ci.result === CheckResult.ABNORMAL);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: this.inspectionId ? '巡检详情' : '新建巡检',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.saveButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Column({ space: 16 }) {
            FormField({
              label: '巡检标题',
              placeholder: '请输入巡检标题',
              value: this.draft.title,
              componentId: 'inspection-detail-title-input',
              onChange: (v) => this.draft.title = v
            })
            FormField({
              label: '巡检地点',
              placeholder: '请输入地点',
              value: this.draft.location,
              componentId: 'inspection-detail-location-input',
              onChange: (v) => this.draft.location = v
            })
            Column({ space: 6 }) {
              Text('巡检日期')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .width('100%')
              TextInput({ text: formatDate(this.draft.date), placeholder: '选择日期' })
                .id('inspection-detail-date-picker')
                .width('100%')
                .height(48)
                .fontSize(14)
                .fontColor(Theme.textPrimary)
                .placeholderColor(Theme.textPlaceholder)
                .backgroundColor(Theme.inputBg)
                .border({ width: 1, color: Theme.borderDefault })
                .borderRadius(Theme.radiusPill)
                .padding({ left: 14, right: 14 })
                .onChange((v) => {
                  const ts = parseDate(v);
                  if (ts !== null) this.draft.date = ts;
                })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          Column({ space: 12 }) {
            Text('检查项')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .width('100%')

            List({ space: 12 }) {
              ForEach(this.draft.checklist, (item: InspectionCheckItem, index: number) => {
                ListItem() {
                  this.CheckItemRow(item, index)
                }
              }, (item: InspectionCheckItem) => item.id)
            }
            .id('inspection-detail-checklist')
            .width('100%')

            if (this.hasAbnormal()) {
              Button('将异常项转为隐患')
                .id('inspection-detail-convert-hazard-button')
                .width('100%')
                .height(44)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.danger)
                .backgroundColor(Theme.dangerSoft)
                .borderRadius(Theme.radiusButton)
                .onClick(() => this.convertToHazard())
            }
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          if (this.inspectionId) {
            DangerButton({
              label: '删除巡检',
              onTap: () => this.delete()
            })
          }

          Blank().height(24)
        }
        .width('100%')
        .padding(16)
        .padding({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Column() {
        PrimaryButton({
          label: '提交巡检结果',
          onTap: () => this.save()
        })
          .id('inspection-detail-submit-button')
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Theme.pageBg)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  saveButton() {
    Button('保存')
      .fontSize(14)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.brandPrimary)
      .backgroundColor(Color.Transparent)
      .onClick(() => this.save())
  }

  @Builder
  CheckItemRow(item: InspectionCheckItem, index: number) {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Column() {
          Text(`${index + 1}`)
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnBrand)
        }
        .width(28)
        .height(28)
        .borderRadius(8)
        .linearGradient(BrandGradient.primary)
        .justifyContent(FlexAlign.Center)

        Text(item.text)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')

      Row({ space: 8 }) {
        Button('正常')
          .id('inspection-detail-check-normal-button')
          .layoutWeight(1)
          .height(36)
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(item.result === CheckResult.NORMAL ? Theme.success : Theme.textTertiary)
          .backgroundColor(item.result === CheckResult.NORMAL ? Theme.successSoft : Theme.inputBg)
          .border({ width: 1, color: item.result === CheckResult.NORMAL ? Theme.success : Theme.borderDefault })
          .borderRadius(Theme.radiusSmall)
          .onClick(() => this.markNormal(item))

        Button('异常')
          .id('inspection-detail-check-abnormal-button')
          .layoutWeight(1)
          .height(36)
          .fontSize(13)
          .fontWeight(FontWeight.Medium)
          .fontColor(item.result === CheckResult.ABNORMAL ? Theme.danger : Theme.textTertiary)
          .backgroundColor(item.result === CheckResult.ABNORMAL ? Theme.dangerSoft : Theme.inputBg)
          .border({ width: 1, color: item.result === CheckResult.ABNORMAL ? Theme.danger : Theme.borderDefault })
          .borderRadius(Theme.radiusSmall)
          .onClick(() => this.markAbnormal(item))
      }
      .width('100%')
    }
    .width('100%')
    .padding(14)
    .backgroundColor(item.result === CheckResult.ABNORMAL ? Theme.dangerSoft : Theme.cardBg)
    .border({ width: 1, color: item.result === CheckResult.ABNORMAL ? Theme.danger : Theme.borderDefault })
    .borderRadius(Theme.radiusPill)
  }
}
