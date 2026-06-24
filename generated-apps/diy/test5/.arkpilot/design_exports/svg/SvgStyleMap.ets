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
  "icon_会员作品图占位.svg": {
    "fileName": "icon_会员作品图占位.svg",
    "title": "会员作品图占位",
    "sourceHtml": "page-member-detail-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#B88B6F",
    "opacity": "1",
    "contextClasses": [
      "gallery-item",
      "gallery",
      "card"
    ]
  },
  "icon_会员标签-1.svg": {
    "fileName": "icon_会员标签-1.svg",
    "title": "会员标签",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9C3A0",
    "fillColor": "",
    "strokeColor": "#D9C3A0",
    "opacity": "0.75",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_会员标签-2.svg": {
    "fileName": "icon_会员标签-2.svg",
    "title": "会员标签",
    "sourceHtml": "page-members-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_低库存预警图标-1.svg": {
    "fileName": "icon_低库存预警图标-1.svg",
    "title": "低库存预警图标",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#E08A52",
    "opacity": "1",
    "contextClasses": [
      "banner-icon",
      "banner",
      "alert",
      "section"
    ]
  },
  "icon_低库存预警图标-2.svg": {
    "fileName": "icon_低库存预警图标-2.svg",
    "title": "低库存预警图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B84A3E",
    "fillColor": "",
    "strokeColor": "#B84A3E",
    "opacity": "1",
    "contextClasses": [
      "warning-title",
      "card",
      "warning-card",
      "section"
    ]
  },
  "icon_导出工作室数据.svg": {
    "fileName": "icon_导出工作室数据.svg",
    "title": "导出工作室数据",
    "sourceHtml": "page-profile-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "action-card",
      "action-row"
    ]
  },
  "icon_已预约标记.svg": {
    "fileName": "icon_已预约标记.svg",
    "title": "已预约标记",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "course-card-header",
      "course-card",
      "booked",
      "timeline-item"
    ]
  },
  "icon_库存标签-1.svg": {
    "fileName": "icon_库存标签-1.svg",
    "title": "库存标签",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9C3A0",
    "fillColor": "",
    "strokeColor": "#D9C3A0",
    "opacity": "0.75",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_库存标签-2.svg": {
    "fileName": "icon_库存标签-2.svg",
    "title": "库存标签",
    "sourceHtml": "page-inventory-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_我的标签-1.svg": {
    "fileName": "icon_我的标签-1.svg",
    "title": "我的标签",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9C3A0",
    "fillColor": "",
    "strokeColor": "#D9C3A0",
    "opacity": "0.75",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
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
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_打开会员筛选.svg": {
    "fileName": "icon_打开会员筛选.svg",
    "title": "打开会员筛选",
    "sourceHtml": "page-members-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-row",
      "sticky-header"
    ]
  },
  "icon_打开关于与设置.svg": {
    "fileName": "icon_打开关于与设置.svg",
    "title": "打开关于与设置",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "hero-header",
      "hero"
    ]
  },
  "icon_打开库存设置.svg": {
    "fileName": "icon_打开库存设置.svg",
    "title": "打开库存设置",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-row",
      "sticky-header"
    ]
  },
  "icon_打开课程设置.svg": {
    "fileName": "icon_打开课程设置.svg",
    "title": "打开课程设置",
    "sourceHtml": "page-courses-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-row",
      "sticky-header"
    ]
  },
  "icon_搜索会员图标.svg": {
    "fileName": "icon_搜索会员图标.svg",
    "title": "搜索会员图标",
    "sourceHtml": "page-members-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#7A6A5C",
    "opacity": "1",
    "contextClasses": [
      "search-box",
      "sticky-header",
      "page-root"
    ]
  },
  "icon_搜索库存图标.svg": {
    "fileName": "icon_搜索库存图标.svg",
    "title": "搜索库存图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#7A6A5C",
    "opacity": "1",
    "contextClasses": [
      "search-box",
      "sticky-header",
      "page-root"
    ]
  },
  "icon_新增库存物品.svg": {
    "fileName": "icon_新增库存物品.svg",
    "title": "新增库存物品",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_新增课程.svg": {
    "fileName": "icon_新增课程.svg",
    "title": "新增课程",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_查看关于手作印记.svg": {
    "fileName": "icon_查看关于手作印记.svg",
    "title": "查看关于手作印记",
    "sourceHtml": "page-profile-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#6E8078",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "action-card",
      "action-row"
    ]
  },
  "icon_查看积分排行.svg": {
    "fileName": "icon_查看积分排行.svg",
    "title": "查看积分排行",
    "sourceHtml": "page-home-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#6E8078",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_沉睡会员提醒图标.svg": {
    "fileName": "icon_沉睡会员提醒图标.svg",
    "title": "沉睡会员提醒图标",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#B84A3E",
    "opacity": "1",
    "contextClasses": [
      "banner-icon",
      "banner",
      "warn",
      "section"
    ]
  },
  "icon_添加新会员.svg": {
    "fileName": "icon_添加新会员.svg",
    "title": "添加新会员",
    "sourceHtml": "page-members-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_添加新作品.svg": {
    "fileName": "icon_添加新作品.svg",
    "title": "添加新作品",
    "sourceHtml": "page-member-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A2593B",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "add-work",
      "gallery",
      "card"
    ]
  },
  "icon_编辑会员档案.svg": {
    "fileName": "icon_编辑会员档案.svg",
    "title": "编辑会员档案",
    "sourceHtml": "page-member-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "nav-btn",
      "top-nav",
      "page-root"
    ]
  },
  "icon_耗材库存不足警告.svg": {
    "fileName": "icon_耗材库存不足警告.svg",
    "title": "耗材库存不足警告",
    "sourceHtml": "page-course-booking-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#B84A3E",
    "opacity": "1",
    "contextClasses": [
      "warning-box",
      "section",
      "page-root"
    ]
  },
  "icon_课程标签-1.svg": {
    "fileName": "icon_课程标签-1.svg",
    "title": "课程标签",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_课程标签-2.svg": {
    "fileName": "icon_课程标签-2.svg",
    "title": "课程标签",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9C3A0",
    "fillColor": "",
    "strokeColor": "#D9C3A0",
    "opacity": "0.75",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-course-booking-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#3E2F27",
    "opacity": "1",
    "contextClasses": [
      "nav-btn",
      "top-nav",
      "page-root"
    ]
  },
  "icon_进入库存管理-1.svg": {
    "fileName": "icon_进入库存管理-1.svg",
    "title": "进入库存管理",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A2593B",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "banner-arrow",
      "banner",
      "alert",
      "section"
    ]
  },
  "icon_进入库存管理-2.svg": {
    "fileName": "icon_进入库存管理-2.svg",
    "title": "进入库存管理",
    "sourceHtml": "page-home-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3E2F27",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "quick-card",
      "quick-grid"
    ]
  },
  "icon_进入沉睡会员列表.svg": {
    "fileName": "icon_进入沉睡会员列表.svg",
    "title": "进入沉睡会员列表",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A2593B",
    "fillColor": "",
    "strokeColor": "#A2593B",
    "opacity": "1",
    "contextClasses": [
      "banner-arrow",
      "banner",
      "warn",
      "section"
    ]
  },
  "icon_首页标签-1.svg": {
    "fileName": "icon_首页标签-1.svg",
    "title": "首页标签",
    "sourceHtml": "page-courses-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9C3A0",
    "fillColor": "",
    "strokeColor": "#D9C3A0",
    "opacity": "0.75",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_首页标签-2.svg": {
    "fileName": "icon_首页标签-2.svg",
    "title": "首页标签",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F7F4EF",
    "fillColor": "",
    "strokeColor": "#F7F4EF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  }
};
