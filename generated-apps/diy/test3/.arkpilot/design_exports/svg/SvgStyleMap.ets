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
    "sourceHtml": "page-classes-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "nav",
      "calendar-header"
    ]
  },
  "icon_上传新作品图.svg": {
    "fileName": "icon_上传新作品图.svg",
    "title": "上传新作品图",
    "sourceHtml": "page-profile-edit-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "work",
      "add",
      "gallery-edit",
      "page"
    ]
  },
  "icon_下个月.svg": {
    "fileName": "icon_下个月.svg",
    "title": "下个月",
    "sourceHtml": "page-classes-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "nav",
      "calendar-header"
    ]
  },
  "icon_今日签到.svg": {
    "fileName": "icon_今日签到.svg",
    "title": "今日签到",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFBF6",
    "fillColor": "",
    "strokeColor": "#FFFBF6",
    "opacity": "1",
    "contextClasses": [
      "checkin-btn",
      "checkin-section",
      "page"
    ]
  },
  "icon_会员头像-1.svg": {
    "fileName": "icon_会员头像-1.svg",
    "title": "会员头像",
    "sourceHtml": "page-dormant-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "row",
      "member-card"
    ]
  },
  "icon_会员头像-2.svg": {
    "fileName": "icon_会员头像-2.svg",
    "title": "会员头像",
    "sourceHtml": "page-profile-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "profile-card",
      "page"
    ]
  },
  "icon_作品图1.svg": {
    "fileName": "icon_作品图1.svg",
    "title": "作品图1",
    "sourceHtml": "page-profile-edit-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "work",
      "gallery-edit",
      "page"
    ]
  },
  "icon_作品图2.svg": {
    "fileName": "icon_作品图2.svg",
    "title": "作品图2",
    "sourceHtml": "page-profile-edit-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "work",
      "gallery-edit",
      "page"
    ]
  },
  "icon_兑换积分.svg": {
    "fileName": "icon_兑换积分.svg",
    "title": "兑换积分",
    "sourceHtml": "page-points-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B84A3D",
    "fillColor": "",
    "strokeColor": "#B84A3D",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "red",
      "list-item",
      "list-card"
    ]
  },
  "icon_库存不足.svg": {
    "fileName": "icon_库存不足.svg",
    "title": "库存不足",
    "sourceHtml": "page-classes-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B84A3D",
    "fillColor": "",
    "strokeColor": "#B84A3D",
    "opacity": "1",
    "contextClasses": [
      "tag",
      "stock",
      "slot-tags",
      "slot-body"
    ]
  },
  "icon_库存物品图标.svg": {
    "fileName": "icon_库存物品图标.svg",
    "title": "库存物品图标",
    "sourceHtml": "page-inventory-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "row",
      "item-card"
    ]
  },
  "icon_库存管理入口.svg": {
    "fileName": "icon_库存管理入口.svg",
    "title": "库存管理入口",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "menu-item",
      "menu-card"
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
    "defaultColor": "#B84A3D",
    "fillColor": "",
    "strokeColor": "#B84A3D",
    "opacity": "1",
    "contextClasses": [
      "alert",
      "page"
    ]
  },
  "icon_库存预警提示.svg": {
    "fileName": "icon_库存预警提示.svg",
    "title": "库存预警提示",
    "sourceHtml": "page-class-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B84A3D",
    "fillColor": "",
    "strokeColor": "#B84A3D",
    "opacity": "1",
    "contextClasses": [
      "alert",
      "page"
    ]
  },
  "icon_我的-1.svg": {
    "fileName": "icon_我的-1.svg",
    "title": "我的",
    "sourceHtml": "page-classes-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_我的-2.svg": {
    "fileName": "icon_我的-2.svg",
    "title": "我的",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_打开沉睡会员提醒.svg": {
    "fileName": "icon_打开沉睡会员提醒.svg",
    "title": "打开沉睡会员提醒",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_无课程.svg": {
    "fileName": "icon_无课程.svg",
    "title": "无课程",
    "sourceHtml": "page-classes-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无作品.svg": {
    "fileName": "icon_暂无作品.svg",
    "title": "暂无作品",
    "sourceHtml": "page-profile-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无动态.svg": {
    "fileName": "icon_暂无动态.svg",
    "title": "暂无动态",
    "sourceHtml": "page-home-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无工艺标签.svg": {
    "fileName": "icon_暂无工艺标签.svg",
    "title": "暂无工艺标签",
    "sourceHtml": "page-profile-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无库存.svg": {
    "fileName": "icon_暂无库存.svg",
    "title": "暂无库存",
    "sourceHtml": "page-inventory-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无沉睡会员.svg": {
    "fileName": "icon_暂无沉睡会员.svg",
    "title": "暂无沉睡会员",
    "sourceHtml": "page-dormant-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无消费记录.svg": {
    "fileName": "icon_暂无消费记录.svg",
    "title": "暂无消费记录",
    "sourceHtml": "page-points-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无积分明细.svg": {
    "fileName": "icon_暂无积分明细.svg",
    "title": "暂无积分明细",
    "sourceHtml": "page-points-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_暂无耗材.svg": {
    "fileName": "icon_暂无耗材.svg",
    "title": "暂无耗材",
    "sourceHtml": "page-class-detail-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DCC8B0",
    "fillColor": "",
    "strokeColor": "#DCC8B0",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page"
    ]
  },
  "icon_添加作品图.svg": {
    "fileName": "icon_添加作品图.svg",
    "title": "添加作品图",
    "sourceHtml": "page-profile-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "work",
      "add",
      "gallery",
      "page"
    ]
  },
  "icon_添加工艺标签.svg": {
    "fileName": "icon_添加工艺标签.svg",
    "title": "添加工艺标签",
    "sourceHtml": "page-profile-edit-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFBF6",
    "fillColor": "",
    "strokeColor": "#FFFBF6",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "add-row",
      "page"
    ]
  },
  "icon_积分-1.svg": {
    "fileName": "icon_积分-1.svg",
    "title": "积分",
    "sourceHtml": "page-classes-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_积分-2.svg": {
    "fileName": "icon_积分-2.svg",
    "title": "积分",
    "sourceHtml": "page-points-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_积分明细.svg": {
    "fileName": "icon_积分明细.svg",
    "title": "积分明细",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "action-tile",
      "quick-actions"
    ]
  },
  "icon_签到积分.svg": {
    "fileName": "icon_签到积分.svg",
    "title": "签到积分",
    "sourceHtml": "page-points-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4D8A72",
    "fillColor": "",
    "strokeColor": "#4D8A72",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "green",
      "list-item",
      "list-card"
    ]
  },
  "icon_编辑会员档案.svg": {
    "fileName": "icon_编辑会员档案.svg",
    "title": "编辑会员档案",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_耗材图标.svg": {
    "fileName": "icon_耗材图标.svg",
    "title": "耗材图标",
    "sourceHtml": "page-class-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "material-item",
      "material-list"
    ]
  },
  "icon_课程-1.svg": {
    "fileName": "icon_课程-1.svg",
    "title": "课程",
    "sourceHtml": "page-classes-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_课程-2.svg": {
    "fileName": "icon_课程-2.svg",
    "title": "课程",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_课程积分.svg": {
    "fileName": "icon_课程积分.svg",
    "title": "课程积分",
    "sourceHtml": "page-points-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C99E3A",
    "fillColor": "",
    "strokeColor": "#C99E3A",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "yellow",
      "list-item",
      "list-card"
    ]
  },
  "icon_返回.svg": {
    "fileName": "icon_返回.svg",
    "title": "返回",
    "sourceHtml": "page-class-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "page"
    ]
  },
  "icon_进入库存管理.svg": {
    "fileName": "icon_进入库存管理.svg",
    "title": "进入库存管理",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_预约课程.svg": {
    "fileName": "icon_预约课程.svg",
    "title": "预约课程",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "icon",
      "action-tile",
      "quick-actions"
    ]
  },
  "icon_首页-1.svg": {
    "fileName": "icon_首页-1.svg",
    "title": "首页",
    "sourceHtml": "page-classes-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A89A8E",
    "fillColor": "",
    "strokeColor": "#A89A8E",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar"
    ]
  },
  "icon_首页-2.svg": {
    "fileName": "icon_首页-2.svg",
    "title": "首页",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A65D48",
    "fillColor": "",
    "strokeColor": "#A65D48",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar"
    ]
  }
};
