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
  "icon_上报新的安全隐患.svg": {
    "fileName": "icon_上报新的安全隐患.svg",
    "title": "上报新的安全隐患",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "hazard",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_发送短信给联系人.svg": {
    "fileName": "icon_发送短信给联系人.svg",
    "title": "发送短信给联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0EA5E9",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "msg",
      "action-btns",
      "card"
    ]
  },
  "icon_发送评论.svg": {
    "fileName": "icon_发送评论.svg",
    "title": "发送评论",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "comment-send",
      "comment-bar"
    ]
  },
  "icon_地点图标.svg": {
    "fileName": "icon_地点图标.svg",
    "title": "地点图标",
    "sourceHtml": "page-hazards-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "card-meta",
      "card-body"
    ]
  },
  "icon_导出本地数据.svg": {
    "fileName": "icon_导出本地数据.svg",
    "title": "导出本地数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#6366F1",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "export",
      "menu-left",
      "menu-item"
    ]
  },
  "icon_工作台标签-1.svg": {
    "fileName": "icon_工作台标签-1.svg",
    "title": "工作台标签",
    "sourceHtml": "page-hazards-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_工作台标签-2.svg": {
    "fileName": "icon_工作台标签-2.svg",
    "title": "工作台标签",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_开始导出数据.svg": {
    "fileName": "icon_开始导出数据.svg",
    "title": "开始导出数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "section"
    ]
  },
  "icon_开始巡检任务.svg": {
    "fileName": "icon_开始巡检任务.svg",
    "title": "开始巡检任务",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "inspect",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_我的标签-1.svg": {
    "fileName": "icon_我的标签-1.svg",
    "title": "我的标签",
    "sourceHtml": "page-hazards-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_我的标签-2.svg": {
    "fileName": "icon_我的标签-2.svg",
    "title": "我的标签",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_截止日期图标.svg": {
    "fileName": "icon_截止日期图标.svg",
    "title": "截止日期图标",
    "sourceHtml": "page-hazards-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EF4444",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "overdue",
      "card-meta",
      "card-body"
    ]
  },
  "icon_打开个人中心.svg": {
    "fileName": "icon_打开个人中心.svg",
    "title": "打开个人中心",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "header-avatar",
      "header-top",
      "header"
    ]
  },
  "icon_打开应用设置.svg": {
    "fileName": "icon_打开应用设置.svg",
    "title": "打开应用设置",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0EA5E9",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "settings",
      "menu-left",
      "menu-item"
    ]
  },
  "icon_拨打联系人电话.svg": {
    "fileName": "icon_拨打联系人电话.svg",
    "title": "拨打联系人电话",
    "sourceHtml": "page-contacts-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "call",
      "action-btns",
      "card"
    ]
  },
  "icon_搜索联系人.svg": {
    "fileName": "icon_搜索联系人.svg",
    "title": "搜索联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-box"
    ]
  },
  "icon_新增安全事项.svg": {
    "fileName": "icon_新增安全事项.svg",
    "title": "新增安全事项",
    "sourceHtml": "page-safety-notes-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_新增安全事项记录.svg": {
    "fileName": "icon_新增安全事项记录.svg",
    "title": "新增安全事项记录",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "note",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_新增应急联系人.svg": {
    "fileName": "icon_新增应急联系人.svg",
    "title": "新增应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_新增巡检任务.svg": {
    "fileName": "icon_新增巡检任务.svg",
    "title": "新增巡检任务",
    "sourceHtml": "page-inspections-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_新增隐患上报.svg": {
    "fileName": "icon_新增隐患上报.svg",
    "title": "新增隐患上报",
    "sourceHtml": "page-hazards-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_时间图标.svg": {
    "fileName": "icon_时间图标.svg",
    "title": "时间图标",
    "sourceHtml": "page-inspections-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "card-meta",
      "card-body"
    ]
  },
  "icon_查看关于平安扣.svg": {
    "fileName": "icon_查看关于平安扣.svg",
    "title": "查看关于平安扣",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "about",
      "menu-left",
      "menu-item"
    ]
  },
  "icon_查看应急联系人.svg": {
    "fileName": "icon_查看应急联系人.svg",
    "title": "查看应急联系人",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "contact",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_添加现场照片.svg": {
    "fileName": "icon_添加现场照片.svg",
    "title": "添加现场照片",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "photo-add",
      "photo-grid",
      "card"
    ]
  },
  "icon_清除所有本地数据.svg": {
    "fileName": "icon_清除所有本地数据.svg",
    "title": "清除所有本地数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "danger",
      "menu-left",
      "menu-item"
    ]
  },
  "icon_确认清除本地数据.svg": {
    "fileName": "icon_确认清除本地数据.svg",
    "title": "确认清除本地数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "section"
    ]
  },
  "icon_统计标签-1.svg": {
    "fileName": "icon_统计标签-1.svg",
    "title": "统计标签",
    "sourceHtml": "page-hazards-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_统计标签-2.svg": {
    "fileName": "icon_统计标签-2.svg",
    "title": "统计标签",
    "sourceHtml": "page-stats-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_巡检标签-1.svg": {
    "fileName": "icon_巡检标签-1.svg",
    "title": "巡检标签",
    "sourceHtml": "page-hazards-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_巡检标签-2.svg": {
    "fileName": "icon_巡检标签-2.svg",
    "title": "巡检标签",
    "sourceHtml": "page-inspections-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_近7日隐患上报数量趋势图.svg": {
    "fileName": "icon_近7日隐患上报数量趋势图.svg",
    "title": "近7日隐患上报数量趋势图",
    "sourceHtml": "page-stats-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 140",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "card",
      "section"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-contact-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#334155",
    "opacity": "1",
    "contextClasses": [
      "header-back",
      "header-left",
      "header"
    ]
  },
  "icon_进入关于页.svg": {
    "fileName": "icon_进入关于页.svg",
    "title": "进入关于页",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "section"
    ]
  },
  "icon_进入设置页.svg": {
    "fileName": "icon_进入设置页.svg",
    "title": "进入设置页",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "section"
    ]
  },
  "icon_隐患标签-1.svg": {
    "fileName": "icon_隐患标签-1.svg",
    "title": "隐患标签",
    "sourceHtml": "page-hazards-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_隐患标签-2.svg": {
    "fileName": "icon_隐患标签-2.svg",
    "title": "隐患标签",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_隐患状态分布环形图.svg": {
    "fileName": "icon_隐患状态分布环形图.svg",
    "title": "隐患状态分布环形图",
    "sourceHtml": "page-stats-page.html",
    "width": 120,
    "height": 120,
    "viewBox": "0 0 100 100",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#E2E8F0",
    "opacity": "1",
    "contextClasses": [
      "donut-wrap",
      "card",
      "section"
    ]
  }
};
