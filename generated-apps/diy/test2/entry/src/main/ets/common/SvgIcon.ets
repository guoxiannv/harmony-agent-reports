import { SvgStyleSpec, SVG_STYLE_MAP } from './svg/SvgStyleMap';

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop variant: string = 'search';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    if (v === 'tab-home-active') {
      return 'icon_首页标签-1.svg';
    } else if (v === 'tab-home-inactive') {
      return 'icon_首页标签-2.svg';
    } else if (v === 'tab-members-active') {
      return 'icon_会员列表标签-2.svg';
    } else if (v === 'tab-members-inactive') {
      return 'icon_会员列表标签-1.svg';
    } else if (v === 'tab-courses-active' || v === 'tab-courses-inactive') {
      return 'icon_课程日历标签.svg';
    } else if (v === 'tab-inventory-active' || v === 'tab-inventory-inactive') {
      return 'icon_库存管理标签.svg';
    } else if (v === 'tab-profile-active' || v === 'tab-profile-inactive') {
      return 'icon_我的设置标签.svg';
    } else if (v === 'sleeping-reminder') {
      return 'icon_沉睡会员提醒入口.svg';
    } else if (v === 'check-in-fab') {
      return 'icon_打开签到与消费录入页面.svg';
    } else if (v === 'add') {
      return 'icon_新增会员按钮.svg';
    } else if (v === 'filter') {
      return 'icon_打开会员筛选面板.svg';
    } else if (v === 'empty-members') {
      return 'icon_会员列表为空.svg';
    } else if (v === 'course-pottery') {
      return 'icon_今日陶艺课程图标.svg';
    } else if (v === 'course-woodwork') {
      return 'icon_今日木作课程图标.svg';
    }
    return 'icon_首页标签-2.svg';
  }

  private styleSpecForVariant(): SvgStyleSpec | undefined {
    return SVG_STYLE_MAP[this.fileNameForVariant()];
  }
}
