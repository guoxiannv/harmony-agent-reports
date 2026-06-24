// 手作·印记 — 会员详情 / MemberDetail surface.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { SectionHeader } from '../components/Widgets';
import { AppStore } from '../services/AppStore';
import { ReminderService } from '../services/ReminderService';
import { Ui } from '../common/Ui';
import { Member, Course, Booking, KEY_MEMBERS, KEY_BOOKINGS, KEY_COURSES } from '../common/Models';
import { TimeUtil } from '../common/Util';
import { NavOpen } from './Index';

interface BookedCourse {
  id: string;
  title: string;
  startLabel: string;
  timeLabel: string;
}

@Component
export struct MemberDetailPage {
  @Prop memberId: string;
  @StorageLink(KEY_MEMBERS) membersLink: Member[] = [];
  @StorageLink(KEY_BOOKINGS) bookingsLink: Booking[] = [];
  @StorageLink(KEY_COURSES) coursesLink: Course[] = [];
  onOpen: (req: NavOpen) => void = () => {};
  onBack: () => void = () => {};

  build() {
    Scroll() {
      Column() {
        this.TopNav()
        this.Header()
        this.InfoCard()
        this.Actions()
        this.BookedCourses()
        this.WorksGrid()
        Column().height(40)
      }
      .width('100%')
      .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, bottom: 40 })
    }
    .layoutWeight(1)
    .scrollBar(BarState.Off)
    .backgroundColor(Theme.pageBg)
  }

  @Builder
  TopNav() {
    Row() {
      Row() {
        SvgIcon({ variant: 'back', iconSize: 22 })
      }
      .width(40)
      .height(40)
      .borderRadius(Theme.radiusPill)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('member-detail-back-button')
      .onClick(() => this.onBack())

      Text('会员详情')
        .fontSize(Theme.fontTopNav)
        .fontWeight(FontWeight.Medium)
        .fontColor(Theme.textTitle)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)

      Column().width(40)
    }
    .width('100%')
    .padding({ top: 10, bottom: 6 })
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  Header() {
    Column() {
      Text(this.member()?.name ?? '')
        .fontSize(Theme.fontPageTitle)
        .fontColor(Theme.textTitle)
        .id('member-detail-name')
        .margin({ top: 6, bottom: 4 })
      Text(this.craftsLabel())
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textMuted)
        .id('member-detail-crafts')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  InfoCard() {
    Column() {
      Row() {
        this.Stat('积分余额', `${this.member()?.points ?? 0}`, Theme.brandPrimary)
        this.Stat('累计消费', `${this.member()?.totalSpend ?? 0}`, Theme.success)
        this.Stat('最近到店', this.lastVisitLabel(), Theme.textTitle)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      if ((this.member()?.allergy ?? '').length > 0 || (this.member()?.notes ?? '').length > 0) {
        Column() {
          if ((this.member()?.allergy ?? '').length > 0) {
            Text(`过敏/注意：${this.member()?.allergy}`)
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.danger)
              .margin({ top: 8 })
          }
          if ((this.member()?.notes ?? '').length > 0) {
            Text(this.member()?.notes ?? '')
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textBody)
              .margin({ top: 6 })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .margin({ top: 12 })
      }
    }
    .width('100%')
    .padding(18)
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
    .margin({ top: 14 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  Stat(label: string, value: string, color: string) {
    Column() {
      Text(value)
        .fontSize(Theme.fontBigNumberSmall)
        .fontWeight(FontWeight.Bold)
        .fontColor(color)
        .id(label === '积分余额' ? 'member-detail-points' : '')
      Text(label)
        .fontSize(Theme.fontCaption)
        .fontColor(Theme.textMuted)
        .margin({ top: 4 })
    }
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  Actions() {
    Column() {
      Row() {
        Column() {
          Row() {
            SvgIcon({ variant: 'edit', iconSize: 18 })
            Text('编辑')
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.brandPrimary)
              .margin({ left: 4 })
          }
        }
        .layoutWeight(1)
        .height(46)
        .borderRadius(Theme.radiusButton)
        .backgroundColor(Theme.cardBg)
        .border({ width: 1.5, color: Theme.brandSecondary })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .id('member-detail-edit-button')
        .onClick(() => this.onOpen({ target: 'member-edit', memberId: this.memberId }))
        .margin({ right: 6 })

        Column() {
          Row() {
            SvgIcon({ variant: 'checkin-white', iconSize: 18 })
            Text('签到')
              .fontSize(Theme.fontCaption)
              .fontColor(Theme.textOnBrand)
              .margin({ left: 4 })
          }
        }
        .layoutWeight(1)
        .height(46)
        .borderRadius(Theme.radiusButton)
        .linearGradient(BrandGradient.primary)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .id('member-detail-checkin-button')
        .onClick(() => this.doCheckin())
        .margin({ left: 6 })
      }
      .width('100%')
      .margin({ top: 14 })

      Row() {
        Text('唤醒沉睡会员')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.sleeping)
          .margin({ left: 6 })
      }
      .width('100%')
      .height(42)
      .margin({ top: 10 })
      .borderRadius(Theme.radiusButton)
      .backgroundColor(Theme.pageBg)
      .border({ width: 1, color: Theme.borderSoft })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .visibility(this.isSleeping() ? Visibility.Visible : Visibility.None)
      .onClick(() => this.doWake())

      Row() {
        SvgIcon({ variant: 'delete', iconSize: 16 })
        Text('删除会员')
          .fontSize(Theme.fontCaption)
          .fontColor(Theme.danger)
          .margin({ left: 4 })
      }
      .width('100%')
      .height(42)
      .margin({ top: 8 })
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('member-detail-delete-button')
      .onClick(() => this.doDelete())
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  BookedCourses() {
    SectionHeader({ text: '已预约课程', iconVariant: 'section-courses' })
    Column() {
      if (this.bookedCourses().length === 0) {
        Text('暂无预约课程')
          .fontSize(Theme.fontBody)
          .fontColor(Theme.textMuted)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 18, bottom: 18 })
          .id('member-empty-courses')
      } else {
        ForEach(this.bookedCourses(), (bc: BookedCourse) => {
          Row() {
            Text(bc.title.length > 0 ? bc.title.charAt(0) : '课')
              .width(36)
              .height(36)
              .borderRadius(18)
              .fontSize(Theme.fontBody)
              .fontColor(Theme.textOnBrand)
              .linearGradient(BrandGradient.primary)
              .textAlign(TextAlign.Center)
            Column() {
              Text(bc.title)
                .fontSize(Theme.fontCardTitle)
                .fontWeight(FontWeight.Medium)
                .fontColor(Theme.textTitle)
              Text(`${bc.startLabel} · ${bc.timeLabel}`)
                .fontSize(Theme.fontCaption)
                .fontColor(Theme.textMuted)
                .margin({ top: 2 })
            }
            .layoutWeight(1)
            .margin({ left: 14 })
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding({ top: 12, bottom: 12 })
          .border({ width: { bottom: 1 }, color: { bottom: Theme.cardDivider } })
          .id(`member-course-${bc.id}`)
        }, (bc: BookedCourse) => bc.id)
      }
    }
    .width('100%')
    .padding({ left: 18, right: 18, top: 4, bottom: 4 })
    .backgroundColor(Theme.cardBg)
    .borderRadius(Theme.radiusCard)
    .border({ width: 1, color: Theme.borderSoft })
    .shadow({ radius: 28, color: 'rgba(74,48,36,0.10)', offsetX: 0, offsetY: 10 })
  }

  @Builder
  WorksGrid() {
    SectionHeader({ text: '作品图墙', iconVariant: 'upload' })
    if (this.works().length === 0) {
      Text('还没有作品图')
        .fontSize(Theme.fontBody)
        .fontColor(Theme.textMuted)
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ top: 18, bottom: 18 })
        .id('member-empty-works')
    } else {
      Grid() {
        ForEach(this.works(), (img: string, idx: number) => {
          GridItem() {
            if (img.indexOf('placeholder:') === 0) {
              Column()
                .width('100%')
                .aspectRatio(1)
                .borderRadius(Theme.radiusInput)
                .linearGradient(BrandGradient.primary)
                .id(`member-work-${idx}`)
            } else {
              Image(img)
                .width('100%')
                .aspectRatio(1)
                .borderRadius(Theme.radiusInput)
                .objectFit(ImageFit.Cover)
                .border({ width: 1, color: Theme.borderSoft })
                .id(`member-work-${idx}`)
            }
          }
        }, (img: string, idx: number) => `${idx}-${img}`)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .padding({ left: 18, right: 18, top: 4, bottom: 12 })
    }
  }

  private member(): Member | null {
    return AppStore.get().getMember(this.memberId);
  }

  private craftsLabel(): string {
    const m = this.member();
    if (m === null) {
      return '';
    }
    if (m.crafts.length === 0) {
      return m.nickname.length > 0 ? m.nickname : '';
    }
    return m.crafts.join(' · ');
  }

  private lastVisitLabel(): string {
    const m = this.member();
    if (m === null || m.lastVisitAt <= 0) {
      return '未到店';
    }
    return TimeUtil.relativeDays(m.lastVisitAt, TimeUtil.now());
  }

  private isSleeping(): boolean {
    const m = this.member();
    if (m === null || m.lastVisitAt <= 0) {
      return false;
    }
    const settings = AppStore.get().getSettings();
    return (TimeUtil.now() - m.lastVisitAt) > settings.sleepingThresholdDays * 24 * 3600 * 1000;
  }

  private works(): string[] {
    const m = this.member();
    return m !== null ? m.workImages : [];
  }

  private bookedCourses(): BookedCourse[] {
    const store = AppStore.get();
    const bookings: Booking[] = store.getBookings();
    const out: BookedCourse[] = [];
    for (let i = 0; i < bookings.length; i++) {
      if (bookings[i].memberId === this.memberId && bookings[i].status === 'active') {
        const c: Course | null = store.getCourse(bookings[i].courseId);
        if (c !== null) {
          out.push({
            id: bookings[i].id,
            title: c.title,
            startLabel: TimeUtil.dateLabel(c.startAt),
            timeLabel: TimeUtil.timeLabel(c.startAt),
          });
        }
      }
    }
    return out;
  }

  private doCheckin(): void {
    const store = AppStore.get();
    if (store.hasCheckedInToday(this.memberId)) {
      Ui.toast('今日已签到');
      return;
    }
    const pts = store.getSettings().checkinPoints;
    store.applyPointTx(this.memberId, 'checkin', pts, '每日签到', 'checkin', '');
    AppStore.get().touchMember(this.memberId, TimeUtil.now(), 0);
    Ui.toast(`签到成功 +${pts}`);
  }

  private doWake(): void {
    ReminderService.wakeMember(this.memberId, '已联系');
    Ui.toast('已记录唤醒，会员移出沉睡列表');
  }

  private doDelete(): void {
    Ui.confirm('删除会员', '删除后无法恢复，相关预约将被取消。', () => {
      AppStore.get().deleteMember(this.memberId);
      Ui.toast('已删除');
      this.onBack();
    });
  }
}
