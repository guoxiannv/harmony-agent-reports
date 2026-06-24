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
  "icon_PawLog-应用标志.svg": {
    "fileName": "icon_PawLog-应用标志.svg",
    "title": "PawLog 应用标志",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#163832",
    "fillColor": "white",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "app-logo",
      "header-left",
      "header"
    ]
  },
  "icon_体重记录条目.svg": {
    "fileName": "icon_体重记录条目.svg",
    "title": "体重记录条目",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#87CEEB",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "weight",
      "record-item",
      "timeline"
    ]
  },
  "icon_体重趋势面积图.svg": {
    "fileName": "icon_体重趋势面积图.svg",
    "title": "体重趋势面积图",
    "sourceHtml": "page-trends-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 220",
    "paintMode": "fill+stroke",
    "defaultColor": "#163832",
    "fillColor": "url(#areaFill)",
    "strokeColor": "#E3EDEA",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card"
    ]
  },
  "icon_关闭体重记录表单.svg": {
    "fileName": "icon_关闭体重记录表单.svg",
    "title": "关闭体重记录表单",
    "sourceHtml": "page-record-weight-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "close-icon",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_关闭排泄记录表单.svg": {
    "fileName": "icon_关闭排泄记录表单.svg",
    "title": "关闭排泄记录表单",
    "sourceHtml": "page-record-stool-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "close-icon",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_关闭用药记录表单.svg": {
    "fileName": "icon_关闭用药记录表单.svg",
    "title": "关闭用药记录表单",
    "sourceHtml": "page-record-meds-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "close-icon",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_关闭饮食记录表单.svg": {
    "fileName": "icon_关闭饮食记录表单.svg",
    "title": "关闭饮食记录表单",
    "sourceHtml": "page-record-diet-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "close-icon",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_切换当前宠物.svg": {
    "fileName": "icon_切换当前宠物.svg",
    "title": "切换当前宠物",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3D5A52",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-actions",
      "header"
    ]
  },
  "icon_宠物头像-1.svg": {
    "fileName": "icon_宠物头像-1.svg",
    "title": "宠物头像",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#163832",
    "fillColor": "#FFB3C1",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-avatar-wrap",
      "pet-item"
    ]
  },
  "icon_宠物头像-2.svg": {
    "fileName": "icon_宠物头像-2.svg",
    "title": "宠物头像",
    "sourceHtml": "page-pet-editor-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#163832",
    "fillColor": "#3FC0A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "avatar-edit",
      "avatar-section"
    ]
  },
  "icon_家庭成员共享入口.svg": {
    "fileName": "icon_家庭成员共享入口.svg",
    "title": "家庭成员共享入口",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "family-icon",
      "family-header",
      "family-card"
    ]
  },
  "icon_家庭成员头像-1.svg": {
    "fileName": "icon_家庭成员头像-1.svg",
    "title": "家庭成员头像",
    "sourceHtml": "page-family-invite-sheet.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "member-item"
    ]
  },
  "icon_家庭成员头像-2.svg": {
    "fileName": "icon_家庭成员头像-2.svg",
    "title": "家庭成员头像",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFB3C1",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "family-members",
      "family-card"
    ]
  },
  "icon_已完成提醒条目.svg": {
    "fileName": "icon_已完成提醒条目.svg",
    "title": "已完成提醒条目",
    "sourceHtml": "page-care-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "done",
      "section"
    ]
  },
  "icon_当前宠物头像.svg": {
    "fileName": "icon_当前宠物头像.svg",
    "title": "当前宠物头像",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#163832",
    "fillColor": "#3FC0A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-avatar-wrap",
      "pet-item",
      "active"
    ]
  },
  "icon_当前宠物概览头像.svg": {
    "fileName": "icon_当前宠物概览头像.svg",
    "title": "当前宠物概览头像",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#163832",
    "fillColor": "#3FC0A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "hero-pet-avatar",
      "hero-pet",
      "hero-header"
    ]
  },
  "icon_当前选中标记.svg": {
    "fileName": "icon_当前选中标记.svg",
    "title": "当前选中标记",
    "sourceHtml": "page-pet-picker-sheet.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "pet-option-check",
      "pet-option",
      "active",
      "sheet"
    ]
  },
  "icon_我的标签-1.svg": {
    "fileName": "icon_我的标签-1.svg",
    "title": "我的标签",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_我的标签-3.svg": {
    "fileName": "icon_我的标签-3.svg",
    "title": "我的标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#87CEEB",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "blue",
      "menu-item",
      "menu-group"
    ]
  },
  "icon_排泄记录条目.svg": {
    "fileName": "icon_排泄记录条目.svg",
    "title": "排泄记录条目",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#163832",
    "fillColor": "#163832",
    "strokeColor": "#5ED7B6",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "stool",
      "record-item",
      "timeline"
    ]
  },
  "icon_更换头像.svg": {
    "fileName": "icon_更换头像.svg",
    "title": "更换头像",
    "sourceHtml": "page-pet-editor-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "avatar-badge",
      "avatar-edit",
      "avatar-section"
    ]
  },
  "icon_查看关于页面.svg": {
    "fileName": "icon_查看关于页面.svg",
    "title": "查看关于页面",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#B8B8E0",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "lavender",
      "menu-item",
      "menu-group"
    ]
  },
  "icon_添加体重记录.svg": {
    "fileName": "icon_添加体重记录.svg",
    "title": "添加体重记录",
    "sourceHtml": "page-add-record-sheet.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "option-icon",
      "option",
      "weight",
      "grid"
    ]
  },
  "icon_添加宠物档案.svg": {
    "fileName": "icon_添加宠物档案.svg",
    "title": "添加宠物档案",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "pet-add",
      "pet-avatar-wrap",
      "pet-item"
    ]
  },
  "icon_添加排泄记录.svg": {
    "fileName": "icon_添加排泄记录.svg",
    "title": "添加排泄记录",
    "sourceHtml": "page-add-record-sheet.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "option-icon",
      "option",
      "stool",
      "grid"
    ]
  },
  "icon_添加新宠物.svg": {
    "fileName": "icon_添加新宠物.svg",
    "title": "添加新宠物",
    "sourceHtml": "page-pet-picker-sheet.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "add-pet-icon",
      "add-pet-row",
      "sheet"
    ]
  },
  "icon_添加新宠物档案.svg": {
    "fileName": "icon_添加新宠物档案.svg",
    "title": "添加新宠物档案",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3D5A52",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-actions",
      "header"
    ]
  },
  "icon_添加新记录.svg": {
    "fileName": "icon_添加新记录.svg",
    "title": "添加新记录",
    "sourceHtml": "page-records-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3D5A52",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-actions",
      "header"
    ]
  },
  "icon_添加照护项目.svg": {
    "fileName": "icon_添加照护项目.svg",
    "title": "添加照护项目",
    "sourceHtml": "page-care-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3D5A52",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header"
    ]
  },
  "icon_添加用药记录.svg": {
    "fileName": "icon_添加用药记录.svg",
    "title": "添加用药记录",
    "sourceHtml": "page-add-record-sheet.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "option-icon",
      "option",
      "meds",
      "grid"
    ]
  },
  "icon_添加病历图片附件.svg": {
    "fileName": "icon_添加病历图片附件.svg",
    "title": "添加病历图片附件",
    "sourceHtml": "page-medical-case-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#B8B8E0",
    "opacity": "1",
    "contextClasses": [
      "upload-thumb",
      "upload-grid",
      "image-upload"
    ]
  },
  "icon_添加饮食记录.svg": {
    "fileName": "icon_添加饮食记录.svg",
    "title": "添加饮食记录",
    "sourceHtml": "page-add-record-sheet.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "option-icon",
      "option",
      "diet",
      "grid"
    ]
  },
  "icon_照护标签-1.svg": {
    "fileName": "icon_照护标签-1.svg",
    "title": "照护标签",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_照护标签-2.svg": {
    "fileName": "icon_照护标签-2.svg",
    "title": "照护标签",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_照护标签-3.svg": {
    "fileName": "icon_照护标签-3.svg",
    "title": "照护标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_用户头像.svg": {
    "fileName": "icon_用户头像.svg",
    "title": "用户头像",
    "sourceHtml": "page-profile-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "profile-avatar",
      "profile-card"
    ]
  },
  "icon_用药记录条目.svg": {
    "fileName": "icon_用药记录条目.svg",
    "title": "用药记录条目",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#B8B8E0",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "meds",
      "record-item",
      "timeline"
    ]
  },
  "icon_疫苗提醒.svg": {
    "fileName": "icon_疫苗提醒.svg",
    "title": "疫苗提醒",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "urgent",
      "card"
    ]
  },
  "icon_疫苗提醒条目.svg": {
    "fileName": "icon_疫苗提醒条目.svg",
    "title": "疫苗提醒条目",
    "sourceHtml": "page-care-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "urgent",
      "section"
    ]
  },
  "icon_疫苗提醒详情图标.svg": {
    "fileName": "icon_疫苗提醒详情图标.svg",
    "title": "疫苗提醒详情图标",
    "sourceHtml": "page-reminder-detail-page.html",
    "width": 38,
    "height": 38,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FF9AAE",
    "opacity": "1",
    "contextClasses": [
      "detail-icon",
      "detail-card"
    ]
  },
  "icon_病历卡片.svg": {
    "fileName": "icon_病历卡片.svg",
    "title": "病历卡片",
    "sourceHtml": "page-care-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "medical-icon",
      "medical-header",
      "medical-card"
    ]
  },
  "icon_病历详情图标.svg": {
    "fileName": "icon_病历详情图标.svg",
    "title": "病历详情图标",
    "sourceHtml": "page-medical-case-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "detail-icon",
      "detail-header",
      "detail-card"
    ]
  },
  "icon_病历附件图片.svg": {
    "fileName": "icon_病历附件图片.svg",
    "title": "病历附件图片",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#163832",
    "fillColor": "#163832",
    "strokeColor": "#B8B8E0",
    "opacity": "1",
    "contextClasses": [
      "medical-thumb",
      "medical-images",
      "medical-card"
    ]
  },
  "icon_管理宠物档案.svg": {
    "fileName": "icon_管理宠物档案.svg",
    "title": "管理宠物档案",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "mint",
      "menu-item",
      "menu-group"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-btn",
      "weight",
      "quick-item"
    ]
  },
  "icon_记录排泄.svg": {
    "fileName": "icon_记录排泄.svg",
    "title": "记录排泄",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#163832",
    "fillColor": "white",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-btn",
      "stool",
      "quick-item"
    ]
  },
  "icon_记录标签-1.svg": {
    "fileName": "icon_记录标签-1.svg",
    "title": "记录标签",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_记录标签-2.svg": {
    "fileName": "icon_记录标签-2.svg",
    "title": "记录标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_记录标签-3.svg": {
    "fileName": "icon_记录标签-3.svg",
    "title": "记录标签",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-btn",
      "meds",
      "quick-item"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-btn",
      "diet",
      "quick-item"
    ]
  },
  "icon_趋势标签-1.svg": {
    "fileName": "icon_趋势标签-1.svg",
    "title": "趋势标签",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_趋势标签-2.svg": {
    "fileName": "icon_趋势标签-2.svg",
    "title": "趋势标签",
    "sourceHtml": "page-trends-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_趋势标签-3.svg": {
    "fileName": "icon_趋势标签-3.svg",
    "title": "趋势标签",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-medical-case-editor-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3D5A52",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header-left",
      "header"
    ]
  },
  "icon_进入关于页面.svg": {
    "fileName": "icon_进入关于页面.svg",
    "title": "进入关于页面",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-group"
    ]
  },
  "icon_进入照护提醒列表.svg": {
    "fileName": "icon_进入照护提醒列表.svg",
    "title": "进入照护提醒列表",
    "sourceHtml": "page-home-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3FC0A0",
    "fillColor": "",
    "strokeColor": "#5ED7B6",
    "opacity": "1",
    "contextClasses": [
      "card-more",
      "card-header",
      "card"
    ]
  },
  "icon_进入管理宠物页面.svg": {
    "fileName": "icon_进入管理宠物页面.svg",
    "title": "进入管理宠物页面",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-group"
    ]
  },
  "icon_进入设置页面.svg": {
    "fileName": "icon_进入设置页面.svg",
    "title": "进入设置页面",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-group"
    ]
  },
  "icon_选择宠物布丁.svg": {
    "fileName": "icon_选择宠物布丁.svg",
    "title": "选择宠物布丁",
    "sourceHtml": "page-pet-picker-sheet.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#3FC0A0",
    "fillColor": "#3FC0A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-option-avatar",
      "pet-option",
      "active",
      "sheet"
    ]
  },
  "icon_选择宠物年糕.svg": {
    "fileName": "icon_选择宠物年糕.svg",
    "title": "选择宠物年糕",
    "sourceHtml": "page-pet-picker-sheet.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#FFB3C1",
    "fillColor": "#FFB3C1",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-option-avatar",
      "pet-option",
      "sheet"
    ]
  },
  "icon_邀请更多家庭成员.svg": {
    "fileName": "icon_邀请更多家庭成员.svg",
    "title": "邀请更多家庭成员",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#FFB3C1",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "family-members",
      "family-card"
    ]
  },
  "icon_饮食记录条目.svg": {
    "fileName": "icon_饮食记录条目.svg",
    "title": "饮食记录条目",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#F4D0A4",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "diet",
      "record-item",
      "timeline"
    ]
  },
  "icon_首页标签-1.svg": {
    "fileName": "icon_首页标签-1.svg",
    "title": "首页标签",
    "sourceHtml": "page-care-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
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
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_首页标签-3.svg": {
    "fileName": "icon_首页标签-3.svg",
    "title": "首页标签",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#6F8983",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_驱虫提醒.svg": {
    "fileName": "icon_驱虫提醒.svg",
    "title": "驱虫提醒",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "card"
    ]
  },
  "icon_驱虫提醒条目.svg": {
    "fileName": "icon_驱虫提醒条目.svg",
    "title": "驱虫提醒条目",
    "sourceHtml": "page-care-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#163832",
    "fillColor": "",
    "strokeColor": "#3FC0A0",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-item",
      "section"
    ]
  }
};
