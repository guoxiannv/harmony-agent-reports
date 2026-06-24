// Shared icon wrapper for PawLog.
// All rawfile SVGs are stroke-mode with embedded colors; do not apply fillColor/strokeColor tinting.

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
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
      return 'icon_今日首页.svg';
    } else if (v === 'records') {
      return 'icon_查看记录.svg';
    } else if (v === 'charts') {
      return 'icon_查看趋势.svg';
    } else if (v === 'profile') {
      return 'icon_我的.svg';
    } else if (v === 'fab-add') {
      return 'icon_添加新记录.svg';
    } else if (v === 'add-pet') {
      return 'icon_添加新宠物档案.svg';
    } else if (v === 'current-pet') {
      return 'icon_当前宠物.svg';
    } else if (v === 'open-profile') {
      return 'icon_打开个人中心.svg';
    } else if (v === 'avatar-1') {
      return 'icon_宠物豆豆头像占位.svg';
    } else if (v === 'avatar-2') {
      return 'icon_宠物奶茶头像占位.svg';
    } else if (v === 'record-food') {
      return 'icon_记录饮食.svg';
    } else if (v === 'record-waste') {
      return 'icon_记录排泄.svg';
    } else if (v === 'record-weight') {
      return 'icon_记录体重.svg';
    } else if (v === 'record-medicine') {
      return 'icon_记录用药.svg';
    } else if (v === 'reminder-vaccine') {
      return 'icon_疫苗提醒.svg';
    } else if (v === 'reminder-deworm') {
      return 'icon_驱虫提醒.svg';
    }
    return 'icon_今日首页.svg';
  }
}
