import { SVG_STYLE_MAP, SvgStyleSpec } from './svg/SvgStyleMap';

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#0F3329';
  @Prop strokeWidth: number = 2;
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
    if (v === 'home') {
      return 'icon_工作台标签.svg';
    } else if (v === 'home-active') {
      return 'icon_工作台标签-1.svg';
    } else if (v === 'inspections') {
      return 'icon_巡检标签.svg';
    } else if (v === 'inspections-active') {
      return 'icon_巡检标签-2.svg';
    } else if (v === 'hazards') {
      return 'icon_隐患标签.svg';
    } else if (v === 'hazards-active') {
      return 'icon_隐患标签.svg';
    } else if (v === 'stats') {
      return 'icon_统计标签.svg';
    } else if (v === 'stats-active') {
      return 'icon_统计标签.svg';
    } else if (v === 'profile') {
      return 'icon_我的标签.svg';
    } else if (v === 'profile-active') {
      return 'icon_我的标签.svg';
    } else if (v === 'inspect') {
      return 'icon_开始巡检任务.svg';
    } else if (v === 'hazard') {
      return 'icon_上报新的安全隐患.svg';
    } else if (v === 'note') {
      return 'icon_新增安全事项记录.svg';
    } else if (v === 'contact') {
      return 'icon_查看应急联系人.svg';
    } else if (v === 'user') {
      return 'icon_打开个人中心.svg';
    } else if (v === 'add') {
      return 'icon_新增巡检任务.svg';
    }
    return 'icon_工作台标签.svg';
  }

  static spec(fileName: string): SvgStyleSpec | undefined {
    return SVG_STYLE_MAP[fileName];
  }

  static isStroke(fileName: string): boolean {
    const spec = SVG_STYLE_MAP[fileName];
    return !!spec && spec.paintMode === 'stroke';
  }
}
