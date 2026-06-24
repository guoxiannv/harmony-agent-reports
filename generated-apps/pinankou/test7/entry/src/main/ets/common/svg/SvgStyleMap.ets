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
  "icon_一键拨打应急电话.svg": {
    "fileName": "icon_一键拨打应急电话.svg",
    "title": "一键拨打应急电话",
    "sourceHtml": "page-contact-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#047857",
    "fillColor": "",
    "strokeColor": "#047857",
    "opacity": "1",
    "contextClasses": [
      "btn-call",
      "form-card",
      "app"
    ]
  },
  "icon_一键拨打张工电话.svg": {
    "fileName": "icon_一键拨打张工电话.svg",
    "title": "一键拨打张工电话",
    "sourceHtml": "page-contacts-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-item",
      "list-card"
    ]
  },
  "icon_一键拨打李队电话.svg": {
    "fileName": "icon_一键拨打李队电话.svg",
    "title": "一键拨打李队电话",
    "sourceHtml": "page-contacts-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-item",
      "list-card"
    ]
  },
  "icon_上传隐患现场照片.svg": {
    "fileName": "icon_上传隐患现场照片.svg",
    "title": "上传隐患现场照片",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0B4F6C",
    "fillColor": "",
    "strokeColor": "#0B4F6C",
    "opacity": "1",
    "contextClasses": [
      "photo-picker",
      "form-group",
      "form-card"
    ]
  },
  "icon_上报风险隐患.svg": {
    "fileName": "icon_上报风险隐患.svg",
    "title": "上报风险隐患",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "actions-grid"
    ]
  },
  "icon_中风险隐患图标.svg": {
    "fileName": "icon_中风险隐患图标.svg",
    "title": "中风险隐患图标",
    "sourceHtml": "page-hazards-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F59E0B",
    "fillColor": "",
    "strokeColor": "#F59E0B",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "orange",
      "list-item",
      "list-card"
    ]
  },
  "icon_今日待办事项数量.svg": {
    "fileName": "icon_今日待办事项数量.svg",
    "title": "今日待办事项数量",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B82F6",
    "fillColor": "",
    "strokeColor": "#3B82F6",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "blue",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_今日巡检完成率.svg": {
    "fileName": "icon_今日巡检完成率.svg",
    "title": "今日巡检完成率",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "teal",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_删除当前安全事项.svg": {
    "fileName": "icon_删除当前安全事项.svg",
    "title": "删除当前安全事项",
    "sourceHtml": "page-safety-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EF4444",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_删除当前联系人.svg": {
    "fileName": "icon_删除当前联系人.svg",
    "title": "删除当前联系人",
    "sourceHtml": "page-contact-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EF4444",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_删除当前隐患.svg": {
    "fileName": "icon_删除当前隐患.svg",
    "title": "删除当前隐患",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EF4444",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_安全事项列表-1.svg": {
    "fileName": "icon_安全事项列表-1.svg",
    "title": "安全事项列表",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
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
  "icon_安全事项列表-2.svg": {
    "fileName": "icon_安全事项列表-2.svg",
    "title": "安全事项列表",
    "sourceHtml": "page-safety-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_安全事项图标-1.svg": {
    "fileName": "icon_安全事项图标-1.svg",
    "title": "安全事项图标",
    "sourceHtml": "page-safety-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B82F6",
    "fillColor": "",
    "strokeColor": "#3B82F6",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "blue",
      "list-item",
      "list-card"
    ]
  },
  "icon_安全事项图标-2.svg": {
    "fileName": "icon_安全事项图标-2.svg",
    "title": "安全事项图标",
    "sourceHtml": "page-safety-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F59E0B",
    "fillColor": "",
    "strokeColor": "#F59E0B",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "orange",
      "list-item",
      "list-card"
    ]
  },
  "icon_安全事项图标-3.svg": {
    "fileName": "icon_安全事项图标-3.svg",
    "title": "安全事项图标",
    "sourceHtml": "page-safety-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "green",
      "list-item",
      "list-card"
    ]
  },
  "icon_安全事项类型图标-1.svg": {
    "fileName": "icon_安全事项类型图标-1.svg",
    "title": "安全事项类型图标",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B82F6",
    "fillColor": "",
    "strokeColor": "#3B82F6",
    "opacity": "1",
    "contextClasses": [
      "recent-item-icon",
      "recent-item",
      "recent-list"
    ]
  },
  "icon_安全事项类型图标-2.svg": {
    "fileName": "icon_安全事项类型图标-2.svg",
    "title": "安全事项类型图标",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B82F6",
    "fillColor": "",
    "strokeColor": "#3B82F6",
    "opacity": "1",
    "contextClasses": [
      "recent-item-icon",
      "recent-item",
      "recent-list"
    ]
  },
  "icon_安全事项类型图标-3.svg": {
    "fileName": "icon_安全事项类型图标-3.svg",
    "title": "安全事项类型图标",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B82F6",
    "fillColor": "",
    "strokeColor": "#3B82F6",
    "opacity": "1",
    "contextClasses": [
      "recent-item-icon",
      "recent-item",
      "recent-list"
    ]
  },
  "icon_已完成隐患图标.svg": {
    "fileName": "icon_已完成隐患图标.svg",
    "title": "已完成隐患图标",
    "sourceHtml": "page-hazards-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "green",
      "list-item",
      "list-card"
    ]
  },
  "icon_已打卡巡检点位.svg": {
    "fileName": "icon_已打卡巡检点位.svg",
    "title": "已打卡巡检点位",
    "sourceHtml": "page-patrol-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "point-icon",
      "done",
      "point-item",
      "task-card"
    ]
  },
  "icon_应急联系人-1.svg": {
    "fileName": "icon_应急联系人-1.svg",
    "title": "应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_应急联系人-2.svg": {
    "fileName": "icon_应急联系人-2.svg",
    "title": "应急联系人",
    "sourceHtml": "page-dashboard-page.html",
    "width": 24,
    "height": 24,
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
  "icon_开始巡检打卡.svg": {
    "fileName": "icon_开始巡检打卡.svg",
    "title": "开始巡检打卡",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "actions-grid"
    ]
  },
  "icon_待打卡巡检点位.svg": {
    "fileName": "icon_待打卡巡检点位.svg",
    "title": "待打卡巡检点位",
    "sourceHtml": "page-patrol-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "point-icon",
      "point-item",
      "task-card"
    ]
  },
  "icon_快速上报隐患.svg": {
    "fileName": "icon_快速上报隐患.svg",
    "title": "快速上报隐患",
    "sourceHtml": "page-hazards-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_快速新增安全事项.svg": {
    "fileName": "icon_快速新增安全事项.svg",
    "title": "快速新增安全事项",
    "sourceHtml": "page-safety-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_快速新增应急联系人.svg": {
    "fileName": "icon_快速新增应急联系人.svg",
    "title": "快速新增应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_搜索安全事项.svg": {
    "fileName": "icon_搜索安全事项.svg",
    "title": "搜索安全事项",
    "sourceHtml": "page-safety-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "app"
    ]
  },
  "icon_搜索应急联系人.svg": {
    "fileName": "icon_搜索应急联系人.svg",
    "title": "搜索应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "app"
    ]
  },
  "icon_新增安全事项-1.svg": {
    "fileName": "icon_新增安全事项-1.svg",
    "title": "新增安全事项",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "actions-grid"
    ]
  },
  "icon_新增安全事项-2.svg": {
    "fileName": "icon_新增安全事项-2.svg",
    "title": "新增安全事项",
    "sourceHtml": "page-safety-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_新增应急联系人.svg": {
    "fileName": "icon_新增应急联系人.svg",
    "title": "新增应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_新增巡检任务.svg": {
    "fileName": "icon_新增巡检任务.svg",
    "title": "新增巡检任务",
    "sourceHtml": "page-patrol-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_新增隐患上报.svg": {
    "fileName": "icon_新增隐患上报.svg",
    "title": "新增隐患上报",
    "sourceHtml": "page-hazards-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "nav-action",
      "navbar",
      "app"
    ]
  },
  "icon_查看整改进度.svg": {
    "fileName": "icon_查看整改进度.svg",
    "title": "查看整改进度",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "actions-grid"
    ]
  },
  "icon_查看通知消息.svg": {
    "fileName": "icon_查看通知消息.svg",
    "title": "查看通知消息",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "header-icon",
      "header-top",
      "header"
    ]
  },
  "icon_添加巡检点位.svg": {
    "fileName": "icon_添加巡检点位.svg",
    "title": "添加巡检点位",
    "sourceHtml": "page-patrol-create-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0B4F6C",
    "fillColor": "",
    "strokeColor": "#0B4F6C",
    "opacity": "1",
    "contextClasses": [
      "add-point-btn",
      "form-group",
      "form-card"
    ]
  },
  "icon_累计隐患数量.svg": {
    "fileName": "icon_累计隐患数量.svg",
    "title": "累计隐患数量",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F59E0B",
    "fillColor": "",
    "strokeColor": "#F59E0B",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "orange",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_巡检打卡-1.svg": {
    "fileName": "icon_巡检打卡-1.svg",
    "title": "巡检打卡",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
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
  "icon_巡检打卡-2.svg": {
    "fileName": "icon_巡检打卡-2.svg",
    "title": "巡检打卡",
    "sourceHtml": "page-patrol-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_巡检点位图标.svg": {
    "fileName": "icon_巡检点位图标.svg",
    "title": "巡检点位图标",
    "sourceHtml": "page-patrol-create-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "point-row",
      "point-list",
      "form-group"
    ]
  },
  "icon_返回安全事项列表.svg": {
    "fileName": "icon_返回安全事项列表.svg",
    "title": "返回安全事项列表",
    "sourceHtml": "page-safety-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "nav-back",
      "navbar",
      "app"
    ]
  },
  "icon_返回联系人列表.svg": {
    "fileName": "icon_返回联系人列表.svg",
    "title": "返回联系人列表",
    "sourceHtml": "page-contact-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "nav-back",
      "navbar",
      "app"
    ]
  },
  "icon_返回巡检列表.svg": {
    "fileName": "icon_返回巡检列表.svg",
    "title": "返回巡检列表",
    "sourceHtml": "page-patrol-create-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "nav-back",
      "navbar",
      "app"
    ]
  },
  "icon_返回隐患列表.svg": {
    "fileName": "icon_返回隐患列表.svg",
    "title": "返回隐患列表",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "nav-back",
      "navbar",
      "app"
    ]
  },
  "icon_返回首页.svg": {
    "fileName": "icon_返回首页.svg",
    "title": "返回首页",
    "sourceHtml": "page-contacts-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "nav-back",
      "navbar",
      "app"
    ]
  },
  "icon_隐患上报-1.svg": {
    "fileName": "icon_隐患上报-1.svg",
    "title": "隐患上报",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
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
  "icon_隐患上报-2.svg": {
    "fileName": "icon_隐患上报-2.svg",
    "title": "隐患上报",
    "sourceHtml": "page-hazards-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_隐患整改完成率.svg": {
    "fileName": "icon_隐患整改完成率.svg",
    "title": "隐患整改完成率",
    "sourceHtml": "page-dashboard-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "green",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_首页统计看板-1.svg": {
    "fileName": "icon_首页统计看板-1.svg",
    "title": "首页统计看板",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
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
  "icon_首页统计看板-2.svg": {
    "fileName": "icon_首页统计看板-2.svg",
    "title": "首页统计看板",
    "sourceHtml": "page-dashboard-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#20B2AA",
    "fillColor": "",
    "strokeColor": "#20B2AA",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_高风险隐患图标.svg": {
    "fileName": "icon_高风险隐患图标.svg",
    "title": "高风险隐患图标",
    "sourceHtml": "page-hazards-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EF4444",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "item-icon",
      "red",
      "list-item",
      "list-card"
    ]
  }
};
