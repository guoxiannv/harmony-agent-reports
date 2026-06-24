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
  "icon_App-二维码占位.svg": {
    "fileName": "icon_App-二维码占位.svg",
    "title": "App 二维码占位",
    "sourceHtml": "page-share-card.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1A1A1A",
    "fillColor": "",
    "strokeColor": "#1A1A1A",
    "opacity": "1",
    "contextClasses": [
      "card-qr",
      "card-footer",
      "share-card"
    ]
  },
  "icon_一星评分.svg": {
    "fileName": "icon_一星评分.svg",
    "title": "一星评分",
    "sourceHtml": "page-record-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#fff",
    "fillColor": "#fff",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "star",
      "active",
      "stars",
      "form-row"
    ]
  },
  "icon_三星评分.svg": {
    "fileName": "icon_三星评分.svg",
    "title": "三星评分",
    "sourceHtml": "page-record-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#fff",
    "fillColor": "#fff",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "star",
      "active",
      "stars",
      "form-row"
    ]
  },
  "icon_二星评分.svg": {
    "fileName": "icon_二星评分.svg",
    "title": "二星评分",
    "sourceHtml": "page-record-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#fff",
    "fillColor": "#fff",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "star",
      "active",
      "stars",
      "form-row"
    ]
  },
  "icon_五星评分未选中.svg": {
    "fileName": "icon_五星评分未选中.svg",
    "title": "五星评分未选中",
    "sourceHtml": "page-record-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8A8A8A",
    "fillColor": "",
    "strokeColor": "#8A8A8A",
    "opacity": "1",
    "contextClasses": [
      "star",
      "stars",
      "form-row"
    ]
  },
  "icon_今日首页导航-1.svg": {
    "fileName": "icon_今日首页导航-1.svg",
    "title": "今日首页导航",
    "sourceHtml": "page-home.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B35",
    "fillColor": "",
    "strokeColor": "#FF6B35",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_今日首页导航-2.svg": {
    "fileName": "icon_今日首页导航-2.svg",
    "title": "今日首页导航",
    "sourceHtml": "page-ingredients.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8A8A8A",
    "fillColor": "",
    "strokeColor": "#8A8A8A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_保存分享卡片到相册.svg": {
    "fileName": "icon_保存分享卡片到相册.svg",
    "title": "保存分享卡片到相册",
    "sourceHtml": "page-share-card.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "bottom-actions"
    ]
  },
  "icon_关闭分享卡片.svg": {
    "fileName": "icon_关闭分享卡片.svg",
    "title": "关闭分享卡片",
    "sourceHtml": "page-share-card.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "close-btn",
      "top-bar"
    ]
  },
  "icon_冰箱为空状态.svg": {
    "fileName": "icon_冰箱为空状态.svg",
    "title": "冰箱为空状态",
    "sourceHtml": "page-ingredients.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D4D0CA",
    "fillColor": "",
    "strokeColor": "#D4D0CA",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "section"
    ]
  },
  "icon_冰箱食材导航-1.svg": {
    "fileName": "icon_冰箱食材导航-1.svg",
    "title": "冰箱食材导航",
    "sourceHtml": "page-home.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8A8A8A",
    "fillColor": "",
    "strokeColor": "#8A8A8A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_冰箱食材导航-2.svg": {
    "fileName": "icon_冰箱食材导航-2.svg",
    "title": "冰箱食材导航",
    "sourceHtml": "page-ingredients.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B35",
    "fillColor": "",
    "strokeColor": "#FF6B35",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_分享卡片主菜品图标.svg": {
    "fileName": "icon_分享卡片主菜品图标.svg",
    "title": "分享卡片主菜品图标",
    "sourceHtml": "page-share-card.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "hero-icon",
      "card-hero",
      "share-card"
    ]
  },
  "icon_切换到上个月.svg": {
    "fileName": "icon_切换到上个月.svg",
    "title": "切换到上个月",
    "sourceHtml": "page-records.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4A4A4A",
    "fillColor": "",
    "strokeColor": "#4A4A4A",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-header"
    ]
  },
  "icon_切换到下个月.svg": {
    "fileName": "icon_切换到下个月.svg",
    "title": "切换到下个月",
    "sourceHtml": "page-records.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4A4A4A",
    "fillColor": "",
    "strokeColor": "#4A4A4A",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-header"
    ]
  },
  "icon_删除该食材.svg": {
    "fileName": "icon_删除该食材.svg",
    "title": "删除该食材",
    "sourceHtml": "page-ingredients.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8A8A8A",
    "fillColor": "",
    "strokeColor": "#8A8A8A",
    "opacity": "1",
    "contextClasses": [
      "del",
      "chip",
      "chip-cloud"
    ]
  },
  "icon_取消并返回.svg": {
    "fileName": "icon_取消并返回.svg",
    "title": "取消并返回",
    "sourceHtml": "page-record-form.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1A1A1A",
    "fillColor": "",
    "strokeColor": "#1A1A1A",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "top-bar"
    ]
  },
  "icon_四星满意度.svg": {
    "fileName": "icon_四星满意度.svg",
    "title": "四星满意度",
    "sourceHtml": "page-records.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#FFC93D",
    "fillColor": "#FFC93D",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "record-stars",
      "record-info",
      "record-item"
    ]
  },
  "icon_四星评分.svg": {
    "fileName": "icon_四星评分.svg",
    "title": "四星评分",
    "sourceHtml": "page-record-form.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#fff",
    "fillColor": "#fff",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "star",
      "active",
      "stars",
      "form-row"
    ]
  },
  "icon_开始随机转盘抽取菜品.svg": {
    "fileName": "icon_开始随机转盘抽取菜品.svg",
    "title": "开始随机转盘抽取菜品",
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
      "btn-primary",
      "hero-actions",
      "hero"
    ]
  },
  "icon_打开分享卡片页面.svg": {
    "fileName": "icon_打开分享卡片页面.svg",
    "title": "打开分享卡片页面",
    "sourceHtml": "page-wheel.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "share-btn",
      "top-bar"
    ]
  },
  "icon_打开心情时间餐别筛选.svg": {
    "fileName": "icon_打开心情时间餐别筛选.svg",
    "title": "打开心情时间餐别筛选",
    "sourceHtml": "page-home.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "btn-icon",
      "hero-actions",
      "hero"
    ]
  },
  "icon_抽中菜品图标.svg": {
    "fileName": "icon_抽中菜品图标.svg",
    "title": "抽中菜品图标",
    "sourceHtml": "page-wheel.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "result-thumb",
      "result-sheet",
      "wheel-area"
    ]
  },
  "icon_新增今日饮食打卡-1.svg": {
    "fileName": "icon_新增今日饮食打卡-1.svg",
    "title": "新增今日饮食打卡",
    "sourceHtml": "page-home.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "floating-record"
    ]
  },
  "icon_新增今日饮食打卡-2.svg": {
    "fileName": "icon_新增今日饮食打卡-2.svg",
    "title": "新增今日饮食打卡",
    "sourceHtml": "page-records.html",
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
      "page-header"
    ]
  },
  "icon_无匹配菜谱空状态.svg": {
    "fileName": "icon_无匹配菜谱空状态.svg",
    "title": "无匹配菜谱空状态",
    "sourceHtml": "page-ingredients.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D4D0CA",
    "fillColor": "",
    "strokeColor": "#D4D0CA",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "card",
      "section"
    ]
  },
  "icon_无打卡记录空状态.svg": {
    "fileName": "icon_无打卡记录空状态.svg",
    "title": "无打卡记录空状态",
    "sourceHtml": "page-records.html",
    "width": 52,
    "height": 52,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D4D0CA",
    "fillColor": "",
    "strokeColor": "#D4D0CA",
    "opacity": "1",
    "contextClasses": [
      "card",
      "empty-state",
      "section"
    ]
  },
  "icon_无推荐结果空状态.svg": {
    "fileName": "icon_无推荐结果空状态.svg",
    "title": "无推荐结果空状态",
    "sourceHtml": "page-home.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D4D0CA",
    "fillColor": "",
    "strokeColor": "#D4D0CA",
    "opacity": "1",
    "contextClasses": [
      "card",
      "empty-state",
      "section"
    ]
  },
  "icon_未点亮满意度星标.svg": {
    "fileName": "icon_未点亮满意度星标.svg",
    "title": "未点亮满意度星标",
    "sourceHtml": "page-records.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFC93D",
    "fillColor": "",
    "strokeColor": "#FFC93D",
    "opacity": "1",
    "contextClasses": [
      "record-stars",
      "record-info",
      "record-item"
    ]
  },
  "icon_添加食材到冰箱清单.svg": {
    "fileName": "icon_添加食材到冰箱清单.svg",
    "title": "添加食材到冰箱清单",
    "sourceHtml": "page-ingredients.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "input-row",
      "input-card"
    ]
  },
  "icon_清蒸鱼菜品图标.svg": {
    "fileName": "icon_清蒸鱼菜品图标.svg",
    "title": "清蒸鱼菜品图标",
    "sourceHtml": "page-home.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "dish-thumb",
      "dish-item",
      "dish-list"
    ]
  },
  "icon_生成这条打卡的分享卡片.svg": {
    "fileName": "icon_生成这条打卡的分享卡片.svg",
    "title": "生成这条打卡的分享卡片",
    "sourceHtml": "page-records.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B35",
    "fillColor": "",
    "strokeColor": "#FF6B35",
    "opacity": "1",
    "contextClasses": [
      "record-share",
      "record-item",
      "card"
    ]
  },
  "icon_番茄鸡蛋菜品图标-1.svg": {
    "fileName": "icon_番茄鸡蛋菜品图标-1.svg",
    "title": "番茄鸡蛋菜品图标",
    "sourceHtml": "page-home.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "dish-thumb",
      "dish-item",
      "dish-list"
    ]
  },
  "icon_番茄鸡蛋菜品图标-2.svg": {
    "fileName": "icon_番茄鸡蛋菜品图标-2.svg",
    "title": "番茄鸡蛋菜品图标",
    "sourceHtml": "page-ingredients.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "dish-thumb",
      "dish-item",
      "dish-list"
    ]
  },
  "icon_转盘结果指针.svg": {
    "fileName": "icon_转盘结果指针.svg",
    "title": "转盘结果指针",
    "sourceHtml": "page-wheel.html",
    "width": 28,
    "height": 36,
    "viewBox": "0 0 28 36",
    "paintMode": "color",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "wheel-container",
      "wheel-area"
    ]
  },
  "icon_返回上一页-1.svg": {
    "fileName": "icon_返回上一页-1.svg",
    "title": "返回上一页",
    "sourceHtml": "page-filter.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1A1A1A",
    "fillColor": "",
    "strokeColor": "#1A1A1A",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "top-bar"
    ]
  },
  "icon_返回上一页-2.svg": {
    "fileName": "icon_返回上一页-2.svg",
    "title": "返回上一页",
    "sourceHtml": "page-wheel.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "top-bar"
    ]
  },
  "icon_随机转盘候选菜品.svg": {
    "fileName": "icon_随机转盘候选菜品.svg",
    "title": "随机转盘候选菜品",
    "sourceHtml": "page-wheel.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 340 340",
    "paintMode": "fill",
    "defaultColor": "#fff",
    "fillColor": "url(#g1)",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "wheel",
      "wheel-container",
      "wheel-area"
    ]
  },
  "icon_饮食打卡导航-1.svg": {
    "fileName": "icon_饮食打卡导航-1.svg",
    "title": "饮食打卡导航",
    "sourceHtml": "page-home.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8A8A8A",
    "fillColor": "",
    "strokeColor": "#8A8A8A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab"
    ]
  },
  "icon_饮食打卡导航-2.svg": {
    "fileName": "icon_饮食打卡导航-2.svg",
    "title": "饮食打卡导航",
    "sourceHtml": "page-records.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B35",
    "fillColor": "",
    "strokeColor": "#FF6B35",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab"
    ]
  },
  "icon_麻婆豆腐菜品图标-1.svg": {
    "fileName": "icon_麻婆豆腐菜品图标-1.svg",
    "title": "麻婆豆腐菜品图标",
    "sourceHtml": "page-home.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "dish-thumb",
      "dish-item",
      "dish-list"
    ]
  },
  "icon_麻婆豆腐菜品图标-2.svg": {
    "fileName": "icon_麻婆豆腐菜品图标-2.svg",
    "title": "麻婆豆腐菜品图标",
    "sourceHtml": "page-ingredients.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "dish-thumb",
      "dish-item",
      "dish-list"
    ]
  }
};
