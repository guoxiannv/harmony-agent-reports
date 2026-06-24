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
  "icon_不认识当前单词，放回队列底部复习.svg": {
    "fileName": "icon_不认识当前单词，放回队列底部复习.svg",
    "title": "不认识当前单词，放回队列底部复习",
    "sourceHtml": "page-review-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn",
      "btn-unknown",
      "action-bar",
      "main"
    ]
  },
  "icon_当前单词库为空.svg": {
    "fileName": "icon_当前单词库为空.svg",
    "title": "当前单词库为空",
    "sourceHtml": "page-review-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2D2D2D",
    "fillColor": "",
    "strokeColor": "#2D2D2D",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "is-hidden",
      "main"
    ]
  },
  "icon_本轮复习完成奖励星.svg": {
    "fileName": "icon_本轮复习完成奖励星.svg",
    "title": "本轮复习完成奖励星",
    "sourceHtml": "page-review-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#2D2D2D",
    "fillColor": "#2D2D2D",
    "strokeColor": "#2D2D2D",
    "opacity": "1",
    "contextClasses": [
      "completion-icon",
      "completion-panel",
      "is-hidden",
      "main"
    ]
  },
  "icon_点击卡片翻开释义.svg": {
    "fileName": "icon_点击卡片翻开释义.svg",
    "title": "点击卡片翻开释义",
    "sourceHtml": "page-review-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A1A1A1",
    "fillColor": "",
    "strokeColor": "#A1A1A1",
    "opacity": "1",
    "contextClasses": [
      "flip-hint",
      "card-face",
      "card-front",
      "flip-card"
    ]
  },
  "icon_装饰星.svg": {
    "fileName": "icon_装饰星.svg",
    "title": "装饰星",
    "sourceHtml": "page-review-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#2D2D2D",
    "fillColor": "#2D2D2D",
    "strokeColor": "#2D2D2D",
    "opacity": "1",
    "contextClasses": [
      "empty-icon",
      "empty-state",
      "is-hidden",
      "main"
    ]
  },
  "icon_装饰星星.svg": {
    "fileName": "icon_装饰星星.svg",
    "title": "装饰星星",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill+stroke",
    "defaultColor": "#2D2D2D",
    "fillColor": "#2D2D2D",
    "strokeColor": "#2D2D2D",
    "opacity": "1",
    "contextClasses": [
      "back-decoration",
      "card-face",
      "card-back",
      "flip-card"
    ]
  },
  "icon_认识当前单词并移出卡片堆.svg": {
    "fileName": "icon_认识当前单词并移出卡片堆.svg",
    "title": "认识当前单词并移出卡片堆",
    "sourceHtml": "page-review-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn",
      "btn-known",
      "action-bar",
      "main"
    ]
  },
  "icon_重新加载单词开始新一轮复习.svg": {
    "fileName": "icon_重新加载单词开始新一轮复习.svg",
    "title": "重新加载单词开始新一轮复习",
    "sourceHtml": "page-review-page.html",
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
      "completion-panel",
      "is-hidden",
      "main"
    ]
  }
};
