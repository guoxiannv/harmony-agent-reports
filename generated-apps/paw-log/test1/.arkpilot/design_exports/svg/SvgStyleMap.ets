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
  "icon_上传病历图片.svg": {
    "fileName": "icon_上传病历图片.svg",
    "title": "上传病历图片",
    "sourceHtml": "page-medical-editor-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "image-picker",
      "form-group",
      "sheet"
    ]
  },
  "icon_今日首页-1.svg": {
    "fileName": "icon_今日首页-1.svg",
    "title": "今日首页",
    "sourceHtml": "page-charts-page.html",
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
  "icon_今日首页-2.svg": {
    "fileName": "icon_今日首页-2.svg",
    "title": "今日首页",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_体重记录.svg": {
    "fileName": "icon_体重记录.svg",
    "title": "体重记录",
    "sourceHtml": "page-records-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2563EB",
    "fillColor": "",
    "strokeColor": "#2563EB",
    "opacity": "1",
    "contextClasses": [
      "timeline-dot",
      "weight",
      "timeline-left",
      "timeline-item"
    ]
  },
  "icon_健康洞察.svg": {
    "fileName": "icon_健康洞察.svg",
    "title": "健康洞察",
    "sourceHtml": "page-charts-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "insight-title",
      "insight-card",
      "container"
    ]
  },
  "icon_关闭编辑.svg": {
    "fileName": "icon_关闭编辑.svg",
    "title": "关闭编辑",
    "sourceHtml": "page-medical-editor-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_关闭邀请.svg": {
    "fileName": "icon_关闭邀请.svg",
    "title": "关闭邀请",
    "sourceHtml": "page-family-invite-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_分享邀请.svg": {
    "fileName": "icon_分享邀请.svg",
    "title": "分享邀请",
    "sourceHtml": "page-family-invite-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#334155",
    "fillColor": "",
    "strokeColor": "#334155",
    "opacity": "1",
    "contextClasses": [
      "secondary-btn",
      "sheet"
    ]
  },
  "icon_切换宠物.svg": {
    "fileName": "icon_切换宠物.svg",
    "title": "切换宠物",
    "sourceHtml": "page-charts-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "pet-select",
      "container"
    ]
  },
  "icon_复制邀请码.svg": {
    "fileName": "icon_复制邀请码.svg",
    "title": "复制邀请码",
    "sourceHtml": "page-family-invite-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "sheet"
    ]
  },
  "icon_宠物奶茶-1.svg": {
    "fileName": "icon_宠物奶茶-1.svg",
    "title": "宠物奶茶",
    "sourceHtml": "page-pets-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-card",
      "pet-grid"
    ]
  },
  "icon_宠物奶茶-2.svg": {
    "fileName": "icon_宠物奶茶-2.svg",
    "title": "宠物奶茶",
    "sourceHtml": "page-reminders-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "reminder-avatar",
      "reminder-item",
      "reminder-list"
    ]
  },
  "icon_宠物奶茶头像占位.svg": {
    "fileName": "icon_宠物奶茶头像占位.svg",
    "title": "宠物奶茶头像占位",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "pet-chip",
      "pet-switcher"
    ]
  },
  "icon_宠物档案.svg": {
    "fileName": "icon_宠物档案.svg",
    "title": "宠物档案",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "icon-mint",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_宠物豆豆-1.svg": {
    "fileName": "icon_宠物豆豆-1.svg",
    "title": "宠物豆豆",
    "sourceHtml": "page-pets-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-card",
      "pet-grid"
    ]
  },
  "icon_宠物豆豆-2.svg": {
    "fileName": "icon_宠物豆豆-2.svg",
    "title": "宠物豆豆",
    "sourceHtml": "page-reminders-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "reminder-avatar",
      "reminder-item",
      "reminder-list"
    ]
  },
  "icon_宠物豆豆头像占位.svg": {
    "fileName": "icon_宠物豆豆头像占位.svg",
    "title": "宠物豆豆头像占位",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "pet-chip",
      "active",
      "pet-switcher"
    ]
  },
  "icon_家庭成员.svg": {
    "fileName": "icon_家庭成员.svg",
    "title": "家庭成员",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7C3AED",
    "fillColor": "",
    "strokeColor": "#7C3AED",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "icon-purple",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_家庭组.svg": {
    "fileName": "icon_家庭组.svg",
    "title": "家庭组",
    "sourceHtml": "page-family-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "group-icon",
      "group-card",
      "container"
    ]
  },
  "icon_当前宠物.svg": {
    "fileName": "icon_当前宠物.svg",
    "title": "当前宠物",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "container"
    ]
  },
  "icon_当前选中宠物.svg": {
    "fileName": "icon_当前选中宠物.svg",
    "title": "当前选中宠物",
    "sourceHtml": "page-charts-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "pet-select",
      "container"
    ]
  },
  "icon_成员头像-1.svg": {
    "fileName": "icon_成员头像-1.svg",
    "title": "成员头像",
    "sourceHtml": "page-family-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "member-card",
      "member-list"
    ]
  },
  "icon_成员头像-2.svg": {
    "fileName": "icon_成员头像-2.svg",
    "title": "成员头像",
    "sourceHtml": "page-family-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "member-card",
      "member-list"
    ]
  },
  "icon_我的-1.svg": {
    "fileName": "icon_我的-1.svg",
    "title": "我的",
    "sourceHtml": "page-charts-page.html",
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
  "icon_我的-2.svg": {
    "fileName": "icon_我的-2.svg",
    "title": "我的",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_打开个人中心.svg": {
    "fileName": "icon_打开个人中心.svg",
    "title": "打开个人中心",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "user-avatar",
      "container"
    ]
  },
  "icon_排泄记录.svg": {
    "fileName": "icon_排泄记录.svg",
    "title": "排泄记录",
    "sourceHtml": "page-records-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C2410C",
    "fillColor": "",
    "strokeColor": "#C2410C",
    "opacity": "1",
    "contextClasses": [
      "timeline-dot",
      "waste",
      "timeline-left",
      "timeline-item"
    ]
  },
  "icon_提醒管理.svg": {
    "fileName": "icon_提醒管理.svg",
    "title": "提醒管理",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FB7185",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "icon-pink",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_查看记录-1.svg": {
    "fileName": "icon_查看记录-1.svg",
    "title": "查看记录",
    "sourceHtml": "page-charts-page.html",
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
  "icon_查看记录-2.svg": {
    "fileName": "icon_查看记录-2.svg",
    "title": "查看记录",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "filter-chip"
    ]
  },
  "icon_查看趋势-1.svg": {
    "fileName": "icon_查看趋势-1.svg",
    "title": "查看趋势",
    "sourceHtml": "page-charts-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_查看趋势-2.svg": {
    "fileName": "icon_查看趋势-2.svg",
    "title": "查看趋势",
    "sourceHtml": "page-home-page.html",
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
  "icon_添加新宠物.svg": {
    "fileName": "icon_添加新宠物.svg",
    "title": "添加新宠物",
    "sourceHtml": "page-pets-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_添加新宠物档案.svg": {
    "fileName": "icon_添加新宠物档案.svg",
    "title": "添加新宠物档案",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "add-pet",
      "pet-switcher",
      "container"
    ]
  },
  "icon_添加新提醒.svg": {
    "fileName": "icon_添加新提醒.svg",
    "title": "添加新提醒",
    "sourceHtml": "page-reminders-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_添加新病历.svg": {
    "fileName": "icon_添加新病历.svg",
    "title": "添加新病历",
    "sourceHtml": "page-medical-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_添加新记录-1.svg": {
    "fileName": "icon_添加新记录-1.svg",
    "title": "添加新记录",
    "sourceHtml": "page-charts-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab-tab",
      "fab-wrap",
      "tab-bar"
    ]
  },
  "icon_添加新记录-2.svg": {
    "fileName": "icon_添加新记录-2.svg",
    "title": "添加新记录",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "filter-chip"
    ]
  },
  "icon_用户头像占位.svg": {
    "fileName": "icon_用户头像占位.svg",
    "title": "用户头像占位",
    "sourceHtml": "page-profile-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#FB7185",
    "opacity": "1",
    "contextClasses": [
      "profile-avatar",
      "profile-card",
      "container"
    ]
  },
  "icon_疫苗提醒-1.svg": {
    "fileName": "icon_疫苗提醒-1.svg",
    "title": "疫苗提醒",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "overdue",
      "reminder-list"
    ]
  },
  "icon_疫苗提醒-2.svg": {
    "fileName": "icon_疫苗提醒-2.svg",
    "title": "疫苗提醒",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#EF4444",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "reminder-list"
    ]
  },
  "icon_病历归档.svg": {
    "fileName": "icon_病历归档.svg",
    "title": "病历归档",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2563EB",
    "fillColor": "",
    "strokeColor": "#2563EB",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "icon-blue",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_记录体重.svg": {
    "fileName": "icon_记录体重.svg",
    "title": "记录体重",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2563EB",
    "fillColor": "",
    "strokeColor": "#2563EB",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "icon-weight",
      "quick-record-btn",
      "quick-record-grid"
    ]
  },
  "icon_记录排泄.svg": {
    "fileName": "icon_记录排泄.svg",
    "title": "记录排泄",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C2410C",
    "fillColor": "",
    "strokeColor": "#C2410C",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "icon-waste",
      "quick-record-btn",
      "quick-record-grid"
    ]
  },
  "icon_记录用药.svg": {
    "fileName": "icon_记录用药.svg",
    "title": "记录用药",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7C3AED",
    "fillColor": "",
    "strokeColor": "#7C3AED",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "icon-medicine",
      "quick-record-btn",
      "quick-record-grid"
    ]
  },
  "icon_记录饮食.svg": {
    "fileName": "icon_记录饮食.svg",
    "title": "记录饮食",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "icon-wrap",
      "icon-food",
      "quick-record-btn",
      "quick-record-grid"
    ]
  },
  "icon_设置.svg": {
    "fileName": "icon_设置.svg",
    "title": "设置",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#64748B",
    "fillColor": "",
    "strokeColor": "#64748B",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "icon-gray",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_豆豆体重趋势折线图.svg": {
    "fileName": "icon_豆豆体重趋势折线图.svg",
    "title": "豆豆体重趋势折线图",
    "sourceHtml": "page-charts-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 180",
    "paintMode": "fill+stroke",
    "defaultColor": "#0F172A",
    "fillColor": "url(#areaFill)",
    "strokeColor": "#E2E8F0",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card",
      "container"
    ]
  },
  "icon_豆豆头像.svg": {
    "fileName": "icon_豆豆头像.svg",
    "title": "豆豆头像",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "hero-avatar",
      "hero",
      "container"
    ]
  },
  "icon_返回.svg": {
    "fileName": "icon_返回.svg",
    "title": "返回",
    "sourceHtml": "page-family-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#334155",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "container"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-pet-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#334155",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "container"
    ]
  },
  "icon_进入宠物档案.svg": {
    "fileName": "icon_进入宠物档案.svg",
    "title": "进入宠物档案",
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
      "menu-item",
      "menu-card",
      "container"
    ]
  },
  "icon_进入家庭成员.svg": {
    "fileName": "icon_进入家庭成员.svg",
    "title": "进入家庭成员",
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
      "menu-item",
      "menu-card",
      "container"
    ]
  },
  "icon_进入提醒管理.svg": {
    "fileName": "icon_进入提醒管理.svg",
    "title": "进入提醒管理",
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
      "menu-item",
      "menu-card",
      "container"
    ]
  },
  "icon_进入病历归档.svg": {
    "fileName": "icon_进入病历归档.svg",
    "title": "进入病历归档",
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
      "menu-item",
      "menu-card",
      "container"
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
      "menu-item",
      "menu-card",
      "container"
    ]
  },
  "icon_选择宠物头像.svg": {
    "fileName": "icon_选择宠物头像.svg",
    "title": "选择宠物头像",
    "sourceHtml": "page-pet-editor-sheet.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#94A3B8",
    "fillColor": "",
    "strokeColor": "#94A3B8",
    "opacity": "1",
    "contextClasses": [
      "avatar-picker",
      "sheet"
    ]
  },
  "icon_邀请家庭成员.svg": {
    "fileName": "icon_邀请家庭成员.svg",
    "title": "邀请家庭成员",
    "sourceHtml": "page-family-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "invite-btn",
      "container"
    ]
  },
  "icon_饮食记录.svg": {
    "fileName": "icon_饮食记录.svg",
    "title": "饮食记录",
    "sourceHtml": "page-records-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#14B8A6",
    "fillColor": "",
    "strokeColor": "#14B8A6",
    "opacity": "1",
    "contextClasses": [
      "timeline-dot",
      "food",
      "timeline-left",
      "timeline-item"
    ]
  },
  "icon_驱虫提醒.svg": {
    "fileName": "icon_驱虫提醒.svg",
    "title": "驱虫提醒",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0F172A",
    "fillColor": "",
    "strokeColor": "#F59E0B",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "soon",
      "reminder-list"
    ]
  }
};
