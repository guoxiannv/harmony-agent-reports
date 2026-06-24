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
  "icon_上个月.svg": {
    "fileName": "icon_上个月.svg",
    "title": "上个月",
    "sourceHtml": "page-calendar-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#3D2E26",
    "opacity": "1",
    "contextClasses": [
      "month-nav",
      "calendar-header"
    ]
  },
  "icon_下个月.svg": {
    "fileName": "icon_下个月.svg",
    "title": "下个月",
    "sourceHtml": "page-calendar-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#3D2E26",
    "opacity": "1",
    "contextClasses": [
      "month-nav",
      "calendar-header"
    ]
  },
  "icon_个人简介.svg": {
    "fileName": "icon_个人简介.svg",
    "title": "个人简介",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_低库存警告图标.svg": {
    "fileName": "icon_低库存警告图标.svg",
    "title": "低库存警告图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C45A4B",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "alert-banner",
      "card",
      "content"
    ]
  },
  "icon_作品图片占位-1.svg": {
    "fileName": "icon_作品图片占位-1.svg",
    "title": "作品图片占位 1",
    "sourceHtml": "page-profile-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "0.5",
    "contextClasses": [
      "work-item",
      "gallery",
      "card"
    ]
  },
  "icon_作品图片占位-2.svg": {
    "fileName": "icon_作品图片占位-2.svg",
    "title": "作品图片占位 2",
    "sourceHtml": "page-profile-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "0.5",
    "contextClasses": [
      "work-item",
      "gallery",
      "card"
    ]
  },
  "icon_作品图片占位-3.svg": {
    "fileName": "icon_作品图片占位-3.svg",
    "title": "作品图片占位 3",
    "sourceHtml": "page-profile-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "0.5",
    "contextClasses": [
      "work-item",
      "gallery",
      "card"
    ]
  },
  "icon_作品图集.svg": {
    "fileName": "icon_作品图集.svg",
    "title": "作品图集",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_关于入口.svg": {
    "fileName": "icon_关于入口.svg",
    "title": "关于入口",
    "sourceHtml": "page-my-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#8A9A8C",
    "opacity": "1",
    "contextClasses": [
      "menu-item-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_切换到会员列表-1.svg": {
    "fileName": "icon_切换到会员列表-1.svg",
    "title": "切换到会员列表",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到会员列表-2.svg": {
    "fileName": "icon_切换到会员列表-2.svg",
    "title": "切换到会员列表",
    "sourceHtml": "page-members-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C17A53",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到我的-1.svg": {
    "fileName": "icon_切换到我的-1.svg",
    "title": "切换到我的",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到我的-2.svg": {
    "fileName": "icon_切换到我的-2.svg",
    "title": "切换到我的",
    "sourceHtml": "page-my-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C17A53",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到课程日历-1.svg": {
    "fileName": "icon_切换到课程日历-1.svg",
    "title": "切换到课程日历",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C17A53",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到课程日历-2.svg": {
    "fileName": "icon_切换到课程日历-2.svg",
    "title": "切换到课程日历",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到首页-1.svg": {
    "fileName": "icon_切换到首页-1.svg",
    "title": "切换到首页",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_切换到首页-2.svg": {
    "fileName": "icon_切换到首页-2.svg",
    "title": "切换到首页",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C17A53",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_前往积分明细.svg": {
    "fileName": "icon_前往积分明细.svg",
    "title": "前往积分明细",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "1",
    "contextClasses": [
      "points-arrow",
      "card",
      "points-card",
      "content"
    ]
  },
  "icon_库存不足警告.svg": {
    "fileName": "icon_库存不足警告.svg",
    "title": "库存不足警告",
    "sourceHtml": "page-booking-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C45A4B",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "warning-box",
      "card",
      "content"
    ]
  },
  "icon_库存扣减.svg": {
    "fileName": "icon_库存扣减.svg",
    "title": "库存扣减",
    "sourceHtml": "page-booking-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_库存管理入口.svg": {
    "fileName": "icon_库存管理入口.svg",
    "title": "库存管理入口",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#8A9A8C",
    "opacity": "1",
    "contextClasses": [
      "menu-item-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_库存预警.svg": {
    "fileName": "icon_库存预警.svg",
    "title": "库存预警",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_当日无课程插画.svg": {
    "fileName": "icon_当日无课程插画.svg",
    "title": "当日无课程插画",
    "sourceHtml": "page-calendar-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_待上课程标记.svg": {
    "fileName": "icon_待上课程标记.svg",
    "title": "待上课程标记",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "lesson-card",
      "content"
    ]
  },
  "icon_扣减记录.svg": {
    "fileName": "icon_扣减记录.svg",
    "title": "扣减记录",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_批量唤醒会员.svg": {
    "fileName": "icon_批量唤醒会员.svg",
    "title": "批量唤醒会员",
    "sourceHtml": "page-dormant-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "wake-all",
      "content",
      "app-shell"
    ]
  },
  "icon_搜索会员.svg": {
    "fileName": "icon_搜索会员.svg",
    "title": "搜索会员",
    "sourceHtml": "page-members-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "content",
      "app-shell"
    ]
  },
  "icon_擅长工艺.svg": {
    "fileName": "icon_擅长工艺.svg",
    "title": "擅长工艺",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_新增物料.svg": {
    "fileName": "icon_新增物料.svg",
    "title": "新增物料",
    "sourceHtml": "page-inventory-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_暂无会员插画.svg": {
    "fileName": "icon_暂无会员插画.svg",
    "title": "暂无会员插画",
    "sourceHtml": "page-members-page.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "content",
      "app-shell"
    ]
  },
  "icon_暂无作品插画.svg": {
    "fileName": "icon_暂无作品插画.svg",
    "title": "暂无作品插画",
    "sourceHtml": "page-profile-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_暂无内容插画.svg": {
    "fileName": "icon_暂无内容插画.svg",
    "title": "暂无内容插画",
    "sourceHtml": "page-home-page.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "card",
      "empty-state",
      "content",
      "app-shell"
    ]
  },
  "icon_暂无扣减记录插画.svg": {
    "fileName": "icon_暂无扣减记录插画.svg",
    "title": "暂无扣减记录插画",
    "sourceHtml": "page-inventory-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_暂无擅长工艺.svg": {
    "fileName": "icon_暂无擅长工艺.svg",
    "title": "暂无擅长工艺",
    "sourceHtml": "page-profile-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_暂无沉睡会员插画.svg": {
    "fileName": "icon_暂无沉睡会员插画.svg",
    "title": "暂无沉睡会员插画",
    "sourceHtml": "page-dormant-page.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_暂无物料插画.svg": {
    "fileName": "icon_暂无物料插画.svg",
    "title": "暂无物料插画",
    "sourceHtml": "page-inventory-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_暂无积分记录插画.svg": {
    "fileName": "icon_暂无积分记录插画.svg",
    "title": "暂无积分记录插画",
    "sourceHtml": "page-points-page.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#E6D5C7",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "content",
      "app-shell"
    ]
  },
  "icon_木作课程图标.svg": {
    "fileName": "icon_木作课程图标.svg",
    "title": "木作课程图标",
    "sourceHtml": "page-booking-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#8A9A8C",
    "opacity": "1",
    "contextClasses": [
      "course-icon",
      "course-option",
      "card"
    ]
  },
  "icon_木料物料图标.svg": {
    "fileName": "icon_木料物料图标.svg",
    "title": "木料物料图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#8A9A8C",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-left",
      "inventory-item"
    ]
  },
  "icon_查看会员档案.svg": {
    "fileName": "icon_查看会员档案.svg",
    "title": "查看会员档案",
    "sourceHtml": "page-members-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "list-right",
      "list-item",
      "list-card"
    ]
  },
  "icon_沉睡会员列表.svg": {
    "fileName": "icon_沉睡会员列表.svg",
    "title": "沉睡会员列表",
    "sourceHtml": "page-dormant-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_沉睡会员提醒入口.svg": {
    "fileName": "icon_沉睡会员提醒入口.svg",
    "title": "沉睡会员提醒入口",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "menu-item-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_消费积分图标.svg": {
    "fileName": "icon_消费积分图标.svg",
    "title": "消费积分图标",
    "sourceHtml": "page-points-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "1",
    "contextClasses": [
      "list-icon",
      "list-left",
      "list-item"
    ]
  },
  "icon_添加作品照片.svg": {
    "fileName": "icon_添加作品照片.svg",
    "title": "添加作品照片",
    "sourceHtml": "page-profile-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "0.5",
    "contextClasses": [
      "work-item",
      "add-work",
      "gallery",
      "card"
    ]
  },
  "icon_添加新会员.svg": {
    "fileName": "icon_添加新会员.svg",
    "title": "添加新会员",
    "sourceHtml": "page-members-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_物料库存.svg": {
    "fileName": "icon_物料库存.svg",
    "title": "物料库存",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_积分兑换图标.svg": {
    "fileName": "icon_积分兑换图标.svg",
    "title": "积分兑换图标",
    "sourceHtml": "page-points-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "list-icon",
      "list-left",
      "list-item"
    ]
  },
  "icon_签到打卡图标.svg": {
    "fileName": "icon_签到打卡图标.svg",
    "title": "签到打卡图标",
    "sourceHtml": "page-home-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C17A53",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "checkin-btn",
      "checkin-card",
      "content"
    ]
  },
  "icon_签到积分图标.svg": {
    "fileName": "icon_签到积分图标.svg",
    "title": "签到积分图标",
    "sourceHtml": "page-points-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "list-icon",
      "list-left",
      "list-item"
    ]
  },
  "icon_设置入口.svg": {
    "fileName": "icon_设置入口.svg",
    "title": "设置入口",
    "sourceHtml": "page-my-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "menu-item-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-booking-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_进入关于.svg": {
    "fileName": "icon_进入关于.svg",
    "title": "进入关于",
    "sourceHtml": "page-my-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "menu-item-right",
      "menu-item",
      "card"
    ]
  },
  "icon_进入库存管理.svg": {
    "fileName": "icon_进入库存管理.svg",
    "title": "进入库存管理",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "menu-item-right",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_进入沉睡提醒.svg": {
    "fileName": "icon_进入沉睡提醒.svg",
    "title": "进入沉睡提醒",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "menu-item-right",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_进入设置.svg": {
    "fileName": "icon_进入设置.svg",
    "title": "进入设置",
    "sourceHtml": "page-my-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A665B",
    "fillColor": "",
    "strokeColor": "#7A665B",
    "opacity": "1",
    "contextClasses": [
      "menu-item-right",
      "menu-item",
      "card"
    ]
  },
  "icon_退出登录.svg": {
    "fileName": "icon_退出登录.svg",
    "title": "退出登录",
    "sourceHtml": "page-my-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C45A4B",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "logout-btn",
      "content",
      "app-shell"
    ]
  },
  "icon_选中日期课程.svg": {
    "fileName": "icon_选中日期课程.svg",
    "title": "选中日期课程",
    "sourceHtml": "page-calendar-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_选择课程.svg": {
    "fileName": "icon_选择课程.svg",
    "title": "选择课程",
    "sourceHtml": "page-booking-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_釉料物料图标.svg": {
    "fileName": "icon_釉料物料图标.svg",
    "title": "釉料物料图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C45A4B",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-left",
      "inventory-item",
      "inventory-low"
    ]
  },
  "icon_陶土物料图标.svg": {
    "fileName": "icon_陶土物料图标.svg",
    "title": "陶土物料图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "inventory-icon",
      "inventory-left",
      "inventory-item"
    ]
  },
  "icon_陶艺课程图标-1.svg": {
    "fileName": "icon_陶艺课程图标-1.svg",
    "title": "陶艺课程图标",
    "sourceHtml": "page-booking-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "course-icon",
      "course-option",
      "selected",
      "card"
    ]
  },
  "icon_陶艺课程图标-2.svg": {
    "fileName": "icon_陶艺课程图标-2.svg",
    "title": "陶艺课程图标",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#A85D3C",
    "opacity": "1",
    "contextClasses": [
      "lesson-icon",
      "lesson-row",
      "card",
      "lesson-card"
    ]
  },
  "icon_预约信息.svg": {
    "fileName": "icon_预约信息.svg",
    "title": "预约信息",
    "sourceHtml": "page-booking-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2E26",
    "fillColor": "",
    "strokeColor": "#C17A53",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "card",
      "content"
    ]
  },
  "icon_预约新课程.svg": {
    "fileName": "icon_预约新课程.svg",
    "title": "预约新课程",
    "sourceHtml": "page-home-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "primary-small",
      "card",
      "lesson-card",
      "content"
    ]
  }
};
