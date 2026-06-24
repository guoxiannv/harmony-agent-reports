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
  "icon_为这顿饭打卡.svg": {
    "fileName": "icon_为这顿饭打卡.svg",
    "title": "为这顿饭打卡",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "floating-bar",
      "container"
    ]
  },
  "icon_为这顿饭添加打卡记录.svg": {
    "fileName": "icon_为这顿饭添加打卡记录.svg",
    "title": "为这顿饭添加打卡记录",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "result-card"
    ]
  },
  "icon_今日无打卡记录.svg": {
    "fileName": "icon_今日无打卡记录.svg",
    "title": "今日无打卡记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 56,
    "height": 56,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "container"
    ]
  },
  "icon_保存卡片到相册.svg": {
    "fileName": "icon_保存卡片到相册.svg",
    "title": "保存卡片到相册",
    "sourceHtml": "page-share-card-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "action-row",
      "container"
    ]
  },
  "icon_做法步骤.svg": {
    "fileName": "icon_做法步骤.svg",
    "title": "做法步骤",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "content"
    ]
  },
  "icon_关闭转盘设置.svg": {
    "fileName": "icon_关闭转盘设置.svg",
    "title": "关闭转盘设置",
    "sourceHtml": "page-wheel-settings-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_再转一次菜品.svg": {
    "fileName": "icon_再转一次菜品.svg",
    "title": "再转一次菜品",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "result-actions",
      "result-card"
    ]
  },
  "icon_删除此自定义菜品.svg": {
    "fileName": "icon_删除此自定义菜品.svg",
    "title": "删除此自定义菜品",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C65D4F",
    "fillColor": "",
    "strokeColor": "#C65D4F",
    "opacity": "1",
    "contextClasses": [
      "delete-btn",
      "list-item",
      "list-card"
    ]
  },
  "icon_删除此转盘菜品.svg": {
    "fileName": "icon_删除此转盘菜品.svg",
    "title": "删除此转盘菜品",
    "sourceHtml": "page-wheel-settings-sheet.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C65D4F",
    "fillColor": "",
    "strokeColor": "#C65D4F",
    "opacity": "1",
    "contextClasses": [
      "delete-btn",
      "list-item",
      "list-card"
    ]
  },
  "icon_删除此食材.svg": {
    "fileName": "icon_删除此食材.svg",
    "title": "删除此食材",
    "sourceHtml": "page-ingredients-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B85C25",
    "fillColor": "",
    "strokeColor": "#B85C25",
    "opacity": "1",
    "contextClasses": [
      "ingredient-tag",
      "ingredients-bar"
    ]
  },
  "icon_删除这条打卡记录.svg": {
    "fileName": "icon_删除这条打卡记录.svg",
    "title": "删除这条打卡记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6B6B6B",
    "fillColor": "",
    "strokeColor": "#6B6B6B",
    "opacity": "1",
    "contextClasses": [
      "mini-btn",
      "timeline-actions",
      "timeline-meta"
    ]
  },
  "icon_午餐记录.svg": {
    "fileName": "icon_午餐记录.svg",
    "title": "午餐记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "timeline-dot",
      "lunch",
      "timeline-item",
      "timeline"
    ]
  },
  "icon_发现标签-1.svg": {
    "fileName": "icon_发现标签-1.svg",
    "title": "发现标签",
    "sourceHtml": "page-checkin-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_发现标签-2.svg": {
    "fileName": "icon_发现标签-2.svg",
    "title": "发现标签",
    "sourceHtml": "page-discover-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_取消打卡.svg": {
    "fileName": "icon_取消打卡.svg",
    "title": "取消打卡",
    "sourceHtml": "page-checkin-form-sheet.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_家常菜品图标.svg": {
    "fileName": "icon_家常菜品图标.svg",
    "title": "家常菜品图标",
    "sourceHtml": "page-discover-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "tile-cover",
      "orange",
      "dish-tile",
      "result-grid"
    ]
  },
  "icon_将推荐菜品加入打卡.svg": {
    "fileName": "icon_将推荐菜品加入打卡.svg",
    "title": "将推荐菜品加入打卡",
    "sourceHtml": "page-ingredients-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "checkin-mini",
      "dish-card"
    ]
  },
  "icon_快手菜图标.svg": {
    "fileName": "icon_快手菜图标.svg",
    "title": "快手菜图标",
    "sourceHtml": "page-discover-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "tile-cover",
      "yellow",
      "dish-tile",
      "result-grid"
    ]
  },
  "icon_恢复默认转盘菜品.svg": {
    "fileName": "icon_恢复默认转盘菜品.svg",
    "title": "恢复默认转盘菜品",
    "sourceHtml": "page-wheel-settings-sheet.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "reset-link",
      "sheet"
    ]
  },
  "icon_我的标签-1.svg": {
    "fileName": "icon_我的标签-1.svg",
    "title": "我的标签",
    "sourceHtml": "page-checkin-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_我的标签-2.svg": {
    "fileName": "icon_我的标签-2.svg",
    "title": "我的标签",
    "sourceHtml": "page-profile-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_打卡标签-1.svg": {
    "fileName": "icon_打卡标签-1.svg",
    "title": "打卡标签",
    "sourceHtml": "page-checkin-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_打卡标签-2.svg": {
    "fileName": "icon_打卡标签-2.svg",
    "title": "打卡标签",
    "sourceHtml": "page-discover-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_打开分享卡片.svg": {
    "fileName": "icon_打开分享卡片.svg",
    "title": "打开分享卡片",
    "sourceHtml": "page-checkin-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "icon-button",
      "header-actions"
    ]
  },
  "icon_打开转盘设置.svg": {
    "fileName": "icon_打开转盘设置.svg",
    "title": "打开转盘设置",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "icon-button",
      "container"
    ]
  },
  "icon_早餐记录.svg": {
    "fileName": "icon_早餐记录.svg",
    "title": "早餐记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "timeline-dot",
      "breakfast",
      "timeline-item",
      "timeline"
    ]
  },
  "icon_查看选中菜品做法.svg": {
    "fileName": "icon_查看选中菜品做法.svg",
    "title": "查看选中菜品做法",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "result-actions",
      "result-card"
    ]
  },
  "icon_没有推荐结果.svg": {
    "fileName": "icon_没有推荐结果.svg",
    "title": "没有推荐结果",
    "sourceHtml": "page-ingredients-page.html",
    "width": 56,
    "height": 56,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "container"
    ]
  },
  "icon_添加冰箱食材.svg": {
    "fileName": "icon_添加冰箱食材.svg",
    "title": "添加冰箱食材",
    "sourceHtml": "page-ingredients-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "input-row",
      "input-card"
    ]
  },
  "icon_添加打卡记录.svg": {
    "fileName": "icon_添加打卡记录.svg",
    "title": "添加打卡记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "section-header",
      "container"
    ]
  },
  "icon_添加自定义菜品.svg": {
    "fileName": "icon_添加自定义菜品.svg",
    "title": "添加自定义菜品",
    "sourceHtml": "page-profile-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "add-link",
      "section-header",
      "section"
    ]
  },
  "icon_添加自定义转盘菜品.svg": {
    "fileName": "icon_添加自定义转盘菜品.svg",
    "title": "添加自定义转盘菜品",
    "sourceHtml": "page-wheel-settings-sheet.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "input-row",
      "sheet"
    ]
  },
  "icon_清淡菜品图标.svg": {
    "fileName": "icon_清淡菜品图标.svg",
    "title": "清淡菜品图标",
    "sourceHtml": "page-discover-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "tile-cover",
      "green",
      "dish-tile",
      "result-grid"
    ]
  },
  "icon_生成分享卡片.svg": {
    "fileName": "icon_生成分享卡片.svg",
    "title": "生成分享卡片",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "floating-bar",
      "container"
    ]
  },
  "icon_用户头像.svg": {
    "fileName": "icon_用户头像.svg",
    "title": "用户头像",
    "sourceHtml": "page-profile-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "profile-card",
      "container"
    ]
  },
  "icon_空状态提示图标.svg": {
    "fileName": "icon_空状态提示图标.svg",
    "title": "空状态提示图标",
    "sourceHtml": "page-home-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "empty-hint",
      "container"
    ]
  },
  "icon_编辑这条打卡记录.svg": {
    "fileName": "icon_编辑这条打卡记录.svg",
    "title": "编辑这条打卡记录",
    "sourceHtml": "page-checkin-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6B6B6B",
    "fillColor": "",
    "strokeColor": "#6B6B6B",
    "opacity": "1",
    "contextClasses": [
      "mini-btn",
      "timeline-actions",
      "timeline-meta"
    ]
  },
  "icon_菜品图标-1.svg": {
    "fileName": "icon_菜品图标-1.svg",
    "title": "菜品图标",
    "sourceHtml": "page-ingredients-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "dish-card"
    ]
  },
  "icon_菜品图标-2.svg": {
    "fileName": "icon_菜品图标-2.svg",
    "title": "菜品图标",
    "sourceHtml": "page-ingredients-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "dish-card"
    ]
  },
  "icon_菜品图标-3.svg": {
    "fileName": "icon_菜品图标-3.svg",
    "title": "菜品图标",
    "sourceHtml": "page-ingredients-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "dish-card"
    ]
  },
  "icon_调用系统分享.svg": {
    "fileName": "icon_调用系统分享.svg",
    "title": "调用系统分享",
    "sourceHtml": "page-share-card-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "action-row",
      "container"
    ]
  },
  "icon_返回上一页-1.svg": {
    "fileName": "icon_返回上一页-1.svg",
    "title": "返回上一页",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "hero",
      "container"
    ]
  },
  "icon_返回上一页-2.svg": {
    "fileName": "icon_返回上一页-2.svg",
    "title": "返回上一页",
    "sourceHtml": "page-share-card-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1A1A1A",
    "fillColor": "",
    "strokeColor": "#1A1A1A",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "container"
    ]
  },
  "icon_进入清空数据.svg": {
    "fileName": "icon_进入清空数据.svg",
    "title": "进入清空数据",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "danger-item",
      "danger-zone",
      "container"
    ]
  },
  "icon_重置筛选条件.svg": {
    "fileName": "icon_重置筛选条件.svg",
    "title": "重置筛选条件",
    "sourceHtml": "page-discover-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "text-btn",
      "filter-actions",
      "filter-card"
    ]
  },
  "icon_食材推荐标签-1.svg": {
    "fileName": "icon_食材推荐标签-1.svg",
    "title": "食材推荐标签",
    "sourceHtml": "page-checkin-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_食材推荐标签-2.svg": {
    "fileName": "icon_食材推荐标签-2.svg",
    "title": "食材推荐标签",
    "sourceHtml": "page-ingredients-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_食材清单.svg": {
    "fileName": "icon_食材清单.svg",
    "title": "食材清单",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "section",
      "content"
    ]
  },
  "icon_食材项.svg": {
    "fileName": "icon_食材项.svg",
    "title": "食材项",
    "sourceHtml": "page-dish-detail-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4A9B8E",
    "fillColor": "",
    "strokeColor": "#4A9B8E",
    "opacity": "1",
    "contextClasses": [
      "ingredient-item",
      "ingredient-list",
      "section"
    ]
  },
  "icon_首页标签-1.svg": {
    "fileName": "icon_首页标签-1.svg",
    "title": "首页标签",
    "sourceHtml": "page-checkin-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29E",
    "fillColor": "",
    "strokeColor": "#A8A29E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_首页标签-2.svg": {
    "fileName": "icon_首页标签-2.svg",
    "title": "首页标签",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D97736",
    "fillColor": "",
    "strokeColor": "#D97736",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  }
};
