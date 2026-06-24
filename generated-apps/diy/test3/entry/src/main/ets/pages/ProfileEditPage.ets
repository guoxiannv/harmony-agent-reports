// ProfileEditPage.ets — 编辑档案(对齐 page-profile-edit-page.html)
// 昵称输入 + 工艺添加行(输入+加号)+ 可删除标签 + 作品图集(删除+上传入口) + 底部保存

import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { PageHeader } from '../components/PageHeader';
import { DataStore } from '../services/DataStore';
import { WorkImage, OpResult } from '../model/Models';

@Component
export struct ProfileEditPage {
  onBack: () => void = () => {};

  @State name: string = '';
  @State crafts: string[] = [];
  @State works: WorkImage[] = [];
  @State newCraft: string = '';
  @State feedback: string = '';

  aboutToAppear(): void {
    const m = DataStore.getCurrentMember();
    this.name = m.name;
    this.crafts = m.crafts.slice();
    this.works = m.works.slice();
  }

  private addCraft(): void {
    const v = this.newCraft.trim();
    if (v.length === 0) {
      this.feedback = '工艺名称不能为空';
      setTimeout(() => { this.feedback = ''; }, 2000);
      return;
    }
    if (this.crafts.indexOf(v) >= 0) {
      this.feedback = '该工艺已添加';
      setTimeout(() => { this.feedback = ''; }, 2000);
      return;
    }
    this.crafts.push(v);
    this.newCraft = '';
  }

  private removeCraft(idx: number): void {
    this.crafts.splice(idx, 1);
  }

  private addWork(): void {
    // 无 rawfile 图片库接入，使用沙箱占位记录(作品图占位)
    const r: OpResult = DataStore.addWork('', `作品 ${this.works.length + 1}`);
    this.feedback = r.message;
    this.works = DataStore.getCurrentMember().works.slice();
    setTimeout(() => { this.feedback = ''; }, 2000);
  }

  private removeWork(id: string): void {
    DataStore.removeWork(id);
    this.works = DataStore.getCurrentMember().works.slice();
  }

  private save(): void {
    DataStore.saveName(this.name.trim());
    // 同步工艺(覆盖式)
    const cur = DataStore.getCurrentMember();
    for (const c of cur.crafts) {
      DataStore.removeCraft(c);
    }
    for (const c of this.crafts) {
      DataStore.addCraft(c);
    }
    this.feedback = '档案已保存';
    setTimeout(() => { this.onBack(); }, 600);
  }

  build() {
    Column() {
      PageHeader({ title: '编辑档案', onBack: () => this.onBack() })

      Scroll() {
        Column() {
          Text('基本信息')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, bottom: 10 })

          Column() {
            Text('昵称')
              .fontSize(13)
              .fontColor(Theme.textSecondary)
              .alignSelf(ItemAlign.Start)
            TextInput({ text: this.name, placeholder: '输入你的昵称' })
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .backgroundColor(Theme.cardLight)
              .borderRadius(16)
              .border({ width: 1, color: Theme.borderDefault })
              .padding({ left: 16, right: 16 })
              .height(50)
              .margin({ top: 6 })
              .onChange((v: string) => this.name = v)
              .id('profile-edit-name-input')
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .padding({ left: 20, right: 20 })

          Text('擅长工艺')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 10 })

          // 添加行
          Row() {
            TextInput({ text: this.newCraft, placeholder: '例如：拉坯、釉下彩' })
              .fontSize(15)
              .fontColor(Theme.textPrimary)
              .backgroundColor(Theme.cardLight)
              .borderRadius(16)
              .border({ width: 1, color: Theme.borderDefault })
              .padding({ left: 16, right: 16 })
              .height(48)
              .layoutWeight(1)
              .onChange((v: string) => this.newCraft = v)
              .id('profile-edit-craft-input')
            Column() {
              SvgIcon({ variant: 'add-craft', iconSize: 20 })
            }
            .width(48)
            .height(48)
            .borderRadius(14)
            .backgroundColor(Theme.clay)
            .justifyContent(FlexAlign.Center)
            .margin({ left: 10 })
            .id('profile-edit-add-craft')
            .onClick(() => this.addCraft())
          }
          .width('100%')
          .padding({ left: 20, right: 20 })
          .alignItems(VerticalAlign.Center)

          // 已添加工艺
          if (this.crafts.length > 0) {
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(this.crafts, (c: string, idx: number) => {
                Row() {
                  Text(c)
                    .fontSize(13)
                    .fontColor(Theme.clay)
                  Text('×')
                    .fontSize(15)
                    .fontColor(Theme.red)
                    .margin({ left: 6 })
                    .padding({ left: 5, right: 5 })
                    .backgroundColor('rgba(184,74,61,0.12)')
                    .borderRadius(8)
                    .id(`profile-edit-craft-${idx}-remove`)
                    .onClick(() => this.removeCraft(idx))
                }
                .padding({ left: 12, right: 12, top: 6, bottom: 6 })
                .backgroundColor(Theme.sand)
                .border({ width: 1, color: Theme.yellow })
                .borderRadius(Theme.radiusChip)
                .margin({ right: 8, bottom: 8 })
                .alignItems(VerticalAlign.Center)
                .id(`profile-edit-craft-${idx}`)
              }, (c: string, idx: number) => `${c}-${idx}`)
            }
            .width('100%')
            .padding({ left: 20, right: 20, top: 12 })
            .id('profile-edit-craft-list')
          }

