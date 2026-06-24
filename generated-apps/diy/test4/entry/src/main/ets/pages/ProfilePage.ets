import { AppController, AppState, MemberUpdateInput } from '../viewmodel/AppState';
import { Theme } from '../common/Theme';
import { Member, WorkPhoto } from '../models/Models';
import { promptAction } from '@kit.ArkUI';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

@Component
export struct ProfilePage {
  @ObjectLink state: AppState;
  @Prop ctrl: AppController;
  onBack: () => void = () => {};

  @State editing: boolean = false;
  @State draftName: string = '';
  @State draftPhone: string = '';
  @State draftBio: string = '';
  @State draftCrafts: string = '';

  build() {
    Column() {
      this.Header('会员档案')

      Scroll() {
        Column({ space: 16 }) {
          this.ProfileMemberView(this.state.currentMember())
        }
        .width('100%')
        .padding(Theme.pageHorizontalPadding)
        .constraintSize({ maxWidth: Theme.contentMaxWidth })
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
  Header(title: string) {
    Stack({ alignContent: Alignment.Center }) {
      Column()
        .width('100%')
        .height(56)
        .linearGradient({
          angle: 180,
          direction: GradientDirection.Bottom,
          colors: [[Theme.headerGradientStart, 0.0], [Theme.headerGradientEnd, 1.0]]
        })
        .borderRadius({ bottomLeft: 28, bottomRight: 28 })

      Row() {
        Button({ type: ButtonType.Circle }) {
          Text('<')
            .fontSize(18)
            .fontColor(Theme.textOnBrand)
        }
        .id('back-button')
        .width(40)
        .height(40)
        .backgroundColor('rgba(255,255,255,0.16)')
        .onClick(() => this.onBack())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)

      Text(title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnBrand)
    }
    .width('100%')
    .height(56)
  }

  @Builder
  ProfileMemberView(m: Member | null) {
    if (m) {
      Column({ space: 12 }) {
        Column() {
          Text(m.name.slice(0, 1))
            .id('profile-avatar')
            .fontSize(32)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textOnBrand)
        }
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(Theme.brandPrimary)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        Text(m.name)
          .id('profile-name')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)

        Text(`${this.ctrl.state.levelName(m.id)} · ${m.points} 积分`)
          .id('profile-points-level')
          .fontSize(14)
          .fontColor(Theme.textSecondary)

        if (this.editing) {
          this.EditForm()
        } else {
          this.ReadOnlyProfile(m)
        }
      }
      .width('100%')
      .padding(20)
      .borderRadius(Theme.radiusCard)
      .backgroundColor(Theme.cardBg)
    } else {
      Column({ space: 8 }) {
        Text('尚未选择会员')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
      }
      .width('100%')
      .padding(32)
    }
  }

  @Builder
  ReadOnlyProfile(m: Member) {
    Column({ space: 16 }) {
      Column({ space: 8 }) {
        Text('擅长工艺')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
        Row({ space: 8 }) {
          ForEach(m.crafts, (craft: string, index: number) => {
            Text(craft)
              .id(`profile-craft-${index}`)
              .fontSize(13)
              .fontColor(Theme.brandPrimary)
              .backgroundColor(Theme.brandSoft)
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .borderRadius(10)
          }, (craft: string) => craft)
        }
        .id('profile-craft-tags')
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)

      Column({ space: 8 }) {
        Text('个人简介')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
        Text(m.bio.length > 0 ? m.bio : '暂无简介')
          .id('profile-bio')
          .fontSize(14)
          .fontColor(Theme.textPrimary)
          .width('100%')
      }
      .alignItems(HorizontalAlign.Start)

      Column({ space: 8 }) {
        Text('作品图集')
          .fontSize(13)
          .fontColor(Theme.textSecondary)
        if (this.state.currentWorks.length === 0) {
          Text('暂无作品照片')
            .id('profile-works-empty')
            .fontSize(14)
            .fontColor(Theme.textSecondary)
        } else {
          List() {
            ForEach(this.state.currentWorks, (w: WorkPhoto, index: number) => {
              ListItem() {
                Image(w.uri)
                  .id(`profile-work-${w.id}`)
                  .width(120)
                  .height(120)
                  .borderRadius(Theme.radiusSmall)
                  .objectFit(ImageFit.Cover)
              }
            }, (w: WorkPhoto) => w.id)
          }
          .id('profile-works-gallery')
          .listDirection(Axis.Horizontal)
          .height(130)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')

      Row({ space: 12 }) {
        Button('添加作品', { type: ButtonType.Normal })
          .id('profile-add-work-button')
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.brandSoft)
          .fontColor(Theme.brandPrimary)
          .onClick(() => this.pickPhoto())

        Button('编辑档案', { type: ButtonType.Normal })
          .id('profile-edit-button')
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.brandPrimary)
          .fontColor(Theme.textOnBrand)
          .onClick(() => this.startEdit())
      }
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  EditForm() {
    Column({ space: 12 }) {
      TextInput({ text: this.draftName, placeholder: '昵称' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.draftName = v)

      TextInput({ text: this.draftPhone, placeholder: '手机号' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.draftPhone = v)

      TextInput({ text: this.draftCrafts, placeholder: '擅长工艺，空格分隔' })
        .width('100%')
        .height(44)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.draftCrafts = v)

      TextArea({ text: this.draftBio, placeholder: '个人简介' })
        .width('100%')
        .height(80)
        .borderRadius(Theme.radiusSmall)
        .backgroundColor(Theme.pageBg)
        .onChange((v) => this.draftBio = v)

      Row({ space: 12 }) {
        Button('取消', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.borderDefault)
          .fontColor(Theme.textPrimary)
          .onClick(() => this.editing = false)

        Button('保存', { type: ButtonType.Normal })
          .layoutWeight(1)
          .height(44)
          .borderRadius(Theme.radiusSmall)
          .backgroundColor(Theme.brandPrimary)
          .fontColor(Theme.textOnBrand)
          .onClick(() => this.saveEdit())
      }
      .width('100%')
    }
    .width('100%')
  }

  private startEdit(): void {
    const m = this.state.currentMember();
    if (!m) return;
    this.draftName = m.name;
    this.draftPhone = m.phone;
    this.draftCrafts = m.crafts.join(' ');
    this.draftBio = m.bio;
    this.editing = true;
  }

  private saveEdit(): void {
    const m = this.state.currentMember();
    if (!m) return;
    const req = new MemberUpdateInput();
    req.id = m.id;
    req.name = this.draftName;
    req.phone = this.draftPhone;
    req.bio = this.draftBio;
    req.crafts = this.draftCrafts.split(/\s+/).filter(s => s.length > 0);
    this.ctrl.updateMember(req).then(() => {
      this.editing = false;
      promptAction.showToast({ message: '档案已保存' });
    });
  }

  private pickPhoto(): void {
    const options = new photoAccessHelper.PhotoSelectOptions();
    options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    options.maxSelectNumber = 1;
    const picker = new photoAccessHelper.PhotoViewPicker();
    picker.select(options).then((result: photoAccessHelper.PhotoSelectResult) => {
      const uri = result.photoUris[0];
      if (uri && this.state.currentMemberId.length > 0) {
        this.ctrl.addWorkPhoto(this.state.currentMemberId, uri).then(() => {
          promptAction.showToast({ message: '作品已添加' });
        });
      }
    });
  }
}
