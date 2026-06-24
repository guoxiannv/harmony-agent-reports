// Shared icon entry wrapper for Pinankou
import { Theme } from './Theme';

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#111827';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'home';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    if (v === 'home') {
      return this.activeFile('icon_打开首页统计看板-2.svg', 'icon_打开首页统计看板-1.svg');
    } else if (v === 'inspection') {
      return this.activeFile('icon_打开巡检任务页面-2.svg', 'icon_打开巡检任务页面-1.svg');
    } else if (v === 'risk') {
      return this.activeFile('icon_打开隐患列表页面-2.svg', 'icon_打开隐患列表页面-1.svg');
    } else if (v === 'emergency') {
      return this.activeFile('icon_打开应急联系人页面-1.svg', 'icon_打开应急联系人页面-2.svg');
    } else if (v === 'profile') {
      return this.activeFile('icon_打开个人中心页面-2.svg', 'icon_打开个人中心页面-1.svg');
    } else if (v === 'add' || v === 'plus') {
      return 'icon_快速上报隐患.svg';
    } else if (v === 'back') {
      return 'icon_取消并返回上一页.svg';
    } else if (v === 'search') {
      return 'icon_搜索隐患.svg';
    } else if (v === 'phone' || v === 'call') {
      return 'icon_拨打该应急联系人电话.svg';
    } else if (v === 'more' || v === 'chevronRight' || v === 'arrowRight') {
      return 'icon_进入关于页面.svg';
    } else if (v === 'calendar') {
      return 'icon_上传隐患现场照片.svg';
    } else if (v === 'camera') {
      return 'icon_上传异常现场照片.svg';
    } else if (v === 'check' || v === 'pass') {
      return 'icon_今日巡检数量.svg';
    } else if (v === 'close' || v === 'fail' || v === 'x') {
      return 'icon_标记该项为异常并上报隐患.svg';
    } else if (v === 'warning') {
      return 'icon_逾期隐患数量.svg';
    } else if (v === 'settings') {
      return 'icon_打开通知设置.svg';
    } else if (v === 'export') {
      return 'icon_导出本地数据.svg';
    }
    return 'icon_打开首页统计看板-1.svg';
  }

  private activeFile(active: string, inactive: string): string {
    return this.color === Theme.brandPrimary ? active : inactive
  }
}
