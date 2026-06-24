import { Theme } from '../common/Theme';
import { PageHeader } from '../components/PageHeader'
import { EmptyStateView } from '../components/EmptyStateView';
import { EmergencyContact } from '../models/Models';

@Component
export struct EmergencyPage {
  @Prop contacts: EmergencyContact[] = [];
  @Prop searchQuery: string = '';
  onSearchChange: (query: string) => void = () => {};
  onAddContact: () => void = () => {};
  onDial: (phone: string) => void = () => {};

  build() {
    Column({ space: 12 }) {
      PageHeader({ title: '应急联系人' })

      Row({ space: 8 }) {
        Image($rawfile('icon_搜索应急联系人.svg'))
          .width(20)
          .height(20)
          .fillColor(Theme.textTertiary)
        TextInput({ text: this.searchQuery, placeholder: '搜索姓名/职务/职责' })
          .id('emergency-search-input')
          .width('100%')
          .height(40)
          .fontSize(14)
          .backgroundColor(Theme.pageBg)
          .borderRadius(Theme.radiusSmall)
          .onChange((value: string) => this.onSearchChange(value))
      }
      .width('100%')
      .height(48)
      .padding({ left: 12, right: 12 })
      .backgroundColor(Theme.cardBg)
      .borderRadius(Theme.radiusCard)
      .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })

      Button('添加联系人')
        .id('emergency-add-contact')
        .width('90%')
        .height(44)
        .fontSize(15)
        .fontColor('#FFFFFF')
        .backgroundColor(Theme.brandPrimary)
        .borderRadius(Theme.radiusButton)
        .onClick(() => this.onAddContact())

      if (this.contacts.length === 0) {
        EmptyStateView({ message: '暂无应急联系人', testId: 'emergency-empty-contact' })
      } else {
        List({ space: 8 }) {
          ForEach(this.contacts, (contact: EmergencyContact) => {
            ListItem() {
              this.ContactCard(contact)
            }
            .id(`emergency-contact-${contact.id}`)
          }, (contact: EmergencyContact) => contact.id)
        }
        .id('emergency-contact-list')
        .width('100%')
        .layoutWeight(1)
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  ContactCard(contact: EmergencyContact) {
    Row({ space: 12 }) {
      Column() {
        Text(contact.name[0])
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width(48)
      .height(48)
      .backgroundColor(Theme.brandPrimary)
      .borderRadius(24)
      .justifyContent(FlexAlign.Center)

      Column({ space: 4 }) {
        Text(contact.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`${contact.role} · ${contact.duty}`)
          .fontSize(13)
          .fontColor(Theme.textSecondary)
        Text(contact.phone)
          .fontSize(13)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Column() {
        Image($rawfile('icon_拨打该应急联系人电话.svg'))
          .width(24)
          .height(24)
          .fillColor('#FFFFFF')
      }
      .id(`emergency-contact-call-${contact.id}`)
      .width(40)
      .height(40)
      .backgroundColor(Theme.brandPrimary)
      .borderRadius(20)
      .justifyContent(FlexAlign.Center)
      .onClick(() => this.onDial(contact.phone))
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .alignItems(VerticalAlign.Center)
  }
}
