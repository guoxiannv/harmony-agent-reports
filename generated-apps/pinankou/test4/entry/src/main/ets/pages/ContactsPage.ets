import { SafetyAppState } from '../viewmodels/SafetyAppState'
import { Ids } from '../common/Ids'
import { Theme } from '../common/Theme'
import { Contact, ContactGroup } from '../models/SafetyTypes'
import { groupLabel } from '../common/Formatters'

interface ContactsPageProps {
  state: SafetyAppState
  onAdd: () => void
  onEdit: (contactId: string) => void
  onCall: (contactId: string) => void
}

@Component
export struct ContactsPage {
  @ObjectLink state: SafetyAppState
  onAdd: () => void = () => {}
  onEdit: (contactId: string) => void = () => {}
  onCall: (contactId: string) => void = () => {}

  build() {
    Column({ space: 0 }) {
      this.Header()

      TextInput({ text: this.state.contactsFilter.query, placeholder: '搜索联系人' })
        .id(Ids.contactsSearchInput)
        .width('100%')
        .height(38)
        .margin({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 10 })
        .borderRadius(12)
        .backgroundColor(Theme.surfacePrimary)
        .onChange((value: string) => {
          this.state.contactsFilter.query = value
          this.state.applyContactFilter()
        })

      List({ space: 8 }) {
        ForEach(this.groupedContacts(), (group: GroupedContacts) => {
          ListItemGroup({ header: this.GroupHeader(group.group) }) {
            ForEach(group.contacts, (contact: Contact) => {
              ListItem() {
                this.ContactRow(contact)
              }
              .id(`contacts-item-${contact.id}`)
            }, (contact: Contact) => contact.id)
          }
        }, (group: GroupedContacts) => group.group)
      }
      .id(Ids.contactsList)
      .width('100%')
      .layoutWeight(1)
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  Header() {
    Row() {
      Text('应急联系人')
        .id(Ids.contactsHeaderTitle)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.brandDeep)
      Button('新增')
        .id(Ids.contactsAddButton)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')
        .height(34)
        .padding({ left: 14, right: 14 })
        .borderRadius(17)
        .backgroundColor(Theme.brandPrimary)
        .onClick(() => this.onAdd())
    }
    .width('100%')
    .height(56)
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  GroupHeader(group: ContactGroup) {
    Text(groupLabel(group))
      .fontSize(12)
      .fontWeight(FontWeight.Medium)
      .fontColor(Theme.brandDeep)
      .width('100%')
      .padding({ top: 8, bottom: 4 })
  }

  @Builder
  ContactRow(contact: Contact) {
    Row({ space: 12 }) {
      Column({ space: 2 }) {
        Text(contact.name)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(`${contact.role} · ${contact.phone}`)
          .fontSize(12)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Row({ space: 8 }) {
        Button('拨打')
          .id(`contacts-item-${contact.id}-call-button`)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FFFFFF')
          .height(30)
          .padding({ left: 12, right: 12 })
          .borderRadius(15)
          .backgroundColor(Theme.brandPrimary)
          .onClick(() => this.onCall(contact.id))

        Button('编辑')
          .id(`contacts-item-${contact.id}-edit-button`)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.brandPrimary)
          .height(30)
          .padding({ left: 12, right: 12 })
          .borderRadius(15)
          .backgroundColor(Theme.brandPale)
          .onClick(() => this.onEdit(contact.id))
      }
    }
    .width('100%')
    .padding(14)
    .borderRadius(14)
    .backgroundColor(Theme.surfacePrimary)
    .shadow({ radius: 2, color: 'rgba(15,23,42,0.04)', offsetY: 1 })
  }

  private groupedContacts(): GroupedContacts[] {
    let map: Map<ContactGroup, Contact[]> = new Map()
    this.state.contacts.forEach((c: Contact) => {
      let list: Contact[] = map.get(c.group) ?? []
      list.push(c)
      map.set(c.group, list)
    })
    let result: GroupedContacts[] = []
    map.forEach((contacts: Contact[], group: ContactGroup) => {
      result.push({ group, contacts })
    })
    return result
  }
}

interface GroupedContacts {
  group: ContactGroup
  contacts: Contact[]
}
