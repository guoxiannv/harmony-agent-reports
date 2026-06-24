import { Theme } from '../common/Theme';
import { ContactController } from '../controllers/ContactController';
import { Contact } from '../model/Contact';
import { PageHeader, FormField, PrimaryButton, DangerButton } from '../components/CommonUi';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ContactDetailPage {
  contactId: string = '';
  onBack?: () => void;
  @State draft: Contact = new Contact();
  private controller = new ContactController();

  aboutToAppear(): void {
    if (this.contactId) {
      const found = this.controller.get(this.contactId);
      if (found) {
        this.draft = new Contact();
        this.draft.id = found.id;
        this.draft.name = found.name;
        this.draft.role = found.role;
        this.draft.department = found.department;
        this.draft.phone = found.phone;
        this.draft.isEmergency = found.isEmergency;
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
    if (!this.draft.name.trim() || !this.draft.phone.trim()) {
      promptAction.showToast({ message: '请填写姓名和电话' });
      return;
    }
    this.controller.save(this.draft);
    promptAction.showToast({ message: '已保存' });
    if (this.onBack) this.onBack();
  }

  private delete(): void {
    if (this.contactId) {
      this.controller.delete(this.contactId);
      if (this.onBack) this.onBack();
    }
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: this.contactId ? '联系人详情' : '新建联系人',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.saveButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Column({ space: 16 }) {
            FormField({
              label: '姓名',
              placeholder: '请输入姓名',
              value: this.draft.name,
              componentId: 'contact-detail-name-input',
              onChange: (v) => this.draft.name = v
            })
            FormField({
              label: '角色',
              placeholder: '如：安全主管、消防负责人',
              value: this.draft.role,
              componentId: 'contact-detail-role-input',
              onChange: (v) => this.draft.role = v
            })
            FormField({
              label: '部门',
              placeholder: '请输入部门',
              value: this.draft.department,
              componentId: 'contact-detail-department-input',
              onChange: (v) => this.draft.department = v
            })
            FormField({
              label: '电话',
              placeholder: '请输入电话号码',
              value: this.draft.phone,
              componentId: 'contact-detail-phone-input',
              onChange: (v) => this.draft.phone = v
            })

            Row({ space: 12 }) {
              Text('设为紧急联系人')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textSecondary)
                .layoutWeight(1)
              Toggle({ type: ToggleType.Switch, isOn: this.draft.isEmergency })
                .id('contact-detail-emergency-toggle')
                .selectedColor(Theme.danger)
                .onChange((isOn: boolean) => {
                  this.draft.isEmergency = isOn;
                })
            }
            .width('100%')
            .height(48)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Theme.cardBg)
          .borderRadius(Theme.radiusCard)
          .shadow(Theme.cardShadow)

          if (this.contactId) {
            DangerButton({
              label: '删除联系人',
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
          label: '保存',
          onTap: () => this.save()
        })
          .id('contact-detail-save-button')
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
      .id('contact-detail-save-button')
      .fontSize(14)
      .fontWeight(FontWeight.Bold)
      .fontColor(Theme.brandPrimary)
      .backgroundColor(Color.Transparent)
      .onClick(() => this.save())
  }
}
