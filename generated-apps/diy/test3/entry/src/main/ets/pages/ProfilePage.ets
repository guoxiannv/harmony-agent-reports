// ProfilePage.ets — 会员档案(对齐 page-profile-page.html)
// 头像(泥板灰描边) + 昵称 + 等级标签 + 擅长工艺标签 + 作品图集(3列网格+上传入口) + 库存管理入口

import { Theme } from '../common/Theme';
import { TabId } from '../common/TabTypes';
import { SvgIcon } from '../common/SvgIcon';
import { EmptyState } from '../components/EmptyState';
import { DataStore } from '../services/DataStore';
import { Member, WorkImage } from '../model/Models';

@Component
export struct ProfilePage {
  @Prop @Watch('onRefreshTick') refreshTick: number = 0;
  goToTab: (tab: TabId) => void = () => {};
  openEdit: () => void = () => {};
  openInventory: () => void = () => {};
  openDormant: () => void = () => {};

  @State member: Member = DataStore.getCurrentMember();

  aboutToAppear(): void {
    this.load();
  }

  onRefreshTick(): void {
    this.load();
  }

  private load(): void {
    this.member = DataStore.getCurrentMember();
  }

  private get displayName(): string {
    return this.member.name.length > 0 ? this.member.name : '未设置昵称';
  }

  build() {
    Column() {
      // header
      Row() {
        Text('会员档案')
          .fontSize(Theme.fontDisplay)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.clay)
          .fontFamily('MaShan')
          .layoutWeight(1)
        Row() {
          SvgIcon({ variant: 'edit', iconSize: 20 })
        }
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Theme.cardLight)
        .border({ width: 1, color: Theme.borderDefault })
        .justifyContent(FlexAlign.Center)
        .id('profile-edit-button')
        .onClick(() => this.openEdit())
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 12 })
      .alignItems(VerticalAlign.Center)

      Scroll() {
        Column() {
          // 档案卡
          Column() {
            Row() {
              SvgIcon({ variant: 'avatar-large', iconSize: 44 })
            }
            .width(90)
            .height(90)
            .borderRadius(45)
            .backgroundColor(Theme.sand)
            .border({ width: 3, color: Theme.borderDefault })
            .justifyContent(FlexAlign.Center)
            .id('profile-avatar')

            Text(this.displayName)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.textPrimary)
              .margin({ top: 14 })
              .id('profile-name')

            Text(this.member.level)
              .fontSize(12)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.fire)
              .backgroundColor(Theme.fireSoftBg)
              .padding({ left: 12, right: 12, top: 4, bottom: 4 })
              .borderRadius(Theme.radiusChip)
              .margin({ top: 4 })
              .id('profile-level')
          }
          .width('100%')
          .padding(24)
          .backgroundColor(Theme.cardLight)
          .borderRadius(Theme.radiusHero)
          .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
          .alignItems(HorizontalAlign.Center)
          .margin({ left: 20, right: 20 })

          // 擅长工艺
          Text('擅长工艺')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 12 })

          if (this.member.crafts.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-crafts', title: '还没有添加擅长工艺' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('profile-crafts-empty')
          } else {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.member.crafts, (c: string, idx: number) => {
                Text(c)
                  .fontSize(13)
                  .fontColor(Theme.clay)
                  .backgroundColor(Theme.sand)
                  .border({ width: 1, color: Theme.yellow })
                  .borderRadius(Theme.radiusChip)
                  .padding({ left: 14, right: 14, top: 6, bottom: 6 })
                  .margin({ right: 8, bottom: 8 })
                  .id(`profile-craft-${idx}`)
              }, (c: string, idx: number) => `${c}-${idx}`)
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .id('profile-craft-tags')
          }

          // 作品图集
          Text('作品图集')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 12 })

          if (this.member.works.length === 0) {
            Column() {
              EmptyState({ icon: 'empty-works', title: '还没有上传作品', hint: '点下方 + 添加你的第一件作品' })
            }
            .width('100%')
            .padding({ left: 20, right: 20 })
            .backgroundColor(Theme.cardLight)
            .borderRadius(Theme.radiusCard)
            .id('profile-gallery-empty')
          }

          // 作品网格(3列, 末尾上传入口)
          Grid() {
            ForEach(this.member.works, (w: WorkImage, idx: number) => {
              GridItem() {
                this.WorkTile(w, idx)
              }
            }, (w: WorkImage) => w.id)
            GridItem() {
              this.AddWorkTile()
            }
          }
          .columnsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .padding({ left: 20, right: 20 })
          .margin({ top: this.member.works.length === 0 ? 0 : 0 })
          .id('profile-gallery')

          // 库存管理入口
          Row() {
            Row() {
              SvgIcon({ variant: 'inv-entry', iconSize: 20 })
            }
            .width(36)
            .height(36)
            .borderRadius(10)
            .backgroundColor(Theme.sand)
            .justifyContent(FlexAlign.Center)
            Text('库存管理')
              .fontSize(15)
              .fontWeight(FontWeight.Medium)
              .fontColor(Theme.textPrimary)
              .layoutWeight(1)
              .margin({ left: 12 })
            SvgIcon({ variant: 'inv-arrow', iconSize: 18 })
          }
          .width('100%')
          .padding({ left: 18, right: 18, top: 16, bottom: 16 })
          .backgroundColor(Theme.cardLight)
          .borderRadius(Theme.radiusCard)
          .shadow({ radius: 24, color: Theme.shadowColor, offsetY: 8 })
          .margin({ left: 20, right: 20, top: 24 })
          .alignItems(VerticalAlign.Center)
          .id('profile-inventory-button')
          .onClick(() => this.openInventory())

          Blank().height(12)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  WorkTile(w: WorkImage, idx: number) {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        SvgIcon({ variant: 'work-image', iconSize: 28 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Theme.cardBg)
      .borderRadius(16)
      .justifyContent(FlexAlign.Center)
      Text(w.title)
        .fontSize(11)
        .fontColor(Theme.textTertiary)
        .margin({ bottom: 6 })
    }
    .height(110)
    .borderRadius(16)
    .id(`profile-work-${idx}`)
  }

  @Builder
  AddWorkTile() {
    Column() {
      SvgIcon({ variant: 'add-work', iconSize: 28 })
    }
    .height(110)
    .borderRadius(16)
    .border({ width: 2, color: Theme.borderDefault })
    .backgroundColor(Theme.cardLight)
    .justifyContent(FlexAlign.Center)
    .onClick(() => this.openEdit())
  }
}
