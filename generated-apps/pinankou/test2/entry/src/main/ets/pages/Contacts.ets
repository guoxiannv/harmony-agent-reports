// Contacts.ets — 应急联系人
import { promptAction } from '@kit.ArkUI';
import { Theme } from '../common/Theme';
import { DataStore } from '../services/DataStore';
import { PhoneService } from '../services/PhoneService';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState, SearchField, ChipBar } from '../components/CommonUi';
import { ContactItem, ContactGroup } from '../model/Types';

const GROUP_FILTERS: string[] = ['全部', '指挥', '抢险', '医疗', '消防', '其他'];
const ADD_GROUPS: string[] = ['指挥', '抢险', '医疗', '消防', '其他'];

@Component
export struct ContactsPage {
  @StorageLink('dataStore') store: DataStore = new DataStore();
  @State keyword: string = '';
  @State groupFilter: string = '全部';
  @State showAdd: boolean = false;
  @State newName: string = '';
  @State newPhone: string = '';
  @State newGroup: string = '抢险';

  private filtered(): ContactItem[] {
    const kw = this.keyword.trim();
    return this.store.contacts.filter(c => {
      if (this.groupFilter !== '全部' && c.group !== this.groupFilter) return false;
      if (kw.length > 0 && `${c.name} ${c.phone} ${c.role}`.indexOf(kw) < 0) return false;
      return true;
    });
  }

  build() {
    Column() {
      Row() {
        Text('应急联系人').fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        Blank()
        Button('+ 新增')
          .id('contacts-add-button')
          .type(ButtonType.Capsule)
          .backgroundColor(Theme.brandPrimary).fontColor(Theme.textOnBrand)
          .fontSize(13).height(34)
          .onClick(() => { this.showAdd = true; this.newName = ''; this.newPhone = ''; this.newGroup = '抢险'; })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 48, bottom: 8 })

      Column() {
        SearchField({
          value: this.keyword, placeholder: '搜索联系人 / 电话',
          onTextChange: (v: string) => this.keyword = v
        }).id('contacts-search-input')
        ChipBar({
          options: GROUP_FILTERS, selected: this.groupFilter,
          onSelect: (opt: string) => this.groupFilter = opt
        }).id('contacts-group-filter').margin({ top: 10 })
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 8 })

      Scroll() {
        Column() {
          if (this.filtered().length === 0) {
            EmptyState({
              icon: 'phone', title: '暂无应急联系人', hint: '维护紧急联系人，支持一键拨号',
              actionLabel: '新增联系人', onAction: () => { this.showAdd = true; }
            }).id('contacts-empty-state')
          } else {
            ForEach(this.filtered(), (c: ContactItem) => {
              Row() {
                Stack({ alignContent: Alignment.Center }) {
                  Text(c.name.substring(0, 1)).fontSize(18).fontWeight(FontWeight.Bold).fontColor(Theme.textOnBrand)
                }
                .width(44).height(44).borderRadius(22)
                .backgroundColor(c.isPrimary ? Theme.brandPrimary : Theme.brandAccent)

                Column() {
                  Row() {
                    Text(c.name).fontSize(15).fontWeight(FontWeight.Medium).fontColor(Theme.textPrimary)
                    if (c.isPrimary) {
                      Text('主联络').fontSize(10).fontColor(Theme.textOnBrand).backgroundColor(Theme.brandPrimary)
                        .borderRadius(Theme.radiusTiny).padding({ left: 5, right: 5 }).margin({ left: 6 })
                    }
                  }
                  Text(c.phone).fontSize(13).fontColor(Theme.textSecondary).margin({ top: 3 })
                  Row() {
                    Text(c.group).fontSize(11).fontColor(Theme.brandPrimary).backgroundColor(Theme.brandSoft)
                      .borderRadius(Theme.radiusChip).padding({ left: 8, right: 8, top: 2, bottom: 2 })
                    if (c.role.length > 0) {
                      Text(c.role).fontSize(11).fontColor(Theme.textTertiary).margin({ left: 6 })
                    }
                  }.margin({ top: 4 })
                }.alignItems(HorizontalAlign.Start).layoutWeight(1).margin({ left: 12 })

                Column() {
                  Stack({ alignContent: Alignment.Center }) {
                    SvgIcon({ variant: 'phone', iconSize: 20, color: Theme.textOnBrand, strokeWidth: 0 })
                  }
                  .id('contacts-call-button')
                  .width(40).height(40).borderRadius(20).backgroundColor(Theme.riskLow)
                  .onClick(() => PhoneService.call(c.phone))
                }
              }
              .id(`contact-item-${c.id}`)
              .width('100%').backgroundColor(Theme.cardBg).borderRadius(Theme.radiusCard).padding(14)
              .margin({ bottom: 10 })
            }, (c: ContactItem) => c.id)
          }
        }
        .width('100%')
        .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
      }
      .layoutWeight(1).scrollBar(BarState.Off).align(Alignment.Top)

      if (this.showAdd) {
        this.AddSheet()
      }
    }
    .width('100%').height('100%').backgroundColor(Theme.pageBg)
  }

  @Builder AddSheet() {
    Column() {
      Column() {
        Text('新增应急联系人').fontSize(16).fontWeight(FontWeight.Bold).fontColor(Theme.textPrimary)
        TextInput({ placeholder: '姓名', text: this.newName })
          .fontSize(14).backgroundColor(Theme.chipSoftBg).borderRadius(Theme.radiusSmall).height(44).margin({ top: 12 })
          .onChange((v: string) => this.newName = v)
        TextInput({ placeholder: '电话号码', text: this.newPhone })
          .fontSize(14).backgroundColor(Theme.chipSoftBg).borderRadius(Theme.radiusSmall).height(44).margin({ top: 8 })
          .type(InputType.PhoneNumber)
          .onChange((v: string) => this.newPhone = v)
        ChipBar({
          options: ADD_GROUPS, selected: this.newGroup,
          onSelect: (opt: string) => this.newGroup = opt
        }).margin({ top: 10 })
        Row() {
          Button('取消').type(ButtonType.Capsule).backgroundColor(Theme.chipSoftBg).fontColor(Theme.textSecondary)
            .fontSize(14).height(42).layoutWeight(1)
            .onClick(() => this.showAdd = false)
          Button('保存').type(ButtonType.Capsule).backgroundColor(Theme.brandPrimary).fontColor(Theme.textOnBrand)
            .fontSize(14).height(42).layoutWeight(1).margin({ left: 10 })
            .onClick(() => this.saveContact())
        }.width('100%').margin({ top: 16 })
      }
      .width('100%').backgroundColor(Theme.cardBg).borderRadius(Theme.radiusHero)
      .padding(20)
    }
    .width('100%').height('100%')
    .backgroundColor('rgba(10,55,60,0.45)')
    .justifyContent(FlexAlign.End)
    .padding({ left: 16, right: 16, bottom: 32 })
    .onClick(() => this.showAdd = false)
  }

  private saveContact(): void {
    if (this.newName.trim().length === 0 || this.newPhone.trim().length === 0) {
      promptAction.showToast({ message: '请填写姓名和电话' });
      return;
    }
    const primary = this.store.contacts.length === 0;
    this.store.addContact({
      name: this.newName.trim(), phone: this.newPhone.trim(),
      group: this.newGroup as ContactGroup, role: '', isPrimary: primary,
    });
    promptAction.showToast({ message: '已添加联系人' });
    this.showAdd = false;
  }
}
