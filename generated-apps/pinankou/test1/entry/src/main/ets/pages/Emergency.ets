// Emergency.ets - emergency contacts surface (emergency-page).
//
// Semantic targets:
//   emergency-add-button, emergency-list, emergency-empty-state,
//   emergency-contact-{id}, emergency-contact-{id}-call/-sms/-edit
import { AppController } from '../controller/AppController';
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { EmergencyContact } from '../model/Types';

@Component
export struct EmergencyPage {
  controller: AppController;

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        this.TopBar()
        this.TipBanner()
        if (this.controller.contacts.length === 0) {
          this.EmptyState()
        } else {
          this.ListArea()
        }
      }
      .width('100%')
      .height('100%')

      this.Fab()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TopBar() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 20, color: Theme.slate600 })
      }
      .width(40)
      .height(40)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.navigateBack())

      Text('应急联系人')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.slate900)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Column() {
        SvgIcon({ variant: 'add-contact', iconSize: 22, color: '#FFFFFF' })
      }
      .id('emergency-add-button')
      .width(40)
      .height(40)
      .borderRadius(12)
      .linearGradient(BrandGradient.riskHigh)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .onClick(() => this.controller.openContactForm(''))
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 14, bottom: 14 })
    .backgroundColor('rgba(255,255,255,0.82)')
    .border({ width: { bottom: 1 }, color: { bottom: 'rgba(226,232,240,0.5)' } })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  TipBanner() {
    Row() {
      SvgIcon({ variant: 'emergency-tip', iconSize: 16, color: '#B45309' })
      Text('紧急情况下请优先拨打 119/120，再联系下方人员')
        .fontSize(12)
        .fontColor('#B45309')
        .layoutWeight(1)
        .margin({ left: 8 })
    }
    .width('100%')
    .padding(12)
    .margin({ left: 16, right: 16, top: 12 })
    .borderRadius(Theme.radiusCard)
    .backgroundColor('rgba(254,243,199,0.7)')
    .border({ width: 1, color: 'rgba(245,158,11,0.3)' })
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  ListArea() {
    Scroll() {
      Column() {
        ForEach(this.controller.contacts, (c: EmergencyContact) => {
          Row() {
            Column() {
              Text(c.name.charAt(0))
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
            }
            .width(48)
            .height(48)
            .borderRadius(24)
            .linearGradient(BrandGradient.riskHigh)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)

            Column() {
              Row() {
                Text(c.name)
                  .fontSize(15)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(Theme.slate900)
                if (c.isPrimary) {
                  Text('首选')
                    .fontSize(10)
                    .fontColor(Theme.riskHigh)
                    .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                    .margin({ left: 8 })
                    .borderRadius(8)
                    .backgroundColor('rgba(254,226,226,0.7)')
                }
              }
              .alignItems(VerticalAlign.Center)
              Text(`${c.role} · ${c.phone}`)
                .fontSize(12)
                .fontColor(Theme.slate400)
                .margin({ top: 4 })
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)

            Row() {
              this.ActionIcon(`emergency-contact-${c.id}-call`, 'call', BrandGradient.doneGreen,
                () => this.controller.callContact(c.id))
              this.ActionIcon(`emergency-contact-${c.id}-sms`, 'sms', BrandGradient.riskLow,
                () => this.controller.smsContact(c.id))
              this.ActionIcon(`emergency-contact-${c.id}-edit`, 'edit', BrandGradient.quickTeal,
                () => this.controller.editContact(c.id))
            }
            .alignItems(VerticalAlign.Center)
          }
          .id(`emergency-contact-${c.id}`)
          .width('100%')
          .padding(14)
          .borderRadius(Theme.radiusCard)
          .backgroundColor(Theme.cardBg)
          .border({ width: 1, color: Theme.borderHairline })
          .margin({ left: 16, right: 16, bottom: 10 })
          .alignItems(VerticalAlign.Center)
        }, (c: EmergencyContact) => c.id)
      }
      .width('100%')
      .padding({ top: 8, bottom: 80 })
      .alignItems(HorizontalAlign.Center)
    }
    .id('emergency-list')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
  }

  @Builder
  ActionIcon(sid: string, icon: string, grad: LinearGradient, onTap: () => void) {
    Column() {
      SvgIcon({ variant: icon, iconSize: 16, color: '#FFFFFF' })
    }
    .id(sid)
    .width(34)
    .height(34)
    .borderRadius(17)
    .linearGradient(grad)
    .margin({ left: 6 })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => onTap())
  }

  @Builder
  EmptyState() {
    Column() {
      SvgIcon({ variant: 'empty-contacts', iconSize: 44, color: Theme.riskHigh })
      Text('暂无应急联系人')
        .fontSize(15)
        .fontColor(Theme.slate600)
        .margin({ top: 12 })
      Text('添加应急联系人以便一键求助')
        .fontSize(13)
        .fontColor(Theme.slate400)
        .margin({ top: 4 })
      Text('添加联系人')
        .fontSize(14)
        .fontColor('#FFFFFF')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .margin({ top: 14 })
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.riskHigh)
        .onClick(() => this.controller.openContactForm(''))
    }
    .id('emergency-empty-state')
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Fab() {
    Column() {
      SvgIcon({ variant: 'fab-contact', iconSize: 24, color: '#FFFFFF' })
    }
    .width(58)
    .height(58)
    .borderRadius(29)
    .linearGradient(BrandGradient.riskHigh)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({ right: 20, bottom: 24 })
    .shadow({ radius: 16, color: 'rgba(239,68,68,0.4)', offsetY: 6 })
    .onClick(() => this.controller.openContactForm(''))
  }
}
