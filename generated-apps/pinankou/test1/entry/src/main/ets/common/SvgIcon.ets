// SvgIcon.ets - 平安扣 icon wrapper backed by prepared SVG rawfiles.
//
// Contract honored:
// - Public API stable: variant, iconSize, color, strokeWidth, exported struct SvgIcon.
// - fileNameForVariant() maps generic variant names to real prepared rawfile filenames.
//
// SVG gate:
// - The prepared SVGs use paint_mode "stroke" with embedded stroke colors.
// - We do NOT chain .fillColor() on Image($rawfile(...)) because that would
//   conflict with stroke-mode icons. State changes are handled by switching the
//   rawfile variant (e.g. normal/abnormal active vs inactive).
import { SVG_STYLE_MAP, SvgStyleSpec } from './svg/SvgStyleMap';

@Component
export struct SvgIcon {
  @Prop iconSize: number = 24;
  @Prop color: string = '#0F172A';
  @Prop strokeWidth: number = 2;
  @Prop variant: string = 'home';

  build() {
    Image($rawfile(this.fileNameForVariant()))
      .width(this.iconSize)
      .height(this.iconSize)
      .objectFit(ImageFit.Contain)
      .draggable(false)
  }

  // Map generic variant -> prepared rawfile filename.
  // Prefer variant-specific prepared files; fall back to a sensible default.
  private fileNameForVariant(): string {
    const v: string = this.variant;

    // Bottom tab icons (active variant has color baked in; inactive is slate).
    if (v === 'tab-home') return 'icon_首页标签.svg';
    if (v === 'tab-hazards') return 'icon_风险隐患标签.svg';
    if (v === 'tab-inspections') return 'icon_巡检打卡标签.svg';
    if (v === 'tab-stats') return 'icon_统计看板标签.svg';
    if (v === 'tab-profile') return 'icon_我的标签.svg';

    // Generic home / nav.
    if (v === 'home') return 'icon_首页标签.svg';
    if (v === 'hazards') return 'icon_风险隐患标签.svg';
    if (v === 'inspections') return 'icon_巡检打卡标签.svg';
    if (v === 'stats') return 'icon_统计看板标签.svg';
    if (v === 'profile') return 'icon_我的标签.svg';

    // Brand / header.
    if (v === 'brand') return 'icon_平安扣应用标志.svg';
    if (v === 'notification' || v === 'bell') return 'icon_打开通知中心.svg';
    if (v === 'back') return 'icon_返回上一页.svg';
    if (v === 'back-inspection') return 'icon_返回巡检列表.svg';

    // Date chip.
    if (v === 'calendar' || v === 'date') return 'icon_当前日期.svg';

    // Dashboard icons.
    if (v === 'dash-pending' || v === 'pending-items') return 'icon_待处理安全事项.svg';
    if (v === 'dash-overdue' || v === 'overdue-items') return 'icon_逾期安全事项.svg';
    if (v === 'dash-inspection' || v === 'today-inspection') return 'icon_今日巡检完成进度.svg';

    // Quick grid.
    if (v === 'quick-items' || v === 'safety-items') return 'icon_进入安全事项列表.svg';
    if (v === 'quick-hazards') return 'icon_进入风险隐患列表.svg';
    if (v === 'quick-inspections' || v === 'inspection') return 'icon_进入巡检打卡.svg';
    if (v === 'quick-emergency') return 'icon_进入应急联系人.svg';
    if (v === 'quick-stats') return 'icon_进入统计看板.svg';
    if (v === 'quick-more' || v === 'more') return 'icon_查看更多功能.svg';

    // Safety items page.
    if (v === 'search') return 'icon_搜索安全事项.svg';
    if (v === 'add-item' || v === 'plus-item') return 'icon_新增安全事项-1.svg';
    if (v === 'fab-item') return 'icon_新增安全事项-2.svg';
    if (v === 'create-item') return 'icon_创建安全事项.svg';
    if (v === 'due-date') return 'icon_截止日期.svg';
    if (v === 'overdue') return 'icon_已逾期.svg';
    if (v === 'empty-items') return 'icon_暂无安全事项.svg';

    // Hazards page.
    if (v === 'report-hazard' || v === 'report-hazards') return 'icon_上报隐患.svg';
    if (v === 'fab-hazard' || v === 'add-hazard') return 'icon_上报新的风险隐患.svg';
    if (v === 'hazard-location' || v === 'location') return 'icon_隐患位置.svg';
    if (v === 'empty-hazards') return 'icon_暂无风险隐患.svg';
    if (v === 'hazard-photo') return 'icon_拍摄隐患现场照片.svg';

    // Inspections page.
    if (v === 'start-inspection') return 'icon_开始巡检.svg';
    if (v === 'start-inspection-cta' || v === 'inspection-cta') return 'icon_开始巡检打卡.svg';
    if (v === 'task-progress-1' || v === 'task-progress-active') return 'icon_任务完成进度-1.svg';
    if (v === 'task-progress-2' || v === 'task-progress-idle') return 'icon_任务完成进度-2.svg';
    if (v === 'empty-inspections') return 'icon_暂无巡检任务.svg';

    // Inspection task page.
    if (v === 'checkpoint-location') return 'icon_检查点位置.svg';
    if (v === 'checkpoint-photo') return 'icon_拍摄检查点照片.svg';
    if (v === 'checkpoint-normal-active') return 'icon_标记检查点正常-1.svg';
    if (v === 'checkpoint-normal-idle') return 'icon_标记检查点正常-2.svg';
    if (v === 'checkpoint-abnormal-active') return 'icon_标记检查点异常-2.svg';
    if (v === 'checkpoint-abnormal-idle') return 'icon_标记检查点异常-1.svg';

    // Emergency page.
    if (v === 'emergency-tip' || v === 'tip') return 'icon_应急提示.svg';
    if (v === 'empty-contacts' || v === 'empty-emergency') return 'icon_暂无应急联系人.svg';
    if (v === 'contact-call' || v === 'call') return 'icon_拨打李建国电话.svg';
    if (v === 'contact-sms' || v === 'sms') return 'icon_给李建国发短信.svg';
    if (v === 'contact-edit' || v === 'edit') return 'icon_编辑李建国联系人信息.svg';
    if (v === 'fab-contact' || v === 'add-contact') return 'icon_新增应急联系人-2.svg';
    if (v === 'create-contact') return 'icon_添加应急联系人.svg';

    // Stats metrics.
    if (v === 'metric-hazard-total') return 'icon_隐患总数指标.svg';
    if (v === 'metric-pending') return 'icon_待整改指标.svg';
    if (v === 'metric-completion') return 'icon_整改完成率指标.svg';
    if (v === 'metric-inspection-rate') return 'icon_巡检完成率指标.svg';
    if (v === 'metric-overdue') return 'icon_逾期事项指标.svg';
    if (v === 'metric-month') return 'icon_本月新增指标.svg';

    // Forms.
    if (v === 'close-item') return 'icon_关闭事项表单.svg';
    if (v === 'close-hazard') return 'icon_关闭隐患表单.svg';
    if (v === 'close-contact') return 'icon_关闭联系人表单.svg';

    // Generic fallbacks.
    if (v === 'add' || v === 'plus') return 'icon_新增安全事项-1.svg';
    if (v === 'remove' || v === 'minus') return 'icon_新增安全事项-1.svg';

    return 'icon_首页标签.svg';
  }
}
