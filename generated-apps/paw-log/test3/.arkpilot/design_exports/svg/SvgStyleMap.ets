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
  "icon_page-health-page-02.svg": {
    "fileName": "icon_page-health-page-02.svg",
    "title": "",
    "sourceHtml": "page-health-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "",
    "paintMode": "color",
    "defaultColor": "#1F2937",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card",
      "section"
    ]
  },
  "icon_体重记录类型.svg": {
    "fileName": "icon_体重记录类型.svg",
    "title": "体重记录类型",
    "sourceHtml": "page-record-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "type-cell",
      "type-grid",
      "form-group"
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
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
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
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_关于宠迹.svg": {
    "fileName": "icon_关于宠迹.svg",
    "title": "关于宠迹",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8B6ACB",
    "fillColor": "",
    "strokeColor": "#8B6ACB",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "lilac",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_分享邀请码.svg": {
    "fileName": "icon_分享邀请码.svg",
    "title": "分享邀请码",
    "sourceHtml": "page-member-invite-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "code-btn",
      "secondary",
      "code-actions",
      "code-card"
    ]
  },
  "icon_切换宠物.svg": {
    "fileName": "icon_切换宠物.svg",
    "title": "切换宠物",
    "sourceHtml": "page-health-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "pet-switcher",
      "header",
      "page"
    ]
  },
  "icon_切换宠物展开按钮.svg": {
    "fileName": "icon_切换宠物展开按钮.svg",
    "title": "切换宠物展开按钮",
    "sourceHtml": "page-home-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "pet-name",
      "pet-info",
      "header-left"
    ]
  },
  "icon_删除标签.svg": {
    "fileName": "icon_删除标签.svg",
    "title": "删除标签",
    "sourceHtml": "page-pet-editor-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "tag",
      "tags-input",
      "form-group"
    ]
  },
  "icon_复制邀请码.svg": {
    "fileName": "icon_复制邀请码.svg",
    "title": "复制邀请码",
    "sourceHtml": "page-member-invite-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "code-btn",
      "primary",
      "code-actions",
      "code-card"
    ]
  },
  "icon_宠物头像.svg": {
    "fileName": "icon_宠物头像.svg",
    "title": "宠物头像",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "shared-pet-avatar",
      "shared-pet-item",
      "shared-pet-list"
    ]
  },
  "icon_宠物头像占位.svg": {
    "fileName": "icon_宠物头像占位.svg",
    "title": "宠物头像占位",
    "sourceHtml": "page-pet-editor-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "avatar-picker",
      "avatar-section",
      "page"
    ]
  },
  "icon_宠物年糕头像.svg": {
    "fileName": "icon_宠物年糕头像.svg",
    "title": "宠物年糕头像",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "pet-grid-avatar",
      "pet-grid-item",
      "pet-grid"
    ]
  },
  "icon_宠物筛选.svg": {
    "fileName": "icon_宠物筛选.svg",
    "title": "宠物筛选",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "active",
      "filters",
      "page"
    ]
  },
  "icon_宠物豆豆头像.svg": {
    "fileName": "icon_宠物豆豆头像.svg",
    "title": "宠物豆豆头像",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "pet-grid-avatar",
      "pet-grid-item",
      "pet-grid"
    ]
  },
  "icon_家庭成员邀请插图.svg": {
    "fileName": "icon_家庭成员邀请插图.svg",
    "title": "家庭成员邀请插图",
    "sourceHtml": "page-member-invite-page.html",
    "width": 96,
    "height": 96,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "invite-hero",
      "page"
    ]
  },
  "icon_家庭标签-1.svg": {
    "fileName": "icon_家庭标签-1.svg",
    "title": "家庭标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_家庭标签-2.svg": {
    "fileName": "icon_家庭标签-2.svg",
    "title": "家庭标签",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_导出数据.svg": {
    "fileName": "icon_导出数据.svg",
    "title": "导出数据",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4A9B9E",
    "fillColor": "",
    "strokeColor": "#4A9B9E",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "sky",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_应用设置.svg": {
    "fileName": "icon_应用设置.svg",
    "title": "应用设置",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "mint",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_当前用户头像.svg": {
    "fileName": "icon_当前用户头像.svg",
    "title": "当前用户头像",
    "sourceHtml": "page-profile-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "profile-avatar",
      "profile-card",
      "page"
    ]
  },
  "icon_当前选中宠物头像.svg": {
    "fileName": "icon_当前选中宠物头像.svg",
    "title": "当前选中宠物头像",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "header-left",
      "header"
    ]
  },
  "icon_快捷添加新记录.svg": {
    "fileName": "icon_快捷添加新记录.svg",
    "title": "快捷添加新记录",
    "sourceHtml": "page-family-page.html",
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
      "fab-wrap",
      "tabbar"
    ]
  },
  "icon_我的标签.svg": {
    "fileName": "icon_我的标签.svg",
    "title": "我的标签",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_打开记录类型选择器.svg": {
    "fileName": "icon_打开记录类型选择器.svg",
    "title": "打开记录类型选择器",
    "sourceHtml": "page-home-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "quick-log-btn",
      "quick-log-section",
      "page"
    ]
  },
  "icon_打开设置.svg": {
    "fileName": "icon_打开设置.svg",
    "title": "打开设置",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_排泄记录类型.svg": {
    "fileName": "icon_排泄记录类型.svg",
    "title": "排泄记录类型",
    "sourceHtml": "page-record-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "type-cell",
      "type-grid",
      "form-group"
    ]
  },
  "icon_搜索图标.svg": {
    "fileName": "icon_搜索图标.svg",
    "title": "搜索图标",
    "sourceHtml": "page-records-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "search-icon",
      "search-bar",
      "page"
    ]
  },
  "icon_日期筛选.svg": {
    "fileName": "icon_日期筛选.svg",
    "title": "日期筛选",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "filters",
      "page"
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
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "avatar-edit-badge",
      "avatar-picker",
      "avatar-section"
    ]
  },
  "icon_查看今日提醒.svg": {
    "fileName": "icon_查看今日提醒.svg",
    "title": "查看今日提醒",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-right",
      "header"
    ]
  },
  "icon_添加就医病历.svg": {
    "fileName": "icon_添加就医病历.svg",
    "title": "添加就医病历",
    "sourceHtml": "page-health-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "section-header",
      "section"
    ]
  },
  "icon_添加新宠物档案.svg": {
    "fileName": "icon_添加新宠物档案.svg",
    "title": "添加新宠物档案",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header-right",
      "header"
    ]
  },
  "icon_添加新记录.svg": {
    "fileName": "icon_添加新记录.svg",
    "title": "添加新记录",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_添加疫苗或驱虫提醒.svg": {
    "fileName": "icon_添加疫苗或驱虫提醒.svg",
    "title": "添加疫苗或驱虫提醒",
    "sourceHtml": "page-health-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "section-header",
      "section"
    ]
  },
  "icon_添加病历图片.svg": {
    "fileName": "icon_添加病历图片.svg",
    "title": "添加病历图片",
    "sourceHtml": "page-medical-record-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "photo-add",
      "photo-grid",
      "form-group"
    ]
  },
  "icon_用药记录类型.svg": {
    "fileName": "icon_用药记录类型.svg",
    "title": "用药记录类型",
    "sourceHtml": "page-record-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "type-cell",
      "type-grid",
      "form-group"
    ]
  },
  "icon_疫苗提醒.svg": {
    "fileName": "icon_疫苗提醒.svg",
    "title": "疫苗提醒",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C98A0A",
    "fillColor": "",
    "strokeColor": "#C98A0A",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "vaccine",
      "reminder-row",
      "reminder-list"
    ]
  },
  "icon_病历图片预览.svg": {
    "fileName": "icon_病历图片预览.svg",
    "title": "病历图片预览",
    "sourceHtml": "page-medical-record-editor-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D96C5A",
    "fillColor": "",
    "strokeColor": "#D96C5A",
    "opacity": "1",
    "contextClasses": [
      "photo-thumb",
      "photo-grid",
      "form-group"
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
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "section-header",
      "section"
    ]
  },
  "icon_类型筛选.svg": {
    "fileName": "icon_类型筛选.svg",
    "title": "类型筛选",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "filters",
      "page"
    ]
  },
  "icon_记录标签-1.svg": {
    "fileName": "icon_记录标签-1.svg",
    "title": "记录标签",
    "sourceHtml": "page-family-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_记录标签-2.svg": {
    "fileName": "icon_记录标签-2.svg",
    "title": "记录标签",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_返回上一页.svg": {
    "fileName": "icon_返回上一页.svg",
    "title": "返回上一页",
    "sourceHtml": "page-medical-record-editor-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4B5563",
    "fillColor": "",
    "strokeColor": "#4B5563",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "page"
    ]
  },
  "icon_进入健康详情页.svg": {
    "fileName": "icon_进入健康详情页.svg",
    "title": "进入健康详情页",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "health-summary-arrow",
      "health-summary-header",
      "health-summary-card"
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
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_进入导出数据.svg": {
    "fileName": "icon_进入导出数据.svg",
    "title": "进入导出数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
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
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-card"
    ]
  },
  "icon_通过链接邀请.svg": {
    "fileName": "icon_通过链接邀请.svg",
    "title": "通过链接邀请",
    "sourceHtml": "page-member-invite-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "share-option",
      "share-options",
      "share-card"
    ]
  },
  "icon_邀请家庭成员.svg": {
    "fileName": "icon_邀请家庭成员.svg",
    "title": "邀请家庭成员",
    "sourceHtml": "page-family-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "invite-btn",
      "header",
      "page"
    ]
  },
  "icon_面对面扫码邀请.svg": {
    "fileName": "icon_面对面扫码邀请.svg",
    "title": "面对面扫码邀请",
    "sourceHtml": "page-member-invite-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "share-option",
      "share-options",
      "share-card"
    ]
  },
  "icon_饮食记录类型.svg": {
    "fileName": "icon_饮食记录类型.svg",
    "title": "饮食记录类型",
    "sourceHtml": "page-record-editor-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3CB5A0",
    "fillColor": "",
    "strokeColor": "#3CB5A0",
    "opacity": "1",
    "contextClasses": [
      "type-cell",
      "active",
      "type-grid",
      "form-group"
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
    "defaultColor": "#9CA3AF",
    "fillColor": "",
    "strokeColor": "#9CA3AF",
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
    "defaultColor": "#5DD9C1",
    "fillColor": "",
    "strokeColor": "#5DD9C1",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_驱虫提醒.svg": {
    "fileName": "icon_驱虫提醒.svg",
    "title": "驱虫提醒",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D96680",
    "fillColor": "",
    "strokeColor": "#D96680",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "deworm",
      "reminder-row",
      "reminder-list"
    ]
  }
};
