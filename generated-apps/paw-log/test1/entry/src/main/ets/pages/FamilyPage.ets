import { AppState, AppViewModel } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme, BrandGradient } from '../common/Theme'
import { SvgIcon } from '../common/SvgIcon'
import { FamilyGroup, FamilyMember } from '../models/Family'

interface FamilyPageProps {
  state: AppState
  vm: AppViewModel
  onBack: () => void
  onOpenInvite: () => void
}

@Component
export struct FamilyPage {
  @ObjectLink state: AppState
  vm: AppViewModel = new AppViewModel(new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog")))
  onBack: () => void = () => {}
  onOpenInvite: () => void = () => {}

  private family(): FamilyGroup | null {
    return this.state.familyGroup
  }

  build() {
    Column({ space: 0 }) {
      Row() {
        Text('<')
          .fontSize(22)
          .fontColor(Theme.textSecondary)
          .onClick(() => this.onBack())
        Text('家庭成员')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({ top: 24, bottom: 24 })

      if (!this.family()) {
        Column({ space: 16 }) {
          Text('还没有家庭组')
            .id('family-empty')
            .fontSize(16)
            .fontColor(Theme.textTertiary)
          Button('创建家庭组')
            .id('family-create-button')
            .width('100%')
            .height(50)
            .backgroundColor(Theme.brandPrimary)
            .fontColor(Theme.textOnPrimary)
            .borderRadius(Theme.radiusButton)
            .onClick(() => {
              this.vm.createFamily('我的家庭')
              this.onOpenInvite()
            })
        }
        .width('100%')
        .padding({ top: 80, bottom: 80 })
      } else {
        Column({ space: 4 }) {
          Text('家庭组')
            .fontSize(13)
            .fontColor(Theme.textTertiary)
          Text(this.family()!.name)
            .id('family-group-name')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 20 })

        Button('邀请成员')
          .id('family-invite-button')
          .width('100%')
          .height(50)
          .backgroundColor(Theme.brandPrimary)
          .fontColor(Theme.textOnPrimary)
          .borderRadius(Theme.radiusButton)
          .margin({ bottom: 20 })
          .onClick(() => this.onOpenInvite())

        Text('成员列表')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .width('100%')
          .margin({ bottom: 12 })

        List({ space: 12 }) {
          ForEach(this.family()!.members, (member: FamilyMember) => {
            ListItem() {
              Row({ space: 12 }) {
                Column() {
                  SvgIcon({ variant: 'avatar-1', iconSize: 24 })
                }
                .width(44)
                .height(44)
                .borderRadius(22)
                .linearGradient(BrandGradient.avatar)
                .justifyContent(FlexAlign.Center)

                Column({ space: 2 }) {
                  Text(member.nickname)
                    .fontSize(15)
                    .fontWeight(FontWeight.Medium)
                    .fontColor(Theme.textSecondary)
                  Text(member.role === 'owner' ? '创建者' : '成员')
                    .fontSize(12)
                    .fontColor(Theme.textTertiary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .id(`family-member-${member.id}`)
              .width('100%')
              .padding(14)
              .backgroundColor(Theme.cardBg)
              .borderRadius(16)
            }
          }, (member: FamilyMember) => member.id)
        }
        .id('family-member-list')
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Off)
      }
    }
    .id('family-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }
}

