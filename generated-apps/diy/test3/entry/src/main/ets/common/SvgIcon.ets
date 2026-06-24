// SvgIcon.ets — 手作·印记 共享图标入口(rawfile SVG)
//
// 保持稳定 API: variant / iconSize / color / strokeWidth，并扩展可选 active(用于 tab 激活态)。
// 所有图标均为 paint_mode=stroke 的 rawfile SVG(SVG gate):
//   - 禁止对 Image($rawfile(...)) 链式 .fillColor();
//   - 选中/未选中态通过切换不同 rawfile 文件实现(如 首页-1/首页-2)。
// color / strokeWidth 为契约保留字段，rawfile 实现下不动态着色。

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#A65D48';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'home';
  @Prop active: boolean = false;

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  private fileNameForVariant(): string {
    const v: string = this.variant;
    const a: boolean = this.active;

    // ---- 底部 Tab(激活态使用不同文件) ----
    if (v === 'home') { return a ? 'icon_首页-2.svg' : 'icon_首页-1.svg'; }
    if (v === 'classes') { return a ? 'icon_课程-1.svg' : 'icon_课程-2.svg'; }
    if (v === 'points') { return a ? 'icon_积分-2.svg' : 'icon_积分-1.svg'; }
    if (v === 'profile') { return a ? 'icon_我的-2.svg' : 'icon_我的-1.svg'; }

    // ---- 功能图标 ----
    if (v === 'checkin') { return 'icon_今日签到.svg'; }
    if (v === 'back') { return 'icon_返回.svg'; }
    if (v === 'bell' || v === 'dormant-alert') { return 'icon_打开沉睡会员提醒.svg'; }
    if (v === 'edit') { return 'icon_编辑会员档案.svg'; }
    if (v === 'add-craft') { return 'icon_添加工艺标签.svg'; }
    if (v === 'add-work') { return 'icon_添加作品图.svg'; }
    if (v === 'upload-work') { return 'icon_上传新作品图.svg'; }
    if (v === 'work-image') { return 'icon_作品图1.svg'; }
    if (v === 'avatar-large') { return 'icon_会员头像-2.svg'; }
    if (v === 'avatar') { return 'icon_会员头像-1.svg'; }
    if (v === 'material') { return 'icon_耗材图标.svg'; }
    if (v === 'inv-item') { return 'icon_库存物品图标.svg'; }
    if (v === 'inv-entry') { return 'icon_库存管理入口.svg'; }
    if (v === 'inv-arrow') { return 'icon_进入库存管理.svg'; }
    if (v === 'low-stock-alert') { return 'icon_库存预警.svg'; }
    if (v === 'stock-warn-detail') { return 'icon_库存预警提示.svg'; }
    if (v === 'stock-warn-tag') { return 'icon_库存不足.svg'; }
    if (v === 'points-detail') { return 'icon_积分明细.svg'; }
    if (v === 'book-class') { return 'icon_预约课程.svg'; }
    if (v === 'redeem-points') { return 'icon_兑换积分.svg'; }
    if (v === 'checkin-points') { return 'icon_签到积分.svg'; }
    if (v === 'course-points') { return 'icon_课程积分.svg'; }
    if (v === 'prev-month') { return 'icon_上个月.svg'; }
    if (v === 'next-month') { return 'icon_下个月.svg'; }

    // ---- 空态图标 ----
    if (v === 'empty-activity') { return 'icon_暂无动态.svg'; }
    if (v === 'empty-crafts') { return 'icon_暂无工艺标签.svg'; }
    if (v === 'empty-works') { return 'icon_暂无作品.svg'; }
    if (v === 'empty-classes') { return 'icon_无课程.svg'; }
    if (v === 'empty-materials') { return 'icon_暂无耗材.svg'; }
    if (v === 'empty-inventory') { return 'icon_暂无库存.svg'; }
    if (v === 'empty-dormant') { return 'icon_暂无沉睡会员.svg'; }
    if (v === 'empty-points') { return 'icon_暂无积分明细.svg'; }
    if (v === 'empty-consumption') { return 'icon_暂无消费记录.svg'; }

    return 'icon_首页-1.svg';
  }
}
