import { AppController } from '../viewmodel/AppController';
import { Member, WorkImage, craftLabel, CraftTag, ALL_CRAFTS } from '../models/AppModels';
import { Theme } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { promptAction } from '@kit.ArkUI';

@Component
export struct MemberDetailPage {
  @ObjectLink ctrl: AppController;
  @Prop memberId: string;
  onBack: () => void = () => {};
  onEdit: () => void = () => {};
  onPointsHistory: () => void = () => {};
  onBookings: () => void = () => {};

  private get member(): Member | undefined {
    return this.ctrl.getMemberById(this.memberId);
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

          Text('会员详情')
            .fontSize(Theme.pageTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)

          Button('编辑')
            .id('member-detail-edit-button')
            .fontSize(14)
            .fontColor(Theme.terracotta)
            .backgroundColor(Color.Transparent)
            .onClick(() => this.onEdit())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ top: 12, bottom: 12 })

        if (this.member) {
          this.ProfileCard(this.member)
          this.StatsRow(this.member)
          this.ActionRow()
          this.CraftsSection(this.member)
          this.WorksSection(this.member)
        }
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }

  @Builder
  ProfileCard(member: Member) {
    Row({ space: 16 }) {
      if (member.avatarUri) {
        Image(member.avatarUri)
          .width(72)
          .height(72)
          .borderRadius(36)
          .objectFit(ImageFit.Cover)
      } else {
        Column() {
          SvgIcon({ variant: 'user', iconSize: 32, color: Theme.clayGray })
        }
        .width(72)
        .height(72)
        .backgroundColor(Theme.ricePaper)
        .borderRadius(36)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }

      Column({ space: 4 }) {
        Text(member.name)
          .fontSize(Theme.sectionTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Text(member.phone)
          .fontSize(Theme.bodySize)
          .fontColor(Theme.textTertiary)
        Text(`上次到店：${this.formatDate(member.lastVisitAt)}`)
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textQuaternary)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .shadow({ radius: 12, color: Theme.shadowNear })
    .margin({ bottom: 16 })
  }

  @Builder
  StatsRow(member: Member) {
    Row({ space: 12 }) {
      Column({ space: 4 }) {
        Text(`${member.pointsBalance}`)
          .id('member-detail-points-balance')
          .fontSize(Theme.statSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.caramel)
        Text('积分余额')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderDefault })
      .borderRadius(Theme.radiusCard)
      .alignItems(HorizontalAlign.Center)

      Column({ space: 4 }) {
        Text(`${this.ctrl.bookingsForMember(member.id).length}`)
          .fontSize(Theme.statSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.terracotta)
        Text('课程预约')
          .fontSize(Theme.captionSize)
          .fontColor(Theme.textTertiary)
      }
      .layoutWeight(1)
      .padding(16)
      .backgroundColor(Theme.cardBg)
      .border({ width: 1, color: Theme.borderDefault })
      .borderRadius(Theme.radiusCard)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .margin({ bottom: 16 })
  }

  @Builder
  ActionRow() {
    Row({ space: 12 }) {
      Button('签到')
        .id('member-detail-checkin-button')
        .layoutWeight(1)
        .height(44)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.textOnAccent)
        .backgroundColor(Theme.terracotta)
        .borderRadius(999)
        .shadow({ radius: 12, color: 'rgba(198,123,92,0.32)' })
        .onClick(() => this.checkin())

      Button('积分流水')
        .id('member-detail-points-history-button')
        .layoutWeight(1)
        .height(44)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.terracotta)
        .backgroundColor(Color.Transparent)
        .border({ width: 1.5, color: Theme.terracotta })
        .borderRadius(999)
        .onClick(() => this.onPointsHistory())
    }
    .width('100%')
    .margin({ bottom: 16 })
  }

  @Builder
  CraftsSection(member: Member) {
    Column({ space: 10 }) {
      Text('擅长工艺')
        .fontSize(Theme.sectionTitleSize)
        .fontColor(Theme.textPrimary)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Row({ space: 8 }) {
        ForEach(member.crafts, (craft: string) => {
          Text(craftLabel(craft))
            .fontSize(13)
            .fontColor(Theme.textOnAccent)
            .padding({ left: 14, right: 14, top: 8, bottom: 8 })
            .backgroundColor(Theme.terracotta)
            .borderRadius(999)
        }, (craft: string) => craft)
      }
      .id('member-detail-crafts-tags')
      .width('100%')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
    .margin({ bottom: 16 })
  }

  @Builder
  WorksSection(member: Member) {
    Column({ space: 10 }) {
      Row() {
        Text('作品图')
          .fontSize(Theme.sectionTitleSize)
          .fontColor(Theme.textPrimary)
          .fontWeight(FontWeight.Bold)
        Blank()
      }
      .width('100%')

      if (member.workImages.length === 0) {
        Column({ space: 6 }) {
          Text('暂无作品图')
            .fontSize(Theme.cardTitleSize)
            .fontColor(Theme.textPrimary)
            .fontWeight(FontWeight.Bold)
          Text('编辑会员档案可添加作品照片')
            .fontSize(Theme.captionSize)
            .fontColor(Theme.textTertiary)
        }
        .id('member-works-empty')
        .width('100%')
        .padding({ top: 40, bottom: 40 })
        .alignItems(HorizontalAlign.Center)
      } else {
        Grid() {
          ForEach(member.workImages, (work: WorkImage) => {
            GridItem() {
              Image(work.uri)
                .width('100%')
                .aspectRatio(1)
                .borderRadius(16)
                .objectFit(ImageFit.Cover)
            }
            .id(`member-work-${work.id}`)
          }, (work: WorkImage) => work.id)
        }
        .id('member-detail-works-grid')
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('100%')
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Theme.cardBg)
    .border({ width: 1, color: Theme.borderDefault })
    .borderRadius(Theme.radiusCard)
  }

  private async checkin(): Promise<void> {
    await this.ctrl.checkin(this.memberId);
    promptAction.showToast({ message: '签到成功，积分已到账' });
  }

  private formatDate(ts: number): string {
    if (!ts) {
      return '从未到店';
    }
    const d: Date = new Date(ts);
    return `${d.getFullYear()}/${(d.getMonth() + 1).toString().padStart(2, '0')}/${d.getDate().toString().padStart(2, '0')}`;
  }
}
