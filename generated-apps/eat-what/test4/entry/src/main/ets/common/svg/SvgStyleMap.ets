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
  "icon_Add-Ingredient-Button-Icon.svg": {
    "fileName": "icon_Add-Ingredient-Button-Icon.svg",
    "title": "Add Ingredient Button Icon",
    "sourceHtml": "page-fridge-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "add-button",
      "input-row",
      "input-card"
    ]
  },
  "icon_Close-Share-Card-Sheet.svg": {
    "fileName": "icon_Close-Share-Card-Sheet.svg",
    "title": "Close Share Card Sheet",
    "sourceHtml": "page-share-card-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6B5E52",
    "fillColor": "",
    "strokeColor": "#6B5E52",
    "opacity": "1",
    "contextClasses": [
      "close-button",
      "sheet-header",
      "sheet"
    ]
  },
  "icon_Export-Share-Card-Image.svg": {
    "fileName": "icon_Export-Share-Card-Image.svg",
    "title": "Export Share Card Image",
    "sourceHtml": "page-share-card-sheet.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "export-button",
      "sheet",
      "app-shell"
    ]
  },
  "icon_Fridge-Tab-Icon-1.svg": {
    "fileName": "icon_Fridge-Tab-Icon-1.svg",
    "title": "Fridge Tab Icon",
    "sourceHtml": "page-fridge-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B4A",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Fridge-Tab-Icon-2.svg": {
    "fileName": "icon_Fridge-Tab-Icon-2.svg",
    "title": "Fridge Tab Icon",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9185",
    "fillColor": "",
    "strokeColor": "#9E9185",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Home-Tab-Icon-1.svg": {
    "fileName": "icon_Home-Tab-Icon-1.svg",
    "title": "Home Tab Icon",
    "sourceHtml": "page-fridge-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9185",
    "fillColor": "",
    "strokeColor": "#9E9185",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Home-Tab-Icon-2.svg": {
    "fileName": "icon_Home-Tab-Icon-2.svg",
    "title": "Home Tab Icon",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B4A",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Log-Tab-Icon-1.svg": {
    "fileName": "icon_Log-Tab-Icon-1.svg",
    "title": "Log Tab Icon",
    "sourceHtml": "page-fridge-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9185",
    "fillColor": "",
    "strokeColor": "#9E9185",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Log-Tab-Icon-2.svg": {
    "fileName": "icon_Log-Tab-Icon-2.svg",
    "title": "Log Tab Icon",
    "sourceHtml": "page-log-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B4A",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Mood-Tab-Icon-1.svg": {
    "fileName": "icon_Mood-Tab-Icon-1.svg",
    "title": "Mood Tab Icon",
    "sourceHtml": "page-fridge-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9185",
    "fillColor": "",
    "strokeColor": "#9E9185",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Mood-Tab-Icon-2.svg": {
    "fileName": "icon_Mood-Tab-Icon-2.svg",
    "title": "Mood Tab Icon",
    "sourceHtml": "page-mood-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B4A",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar",
      "app-shell"
    ]
  },
  "icon_Open-Share-Card-for-This-Entry.svg": {
    "fileName": "icon_Open-Share-Card-for-This-Entry.svg",
    "title": "Open Share Card for This Entry",
    "sourceHtml": "page-log-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF6B4A",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "share-button",
      "entry-card",
      "entry-list"
    ]
  },
  "icon_Remove-Egg-Ingredient.svg": {
    "fileName": "icon_Remove-Egg-Ingredient.svg",
    "title": "Remove Egg Ingredient",
    "sourceHtml": "page-fridge-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F7A71",
    "fillColor": "",
    "strokeColor": "#1F7A71",
    "opacity": "1",
    "contextClasses": [
      "ingredient-chip",
      "chip-row"
    ]
  },
  "icon_Remove-Scallion-Ingredient.svg": {
    "fileName": "icon_Remove-Scallion-Ingredient.svg",
    "title": "Remove Scallion Ingredient",
    "sourceHtml": "page-fridge-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F7A71",
    "fillColor": "",
    "strokeColor": "#1F7A71",
    "opacity": "1",
    "contextClasses": [
      "ingredient-chip",
      "chip-row"
    ]
  },
  "icon_Remove-Tomato-Ingredient.svg": {
    "fileName": "icon_Remove-Tomato-Ingredient.svg",
    "title": "Remove Tomato Ingredient",
    "sourceHtml": "page-fridge-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1F7A71",
    "fillColor": "",
    "strokeColor": "#1F7A71",
    "opacity": "1",
    "contextClasses": [
      "ingredient-chip",
      "chip-row"
    ]
  },
  "icon_Share-Card-Decorative-Sparkle.svg": {
    "fileName": "icon_Share-Card-Decorative-Sparkle.svg",
    "title": "Share Card Decorative Sparkle",
    "sourceHtml": "page-share-card-sheet.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "share-card-top",
      "share-card",
      "preview-area"
    ]
  },
  "icon_Spin-Wheel-Center-Decoration.svg": {
    "fileName": "icon_Spin-Wheel-Center-Decoration.svg",
    "title": "Spin Wheel Center Decoration",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3D2B1F",
    "fillColor": "",
    "strokeColor": "#FF6B4A",
    "opacity": "1",
    "contextClasses": [
      "wheel-center",
      "wheel-plate",
      "wheel-frame"
    ]
  },
  "icon_Start-Wheel-Spin-Icon.svg": {
    "fileName": "icon_Start-Wheel-Spin-Icon.svg",
    "title": "Start Wheel Spin Icon",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#fff",
    "opacity": "1",
    "contextClasses": [
      "spin-button",
      "wheel-card",
      "page"
    ]
  }
};
