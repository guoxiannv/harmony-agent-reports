export interface SvgStyleSpec {
  fileName: string;
  title: string;
  sourceHtml: string;
  width: number;
  height: number;
  viewBox: string;
  paintMode: string;
  defaultColor: string;
  fillColor: string;
  strokeColor: string;
  opacity: string;
  contextClasses: string[];
}

export const SVG_STYLE_MAP: Record<string, SvgStyleSpec> = {
  "icon_上报新的风险隐患.svg": {
    "fileName": "icon_上报新的风险隐患.svg",
    "title": "上报新的风险隐患",
    "sourceHtml": "page-hazards-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_上报隐患.svg": {
    "fileName": "icon_上报隐患.svg",
    "title": "上报隐患",
    "sourceHtml": "page-hazards-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "empty-state",
      "hidden"
    ]
  },
  "icon_今日巡检完成进度.svg": {
    "fileName": "icon_今日巡检完成进度.svg",
    "title": "今日巡检完成进度",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 32 32",
    "paintMode": "color",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "icon-row",
      "dash-card",
      "dashboard"
    ]
  },
  "icon_任务完成进度-1.svg": {
    "fileName": "icon_任务完成进度-1.svg",
    "title": "任务完成进度",
    "sourceHtml": "page-inspections-page.html",
    "width": 56,
    "height": 56,
    "viewBox": "0 0 44 44",
    "paintMode": "color",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "task-card"
    ]
  },
  "icon_任务完成进度-2.svg": {
    "fileName": "icon_任务完成进度-2.svg",
    "title": "任务完成进度",
    "sourceHtml": "page-inspections-page.html",
    "width": 56,
    "height": 56,
    "viewBox": "0 0 44 44",
    "paintMode": "color",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "task-card"
    ]
  },
  "icon_关闭事项表单.svg": {
    "fileName": "icon_关闭事项表单.svg",
    "title": "关闭事项表单",
    "sourceHtml": "page-item-form-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "topbar",
      "sheet"
    ]
  },
  "icon_关闭联系人表单.svg": {
    "fileName": "icon_关闭联系人表单.svg",
    "title": "关闭联系人表单",
    "sourceHtml": "page-contact-form-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "topbar",
      "sheet"
    ]
  },
  "icon_关闭隐患表单.svg": {
    "fileName": "icon_关闭隐患表单.svg",
    "title": "关闭隐患表单",
    "sourceHtml": "page-hazard-form-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "topbar",
      "sheet"
    ]
  },
  "icon_创建安全事项.svg": {
    "fileName": "icon_创建安全事项.svg",
    "title": "创建安全事项",
    "sourceHtml": "page-safety-items-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "empty-state",
      "hidden"
    ]
  },
  "icon_已逾期.svg": {
    "fileName": "icon_已逾期.svg",
    "title": "已逾期",
    "sourceHtml": "page-safety-items-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DC2626",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "due",
      "overdue-text",
      "item-meta",
      "item-card",
      "overdue"
    ]
  },
  "icon_平安扣应用标志.svg": {
    "fileName": "icon_平安扣应用标志.svg",
    "title": "平安扣应用标志",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "brand-icon",
      "brand"
    ]
  },
  "icon_应急提示.svg": {
    "fileName": "icon_应急提示.svg",
    "title": "应急提示",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B45309",
    "fillColor": "",
    "strokeColor": "#B45309",
    "opacity": "1",
    "contextClasses": [
      "tip-card"
    ]
  },
  "icon_开始巡检.svg": {
    "fileName": "icon_开始巡检.svg",
    "title": "开始巡检",
    "sourceHtml": "page-inspections-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "empty-state",
      "hidden"
    ]
  },
  "icon_开始巡检打卡.svg": {
    "fileName": "icon_开始巡检打卡.svg",
    "title": "开始巡检打卡",
    "sourceHtml": "page-inspections-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F766E",
    "fillColor": "",
    "strokeColor": "#0F766E",
    "opacity": "1",
    "contextClasses": [
      "cta-btn",
      "cta-card"
    ]
  },
  "icon_当前日期.svg": {
    "fileName": "icon_当前日期.svg",
    "title": "当前日期",
    "sourceHtml": "page-home-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "date-chip",
      "welcome"
    ]
  },
  "icon_待处理安全事项.svg": {
    "fileName": "icon_待处理安全事项.svg",
    "title": "待处理安全事项",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#38BDF8",
    "opacity": "1",
    "contextClasses": [
      "icon-row",
      "dash-card",
      "dashboard"
    ]
  },
  "icon_待整改指标.svg": {
    "fileName": "icon_待整改指标.svg",
    "title": "待整改指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B45309",
    "fillColor": "",
    "strokeColor": "#B45309",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "orange",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_我的标签.svg": {
    "fileName": "icon_我的标签.svg",
    "title": "我的标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_截止日期.svg": {
    "fileName": "icon_截止日期.svg",
    "title": "截止日期",
    "sourceHtml": "page-safety-items-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "due",
      "item-meta",
      "item-card",
      "normal"
    ]
  },
  "icon_打开通知中心.svg": {
    "fileName": "icon_打开通知中心.svg",
    "title": "打开通知中心",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "header-action"
    ]
  },
  "icon_拍摄检查点照片.svg": {
    "fileName": "icon_拍摄检查点照片.svg",
    "title": "拍摄检查点照片",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "photo-btn",
      "checkpoint-card"
    ]
  },
  "icon_拍摄隐患现场照片.svg": {
    "fileName": "icon_拍摄隐患现场照片.svg",
    "title": "拍摄隐患现场照片",
    "sourceHtml": "page-hazard-form-sheet.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "photo-area",
      "form-group",
      "sheet"
    ]
  },
  "icon_拨打李建国电话.svg": {
    "fileName": "icon_拨打李建国电话.svg",
    "title": "拨打李建国电话",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "call",
      "action-group",
      "contact-card"
    ]
  },
  "icon_拨打王小梅电话.svg": {
    "fileName": "icon_拨打王小梅电话.svg",
    "title": "拨打王小梅电话",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "call",
      "action-group",
      "contact-card"
    ]
  },
  "icon_搜索安全事项.svg": {
    "fileName": "icon_搜索安全事项.svg",
    "title": "搜索安全事项",
    "sourceHtml": "page-safety-items-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-box"
    ]
  },
  "icon_整改完成率指标.svg": {
    "fileName": "icon_整改完成率指标.svg",
    "title": "整改完成率指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "green",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_新增安全事项-1.svg": {
    "fileName": "icon_新增安全事项-1.svg",
    "title": "新增安全事项",
    "sourceHtml": "page-safety-items-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "topbar"
    ]
  },
  "icon_新增安全事项-2.svg": {
    "fileName": "icon_新增安全事项-2.svg",
    "title": "新增安全事项",
    "sourceHtml": "page-safety-items-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_新增应急联系人-1.svg": {
    "fileName": "icon_新增应急联系人-1.svg",
    "title": "新增应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "topbar"
    ]
  },
  "icon_新增应急联系人-2.svg": {
    "fileName": "icon_新增应急联系人-2.svg",
    "title": "新增应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_暂无安全事项.svg": {
    "fileName": "icon_暂无安全事项.svg",
    "title": "暂无安全事项",
    "sourceHtml": "page-safety-items-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F766E",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "hidden"
    ]
  },
  "icon_暂无应急联系人.svg": {
    "fileName": "icon_暂无应急联系人.svg",
    "title": "暂无应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "hidden"
    ]
  },
  "icon_暂无巡检任务.svg": {
    "fileName": "icon_暂无巡检任务.svg",
    "title": "暂无巡检任务",
    "sourceHtml": "page-inspections-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "hidden"
    ]
  },
  "icon_暂无风险隐患.svg": {
    "fileName": "icon_暂无风险隐患.svg",
    "title": "暂无风险隐患",
    "sourceHtml": "page-hazards-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#B45309",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "hidden"
    ]
  },
  "icon_本月新增指标.svg": {
    "fileName": "icon_本月新增指标.svg",
    "title": "本月新增指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "green",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_查看更多功能.svg": {
    "fileName": "icon_查看更多功能.svg",
    "title": "查看更多功能",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "purple",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_标记检查点异常-1.svg": {
    "fileName": "icon_标记检查点异常-1.svg",
    "title": "标记检查点异常",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "toggle-btn",
      "toggle-group",
      "checkpoint-card"
    ]
  },
  "icon_标记检查点异常-2.svg": {
    "fileName": "icon_标记检查点异常-2.svg",
    "title": "标记检查点异常",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DC2626",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "toggle-btn",
      "active-abnormal",
      "toggle-group",
      "checkpoint-card"
    ]
  },
  "icon_标记检查点正常-1.svg": {
    "fileName": "icon_标记检查点正常-1.svg",
    "title": "标记检查点正常",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "toggle-btn",
      "active-normal",
      "toggle-group",
      "checkpoint-card"
    ]
  },
  "icon_标记检查点正常-2.svg": {
    "fileName": "icon_标记检查点正常-2.svg",
    "title": "标记检查点正常",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "toggle-btn",
      "toggle-group",
      "checkpoint-card"
    ]
  },
  "icon_检查点位置.svg": {
    "fileName": "icon_检查点位置.svg",
    "title": "检查点位置",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "checkpoint-location",
      "checkpoint-header"
    ]
  },
  "icon_添加应急联系人.svg": {
    "fileName": "icon_添加应急联系人.svg",
    "title": "添加应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "empty-state",
      "hidden"
    ]
  },
  "icon_给李建国发短信.svg": {
    "fileName": "icon_给李建国发短信.svg",
    "title": "给李建国发短信",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1D4ED8",
    "fillColor": "",
    "strokeColor": "#1D4ED8",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "sms",
      "action-group",
      "contact-card"
    ]
  },
  "icon_给王小梅发短信.svg": {
    "fileName": "icon_给王小梅发短信.svg",
    "title": "给王小梅发短信",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1D4ED8",
    "fillColor": "",
    "strokeColor": "#1D4ED8",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "sms",
      "action-group",
      "contact-card"
    ]
  },
  "icon_统计看板标签.svg": {
    "fileName": "icon_统计看板标签.svg",
    "title": "统计看板标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_编辑李建国联系人信息.svg": {
    "fileName": "icon_编辑李建国联系人信息.svg",
    "title": "编辑李建国联系人信息",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "edit",
      "action-group",
      "contact-card"
    ]
  },
  "icon_编辑王小梅联系人信息.svg": {
    "fileName": "icon_编辑王小梅联系人信息.svg",
    "title": "编辑王小梅联系人信息",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "edit",
      "action-group",
      "contact-card"
    ]
  },
  "icon_巡检完成率指标.svg": {
    "fileName": "icon_巡检完成率指标.svg",
    "title": "巡检完成率指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1D4ED8",
    "fillColor": "",
    "strokeColor": "#1D4ED8",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "blue",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_巡检打卡标签.svg": {
    "fileName": "icon_巡检打卡标签.svg",
    "title": "巡检打卡标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-emergency-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "topbar-left",
      "topbar"
    ]
  },
  "icon_返回巡检列表.svg": {
    "fileName": "icon_返回巡检列表.svg",
    "title": "返回巡检列表",
    "sourceHtml": "page-inspection-task-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "topbar"
    ]
  },
  "icon_进入安全事项列表.svg": {
    "fileName": "icon_进入安全事项列表.svg",
    "title": "进入安全事项列表",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "blue",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_进入应急联系人.svg": {
    "fileName": "icon_进入应急联系人.svg",
    "title": "进入应急联系人",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "red",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_进入统计看板.svg": {
    "fileName": "icon_进入统计看板.svg",
    "title": "进入统计看板",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "teal",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_进入巡检打卡.svg": {
    "fileName": "icon_进入巡检打卡.svg",
    "title": "进入巡检打卡",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "green",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_进入风险隐患列表.svg": {
    "fileName": "icon_进入风险隐患列表.svg",
    "title": "进入风险隐患列表",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "orange",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_逾期事项指标.svg": {
    "fileName": "icon_逾期事项指标.svg",
    "title": "逾期事项指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DC2626",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "red",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_逾期安全事项.svg": {
    "fileName": "icon_逾期安全事项.svg",
    "title": "逾期安全事项",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "icon-row",
      "dash-card",
      "alert",
      "dashboard"
    ]
  },
  "icon_隐患位置.svg": {
    "fileName": "icon_隐患位置.svg",
    "title": "隐患位置",
    "sourceHtml": "page-hazards-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "hazard-location",
      "hazard-card"
    ]
  },
  "icon_隐患总数指标.svg": {
    "fileName": "icon_隐患总数指标.svg",
    "title": "隐患总数指标",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1D4ED8",
    "fillColor": "",
    "strokeColor": "#1D4ED8",
    "opacity": "1",
    "contextClasses": [
      "metric-icon",
      "blue",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_隐患等级分布环形图.svg": {
    "fileName": "icon_隐患等级分布环形图.svg",
    "title": "隐患等级分布环形图",
    "sourceHtml": "page-stats-page.html",
    "width": 140,
    "height": 140,
    "viewBox": "0 0 100 100",
    "paintMode": "fill",
    "defaultColor": "#0F172A",
    "fillColor": "#0F766E",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "chart-card"
    ]
  },
  "icon_风险隐患标签.svg": {
    "fileName": "icon_风险隐患标签.svg",
    "title": "风险隐患标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_首页标签.svg": {
    "fileName": "icon_首页标签.svg",
    "title": "首页标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#38BDF8",
    "fillColor": "",
    "strokeColor": "#38BDF8",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar"
    ]
  }
};
