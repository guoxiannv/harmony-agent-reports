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
  "icon_复习完成成就星星.svg": {
    "fileName": "icon_复习完成成就星星.svg",
    "title": "复习完成成就星星",
    "sourceHtml": "page-study.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#8A6D1B",
    "fillColor": "#8A6D1B",
    "strokeColor": "#8A6D1B",
    "opacity": "1",
    "contextClasses": [
      "star-badge",
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_将单词放回队列末尾稍后复习.svg": {
    "fileName": "icon_将单词放回队列末尾稍后复习.svg",
    "title": "将单词放回队列末尾稍后复习",
    "sourceHtml": "page-study.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn",
      "btn-unknown",
      "action-bar-inner",
      "action-bar"
    ]
  },
  "icon_提示可翻转卡片查看释义.svg": {
    "fileName": "icon_提示可翻转卡片查看释义.svg",
    "title": "提示可翻转卡片查看释义",
    "sourceHtml": "page-study.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6B4EE6",
    "fillColor": "",
    "strokeColor": "#6B4EE6",
    "opacity": "1",
    "contextClasses": [
      "card-badge",
      "flip-card-face",
      "flip-card-front",
      "flip-card-inner"
    ]
  },
  "icon_标记当前单词已认识并移除.svg": {
    "fileName": "icon_标记当前单词已认识并移除.svg",
    "title": "标记当前单词已认识并移除",
    "sourceHtml": "page-study.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn",
      "btn-known",
      "action-bar-inner",
      "action-bar"
    ]
  },
  "icon_童词卡应用标志.svg": {
    "fileName": "icon_童词卡应用标志.svg",
    "title": "童词卡应用标志",
    "sourceHtml": "page-study.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6B4EE6",
    "fillColor": "",
    "strokeColor": "#6B4EE6",
    "opacity": "1",
    "contextClasses": [
      "brand",
      "header-top",
      "header"
    ]
  },
  "icon_装饰性星光一.svg": {
    "fileName": "icon_装饰性星光一.svg",
    "title": "装饰性星光一",
    "sourceHtml": "page-study.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#B8B0E6",
    "fillColor": "#B8B0E6",
    "strokeColor": "",
    "opacity": "0.35",
    "contextClasses": [
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_装饰性星光三.svg": {
    "fileName": "icon_装饰性星光三.svg",
    "title": "装饰性星光三",
    "sourceHtml": "page-study.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#B8B0E6",
    "fillColor": "#B8B0E6",
    "strokeColor": "",
    "opacity": "0.35",
    "contextClasses": [
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_装饰性星光二.svg": {
    "fileName": "icon_装饰性星光二.svg",
    "title": "装饰性星光二",
    "sourceHtml": "page-study.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#B8B0E6",
    "fillColor": "#B8B0E6",
    "strokeColor": "",
    "opacity": "0.35",
    "contextClasses": [
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_装饰性星光五.svg": {
    "fileName": "icon_装饰性星光五.svg",
    "title": "装饰性星光五",
    "sourceHtml": "page-study.html",
    "width": 10,
    "height": 10,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#B8B0E6",
    "fillColor": "#B8B0E6",
    "strokeColor": "",
    "opacity": "0.35",
    "contextClasses": [
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_装饰性星光四.svg": {
    "fileName": "icon_装饰性星光四.svg",
    "title": "装饰性星光四",
    "sourceHtml": "page-study.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#B8B0E6",
    "fillColor": "#B8B0E6",
    "strokeColor": "",
    "opacity": "0.35",
    "contextClasses": [
      "completion-overlay",
      "app-shell"
    ]
  },
  "icon_重新开始一轮复习.svg": {
    "fileName": "icon_重新开始一轮复习.svg",
    "title": "重新开始一轮复习",
    "sourceHtml": "page-study.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-restart",
      "completion-overlay",
      "app-shell"
    ]
  }
};
