// ProfilePage.ets
// 我的: profile card + menu list (菜品管理 / 饮食统计 / 设置). Menu actions give real feedback.
import { Theme, BrandGradient } from '../common/Theme';
import { SvgIcon } from '../common/SvgIcon';
import { Store } from '../services/Store';
import { toast } from '../common/Feedback';
import { promptAction } from '@kit.ArkUI';

@Component
export struct ProfilePage {
  goToDishLibrary: () => void = () => {};

  @State mealCount: number = 0;
  @State streak: number = 0;
  @State dishCount: number = 0;

  async aboutToAppear() {
    await Store.ensureLoaded();
    this.refresh();
  }

  private refresh(): void {
    this.mealCount = Store.countCheckins();
    this.streak = Store.streak();
    this.dishCount = Store.getDishes().length;
  }

  build() {
    Column() {
      // Header
      Row() {
        Text('我的')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.textPrimary)
          .layoutWeight(1)
        Row() {
          SvgIcon({ variant: 'settings', iconSize: 22 })
        }
        .id('profile-settings-button')
        .width(44)
        .height(44)
        .borderRadius(Theme.radiusTiny)
        .backgroundColor(Theme.lightGray)
        .justifyContent(FlexAlign.Center)
        .onClick(() => this.openSettings())
      }
      .width('100%')
      .margin({ bottom: 24 })

      // Profile card
      Row({ space: 18 }) {
        Row() {
          SvgIcon({ variant: 'profile', iconSize: 36 })
        }
        .width(72)
        .height(72)
        .borderRadius(36)
        .linearGradient(BrandGradient.orange)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('美食家')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.textPrimary)
            .margin({ bottom: 6 })
          Text('已记录 ' + this.mealCount + ' 餐 · 连续打卡 ' + this.streak + ' 天')
            .fontSize(14)
            .fontColor(Theme.warmGray)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
      }
      .width('100%')
      .padding(24)
      .borderRadius(Theme.radiusHero)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 20, color: 'rgba(46,42,37,0.05)', offsetY: 6 })
      .alignItems(VerticalAlign.Center)
      .margin({ bottom: 24 })

      // Menu list
      Column() {
        this.MenuRow('dish-library', Theme.tintOrange, '菜品管理', '当前 ' + this.dishCount + ' 道菜',
          'profile-dish-library-button', () => this.goToDishLibrary())
        this.Sep()
        this.MenuRow('daily', Theme.tintGreen, '饮食统计', '查看打卡与菜品概况', 'profile-stats-button',
          () => this.openStats())
        this.Sep()
        this.MenuRow('settings', Theme.tintOlive, '设置', '清空数据等', 'profile-settings-button',
          () => this.openSettings())
      }
      .width('100%')
      .borderRadius(22)
      .backgroundColor(Theme.paper)
      .shadow({ radius: 16, color: 'rgba(46,42,37,0.05)', offsetY: 4 })
    }
    .width('100%')
    .padding({ left: Theme.pageHorizontalPadding, right: Theme.pageHorizontalPadding, top: 20, bottom: 20 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  MenuRow(icon: string, tint: string, title: string, subtitle: string, id: string, onTap: () => void) {
    Row({ space: 14 }) {
      Row() {
        SvgIcon({ variant: icon, iconSize: 22 })
      }
      .width(40)
      .height(40)
      .borderRadius(12)
      .backgroundColor(tint)
      .justifyContent(FlexAlign.Center)

      Column() {
        Text(title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor(Theme.textPrimary)
        Text(subtitle)
          .fontSize(12)
          .fontColor(Theme.warmGray)
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      SvgIcon({ variant: 'back', iconSize: 18 })
    }
    .id(id)
    .width('100%')
    .padding({ left: 20, right: 20, top: 16, bottom: 16 })
    .alignItems(VerticalAlign.Center)
    .onClick(() => onTap())
  }

  @Builder
  Sep() {
    Row()
      .width('100%')
      .height(1)
      .backgroundColor(Theme.border)
      .margin({ left: 20, right: 20 })
  }

  private openStats(): void {
    try {
      promptAction.showDialog({
        title: '饮食统计',
        message: '累计打卡 ' + this.mealCount + ' 餐\n连续打卡 ' + this.streak + ' 天\n菜品库 ' + this.dishCount + ' 道',
        buttons: [{ text: '好的', color: Theme.brandPrimary }],
      });
    } catch (e) {
      toast('暂无可显示的统计');
    }
  }

  private openSettings(): void {
    try {
      promptAction.showDialog({
        title: '设置',
        message: '是否清空所有本地数据？（菜品、打卡、食材、候选）',
        buttons: [
          { text: '取消', color: Theme.warmGray },
          { text: '清空', color: Theme.orangeDark },
        ],
      }).then((res: promptAction.ShowDialogSuccessResponse) => {
        if (res.index === 1) {
          Store.clearAll();
          this.refresh();
          toast('已清空所有数据');
        }
      });
    } catch (e) {
      toast('设置暂不可用');
    }
  }
}
