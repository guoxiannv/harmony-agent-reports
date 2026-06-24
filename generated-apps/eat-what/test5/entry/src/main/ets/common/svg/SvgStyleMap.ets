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
  "icon_Add-Candidate-Dish.svg": {
    "fileName": "icon_Add-Candidate-Dish.svg",
    "title": "Add Candidate Dish",
    "sourceHtml": "page-recommend-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "input-row",
      "candidate-section"
    ]
  },
  "icon_Add-Ingredient.svg": {
    "fileName": "icon_Add-Ingredient.svg",
    "title": "Add Ingredient",
    "sourceHtml": "page-ingredient-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "add-btn",
      "input-row",
      "input-card"
    ]
  },
  "icon_Add-New-Dish.svg": {
    "fileName": "icon_Add-New-Dish.svg",
    "title": "Add New Dish",
    "sourceHtml": "page-dish-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "fab-add",
      "search-row",
      "page"
    ]
  },
  "icon_App-Brand-Icon.svg": {
    "fileName": "icon_App-Brand-Icon.svg",
    "title": "App Brand Icon",
    "sourceHtml": "page-share-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "share-brand",
      "share-bottom",
      "share-card"
    ]
  },
  "icon_Breakfast-Time.svg": {
    "fileName": "icon_Breakfast-Time.svg",
    "title": "Breakfast Time",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "active",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Calendar-Navigation.svg": {
    "fileName": "icon_Calendar-Navigation.svg",
    "title": "Calendar Navigation",
    "sourceHtml": "page-checkin-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "calendar-header",
      "calendar-card",
      "page"
    ]
  },
  "icon_Check-in-Tab-1.svg": {
    "fileName": "icon_Check-in-Tab-1.svg",
    "title": "Check-in Tab",
    "sourceHtml": "page-checkin-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_Check-in-Tab-2.svg": {
    "fileName": "icon_Check-in-Tab-2.svg",
    "title": "Check-in Tab",
    "sourceHtml": "page-dish-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_Chef-Hat-Decoration.svg": {
    "fileName": "icon_Chef-Hat-Decoration.svg",
    "title": "Chef Hat Decoration",
    "sourceHtml": "page-home-page.html",
    "width": 80,
    "height": 80,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "today-card",
      "page"
    ]
  },
  "icon_Comfort-Mood.svg": {
    "fileName": "icon_Comfort-Mood.svg",
    "title": "Comfort Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Daily-Check-in.svg": {
    "fileName": "icon_Daily-Check-in.svg",
    "title": "Daily Check-in",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A6B58",
    "fillColor": "",
    "strokeColor": "#5A6B58",
    "opacity": "1",
    "contextClasses": [
      "feature-icon",
      "olive",
      "feature-card",
      "quick-grid"
    ]
  },
  "icon_Dinner-Time.svg": {
    "fileName": "icon_Dinner-Time.svg",
    "title": "Dinner Time",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Dish-Library-Menu.svg": {
    "fileName": "icon_Dish-Library-Menu.svg",
    "title": "Dish Library Menu",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "orange",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_Dish-Library.svg": {
    "fileName": "icon_Dish-Library.svg",
    "title": "Dish Library",
    "sourceHtml": "page-recommend-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_Edit-Dish.svg": {
    "fileName": "icon_Edit-Dish.svg",
    "title": "Edit Dish",
    "sourceHtml": "page-dish-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "dish-edit",
      "dish-item",
      "dish-list"
    ]
  },
  "icon_Filter-Dishes.svg": {
    "fileName": "icon_Filter-Dishes.svg",
    "title": "Filter Dishes",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#8FA897",
    "fillColor": "",
    "strokeColor": "#8FA897",
    "opacity": "1",
    "contextClasses": [
      "feature-icon",
      "sage",
      "feature-card",
      "quick-grid"
    ]
  },
  "icon_Filtered-Dish-1.svg": {
    "fileName": "icon_Filtered-Dish-1.svg",
    "title": "Filtered Dish",
    "sourceHtml": "page-filter-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "result-color",
      "orange",
      "result-card",
      "result-grid"
    ]
  },
  "icon_Filtered-Dish-2.svg": {
    "fileName": "icon_Filtered-Dish-2.svg",
    "title": "Filtered Dish",
    "sourceHtml": "page-filter-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "result-color",
      "green",
      "result-card",
      "result-grid"
    ]
  },
  "icon_Filtered-Dish-3.svg": {
    "fileName": "icon_Filtered-Dish-3.svg",
    "title": "Filtered Dish",
    "sourceHtml": "page-filter-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "result-color",
      "sage",
      "result-card",
      "result-grid"
    ]
  },
  "icon_Filtered-Dish-4.svg": {
    "fileName": "icon_Filtered-Dish-4.svg",
    "title": "Filtered Dish",
    "sourceHtml": "page-filter-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "result-color",
      "cream",
      "result-card",
      "result-grid"
    ]
  },
  "icon_Go-Back.svg": {
    "fileName": "icon_Go-Back.svg",
    "title": "Go Back",
    "sourceHtml": "page-dish-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "page"
    ]
  },
  "icon_Happy-Mood.svg": {
    "fileName": "icon_Happy-Mood.svg",
    "title": "Happy Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "active",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Home-Tab-1.svg": {
    "fileName": "icon_Home-Tab-1.svg",
    "title": "Home Tab",
    "sourceHtml": "page-checkin-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_Home-Tab-2.svg": {
    "fileName": "icon_Home-Tab-2.svg",
    "title": "Home Tab",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_Indulgent-Mood.svg": {
    "fileName": "icon_Indulgent-Mood.svg",
    "title": "Indulgent Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Ingredient-Recommendation.svg": {
    "fileName": "icon_Ingredient-Recommendation.svg",
    "title": "Ingredient Recommendation",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4ECB9C",
    "fillColor": "",
    "strokeColor": "#4ECB9C",
    "opacity": "1",
    "contextClasses": [
      "feature-icon",
      "green",
      "feature-card",
      "quick-grid"
    ]
  },
  "icon_Late-Night-Time.svg": {
    "fileName": "icon_Late-Night-Time.svg",
    "title": "Late Night Time",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Light-Mood.svg": {
    "fileName": "icon_Light-Mood.svg",
    "title": "Light Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Lunch-Time.svg": {
    "fileName": "icon_Lunch-Time.svg",
    "title": "Lunch Time",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Navigate-Forward.svg": {
    "fileName": "icon_Navigate-Forward.svg",
    "title": "Navigate Forward",
    "sourceHtml": "page-profile-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "menu-arrow",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_Open-Settings.svg": {
    "fileName": "icon_Open-Settings.svg",
    "title": "Open Settings",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_Profile-Tab-1.svg": {
    "fileName": "icon_Profile-Tab-1.svg",
    "title": "Profile Tab",
    "sourceHtml": "page-checkin-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_Profile-Tab-2.svg": {
    "fileName": "icon_Profile-Tab-2.svg",
    "title": "Profile Tab",
    "sourceHtml": "page-dish-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_Recommend-Tab-1.svg": {
    "fileName": "icon_Recommend-Tab-1.svg",
    "title": "Recommend Tab",
    "sourceHtml": "page-checkin-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A8A29C",
    "fillColor": "",
    "strokeColor": "#A8A29C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tab-bar"
    ]
  },
  "icon_Recommend-Tab-2.svg": {
    "fileName": "icon_Recommend-Tab-2.svg",
    "title": "Recommend Tab",
    "sourceHtml": "page-filter-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tab-bar"
    ]
  },
  "icon_Recommended-Dish-1.svg": {
    "fileName": "icon_Recommended-Dish-1.svg",
    "title": "Recommended Dish",
    "sourceHtml": "page-ingredient-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "orange",
      "dish-card",
      "result-list"
    ]
  },
  "icon_Recommended-Dish-2.svg": {
    "fileName": "icon_Recommended-Dish-2.svg",
    "title": "Recommended Dish",
    "sourceHtml": "page-ingredient-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4ECB9C",
    "fillColor": "",
    "strokeColor": "#4ECB9C",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "green",
      "dish-card",
      "result-list"
    ]
  },
  "icon_Recommended-Dish-3.svg": {
    "fileName": "icon_Recommended-Dish-3.svg",
    "title": "Recommended Dish",
    "sourceHtml": "page-ingredient-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A6B58",
    "fillColor": "",
    "strokeColor": "#5A6B58",
    "opacity": "1",
    "contextClasses": [
      "dish-icon",
      "olive",
      "dish-card",
      "result-list"
    ]
  },
  "icon_Remove-Candidate.svg": {
    "fileName": "icon_Remove-Candidate.svg",
    "title": "Remove Candidate",
    "sourceHtml": "page-recommend-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "del",
      "tag",
      "tag-list"
    ]
  },
  "icon_Remove-Ingredient.svg": {
    "fileName": "icon_Remove-Ingredient.svg",
    "title": "Remove Ingredient",
    "sourceHtml": "page-ingredient-page.html",
    "width": 12,
    "height": 12,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#1E7A63",
    "fillColor": "",
    "strokeColor": "#1E7A63",
    "opacity": "1",
    "contextClasses": [
      "del",
      "ingredient-tag",
      "tag-list"
    ]
  },
  "icon_Save-Image.svg": {
    "fileName": "icon_Save-Image.svg",
    "title": "Save Image",
    "sourceHtml": "page-checkin-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "share-btn",
      "share-row",
      "form-card"
    ]
  },
  "icon_Save-to-Album.svg": {
    "fileName": "icon_Save-to-Album.svg",
    "title": "Save to Album",
    "sourceHtml": "page-share-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "action-row",
      "page"
    ]
  },
  "icon_Search-Dishes.svg": {
    "fileName": "icon_Search-Dishes.svg",
    "title": "Search Dishes",
    "sourceHtml": "page-dish-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "search-input-wrap",
      "search-row",
      "page"
    ]
  },
  "icon_Settings-Menu.svg": {
    "fileName": "icon_Settings-Menu.svg",
    "title": "Settings Menu",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A6B58",
    "fillColor": "",
    "strokeColor": "#5A6B58",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "olive",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_Share-Card.svg": {
    "fileName": "icon_Share-Card.svg",
    "title": "Share Card",
    "sourceHtml": "page-checkin-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "share-btn",
      "share-row",
      "form-card"
    ]
  },
  "icon_Share-Check-in.svg": {
    "fileName": "icon_Share-Check-in.svg",
    "title": "Share Check-in",
    "sourceHtml": "page-checkin-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#2E2A25",
    "fillColor": "",
    "strokeColor": "#2E2A25",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "header",
      "page"
    ]
  },
  "icon_Spicy-Mood.svg": {
    "fileName": "icon_Spicy-Mood.svg",
    "title": "Spicy Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Spin-Wheel.svg": {
    "fileName": "icon_Spin-Wheel.svg",
    "title": "Spin Wheel",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FF8C42",
    "fillColor": "",
    "strokeColor": "#FF8C42",
    "opacity": "1",
    "contextClasses": [
      "feature-icon",
      "orange",
      "feature-card",
      "quick-grid"
    ]
  },
  "icon_Spinning-Wheel.svg": {
    "fileName": "icon_Spinning-Wheel.svg",
    "title": "Spinning Wheel",
    "sourceHtml": "page-recommend-page.html",
    "width": 300,
    "height": 300,
    "viewBox": "0 0 300 300",
    "paintMode": "fill",
    "defaultColor": "#2E2A25",
    "fillColor": "#FF8C42",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "wheel",
      "wheel-container",
      "page"
    ]
  },
  "icon_Statistics-Menu.svg": {
    "fileName": "icon_Statistics-Menu.svg",
    "title": "Statistics Menu",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4ECB9C",
    "fillColor": "",
    "strokeColor": "#4ECB9C",
    "opacity": "1",
    "contextClasses": [
      "menu-icon",
      "green",
      "menu-item",
      "menu-list"
    ]
  },
  "icon_System-Share.svg": {
    "fileName": "icon_System-Share.svg",
    "title": "System Share",
    "sourceHtml": "page-share-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "action-row",
      "page"
    ]
  },
  "icon_User-Avatar.svg": {
    "fileName": "icon_User-Avatar.svg",
    "title": "User Avatar",
    "sourceHtml": "page-profile-page.html",
    "width": 36,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "avatar",
      "profile-card",
      "page"
    ]
  },
  "icon_Whatever-Mood.svg": {
    "fileName": "icon_Whatever-Mood.svg",
    "title": "Whatever Mood",
    "sourceHtml": "page-filter-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7A746E",
    "fillColor": "",
    "strokeColor": "#7A746E",
    "opacity": "1",
    "contextClasses": [
      "chip",
      "chip-list",
      "filter-card"
    ]
  },
  "icon_Wheel-Pointer.svg": {
    "fileName": "icon_Wheel-Pointer.svg",
    "title": "Wheel Pointer",
    "sourceHtml": "page-recommend-page.html",
    "width": 28,
    "height": 36,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#FF8C42",
    "fillColor": "#FF8C42",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "wheel-container",
      "page"
    ]
  }
};
