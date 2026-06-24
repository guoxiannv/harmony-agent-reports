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
  "icon_保存到相册图标.svg": {
    "fileName": "icon_保存到相册图标.svg",
    "title": "保存到相册图标",
    "sourceHtml": "page-share-card-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B28",
    "fillColor": "",
    "strokeColor": "#2E2B28",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "bottom-actions",
      "app"
    ]
  },
  "icon_关于菜单图标.svg": {
    "fileName": "icon_关于菜单图标.svg",
    "title": "关于菜单图标",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6D6761",
    "fillColor": "",
    "strokeColor": "#6D6761",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_冰箱食材推荐图标.svg": {
    "fileName": "icon_冰箱食材推荐图标.svg",
    "title": "冰箱食材推荐图标",
    "sourceHtml": "page-home-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B28",
    "fillColor": "",
    "strokeColor": "#2E2B28",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "actions",
      "app"
    ]
  },
  "icon_决策标签页图标-1.svg": {
    "fileName": "icon_决策标签页图标-1.svg",
    "title": "决策标签页图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app"
    ]
  },
  "icon_决策标签页图标-2.svg": {
    "fileName": "icon_决策标签页图标-2.svg",
    "title": "决策标签页图标",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E85D4E",
    "fillColor": "",
    "strokeColor": "#E85D4E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app"
    ]
  },
  "icon_删除该打卡记录图标.svg": {
    "fileName": "icon_删除该打卡记录图标.svg",
    "title": "删除该打卡记录图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6D6761",
    "fillColor": "",
    "strokeColor": "#6D6761",
    "opacity": "1",
    "contextClasses": [
      "record-actions",
      "record-item"
    ]
  },
  "icon_删除该食材图标.svg": {
    "fileName": "icon_删除该食材图标.svg",
    "title": "删除该食材图标",
    "sourceHtml": "page-pantry-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "remove",
      "pantry-tag",
      "tag-cloud"
    ]
  },
  "icon_应用-Logo-小图标.svg": {
    "fileName": "icon_应用-Logo-小图标.svg",
    "title": "应用 Logo 小图标",
    "sourceHtml": "page-share-card-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "card-logo",
      "card-brand",
      "card-footer"
    ]
  },
  "icon_开始转盘图标.svg": {
    "fileName": "icon_开始转盘图标.svg",
    "title": "开始转盘图标",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "actions",
      "app"
    ]
  },
  "icon_快手标签图标.svg": {
    "fileName": "icon_快手标签图标.svg",
    "title": "快手标签图标",
    "sourceHtml": "page-result-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFF8F0",
    "fillColor": "",
    "strokeColor": "#FFF8F0",
    "opacity": "1",
    "contextClasses": [
      "hero-tag",
      "hero-tags",
      "hero"
    ]
  },
  "icon_我的标签页图标-1.svg": {
    "fileName": "icon_我的标签页图标-1.svg",
    "title": "我的标签页图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app"
    ]
  },
  "icon_我的标签页图标-2.svg": {
    "fileName": "icon_我的标签页图标-2.svg",
    "title": "我的标签页图标",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E85D4E",
    "fillColor": "",
    "strokeColor": "#E85D4E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app"
    ]
  },
  "icon_打卡标签页图标-1.svg": {
    "fileName": "icon_打卡标签页图标-1.svg",
    "title": "打卡标签页图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E85D4E",
    "fillColor": "",
    "strokeColor": "#E85D4E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app"
    ]
  },
  "icon_打卡标签页图标-2.svg": {
    "fileName": "icon_打卡标签页图标-2.svg",
    "title": "打卡标签页图标",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app"
    ]
  },
  "icon_查看菜品详情箭头.svg": {
    "fileName": "icon_查看菜品详情箭头.svg",
    "title": "查看菜品详情箭头",
    "sourceHtml": "page-home-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E85D4E",
    "fillColor": "",
    "strokeColor": "#E85D4E",
    "opacity": "1",
    "contextClasses": [
      "result-detail-btn",
      "result-area",
      "app"
    ]
  },
  "icon_添加冰箱食材图标.svg": {
    "fileName": "icon_添加冰箱食材图标.svg",
    "title": "添加冰箱食材图标",
    "sourceHtml": "page-pantry-page.html",
    "width": 24,
    "height": 24,
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
  "icon_生成分享卡片图标-1.svg": {
    "fileName": "icon_生成分享卡片图标-1.svg",
    "title": "生成分享卡片图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6D6761",
    "fillColor": "",
    "strokeColor": "#6D6761",
    "opacity": "1",
    "contextClasses": [
      "record-actions",
      "record-item"
    ]
  },
  "icon_生成分享卡片图标-2.svg": {
    "fileName": "icon_生成分享卡片图标-2.svg",
    "title": "生成分享卡片图标",
    "sourceHtml": "page-result-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B28",
    "fillColor": "",
    "strokeColor": "#2E2B28",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "bottom-actions",
      "app"
    ]
  },
  "icon_用户头像占位图标.svg": {
    "fileName": "icon_用户头像占位图标.svg",
    "title": "用户头像占位图标",
    "sourceHtml": "page-profile-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "profile-header",
      "app"
    ]
  },
  "icon_系统分享图标.svg": {
    "fileName": "icon_系统分享图标.svg",
    "title": "系统分享图标",
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
      "bottom-actions",
      "app"
    ]
  },
  "icon_补录打卡图标.svg": {
    "fileName": "icon_补录打卡图标.svg",
    "title": "补录打卡图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "app"
    ]
  },
  "icon_装饰餐具图标.svg": {
    "fileName": "icon_装饰餐具图标.svg",
    "title": "装饰餐具图标",
    "sourceHtml": "page-share-card-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "card-footer",
      "share-card",
      "preview-area"
    ]
  },
  "icon_记录打卡图标.svg": {
    "fileName": "icon_记录打卡图标.svg",
    "title": "记录打卡图标",
    "sourceHtml": "page-result-page.html",
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
      "bottom-actions",
      "app"
    ]
  },
  "icon_设置菜单图标.svg": {
    "fileName": "icon_设置菜单图标.svg",
    "title": "设置菜单图标",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6D6761",
    "fillColor": "",
    "strokeColor": "#6D6761",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "menu-item-left",
      "menu-item"
    ]
  },
  "icon_转盘指针.svg": {
    "fileName": "icon_转盘指针.svg",
    "title": "转盘指针",
    "sourceHtml": "page-home-page.html",
    "width": 28,
    "height": 34,
    "viewBox": "0 0 28 34",
    "paintMode": "fill",
    "defaultColor": "#2E2B28",
    "fillColor": "#E85D4E",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "wheel-wrapper",
      "wheel-section",
      "app"
    ]
  },
  "icon_返回上一页图标-1.svg": {
    "fileName": "icon_返回上一页图标-1.svg",
    "title": "返回上一页图标",
    "sourceHtml": "page-check-in-editor-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B28",
    "fillColor": "",
    "strokeColor": "#2E2B28",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "top-bar",
      "app"
    ]
  },
  "icon_返回上一页图标-2.svg": {
    "fileName": "icon_返回上一页图标-2.svg",
    "title": "返回上一页图标",
    "sourceHtml": "page-result-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFF8F0",
    "fillColor": "",
    "strokeColor": "#FFF8F0",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "hero",
      "app"
    ]
  },
  "icon_进入关于箭头.svg": {
    "fileName": "icon_进入关于箭头.svg",
    "title": "进入关于箭头",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "app"
    ]
  },
  "icon_进入设置箭头.svg": {
    "fileName": "icon_进入设置箭头.svg",
    "title": "进入设置箭头",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "menu-item",
      "menu-card",
      "app"
    ]
  },
  "icon_连续打卡徽章图标.svg": {
    "fileName": "icon_连续打卡徽章图标.svg",
    "title": "连续打卡徽章图标",
    "sourceHtml": "page-profile-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9C5A36",
    "fillColor": "",
    "strokeColor": "#9C5A36",
    "opacity": "1",
    "contextClasses": [
      "profile-badge",
      "profile-meta",
      "profile-header"
    ]
  },
  "icon_食材标签页图标-1.svg": {
    "fileName": "icon_食材标签页图标-1.svg",
    "title": "食材标签页图标",
    "sourceHtml": "page-check-in-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A9A29B",
    "fillColor": "",
    "strokeColor": "#A9A29B",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app"
    ]
  },
  "icon_食材标签页图标-2.svg": {
    "fileName": "icon_食材标签页图标-2.svg",
    "title": "食材标签页图标",
    "sourceHtml": "page-pantry-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#E85D4E",
    "fillColor": "",
    "strokeColor": "#E85D4E",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app"
    ]
  },
  "icon_食材清单图标.svg": {
    "fileName": "icon_食材清单图标.svg",
    "title": "食材清单图标",
    "sourceHtml": "page-result-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2B28",
    "fillColor": "",
    "strokeColor": "#7CAE7A",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "detail-sheet",
      "app"
    ]
  }
};
