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
  "icon_一键呼叫应急联系人.svg": {
    "fileName": "icon_一键呼叫应急联系人.svg",
    "title": "一键呼叫应急联系人",
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
      "quick-icon",
      "danger",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_今日待办图标.svg": {
    "fileName": "icon_今日待办图标.svg",
    "title": "今日待办图标",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "app-shell"
    ]
  },
  "icon_区域排名图标.svg": {
    "fileName": "icon_区域排名图标.svg",
    "title": "区域排名图标",
    "sourceHtml": "page-stats-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "app-shell"
    ]
  },
  "icon_同步本地数据到云端.svg": {
    "fileName": "icon_同步本地数据到云端.svg",
    "title": "同步本地数据到云端",
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
      "menu-icon",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_呼叫医务室值班.svg": {
    "fileName": "icon_呼叫医务室值班.svg",
    "title": "呼叫医务室值班",
    "sourceHtml": "page-contacts-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "contact-list"
    ]
  },
  "icon_呼叫张工.svg": {
    "fileName": "icon_呼叫张工.svg",
    "title": "呼叫张工",
    "sourceHtml": "page-contacts-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "contact-list"
    ]
  },
  "icon_呼叫李安全.svg": {
    "fileName": "icon_呼叫李安全.svg",
    "title": "呼叫李安全",
    "sourceHtml": "page-contacts-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "call-btn",
      "contact-card",
      "contact-list"
    ]
  },
  "icon_工作台标签-1.svg": {
    "fileName": "icon_工作台标签-1.svg",
    "title": "工作台标签",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_工作台标签-2.svg": {
    "fileName": "icon_工作台标签-2.svg",
    "title": "工作台标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar",
      "app-shell"
    ]
  },
  "icon_应急联系人标签-1.svg": {
    "fileName": "icon_应急联系人标签-1.svg",
    "title": "应急联系人标签",
    "sourceHtml": "page-contacts-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar",
      "app-shell"
    ]
  },
  "icon_应急联系人标签-2.svg": {
    "fileName": "icon_应急联系人标签-2.svg",
    "title": "应急联系人标签",
    "sourceHtml": "page-hazard-page.html",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_开始同步.svg": {
    "fileName": "icon_开始同步.svg",
    "title": "开始同步",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_开始巡检打卡.svg": {
    "fileName": "icon_开始巡检打卡.svg",
    "title": "开始巡检打卡",
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
      "quick-icon",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_快捷操作图标.svg": {
    "fileName": "icon_快捷操作图标.svg",
    "title": "快捷操作图标",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "app-shell"
    ]
  },
  "icon_我的标签-1.svg": {
    "fileName": "icon_我的标签-1.svg",
    "title": "我的标签",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_我的标签-2.svg": {
    "fileName": "icon_我的标签-2.svg",
    "title": "我的标签",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar",
      "app-shell"
    ]
  },
  "icon_打开应用设置.svg": {
    "fileName": "icon_打开应用设置.svg",
    "title": "打开应用设置",
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
      "menu-icon",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_打开通知中心.svg": {
    "fileName": "icon_打开通知中心.svg",
    "title": "打开通知中心",
    "sourceHtml": "page-home-page.html",
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
      "header-top",
      "header-banner"
    ]
  },
  "icon_拍摄现场照片.svg": {
    "fileName": "icon_拍摄现场照片.svg",
    "title": "拍摄现场照片",
    "sourceHtml": "page-hazard-edit-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "photo-upload",
      "section",
      "app-shell"
    ]
  },
  "icon_搜索联系人图标.svg": {
    "fileName": "icon_搜索联系人图标.svg",
    "title": "搜索联系人图标",
    "sourceHtml": "page-contacts-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#334155",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "app-shell"
    ]
  },
  "icon_搜索隐患图标.svg": {
    "fileName": "icon_搜索隐患图标.svg",
    "title": "搜索隐患图标",
    "sourceHtml": "page-hazard-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#334155",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "app-shell"
    ]
  },
  "icon_新建隐患上报.svg": {
    "fileName": "icon_新建隐患上报.svg",
    "title": "新建隐患上报",
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
      "quick-icon",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_新建隐患浮动按钮.svg": {
    "fileName": "icon_新建隐患浮动按钮.svg",
    "title": "新建隐患浮动按钮",
    "sourceHtml": "page-hazard-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "app-shell"
    ]
  },
  "icon_新建隐患记录.svg": {
    "fileName": "icon_新建隐患记录.svg",
    "title": "新建隐患记录",
    "sourceHtml": "page-hazard-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "page-header",
      "app-shell"
    ]
  },
  "icon_查看关于应用信息.svg": {
    "fileName": "icon_查看关于应用信息.svg",
    "title": "查看关于应用信息",
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
      "menu-icon",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_查看更多快捷功能.svg": {
    "fileName": "icon_查看更多快捷功能.svg",
    "title": "查看更多快捷功能",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "secondary",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_添加应急联系人.svg": {
    "fileName": "icon_添加应急联系人.svg",
    "title": "添加应急联系人",
    "sourceHtml": "page-contacts-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "page-header",
      "app-shell"
    ]
  },
  "icon_点位已打卡.svg": {
    "fileName": "icon_点位已打卡.svg",
    "title": "点位已打卡",
    "sourceHtml": "page-patrol-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#10B981",
    "fillColor": "",
    "strokeColor": "#10B981",
    "opacity": "1",
    "contextClasses": [
      "checkpoint-status",
      "done",
      "checkpoint-item",
      "checkpoint-list"
    ]
  },
  "icon_点位未打卡.svg": {
    "fileName": "icon_点位未打卡.svg",
    "title": "点位未打卡",
    "sourceHtml": "page-patrol-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "checkpoint-status",
      "todo",
      "checkpoint-item",
      "checkpoint-list"
    ]
  },
  "icon_统计看板标签-1.svg": {
    "fileName": "icon_统计看板标签-1.svg",
    "title": "统计看板标签",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_统计看板标签-2.svg": {
    "fileName": "icon_统计看板标签-2.svg",
    "title": "统计看板标签",
    "sourceHtml": "page-stats-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar",
      "app-shell"
    ]
  },
  "icon_编辑当前隐患.svg": {
    "fileName": "icon_编辑当前隐患.svg",
    "title": "编辑当前隐患",
    "sourceHtml": "page-hazard-detail-page.html",
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
      "nav-bar",
      "app-shell"
    ]
  },
  "icon_巡检打卡标签.svg": {
    "fileName": "icon_巡检打卡标签.svg",
    "title": "巡检打卡标签",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_巡检点位图标.svg": {
    "fileName": "icon_巡检点位图标.svg",
    "title": "巡检点位图标",
    "sourceHtml": "page-patrol-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "app-shell"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-hazard-detail-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "nav-bar",
      "app-shell"
    ]
  },
  "icon_进入关于页面.svg": {
    "fileName": "icon_进入关于页面.svg",
    "title": "进入关于页面",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_进入设置.svg": {
    "fileName": "icon_进入设置.svg",
    "title": "进入设置",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_隐患管理标签-1.svg": {
    "fileName": "icon_隐患管理标签-1.svg",
    "title": "隐患管理标签",
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
      "tabbar",
      "app-shell"
    ]
  },
  "icon_隐患管理标签-2.svg": {
    "fileName": "icon_隐患管理标签-2.svg",
    "title": "隐患管理标签",
    "sourceHtml": "page-hazard-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar",
      "app-shell"
    ]
  },
  "icon_隐患趋势图标.svg": {
    "fileName": "icon_隐患趋势图标.svg",
    "title": "隐患趋势图标",
    "sourceHtml": "page-stats-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "app-shell"
    ]
  }
};