          Text('作品图集')
            .fontSize(Theme.fontTitle)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.clay)
            .fontFamily('MaShan')
            .width('100%')
            .padding({ left: 20, right: 20, top: 24, bottom: 10 })

          Grid() {
            ForEach(this.works, (w: WorkImage, idx: number) => {
              GridItem() {
                this.WorkEditTile(w, idx)
              }
            }, (w: WorkImage) => w.id)
            GridItem() {
              this.AddWorkEditTile()
            }
          }
          .columnsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .padding({ left: 20, right: 20 })
          .id('profile-edit-work-list')

          if (this.feedback.length > 0) {
            Text(this.feedback)
              .fontSize(13)
              .fontColor(this.feedback.indexOf('保存') >= 0 ? Theme.green : Theme.red)
              .margin({ top: 16, left: 20 })
          }
          Blank().height(90)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.Top)

      // 底部保存
      Button() {
        Text('保存修改')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnClay)
      }
      .type(ButtonType.Capsule)
      .width('100%')
      .height(54)
      .backgroundColor(Theme.fire)
      .shadow({ radius: 12, color: 'rgba(229,122,57,0.28)', offsetY: 4 })
      .margin({ left: 20, right: 20, bottom: 24 })
      .id('profile-edit-save')
      .onClick(() => this.save())
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  WorkEditTile(w: WorkImage, idx: number) {
    Stack({ alignContent: Alignment.TopEnd }) {
      Column() {
        SvgIcon({ variant: 'work-image', iconSize: 28 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Theme.cardBg)
      .borderRadius(16)
      .justifyContent(FlexAlign.Center)

      Text('×')
        .fontSize(13)
        .fontColor('#FFFFFF')
        .width(22)
        .height(22)
        .borderRadius(11)
        .backgroundColor(Theme.red)
        .textAlign(TextAlign.Center)
        .margin({ top: 6, right: 6 })
        .id(`profile-edit-work-${idx}-remove`)
        .onClick(() => this.removeWork(w.id))
    }
    .height(110)
    .borderRadius(16)
    .id(`profile-edit-work-${idx}`)
  }

  @Builder
  AddWorkEditTile() {
    Column() {
      SvgIcon({ variant: 'upload-work', iconSize: 28 })
    }
    .height(110)
    .borderRadius(16)
    .border({ width: 2, color: Theme.borderDefault })
    .backgroundColor(Theme.cardLight)
    .justifyContent(FlexAlign.Center)
    .id('profile-edit-add-work')
    .onClick(() => this.addWork())
  }
}
