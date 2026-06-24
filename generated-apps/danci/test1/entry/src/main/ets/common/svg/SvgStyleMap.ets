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
  "icon_复习进度环.svg": {
    "fileName": "icon_复习进度环.svg",
    "title": "复习进度环",
    "sourceHtml": "page-review.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 56 56",
    "paintMode": "stroke",
    "defaultColor": "#2D2A26",
    "fillColor": "",
    "strokeColor": "#EDE8DD",
    "opacity": "1",
    "contextClasses": [
      "progress-ring-wrap",
      "header",
      "app-root"
    ]
  },
  "icon_将当前单词移到队尾稍后复习.svg": {
    "fileName": "icon_将当前单词移到队尾稍后复习.svg",
    "title": "将当前单词移到队尾稍后复习",
    "sourceHtml": "page-review.html",
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
      "review-stage"
    ]
  },
  "icon_本轮复习完成星星.svg": {
    "fileName": "icon_本轮复习完成星星.svg",
    "title": "本轮复习完成星星",
    "sourceHtml": "page-review.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#FFD93D",
    "fillColor": "#FFD93D",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "completion-panel",
      "app-root"
    ]
  },
  "icon_标记当前单词已认识并移除.svg": {
    "fileName": "icon_标记当前单词已认识并移除.svg",
    "title": "标记当前单词已认识并移除",
    "sourceHtml": "page-review.html",
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
      "review-stage"
    ]
  },
  "icon_没有待复习单词的占位图标.svg": {
    "fileName": "icon_没有待复习单词的占位图标.svg",
    "title": "没有待复习单词的占位图标",
    "sourceHtml": "page-review.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D6CFC2",
    "fillColor": "",
    "strokeColor": "#D6CFC2",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "app-root"
    ]
  },
  "icon_重新加载当前阶段单词.svg": {
    "fileName": "icon_重新加载当前阶段单词.svg",
    "title": "重新加载当前阶段单词",
    "sourceHtml": "page-review.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "restart-btn",
      "completion-panel",
      "app-root"
    ]
  }
};
