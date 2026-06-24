import { AppState } from '../viewmodel/AppViewModel'
import { Repository } from '../service/Repository'
import { JsonPreferenceStore } from '../service/Store'
import { Theme, BrandGradient } from '../common/Theme'
import { SvgIcon } from '../common/SvgIcon'
import { Pet } from '../models/Pet'

interface PetsPageProps {
  state: AppState
  repository: Repository
  onBack: () => void
  onOpenPetEditor: (petId?: string) => void
  onNavigatePetDetail: (petId: string) => void
}

@Component
export struct PetsPage {
  @ObjectLink state: AppState
  repository: Repository = new Repository(new JsonPreferenceStore(getContext(this) as Context, "pawlog"))
  onBack: () => void = () => {}
  onOpenPetEditor: (petId?: string) => void = () => {}
  onNavigatePetDetail: (petId: string) => void = () => {}

  private latestWeight(petId: string): string {
    const w: number | null = this.repository.latestWeight(petId)
    return w !== null ? `${w.toFixed(1)}kg` : '未记录'
  }

  build() {
    Column({ space: 0 }) {
      Row() {
        Text('宠物档案')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)

        Button('添加')
          .id('pets-add-button')
          .fontSize(14)
          .fontColor(Theme.brandPrimary)
          .backgroundColor(Theme.brandSoft)
          .height(36)
          .padding({ left: 16, right: 16 })
          .borderRadius(18)
          .onClick(() => this.onOpenPetEditor())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .margin({ top: 24, bottom: 16 })

      List({ space: 12 }) {
        if (this.state.pets.length === 0) {
          ListItem() {
            Text('还没有宠物，点击右上角添加')
              .id('pets-empty')
              .fontSize(14)
              .fontColor(Theme.textTertiary)
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding({ top: 60, bottom: 60 })
          }
        } else {
          ForEach(this.state.pets, (pet: Pet, index: number) => {
            ListItem() {
              Row({ space: 14 }) {
                Column() {
                  SvgIcon({ variant: index % 2 === 0 ? 'avatar-1' : 'avatar-2', iconSize: 28 })
                }
                .width(60)
                .height(60)
                .borderRadius(30)
                .linearGradient(BrandGradient.avatar)
                .justifyContent(FlexAlign.Center)

                Column({ space: 4 }) {
                  Text(pet.name)
                    .fontSize(17)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Theme.textPrimary)
                  Text(`${pet.species || ''} ${pet.breed || ''}`.trim() || '未知品种')
                    .fontSize(13)
                    .fontColor(Theme.textTertiary)
                  Text(`最近体重 ${this.latestWeight(pet.id)}`)
                    .fontSize(12)
                    .fontColor(Theme.brandPrimary)
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)

                Text('>')
                  .fontSize(16)
                  .fontColor(Theme.textQuaternary)
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Theme.cardBg)
              .borderRadius(Theme.radiusCard)
              .shadow({ radius: 12, color: 'rgba(15,23,42,0.06)', offsetY: 3 })
            }
            .id(`pets-card-${pet.id}`)
            .onClick(() => this.onNavigatePetDetail(pet.id))
          }, (pet: Pet) => pet.id)
        }
      }
      .id('pets-list')
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .id('pets-page')
    .width('100%')
    .height('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding })
    .constraintSize({ maxWidth: Theme.contentMaxWidth })
    .backgroundColor(Theme.pageBg)
  }
}
