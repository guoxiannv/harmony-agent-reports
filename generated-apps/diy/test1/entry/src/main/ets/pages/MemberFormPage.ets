import { AppController } from '../viewmodel/AppController';
import { Member, craftLabel, CraftTag, ALL_CRAFTS, WorkImage } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { PhotoPickerService } from '../services/PhotoPickerService';
import { promptAction } from '@kit.ArkUI';

@Component
export struct MemberFormPage {
  @ObjectLink ctrl: AppController;
  @Prop memberId: string;
  onBack: () => void = () => {};
  onSaved: () => void = () => {};
  @State name: string = '';
  @State phone: string = '';
  @State crafts: string[] = [];
  @State avatarUri: string = '';
  @State works: WorkImage[] = [];
  @State showDelete: boolean = false;
  private picker: PhotoPickerService = new PhotoPickerService();

  aboutToAppear(): void {
    const m: Member | undefined = this.ctrl.getMemberById(this.memberId);
    if (m) {
      this.name = m.name;
      this.phone = m.phone;
      this.crafts = m.crafts.slice();
      this.avatarUri = m.avatarUri;
      this.works = m.workImages.map((w: WorkImage) => {
        const copy: WorkImage = new WorkImage();
        copy.id = w.id;
        copy.uri = w.uri;
        copy.caption = w.caption;
        return copy;
      });
    }
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // Header
        Row() {
          Button() {
            SvgIcon({ variant: 'back', iconSize: 22, color: Theme.textPrimary })
          }
          .width(40)
          .height(40)
          .backgroundColor(Color.Transparent)
          .onClick(() => this.onBack())

          Text(this.memberId ? '编辑会员' : '新增会员')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)

          if (this.memberId) {
            Button() {
              SvgIcon({ variant: 'trash', iconSize: 20, color: Theme.rust })
            }
            .id('member-form-delete-button')
            .width(40)
            .height(40)
            .backgroundColor(Color.Transparent)
            .onClick(() => this.showDelete = true)
          } else {
            Blank().width(40)
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        // Avatar
        Column({ space: 8 }) {
          if (this.avatarUri) {
            Image(this.avatarUri)
              .width(88)
              .height(88)
              .borderRadius(44)
              .objectFit(ImageFit.Cover)
          } else {
            Column() {
              SvgIcon({ variant: 'camera', iconSize: 28, color: Theme.clayGray })
            }
            .width(88)
            .height(88)
            .backgroundColor(Theme.inputBg)
            .borderRadius(44)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }
          Text('点击更换头像')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .id('member-form-avatar-picker')
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .margin({ bottom: 20 })
        .onClick(async () => {
          const uri: string = await this.picker.pickAvatar(getContext(this) as Context);
          if (uri) {
            this.avatarUri = uri;
          }
        })

        // Name
        Text('姓名')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 6 })
        TextInput({ placeholder: '请输入会员姓名', text: this.name })
          .id('member-form-name-input')
          .width('100%')
          .height(48)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 16 })
          .onChange((value: string) => this.name = value)

        // Phone
        Text('手机号')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 6 })
        TextInput({ placeholder: '请输入手机号', text: this.phone })
          .id('member-form-phone-input')
          .width('100%')
          .height(48)
          .backgroundColor(Theme.inputBg)
          .borderRadius(Theme.radiusSmall)
          .placeholderColor(Theme.textPlaceholder)
          .fontSize(Theme.bodySize)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 16 })
          .onChange((value: string) => this.phone = value)

        // Crafts
        Text('擅长工艺')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 10 })
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          ForEach(ALL_CRAFTS, (craft: CraftTag) => {
            Text(craftLabel(craft))
              .fontSize(13)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.crafts.includes(craft) ? Theme.textOnAccent : Theme.textSecondary)
              .padding({ left: 14, right: 14, top: 8, bottom: 8 })
              .backgroundColor(this.crafts.includes(craft) ? Theme.terracotta : Theme.chipSoftBg)
              .borderRadius(999)
              .margin({ right: 8, bottom: 8 })
              .onClick(() => this.toggleCraft(craft))
          }, (craft: CraftTag) => craft)
        }
        .id('member-form-crafts-selector')
        .width('100%')
        .margin({ bottom: 20 })

        // Works
        Text('作品图')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
          .width('100%')
          .margin({ bottom: 10 })
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
          ForEach(this.works, (work: WorkImage) => {
            Stack({ alignContent: Alignment.TopEnd }) {
              Image(work.uri)
                .width(80)
                .height(80)
                .borderRadius(12)
                .objectFit(ImageFit.Cover)
              Button() {
                SvgIcon({ variant: 'trash', iconSize: 12, color: Theme.cardBg })
              }
              .width(20)
              .height(20)
              .backgroundColor(Theme.rust)
              .borderRadius(10)
              .margin(4)
              .onClick(() => this.removeWork(work.id))
            }
            .margin({ right: 10, bottom: 10 })
          }, (work: WorkImage) => work.id)

          Column() {
            SvgIcon({ variant: 'camera', iconSize: 24, color: Theme.clayGray })
          }
          .id('member-form-works-picker')
          .width(80)
          .height(80)
          .backgroundColor(Theme.inputBg)
          .border({ width: 2, color: Theme.sand, style: BorderStyle.Dashed })
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick(async () => {
            const uris: string[] = await this.picker.pickWorks(getContext(this) as Context, 5);
            for (const uri of uris) {
              const w: WorkImage = new WorkImage();
              w.id = `${Date.now()}_${Math.random()}`;
              w.uri = uri;
              this.works.push(w);
            }
          })
        }
        .width('100%')
        .margin({ bottom: 32 })

        // Save
        Button('保存')
          .id('member-form-save-button')
          .width('100%')
          .height(48)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(this.canSave() ? Theme.terracotta : Theme.sand)
          .borderRadius(999)
          .shadow({ radius: 12, color: 'rgba(198,123,92,0.32)' })
          .enabled(this.canSave())
          .onClick(() => this.save())
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .bindSheet(
      this.showDelete,
      this.DeleteSheet(),
      {
        height: SheetSize.FIT_CONTENT,
        onWillDisappear: () => this.showDelete = false,
      }
    )
  }

  @Builder
  DeleteSheet() {
    Column({ space: 16 }) {
      Text('确认删除会员？')
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
      Text('删除后无法恢复，相关积分流水也将被移除')
        .fontSize(Theme.captionSize)
        .fontColor(Theme.textTertiary)
      Row({ space: 12 }) {
        Button('取消')
          .layoutWeight(1)
          .height(44)
          .fontSize(15)
          .fontColor(Theme.terracotta)
          .backgroundColor(Color.Transparent)
          .border({ width: 1.5, color: Theme.terracotta })
          .borderRadius(999)
          .onClick(() => this.showDelete = false)
        Button('删除')
          .layoutWeight(1)
          .height(44)
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textOnAccent)
          .backgroundColor(Theme.rust)
          .borderRadius(999)
          .onClick(async () => {
            this.showDelete = false;
            await this.ctrl.deleteMember(this.memberId);
            this.onSaved();
          })
      }
      .width('100%')
    }
    .width('100%')
    .padding(24)
  }

  private toggleCraft(craft: CraftTag): void {
    if (this.crafts.includes(craft)) {
      this.crafts = this.crafts.filter((c: string) => c !== craft);
    } else {
      this.crafts.push(craft);
    }
  }

  private removeWork(id: string): void {
    this.works = this.works.filter((w: WorkImage) => w.id !== id);
  }

  private canSave(): boolean {
    return this.name.trim().length > 0;
  }

  private async save(): Promise<void> {
    if (!this.canSave()) {
      return;
    }
    let m: Member | undefined = this.ctrl.getMemberById(this.memberId);
    if (!m) {
      m = new Member();
    }
    m.name = this.name.trim();
    m.phone = this.phone.trim();
    m.crafts = this.crafts.slice();
    m.avatarUri = this.avatarUri;
    m.workImages = this.works.slice();
    await this.ctrl.upsertMember(m);
    promptAction.showToast({ message: '保存成功' });
    this.onSaved();
  }
}
