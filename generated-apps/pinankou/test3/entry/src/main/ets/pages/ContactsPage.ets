import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { ContactController } from '../controllers/ContactController';
import { Contact } from '../model/Contact';
import { PageHeader, EmptyStateView } from '../components/CommonUi';
import { callPhone, sendSms } from '../services/CallSmsService';

@Component
export struct ContactsPage {
  onBack?: () => void;
  onOpenDetail?: (id: string) => void;
  @State query: string = '';
  @State items: Contact[] = [];
  private controller = new ContactController();

  aboutToAppear(): void {
    this.refresh();
  }

  private refresh(): void {
    this.items = this.controller.list(this.query);
  }

  private onSearch(v: string): void {
    this.query = v;
    this.refresh();
  }

  private doCall(contact: Contact): void {
    callPhone(contact.phone);
  }

  private doMessage(contact: Contact): void {
    sendSms(contact.phone);
  }

  build() {
    Column({ space: 0 }) {
      PageHeader({
        title: '应急联系人',
        onBack: () => {
          if (this.onBack) this.onBack();
        },
        trailing: this.addButton
      })

      Scroll() {
        Column({ space: 16 }) {
          Search({ value: $$this.query, placeholder: '搜索联系人' })
            .id('contacts-search-input')
            .width('100%')
            .height(44)
            .placeholderColor(Theme.textPlaceholder)
            .backgroundColor(Theme.inputBg)
            .border({ width: 1, color: Theme.borderDefault })
            .borderRadius(Theme.radiusPill)
            .onChange((v: string) => this.onSearch(v))
            .onSubmit(() => this.refresh())

          List({ space: 12 }) {
            if (this.items.length === 0) {
              ListItem() {
                EmptyStateView({ title: '暂无联系人', subtitle: '点击右上角 + 添加' })
                  .id('contacts-empty-state')
              }
            }
            ForEach(this.items, (item: Contact) => {
              ListItem() {
                this.ContactCard(item)
              }
              .id(`contact-${item.id}`)
              .onClick(() => {
                if (this.onOpenDetail) this.onOpenDetail(item.id);
              })
            }, (item: Contact) => item.id)
          }
          .id('contacts-list')
          .width('100%')
          .layoutWeight(1)
        }
        .width('100%')
        .padding(16)
        .padding({ bottom: 24 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  addButton() {
    Button() {
      SvgIcon({ variant: 'add', iconSize: 20 })
    }
    .id('contacts-add-button')
    .width(40)
    .height(40)
    .borderRadius(12)
    .linearGradient(BrandGradient.primary)
    .shadow(Theme.buttonShadow)
    .onClick(() => {
      if (this.onOpenDetail) this.onOpenDetail('');
    })
  }

  @Builder
  ContactCard(contact: Contact) {
    Row({ space: 12 }) {
      Column() {
        Text(contact.name.slice(0, 1))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnBrand)
      }
      .width(44)
      .height(44)
      .borderRadius(22)
      .linearGradient(BrandGradient.primary)
      .justifyContent(FlexAlign.Center)

      Column({ space: 4 }) {
        Row({ space: 8 }) {
          Text(contact.name)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
          if (contact.isEmergency) {
            Text('急')
              .fontSize(10)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textOnBrand)
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor(Theme.danger)
              .borderRadius(6)
          }
        }

        Text(`${contact.role}${contact.department ? ' · ' + contact.department : ''}`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Row({ space: 8 }) {
        Button() {
          SvgIcon({ variant: 'contact', iconSize: 18 })
        }
        .id('contacts-call-button')
        .width(36)
        .height(36)
        .borderRadius(10)
        .backgroundColor(Theme.inputBg)
        .onClick(() => this.doCall(contact))

        Button() {
          SvgIcon({ variant: 'note', iconSize: 18 })
        }
        .id('contacts-message-button')
        .width(36)
        .height(36)
        .borderRadius(10)
        .backgroundColor(Theme.inputBg)
        .onClick(() => this.doMessage(contact))
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .shadow(Theme.cardShadow)
    .alignItems(VerticalAlign.Center)
  }
}
