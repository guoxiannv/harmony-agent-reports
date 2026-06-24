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
  "icon_page-patrol-01.svg": {
    "fileName": "icon_page-patrol-01.svg",
    "title": "",
    "sourceHtml": "page-patrol.html",
    "width": 90,
    "height": 90,
    "viewBox": "0 0 100 100",
    "paintMode": "color",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "summary-card"
    ]
  },
  "icon_关闭隐患.svg": {
    "fileName": "icon_关闭隐患.svg",
    "title": "关闭隐患",
    "sourceHtml": "page-issue-detail.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#475569",
    "fillColor": "",
    "strokeColor": "#475569",
    "opacity": "1",
    "contextClasses": [
      "btn-ghost",
      "action-bar"
    ]
  },
  "icon_导出统计报告.svg": {
    "fileName": "icon_导出统计报告.svg",
    "title": "导出统计报告",
    "sourceHtml": "page-stats.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "export-btn"
    ]
  },
  "icon_应急联系人-1.svg": {
    "fileName": "icon_应急联系人-1.svg",
    "title": "应急联系人",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_应急联系人-2.svg": {
    "fileName": "icon_应急联系人-2.svg",
    "title": "应急联系人",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "tabbar"
    ]
  },
  "icon_开始今日巡检.svg": {
    "fileName": "icon_开始今日巡检.svg",
    "title": "开始今日巡检",
    "sourceHtml": "page-home.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_快速上报隐患.svg": {
    "fileName": "icon_快速上报隐患.svg",
    "title": "快速上报隐患",
    "sourceHtml": "page-home.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_拍摄巡检现场照片.svg": {
    "fileName": "icon_拍摄巡检现场照片.svg",
    "title": "拍摄巡检现场照片",
    "sourceHtml": "page-patrol-checkin.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "photo-btn",
      "photo-row",
      "sheet"
    ]
  },
  "icon_拍摄隐患现场照片.svg": {
    "fileName": "icon_拍摄隐患现场照片.svg",
    "title": "拍摄隐患现场照片",
    "sourceHtml": "page-issue-form.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "photo-slot",
      "photo-add",
      "photo-grid",
      "field"
    ]
  },
  "icon_拨打园区医务室.svg": {
    "fileName": "icon_拨打园区医务室.svg",
    "title": "拨打园区医务室",
    "sourceHtml": "page-contacts.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "list"
    ]
  },
  "icon_拨打安保值班室.svg": {
    "fileName": "icon_拨打安保值班室.svg",
    "title": "拨打安保值班室",
    "sourceHtml": "page-contacts.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "list"
    ]
  },
  "icon_拨打张主管.svg": {
    "fileName": "icon_拨打张主管.svg",
    "title": "拨打张主管",
    "sourceHtml": "page-contacts.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "list"
    ]
  },
  "icon_拨打消防中控室.svg": {
    "fileName": "icon_拨打消防中控室.svg",
    "title": "拨打消防中控室",
    "sourceHtml": "page-contacts.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "list"
    ]
  },
  "icon_搜索联系人.svg": {
    "fileName": "icon_搜索联系人.svg",
    "title": "搜索联系人",
    "sourceHtml": "page-contacts.html",
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
  "icon_搜索隐患.svg": {
    "fileName": "icon_搜索隐患.svg",
    "title": "搜索隐患",
    "sourceHtml": "page-issues.html",
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
  "icon_新建隐患或事项.svg": {
    "fileName": "icon_新建隐患或事项.svg",
    "title": "新建隐患或事项",
    "sourceHtml": "page-issues.html",
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
  "icon_查看应急联系人.svg": {
    "fileName": "icon_查看应急联系人.svg",
    "title": "查看应急联系人",
    "sourceHtml": "page-home.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_查看通知消息.svg": {
    "fileName": "icon_查看通知消息.svg",
    "title": "查看通知消息",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_添加应急联系人.svg": {
    "fileName": "icon_添加应急联系人.svg",
    "title": "添加应急联系人",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_统计看板-1.svg": {
    "fileName": "icon_统计看板-1.svg",
    "title": "统计看板",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "tabbar"
    ]
  },
  "icon_统计看板-2.svg": {
    "fileName": "icon_统计看板-2.svg",
    "title": "统计看板",
    "sourceHtml": "page-stats.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_该点位已巡检完成.svg": {
    "fileName": "icon_该点位已巡检完成.svg",
    "title": "该点位已巡检完成",
    "sourceHtml": "page-patrol.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#059669",
    "fillColor": "",
    "strokeColor": "#059669",
    "opacity": "1",
    "contextClasses": [
      "point-marker",
      "marker-done",
      "point-card",
      "list"
    ]
  },
  "icon_巡检打卡-1.svg": {
    "fileName": "icon_巡检打卡-1.svg",
    "title": "巡检打卡",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "tabbar"
    ]
  },
  "icon_巡检打卡-2.svg": {
    "fileName": "icon_巡检打卡-2.svg",
    "title": "巡检打卡",
    "sourceHtml": "page-patrol.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_返回上一级.svg": {
    "fileName": "icon_返回上一级.svg",
    "title": "返回上一级",
    "sourceHtml": "page-contact-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header"
    ]
  },
  "icon_进入隐患详情.svg": {
    "fileName": "icon_进入隐患详情.svg",
    "title": "进入隐患详情",
    "sourceHtml": "page-issues.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "issue-card",
      "critical",
      "list"
    ]
  },
  "icon_重大风险隐患标识.svg": {
    "fileName": "icon_重大风险隐患标识.svg",
    "title": "重大风险隐患标识",
    "sourceHtml": "page-issue-detail.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "0.9",
    "contextClasses": [
      "hero-icon",
      "hero"
    ]
  },
  "icon_隐患与事项-1.svg": {
    "fileName": "icon_隐患与事项-1.svg",
    "title": "隐患与事项",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "tabbar"
    ]
  },
  "icon_隐患与事项-2.svg": {
    "fileName": "icon_隐患与事项-2.svg",
    "title": "隐患与事项",
    "sourceHtml": "page-issues.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "active",
      "tabbar"
    ]
  },
  "icon_隐患数量七日趋势图.svg": {
    "fileName": "icon_隐患数量七日趋势图.svg",
    "title": "隐患数量七日趋势图",
    "sourceHtml": "page-stats.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 140",
    "paintMode": "fill+stroke",
    "defaultColor": "#0F172A",
    "fillColor": "url(#trendFill)",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card"
    ]
  },
  "icon_首页工作台-1.svg": {
    "fileName": "icon_首页工作台-1.svg",
    "title": "首页工作台",
    "sourceHtml": "page-contacts.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "tabbar"
    ]
  },
  "icon_首页工作台-2.svg": {
    "fileName": "icon_首页工作台-2.svg",
    "title": "首页工作台",
    "sourceHtml": "page-home.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab",
      "active",
      "tabbar"
    ]
  }
};
