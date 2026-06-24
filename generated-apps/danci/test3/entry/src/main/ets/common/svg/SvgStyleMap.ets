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
  "icon_将当前单词放回队列底部稍后复习.svg": {
    "fileName": "icon_将当前单词放回队列底部稍后复习.svg",
    "title": "将当前单词放回队列底部稍后复习",
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
      "action-btn",
      "unknown-btn",
      "action-bar",
      "card-scene"
    ]
  },
  "icon_本轮复习完成.svg": {
    "fileName": "icon_本轮复习完成.svg",
    "title": "本轮复习完成",
    "sourceHtml": "page-review-page.html",
    "width": 40,
    "height": 40,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "completion-badge",
      "completion-card",
      "completion-overlay"
    ]
  },
  "icon_标记当前单词为已认识并移出卡片堆.svg": {
    "fileName": "icon_标记当前单词为已认识并移出卡片堆.svg",
    "title": "标记当前单词为已认识并移出卡片堆",
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
      "action-btn",
      "known-btn",
      "action-bar",
      "card-scene"
    ]
  },
  "icon_翻转卡片查看释义.svg": {
    "fileName": "icon_翻转卡片查看释义.svg",
    "title": "翻转卡片查看释义",
    "sourceHtml": "page-review-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#0EA5E9",
    "fillColor": "",
    "strokeColor": "#0EA5E9",
    "opacity": "1",
    "contextClasses": [
      "flip-hint",
      "card-face",
      "card-front",
      "flashcard"
    ]
  },
  "icon_还没有可复习的单词.svg": {
    "fileName": "icon_还没有可复习的单词.svg",
    "title": "还没有可复习的单词",
    "sourceHtml": "page-review-page.html",
    "width": 56,
    "height": 56,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8B5CF6",
    "fillColor": "",
    "strokeColor": "#8B5CF6",
    "opacity": "1",
    "contextClasses": [
      "empty-icon-wrap",
      "empty-state",
      "card-scene"
    ]
  }
};
