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
  "icon_App-logo-showing-an-open-book.svg": {
    "fileName": "icon_App-logo-showing-an-open-book.svg",
    "title": "App logo showing an open book",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F2937",
    "fillColor": "",
    "strokeColor": "#1F2937",
    "opacity": "1",
    "contextClasses": [
      "brand-icon",
      "brand",
      "progress-header"
    ]
  },
  "icon_Checkmark-indicating-I-know-this-word.svg": {
    "fileName": "icon_Checkmark-indicating-I-know-this-word.svg",
    "title": "Checkmark indicating I know this word",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F2937",
    "fillColor": "",
    "strokeColor": "#1F2937",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "btn-known",
      "action-row",
      "main-stage"
    ]
  },
  "icon_Medal-awarded-for-completing-all-review-words.svg": {
    "fileName": "icon_Medal-awarded-for-completing-all-review-words.svg",
    "title": "Medal awarded for completing all review words",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F2937",
    "fillColor": "",
    "strokeColor": "#1F2937",
    "opacity": "1",
    "contextClasses": [
      "completion-icon",
      "completion-panel",
      "page-root"
    ]
  },
  "icon_Rotate-arrow-indicating-put-this-word-back-for-review.svg": {
    "fileName": "icon_Rotate-arrow-indicating-put-this-word-back-for-review.svg",
    "title": "Rotate arrow indicating put this word back for review",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "action-btn",
      "btn-unknown",
      "action-row",
      "main-stage"
    ]
  },
  "icon_Sparkle-decoration-on-flashcard-front.svg": {
    "fileName": "icon_Sparkle-decoration-on-flashcard-front.svg",
    "title": "Sparkle decoration on flashcard front",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FBBF24",
    "fillColor": "",
    "strokeColor": "#FBBF24",
    "opacity": "1",
    "contextClasses": [
      "card-face",
      "card-face-front",
      "flashcard",
      "scene"
    ]
  },
  "icon_Trophy-icon-showing-words-learned-this-session.svg": {
    "fileName": "icon_Trophy-icon-showing-words-learned-this-session.svg",
    "title": "Trophy icon showing words learned this session",
    "sourceHtml": "page-review-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F2937",
    "fillColor": "",
    "strokeColor": "#1F2937",
    "opacity": "1",
    "contextClasses": [
      "known-badge",
      "progress-cluster",
      "progress-header"
    ]
  }
};
