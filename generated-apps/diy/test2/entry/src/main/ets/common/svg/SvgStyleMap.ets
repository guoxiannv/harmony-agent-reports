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
  "icon_今日木作课程图标.svg": {
    "fileName": "icon_今日木作课程图标.svg",
    "title": "今日木作课程图标",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "today-icon",
      "today-row",
      "today-card"
    ]
  },
  "icon_今日陶艺课程图标.svg": {
    "fileName": "icon_今日陶艺课程图标.svg",
    "title": "今日陶艺课程图标",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "today-icon",
      "today-row",
      "today-card"
    ]
  },
  "icon_会员列表为空.svg": {
    "fileName": "icon_会员列表为空.svg",
    "title": "会员列表为空",
    "sourceHtml": "page-members.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C8BBAF",
    "fillColor": "",
    "strokeColor": "#C8BBAF",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_会员列表标签-1.svg": {
    "fileName": "icon_会员列表标签-1.svg",
    "title": "会员列表标签",
    "sourceHtml": "page-courses.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B9AEA4",
    "fillColor": "",
    "strokeColor": "#B9AEA4",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_会员列表标签-2.svg": {
    "fileName": "icon_会员列表标签-2.svg",
    "title": "会员列表标签",
    "sourceHtml": "page-members.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_兑换积分记录图标.svg": {
    "fileName": "icon_兑换积分记录图标.svg",
    "title": "兑换积分记录图标",
    "sourceHtml": "page-member-detail.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "history-icon",
      "history-left",
      "history-item"
    ]
  },
  "icon_切换到上个月.svg": {
    "fileName": "icon_切换到上个月.svg",
    "title": "切换到上个月",
    "sourceHtml": "page-courses.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A2D28",
    "fillColor": "",
    "strokeColor": "#3A2D28",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-header"
    ]
  },
  "icon_切换到下个月.svg": {
    "fileName": "icon_切换到下个月.svg",
    "title": "切换到下个月",
    "sourceHtml": "page-courses.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A2D28",
    "fillColor": "",
    "strokeColor": "#3A2D28",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-header"
    ]
  },
  "icon_已选中该沉睡会员.svg": {
    "fileName": "icon_已选中该沉睡会员.svg",
    "title": "已选中该沉睡会员",
    "sourceHtml": "page-sleeping-members.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A2D28",
    "fillColor": "",
    "strokeColor": "#FFFDFA",
    "opacity": "1",
    "contextClasses": [
      "member-checkbox",
      "checked",
      "member-card",
      "member-list"
    ]
  },
  "icon_库存管理标签-1.svg": {
    "fileName": "icon_库存管理标签-1.svg",
    "title": "库存管理标签",
    "sourceHtml": "page-courses.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B9AEA4",
    "fillColor": "",
    "strokeColor": "#B9AEA4",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_库存管理标签-2.svg": {
    "fileName": "icon_库存管理标签-2.svg",
    "title": "库存管理标签",
    "sourceHtml": "page-inventory.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_我的设置标签-1.svg": {
    "fileName": "icon_我的设置标签-1.svg",
    "title": "我的设置标签",
    "sourceHtml": "page-courses.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B9AEA4",
    "fillColor": "",
    "strokeColor": "#B9AEA4",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_我的设置标签-2.svg": {
    "fileName": "icon_我的设置标签-2.svg",
    "title": "我的设置标签",
    "sourceHtml": "page-profile.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_打开会员筛选面板.svg": {
    "fileName": "icon_打开会员筛选面板.svg",
    "title": "打开会员筛选面板",
    "sourceHtml": "page-members.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A2D28",
    "fillColor": "",
    "strokeColor": "#3A2D28",
    "opacity": "1",
    "contextClasses": [
      "filter-btn",
      "search-bar",
      "page"
    ]
  },
  "icon_打开签到与消费录入页面.svg": {
    "fileName": "icon_打开签到与消费录入页面.svg",
    "title": "打开签到与消费录入页面",
    "sourceHtml": "page-home.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBF8F5",
    "fillColor": "",
    "strokeColor": "#FBF8F5",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_新增会员按钮.svg": {
    "fileName": "icon_新增会员按钮.svg",
    "title": "新增会员按钮",
    "sourceHtml": "page-members.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBF8F5",
    "fillColor": "",
    "strokeColor": "#FBF8F5",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "page"
    ]
  },
  "icon_新增库存材料按钮.svg": {
    "fileName": "icon_新增库存材料按钮.svg",
    "title": "新增库存材料按钮",
    "sourceHtml": "page-inventory.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBF8F5",
    "fillColor": "",
    "strokeColor": "#FBF8F5",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "page"
    ]
  },
  "icon_新增课程按钮.svg": {
    "fileName": "icon_新增课程按钮.svg",
    "title": "新增课程按钮",
    "sourceHtml": "page-courses.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBF8F5",
    "fillColor": "",
    "strokeColor": "#FBF8F5",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "page"
    ]
  },
  "icon_木材材料图标.svg": {
    "fileName": "icon_木材材料图标.svg",
    "title": "木材材料图标",
    "sourceHtml": "page-inventory.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-card",
      "inventory-list"
    ]
  },
  "icon_沉睡会员提醒入口.svg": {
    "fileName": "icon_沉睡会员提醒入口.svg",
    "title": "沉睡会员提醒入口",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBF8F5",
    "fillColor": "",
    "strokeColor": "#FBF8F5",
    "opacity": "1",
    "contextClasses": [
      "sleeping-header",
      "sleeping-card",
      "page"
    ]
  },
  "icon_沉睡会员汇总图标.svg": {
    "fileName": "icon_沉睡会员汇总图标.svg",
    "title": "沉睡会员汇总图标",
    "sourceHtml": "page-sleeping-members.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9A96D",
    "fillColor": "",
    "strokeColor": "#D9A96D",
    "opacity": "1",
    "contextClasses": [
      "hero-icon",
      "hero-card",
      "page"
    ]
  },
  "icon_消费积分记录图标.svg": {
    "fileName": "icon_消费积分记录图标.svg",
    "title": "消费积分记录图标",
    "sourceHtml": "page-points.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "history-icon",
      "history-left",
      "history-item"
    ]
  },
  "icon_签到积分记录图标.svg": {
    "fileName": "icon_签到积分记录图标.svg",
    "title": "签到积分记录图标",
    "sourceHtml": "page-member-detail.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "history-icon",
      "history-left",
      "history-item"
    ]
  },
  "icon_课程容量图标.svg": {
    "fileName": "icon_课程容量图标.svg",
    "title": "课程容量图标",
    "sourceHtml": "page-course-detail.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9A96D",
    "fillColor": "",
    "strokeColor": "#D9A96D",
    "opacity": "1",
    "contextClasses": [
      "hero-meta-icon",
      "hero-meta-row",
      "hero-meta"
    ]
  },
  "icon_课程日历标签-1.svg": {
    "fileName": "icon_课程日历标签-1.svg",
    "title": "课程日历标签",
    "sourceHtml": "page-courses.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_课程日历标签-2.svg": {
    "fileName": "icon_课程日历标签-2.svg",
    "title": "课程日历标签",
    "sourceHtml": "page-home.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B9AEA4",
    "fillColor": "",
    "strokeColor": "#B9AEA4",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_课程时间图标.svg": {
    "fileName": "icon_课程时间图标.svg",
    "title": "课程时间图标",
    "sourceHtml": "page-course-detail.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9A96D",
    "fillColor": "",
    "strokeColor": "#D9A96D",
    "opacity": "1",
    "contextClasses": [
      "hero-meta-icon",
      "hero-meta-row",
      "hero-meta"
    ]
  },
  "icon_课程积分记录图标.svg": {
    "fileName": "icon_课程积分记录图标.svg",
    "title": "课程积分记录图标",
    "sourceHtml": "page-member-detail.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "history-icon",
      "history-left",
      "history-item"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-check-in.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A2D28",
    "fillColor": "",
    "strokeColor": "#3A2D28",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "page"
    ]
  },
  "icon_釉料材料图标.svg": {
    "fileName": "icon_釉料材料图标.svg",
    "title": "釉料材料图标",
    "sourceHtml": "page-inventory.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-card",
      "inventory-list"
    ]
  },
  "icon_陶土材料图标.svg": {
    "fileName": "icon_陶土材料图标.svg",
    "title": "陶土材料图标",
    "sourceHtml": "page-inventory.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-card",
      "inventory-list"
    ]
  },
  "icon_首页标签-1.svg": {
    "fileName": "icon_首页标签-1.svg",
    "title": "首页标签",
    "sourceHtml": "page-courses.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B9AEA4",
    "fillColor": "",
    "strokeColor": "#B9AEA4",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_首页标签-2.svg": {
    "fileName": "icon_首页标签-2.svg",
    "title": "首页标签",
    "sourceHtml": "page-home.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B88363",
    "fillColor": "",
    "strokeColor": "#B88363",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  }
};
