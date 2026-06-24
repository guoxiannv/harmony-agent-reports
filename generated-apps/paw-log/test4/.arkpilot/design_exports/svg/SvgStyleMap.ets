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
  "icon_Bobo-头像.svg": {
    "fileName": "icon_Bobo-头像.svg",
    "title": "Bobo 头像",
    "sourceHtml": "page-pets-page.html",
    "width": 34,
    "height": 34,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar-lg",
      "pet-card",
      "pets-list"
    ]
  },
  "icon_Mochi-头像.svg": {
    "fileName": "icon_Mochi-头像.svg",
    "title": "Mochi 头像",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 52,
    "height": 52,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "profile-avatar",
      "profile",
      "app-shell"
    ]
  },
  "icon_Mochi-近-30-天体重趋势图.svg": {
    "fileName": "icon_Mochi-近-30-天体重趋势图.svg",
    "title": "Mochi 近 30 天体重趋势图",
    "sourceHtml": "page-trends-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 160",
    "paintMode": "stroke",
    "defaultColor": "#2E2B29",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card",
      "content"
    ]
  },
  "icon_上传宠物头像.svg": {
    "fileName": "icon_上传宠物头像.svg",
    "title": "上传宠物头像",
    "sourceHtml": "page-add-pet-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "camera-badge",
      "avatar-wrap",
      "avatar-upload"
    ]
  },
  "icon_上传病历附件.svg": {
    "fileName": "icon_上传病历附件.svg",
    "title": "上传病历附件",
    "sourceHtml": "page-add-medical-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8A9E8",
    "fillColor": "",
    "strokeColor": "#B8A9E8",
    "opacity": "1",
    "contextClasses": [
      "attachment-box",
      "form-group",
      "content"
    ]
  },
  "icon_今日排泄次数.svg": {
    "fileName": "icon_今日排泄次数.svg",
    "title": "今日排泄次数",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_今日用药次数.svg": {
    "fileName": "icon_今日用药次数.svg",
    "title": "今日用药次数",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_今日饮食次数.svg": {
    "fileName": "icon_今日饮食次数.svg",
    "title": "今日饮食次数",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_健康标签-1.svg": {
    "fileName": "icon_健康标签-1.svg",
    "title": "健康标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8B2AE",
    "fillColor": "",
    "strokeColor": "#B8B2AE",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_健康标签-2.svg": {
    "fileName": "icon_健康标签-2.svg",
    "title": "健康标签",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_健康洞察图标.svg": {
    "fileName": "icon_健康洞察图标.svg",
    "title": "健康洞察图标",
    "sourceHtml": "page-trends-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "insight-icon",
      "insight-card",
      "content"
    ]
  },
  "icon_最新体重.svg": {
    "fileName": "icon_最新体重.svg",
    "title": "最新体重",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "metric-card",
      "metrics-grid"
    ]
  },
  "icon_切换宠物.svg": {
    "fileName": "icon_切换宠物.svg",
    "title": "切换宠物",
    "sourceHtml": "page-home-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "pet-switcher",
      "header",
      "app-shell"
    ]
  },
  "icon_删除宠物档案.svg": {
    "fileName": "icon_删除宠物档案.svg",
    "title": "删除宠物档案",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-delete",
      "action-row",
      "app-shell"
    ]
  },
  "icon_宠物默认头像占位.svg": {
    "fileName": "icon_宠物默认头像占位.svg",
    "title": "宠物默认头像占位",
    "sourceHtml": "page-add-pet-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "avatar-wrap",
      "avatar-upload",
      "content"
    ]
  },
  "icon_家人标签-1.svg": {
    "fileName": "icon_家人标签-1.svg",
    "title": "家人标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_家人标签-2.svg": {
    "fileName": "icon_家人标签-2.svg",
    "title": "家人标签",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8B2AE",
    "fillColor": "",
    "strokeColor": "#B8B2AE",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_家庭成员头像.svg": {
    "fileName": "icon_家庭成员头像.svg",
    "title": "家庭成员头像",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "member-card",
      "member-list"
    ]
  },
  "icon_展开宠物选择.svg": {
    "fileName": "icon_展开宠物选择.svg",
    "title": "展开宠物选择",
    "sourceHtml": "page-add-medical-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "pet-selector",
      "form-group",
      "content"
    ]
  },
  "icon_已选宠物头像.svg": {
    "fileName": "icon_已选宠物头像.svg",
    "title": "已选宠物头像",
    "sourceHtml": "page-add-medical-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "pet-selector-avatar",
      "pet-selector-left",
      "pet-selector"
    ]
  },
  "icon_当前宠物头像.svg": {
    "fileName": "icon_当前宠物头像.svg",
    "title": "当前宠物头像",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B29",
    "fillColor": "",
    "strokeColor": "#2E2B29",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-switcher",
      "header"
    ]
  },
  "icon_快速记录体重.svg": {
    "fileName": "icon_快速记录体重.svg",
    "title": "快速记录体重",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_快速记录排泄.svg": {
    "fileName": "icon_快速记录排泄.svg",
    "title": "快速记录排泄",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_快速记录用药.svg": {
    "fileName": "icon_快速记录用药.svg",
    "title": "快速记录用药",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_快速记录饮食.svg": {
    "fileName": "icon_快速记录饮食.svg",
    "title": "快速记录饮食",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_打开新增记录.svg": {
    "fileName": "icon_打开新增记录.svg",
    "title": "打开新增记录",
    "sourceHtml": "page-family-page.html",
    "width": 28,
    "height": 28,
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
  "icon_按宠物筛选.svg": {
    "fileName": "icon_按宠物筛选.svg",
    "title": "按宠物筛选",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "active",
      "filter-bar",
      "content"
    ]
  },
  "icon_按类型筛选.svg": {
    "fileName": "icon_按类型筛选.svg",
    "title": "按类型筛选",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5856",
    "fillColor": "",
    "strokeColor": "#5C5856",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "filter-bar",
      "content"
    ]
  },
  "icon_新增一条记录.svg": {
    "fileName": "icon_新增一条记录.svg",
    "title": "新增一条记录",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_查看宠物详情.svg": {
    "fileName": "icon_查看宠物详情.svg",
    "title": "查看宠物详情",
    "sourceHtml": "page-pets-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8B2AE",
    "fillColor": "",
    "strokeColor": "#B8B2AE",
    "opacity": "1",
    "contextClasses": [
      "pet-card",
      "pets-list",
      "content"
    ]
  },
  "icon_添加就医病历.svg": {
    "fileName": "icon_添加就医病历.svg",
    "title": "添加就医病历",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B29",
    "fillColor": "",
    "strokeColor": "#2E2B29",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "blue",
      "action-grid"
    ]
  },
  "icon_添加新宠物.svg": {
    "fileName": "icon_添加新宠物.svg",
    "title": "添加新宠物",
    "sourceHtml": "page-pets-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_添加疫苗或驱虫提醒.svg": {
    "fileName": "icon_添加疫苗或驱虫提醒.svg",
    "title": "添加疫苗或驱虫提醒",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B29",
    "fillColor": "",
    "strokeColor": "#2E2B29",
    "opacity": "1",
    "contextClasses": [
      "action-icon",
      "action-card",
      "pink",
      "action-grid"
    ]
  },
  "icon_爱宠标签-1.svg": {
    "fileName": "icon_爱宠标签-1.svg",
    "title": "爱宠标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8B2AE",
    "fillColor": "",
    "strokeColor": "#B8B2AE",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_爱宠标签-2.svg": {
    "fileName": "icon_爱宠标签-2.svg",
    "title": "爱宠标签",
    "sourceHtml": "page-pets-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_疫苗提醒图标.svg": {
    "fileName": "icon_疫苗提醒图标.svg",
    "title": "疫苗提醒图标",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E88694",
    "fillColor": "",
    "strokeColor": "#E88694",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-card",
      "reminder-list"
    ]
  },
  "icon_移除该家庭成员.svg": {
    "fileName": "icon_移除该家庭成员.svg",
    "title": "移除该家庭成员",
    "sourceHtml": "page-family-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E88694",
    "fillColor": "",
    "strokeColor": "#E88694",
    "opacity": "1",
    "contextClasses": [
      "member-remove",
      "member-card",
      "member-list"
    ]
  },
  "icon_编辑宠物档案.svg": {
    "fileName": "icon_编辑宠物档案.svg",
    "title": "编辑宠物档案",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5856",
    "fillColor": "",
    "strokeColor": "#5C5856",
    "opacity": "1",
    "contextClasses": [
      "edit-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-add-medical-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5856",
    "fillColor": "",
    "strokeColor": "#5C5856",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "app-shell"
    ]
  },
  "icon_选择体重记录类型.svg": {
    "fileName": "icon_选择体重记录类型.svg",
    "title": "选择体重记录类型",
    "sourceHtml": "page-add-record-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "type-grid"
    ]
  },
  "icon_选择宠物.svg": {
    "fileName": "icon_选择宠物.svg",
    "title": "选择宠物",
    "sourceHtml": "page-trends-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "selector",
      "selector-row",
      "content"
    ]
  },
  "icon_选择指标.svg": {
    "fileName": "icon_选择指标.svg",
    "title": "选择指标",
    "sourceHtml": "page-trends-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "selector",
      "selector-row",
      "content"
    ]
  },
  "icon_选择排泄记录类型.svg": {
    "fileName": "icon_选择排泄记录类型.svg",
    "title": "选择排泄记录类型",
    "sourceHtml": "page-add-record-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "type-grid"
    ]
  },
  "icon_选择用药记录类型.svg": {
    "fileName": "icon_选择用药记录类型.svg",
    "title": "选择用药记录类型",
    "sourceHtml": "page-add-record-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "type-grid"
    ]
  },
  "icon_选择疫苗提醒.svg": {
    "fileName": "icon_选择疫苗提醒.svg",
    "title": "选择疫苗提醒",
    "sourceHtml": "page-add-reminder-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "vaccine",
      "active",
      "type-grid"
    ]
  },
  "icon_选择饮食记录类型.svg": {
    "fileName": "icon_选择饮食记录类型.svg",
    "title": "选择饮食记录类型",
    "sourceHtml": "page-add-record-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "active",
      "type-grid"
    ]
  },
  "icon_选择驱虫提醒.svg": {
    "fileName": "icon_选择驱虫提醒.svg",
    "title": "选择驱虫提醒",
    "sourceHtml": "page-add-reminder-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F5C646",
    "fillColor": "",
    "strokeColor": "#F5C646",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "type-btn",
      "deworm",
      "type-grid"
    ]
  },
  "icon_邀请家庭成员图标.svg": {
    "fileName": "icon_邀请家庭成员图标.svg",
    "title": "邀请家庭成员图标",
    "sourceHtml": "page-family-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8A9E8",
    "fillColor": "",
    "strokeColor": "#B8A9E8",
    "opacity": "1",
    "contextClasses": [
      "invite-btn",
      "family-card",
      "content"
    ]
  },
  "icon_首页标签-1.svg": {
    "fileName": "icon_首页标签-1.svg",
    "title": "首页标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B8B2AE",
    "fillColor": "",
    "strokeColor": "#B8B2AE",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_首页标签-2.svg": {
    "fileName": "icon_首页标签-2.svg",
    "title": "首页标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4BBF9A",
    "fillColor": "",
    "strokeColor": "#4BBF9A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab",
      "app-shell"
    ]
  },
  "icon_驱虫提醒图标.svg": {
    "fileName": "icon_驱虫提醒图标.svg",
    "title": "驱虫提醒图标",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E88694",
    "fillColor": "",
    "strokeColor": "#E88694",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-card",
      "overdue",
      "reminder-list"
    ]
  }
};
