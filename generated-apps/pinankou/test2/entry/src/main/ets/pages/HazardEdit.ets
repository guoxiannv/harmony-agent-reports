// HazardEdit.ets — 新建 / 编辑隐患表单
import { promptAction } from '@kit.ArkUI';
import { Theme, RiskLevel, riskColor, riskBg, riskLabel } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { SvgIcon } from '../common/SvgIcon';
import { PrimaryButton } from '../components/CommonUi';
import { HazardForm, emptyHazardForm } from '../model/Types';

const LEVELS: RiskLevel[] = ['low', 'medium', 'high', 'critical'];

@Component
export struct HazardEditPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @Prop hazardId: string = '';
  onBack: () => void = () => {};
  onSaved: () => void = () => {};

  @State form: HazardForm = emptyHazardForm();
  @State ready: boolean = false;

  aboutToAppear(): void {
    if (this.hazardId.length > 0) {
      const h = this.store.getHazard(this.hazardId);
      if (h) {
        this.form = {
          id: h.id, title: h.title, location: h.location, level: h.level,
          description: h.description, assignee: h.assignee, deadline: h.deadline, photoPath: h.photoPath,
        };
      }
    }
    this.ready = true;
  }

  build() {
    Column() {
      this.Header()
      Scroll() {
        Column() {
          this.Field('标题（必填）', this.form.title, '请简述隐患', (v: string) => this.form.title = v, 'hazard-edit-title-input', true)
          this.Field('地点', this.form.location, '发生地点 / 区域', (v: string) => this.form.location = v, 'hazard-edit-location-input', false)

          Column() {
            Text('风险等级').fontSize(13).fontColor(Theme.textTertiary)
            Row() {
              ForEach(LEVELS, (lv: RiskLevel) => {
                Text(riskLabel(lv))
                  .id(lv === this.form.level ? 'hazard-edit-level-picker' : '')
                  .fontSize(13).fontWeight(FontWeight.Medium)
                  .fontColor(this.form.level === lv ? Theme.textOnBrand : riskColor(lv))
                  .backgroundColor(this.form.level === lv ? Theme.brandPrimary : riskBg(lv))
                  .borderRadius(Theme.radiusChip)
                  .padding({ left: 12, right: 12, top: 6, bottom: 6 })
                  .margin({ right: 8 })
                  .onClick(() => this.form.level = lv)
              }, (lv: RiskLevel) => lv)
            }.margin({ top: 8 }).width('100%')
          }.width('100%').alignItems(HorizontalAlign.Start).margin({ top: 14 })

          this.Field('描述', this.form.description, '详细描述隐患情况', (v: string) => this.form.description = v, 'hazard-edit-description-input', false)

          Column() {
            Text('现场照片').fontSize(13).fontColor(Theme.textTertiary)
            Row() {
              Column() {
                SvgIcon({ variant: 'plus', iconSize: 22, color: Theme.brandPrimary, strokeWidth: 2 })
                Text(this.form.photoPath.length > 0 ? '已留存' : '拍照 / 选图')
                  .fontSize(12).fontColor(Theme.textSecondary).margin({ top: 6 })
              }
              .id('hazard-edit-photo-button')
              .width(96).height(96).borderRadius(Theme.radiusSmall)
              .backgroundColor(Theme.chipSoftBg)
              .border({ width: 1, color: Theme.borderDefault, style: BorderStyle.Dashed })
              .justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)
              .margin({ top: 8 })
              .onClick(() => {
                this.form.photoPath = `local://photo_${Date.now()}.jpg`;
                promptAction.showToast({ message: '已记录现场照片（占位）' });
              })
            }.width('100%')
          }.width('100%').alignItems(HorizontalAlign.Start).margin({ top: 14 })

          this.Field('责任人', this.form.assignee, '指派整改责任人', (v: string) => this.form.assignee = v, 'hazard-edit-assignee-picker', false)

          Column() {
            Text('整改期限').fontSize(13).fontColor(Theme.textTertiary)
            Row() {
              Text(this.form.deadline > 0 ? this.timeLabel(this.form.deadline) : '点击选择日期')
                .id('hazard-edit-deadline-picker')
                .fontSize(14).fontColor(this.form.deadline > 0 ? Theme.textPrimary : Theme.textPlaceholder)
                .backgroundColor(Theme.chipSoftBg).borderRadius(Theme.radiusSmall)
                .padding({ left: 14, right: 14, top: 10, bottom: 10 })
                .margin({ top: 8 })
                .onClick(() => this.pickDeadline())
            }.width('100%')
          }.width('100%').alignItems(HorizontalAlign.Start).margin({ top: 14 })

          PrimaryButton({
            label: this.hazardId.length > 0 ? '保存修改' : '提交隐患',
            isEnabled: this.form.title.trim().length > 0,
            onTap: () => this.save()
          }).id('hazard-edit-save-button').margin({ top: 24 })
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 32 })
      }
      .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder Header() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary, strokeWidth: 2 })
      }
      .id('hazard-edit-back-button')
      .width(40).height(40).justifyContent(FlexAlign.Center)
      .onClick(() => this.onBack())
      Text(this.hazardId.length > 0 ? '编辑隐患' : '新建隐患')
        .fontSize(17).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary).margin({ left: 4 })
    }
    .width('100%')
    .padding({ left: 8, right: Theme.pageHorizontalPadding, top: 48, bottom: 8 })
  }

  @Builder Field(label: string, value: string, placeholder: string, onChange: (v: string) => void, fieldId: string, required: boolean) {
    Column() {
      Text(required ? `${label}` : label).fontSize(13).fontColor(Theme.textTertiary)
      TextInput({ text: value, placeholder: placeholder })
        .id(fieldId)
        .fontSize(14)
        .backgroundColor(Theme.chipSoftBg)
        .borderRadius(Theme.radiusSmall)
        .padding({ left: 12, right: 12 })
        .height(44)
        .margin({ top: 6 })
        .placeholderColor(Theme.textPlaceholder)
        .onChange((v: string) => onChange(v))
    }.width('100%').alignItems(HorizontalAlign.Start).margin({ top: 14 })
  }

  private pickDeadline(): void {
    DatePickerDialog.show({
      start: new Date(),
      onAccept: (value: DatePickerResult) => {
        const d = new Date(value.year, value.month, value.day);
        this.form.deadline = d.getTime();
      },
    });
  }

  private save(): void {
    if (this.form.title.trim().length === 0) {
      promptAction.showToast({ message: '请填写隐患标题' });
      return;
    }
    if (this.form.id.length > 0) {
      this.store.updateHazard(this.form);
      promptAction.showToast({ message: '已保存修改' });
    } else {
      this.store.addHazard(this.form);
      promptAction.showToast({ message: '隐患已提交' });
    }
    this.onSaved();
  }

  private timeLabel(ms: number): string {
    const d = new Date(ms);
    return `${d.getFullYear()}/${d.getMonth() + 1}/${d.getDate()}`;
  }
}
