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
  "icon_上传异常现场照片.svg": {
    "fileName": "icon_上传异常现场照片.svg",
    "title": "上传异常现场照片",
    "sourceHtml": "page-inspection-detail-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "photo-area",
      "check-item",
      "checklist"
    ]
  },
  "icon_上传隐患现场照片.svg": {
    "fileName": "icon_上传隐患现场照片.svg",
    "title": "上传隐患现场照片",
    "sourceHtml": "page-report-risk-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "photo-upload",
      "form-group",
      "form-card"
    ]
  },
  "icon_上报新的风险隐患-1.svg": {
    "fileName": "icon_上报新的风险隐患-1.svg",
    "title": "上报新的风险隐患",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "primary",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_上报新的风险隐患-2.svg": {
    "fileName": "icon_上报新的风险隐患-2.svg",
    "title": "上报新的风险隐患",
    "sourceHtml": "page-risk-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "appbar-action",
      "appbar",
      "page"
    ]
  },
  "icon_今日巡检数量.svg": {
    "fileName": "icon_今日巡检数量.svg",
    "title": "今日巡检数量",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_取消并返回上一页.svg": {
    "fileName": "icon_取消并返回上一页.svg",
    "title": "取消并返回上一页",
    "sourceHtml": "page-report-risk-page.html",
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
      "appbar",
      "page"
    ]
  },
  "icon_安全盾牌图标.svg": {
    "fileName": "icon_安全盾牌图标.svg",
    "title": "安全盾牌图标",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 48 48",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "hero-icon",
      "hero",
      "page"
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
    "defaultColor": "#0F766E",
    "fillColor": "",
    "strokeColor": "#0F766E",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "primary",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_应急电话图标.svg": {
    "fileName": "icon_应急电话图标.svg",
    "title": "应急电话图标",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 48 48",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "emergency-banner-icon",
      "emergency-banner",
      "page"
    ]
  },
  "icon_开始今日巡检任务.svg": {
    "fileName": "icon_开始今日巡检任务.svg",
    "title": "开始今日巡检任务",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "info",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_待处理隐患数量.svg": {
    "fileName": "icon_待处理隐患数量.svg",
    "title": "待处理隐患数量",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97706",
    "fillColor": "",
    "strokeColor": "#D97706",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_快速上报隐患.svg": {
    "fileName": "icon_快速上报隐患.svg",
    "title": "快速上报隐患",
    "sourceHtml": "page-emergency-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "tab-fab",
      "tabbar"
    ]
  },
  "icon_打开个人中心页面-1.svg": {
    "fileName": "icon_打开个人中心页面-1.svg",
    "title": "打开个人中心页面",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "tabbar"
    ]
  },
  "icon_打开个人中心页面-2.svg": {
    "fileName": "icon_打开个人中心页面-2.svg",
    "title": "打开个人中心页面",
    "sourceHtml": "page-profile-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_打开应急联系人页面-1.svg": {
    "fileName": "icon_打开应急联系人页面-1.svg",
    "title": "打开应急联系人页面",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_打开应急联系人页面-2.svg": {
    "fileName": "icon_打开应急联系人页面-2.svg",
    "title": "打开应急联系人页面",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "tabbar"
    ]
  },
  "icon_打开巡检任务页面-1.svg": {
    "fileName": "icon_打开巡检任务页面-1.svg",
    "title": "打开巡检任务页面",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "tabbar"
    ]
  },
  "icon_打开巡检任务页面-2.svg": {
    "fileName": "icon_打开巡检任务页面-2.svg",
    "title": "打开巡检任务页面",
    "sourceHtml": "page-inspection-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "active",
      "tabbar"
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
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "appbar-action",
      "appbar",
      "page"
    ]
  },
  "icon_打开通知设置.svg": {
    "fileName": "icon_打开通知设置.svg",
    "title": "打开通知设置",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0EA5E9",
    "fillColor": "",
    "strokeColor": "#0EA5E9",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "secondary",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_打开隐患列表页面-1.svg": {
    "fileName": "icon_打开隐患列表页面-1.svg",
    "title": "打开隐患列表页面",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "tabbar"
    ]
  },
  "icon_打开隐患列表页面-2.svg": {
    "fileName": "icon_打开隐患列表页面-2.svg",
    "title": "打开隐患列表页面",
    "sourceHtml": "page-risk-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_打开隐私与安全设置.svg": {
    "fileName": "icon_打开隐私与安全设置.svg",
    "title": "打开隐私与安全设置",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97706",
    "fillColor": "",
    "strokeColor": "#D97706",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "warning",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_打开首页统计看板-1.svg": {
    "fileName": "icon_打开首页统计看板-1.svg",
    "title": "打开首页统计看板",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "tabbar"
    ]
  },
  "icon_打开首页统计看板-2.svg": {
    "fileName": "icon_打开首页统计看板-2.svg",
    "title": "打开首页统计看板",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0D9488",
    "fillColor": "",
    "strokeColor": "#0D9488",
    "opacity": "1",
    "contextClasses": [
      "tab-icon",
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_拨打该应急联系人电话.svg": {
    "fileName": "icon_拨打该应急联系人电话.svg",
    "title": "拨打该应急联系人电话",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F766E",
    "fillColor": "",
    "strokeColor": "#0F766E",
    "opacity": "1",
    "contextClasses": [
      "contact-call",
      "contact-card",
      "contact-group"
    ]
  },
  "icon_搜索应急联系人.svg": {
    "fileName": "icon_搜索应急联系人.svg",
    "title": "搜索应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-box",
      "page"
    ]
  },
  "icon_搜索隐患.svg": {
    "fileName": "icon_搜索隐患.svg",
    "title": "搜索隐患",
    "sourceHtml": "page-risk-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "search-box",
      "page"
    ]
  },
  "icon_整改闭环率.svg": {
    "fileName": "icon_整改闭环率.svg",
    "title": "整改闭环率",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#16A34A",
    "fillColor": "",
    "strokeColor": "#16A34A",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "stat-card",
      "stats-grid"
    ]
  },
  "icon_新建巡检任务.svg": {
    "fileName": "icon_新建巡检任务.svg",
    "title": "新建巡检任务",
    "sourceHtml": "page-inspection-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "appbar-action",
      "appbar",
      "page"
    ]
  },
  "icon_暂无动态图标.svg": {
    "fileName": "icon_暂无动态图标.svg",
    "title": "暂无动态图标",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 120 120",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "url(#grad1)",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state"
    ]
  },
  "icon_暂无应急联系人图标.svg": {
    "fileName": "icon_暂无应急联系人图标.svg",
    "title": "暂无应急联系人图标",
    "sourceHtml": "page-emergency-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 120 120",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "url(#grad1)",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "page"
    ]
  },
  "icon_暂无巡检任务图标.svg": {
    "fileName": "icon_暂无巡检任务图标.svg",
    "title": "暂无巡检任务图标",
    "sourceHtml": "page-inspection-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 120 120",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "url(#grad1)",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "page"
    ]
  },
  "icon_暂无隐患图标.svg": {
    "fileName": "icon_暂无隐患图标.svg",
    "title": "暂无隐患图标",
    "sourceHtml": "page-risk-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 120 120",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "url(#grad1)",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "page"
    ]
  },
  "icon_查看全部统计数据.svg": {
    "fileName": "icon_查看全部统计数据.svg",
    "title": "查看全部统计数据",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0EA5E9",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "secondary",
      "quick-item",
      "quick-grid"
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
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "neutral",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_查看帮助与反馈.svg": {
    "fileName": "icon_查看帮助与反馈.svg",
    "title": "查看帮助与反馈",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "neutral",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_查看应急联系人.svg": {
    "fileName": "icon_查看应急联系人.svg",
    "title": "查看应急联系人",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#D97706",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "warning",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_标记该项为异常并上报隐患.svg": {
    "fileName": "icon_标记该项为异常并上报隐患.svg",
    "title": "标记该项为异常并上报隐患",
    "sourceHtml": "page-inspection-detail-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 16 16",
    "paintMode": "stroke",
    "defaultColor": "#DC2626",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "check-btn",
      "fail",
      "check-actions",
      "check-item"
    ]
  },
  "icon_标记该项为正常.svg": {
    "fileName": "icon_标记该项为正常.svg",
    "title": "标记该项为正常",
    "sourceHtml": "page-inspection-detail-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 16 16",
    "paintMode": "stroke",
    "defaultColor": "#16A34A",
    "fillColor": "",
    "strokeColor": "#16A34A",
    "opacity": "1",
    "contextClasses": [
      "check-btn",
      "pass",
      "active",
      "check-actions",
      "check-item"
    ]
  },
  "icon_消防类隐患图标.svg": {
    "fileName": "icon_消防类隐患图标.svg",
    "title": "消防类隐患图标",
    "sourceHtml": "page-risk-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#DC2626",
    "fillColor": "",
    "strokeColor": "#DC2626",
    "opacity": "1",
    "contextClasses": [
      "risk-icon",
      "fire",
      "risk-header",
      "risk-card"
    ]
  },
  "icon_添加应急联系人.svg": {
    "fileName": "icon_添加应急联系人.svg",
    "title": "添加应急联系人",
    "sourceHtml": "page-emergency-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#0F172A",
    "opacity": "1",
    "contextClasses": [
      "appbar-action",
      "appbar",
      "page"
    ]
  },
  "icon_环境类隐患图标.svg": {
    "fileName": "icon_环境类隐患图标.svg",
    "title": "环境类隐患图标",
    "sourceHtml": "page-risk-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#16A34A",
    "fillColor": "",
    "strokeColor": "#16A34A",
    "opacity": "1",
    "contextClasses": [
      "risk-icon",
      "env",
      "risk-header",
      "risk-card"
    ]
  },
  "icon_电气类隐患图标.svg": {
    "fileName": "icon_电气类隐患图标.svg",
    "title": "电气类隐患图标",
    "sourceHtml": "page-risk-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97706",
    "fillColor": "",
    "strokeColor": "#D97706",
    "opacity": "1",
    "contextClasses": [
      "risk-icon",
      "elec",
      "risk-header",
      "risk-card"
    ]
  },
  "icon_返回巡检列表.svg": {
    "fileName": "icon_返回巡检列表.svg",
    "title": "返回巡检列表",
    "sourceHtml": "page-inspection-detail-page.html",
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
      "appbar",
      "page"
    ]
  },
  "icon_返回隐患列表.svg": {
    "fileName": "icon_返回隐患列表.svg",
    "title": "返回隐患列表",
    "sourceHtml": "page-risk-detail-page.html",
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
      "appbar",
      "page"
    ]
  },
  "icon_进入关于页面.svg": {
    "fileName": "icon_进入关于页面.svg",
    "title": "进入关于页面",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_进入导出数据页面.svg": {
    "fileName": "icon_进入导出数据页面.svg",
    "title": "进入导出数据页面",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_进入帮助与反馈页面.svg": {
    "fileName": "icon_进入帮助与反馈页面.svg",
    "title": "进入帮助与反馈页面",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_进入消息通知设置.svg": {
    "fileName": "icon_进入消息通知设置.svg",
    "title": "进入消息通知设置",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_进入隐私与安全设置.svg": {
    "fileName": "icon_进入隐私与安全设置.svg",
    "title": "进入隐私与安全设置",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_逾期隐患数量.svg": {
    "fileName": "icon_逾期隐患数量.svg",
    "title": "逾期隐患数量",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#EA580C",
    "fillColor": "",
    "strokeColor": "#EA580C",
    "opacity": "1",
    "contextClasses": [
      "stat-icon",
      "stat-card",
      "stats-grid"
    ]
  }
};
