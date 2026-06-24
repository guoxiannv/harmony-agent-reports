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
  "icon_Add-Artwork-Photo.svg": {
    "fileName": "icon_Add-Artwork-Photo.svg",
    "title": "Add Artwork Photo",
    "sourceHtml": "page-member-form-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "image-picker",
      "works-row",
      "form-group"
    ]
  },
  "icon_Add-Inventory-Item.svg": {
    "fileName": "icon_Add-Inventory-Item.svg",
    "title": "Add Inventory Item",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_Add-New-Course.svg": {
    "fileName": "icon_Add-New-Course.svg",
    "title": "Add New Course",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_Add-New-Member-1.svg": {
    "fileName": "icon_Add-New-Member-1.svg",
    "title": "Add New Member",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_Add-New-Member-2.svg": {
    "fileName": "icon_Add-New-Member-2.svg",
    "title": "Add New Member",
    "sourceHtml": "page-members-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#FFFFFF",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab"
    ]
  },
  "icon_Artwork-Thumbnail-Placeholder.svg": {
    "fileName": "icon_Artwork-Thumbnail-Placeholder.svg",
    "title": "Artwork Thumbnail Placeholder",
    "sourceHtml": "page-member-detail-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9CFC2",
    "fillColor": "",
    "strokeColor": "#D9CFC2",
    "opacity": "1",
    "contextClasses": [
      "work-thumb",
      "works-grid",
      "section"
    ]
  },
  "icon_Backup-App-Data.svg": {
    "fileName": "icon_Backup-App-Data.svg",
    "title": "Backup App Data",
    "sourceHtml": "page-settings-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#8C7D70",
    "opacity": "1",
    "contextClasses": [
      "setting-card",
      "form-group",
      "form"
    ]
  },
  "icon_Calendar-Settings.svg": {
    "fileName": "icon_Calendar-Settings.svg",
    "title": "Calendar Settings",
    "sourceHtml": "page-calendar-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#3D2B1F",
    "opacity": "1",
    "contextClasses": [
      "filter-btn",
      "header",
      "page"
    ]
  },
  "icon_Course-Calendar-Tab-1.svg": {
    "fileName": "icon_Course-Calendar-Tab-1.svg",
    "title": "Course Calendar Tab",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_Course-Calendar-Tab-2.svg": {
    "fileName": "icon_Course-Calendar-Tab-2.svg",
    "title": "Course Calendar Tab",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_Dormant-Members-Reminder.svg": {
    "fileName": "icon_Dormant-Members-Reminder.svg",
    "title": "Dormant Members Reminder",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A0522D",
    "fillColor": "",
    "strokeColor": "#A0522D",
    "opacity": "1",
    "contextClasses": [
      "alert-icon",
      "alert-card",
      "section"
    ]
  },
  "icon_Filter-Members.svg": {
    "fileName": "icon_Filter-Members.svg",
    "title": "Filter Members",
    "sourceHtml": "page-members-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#5A4A3F",
    "opacity": "1",
    "contextClasses": [
      "filter-btn",
      "header",
      "page"
    ]
  },
  "icon_Go-Back.svg": {
    "fileName": "icon_Go-Back.svg",
    "title": "Go Back",
    "sourceHtml": "page-course-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#3D2B1F",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "page"
    ]
  },
  "icon_Home-Tab-1.svg": {
    "fileName": "icon_Home-Tab-1.svg",
    "title": "Home Tab",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
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
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_Inventory-Tab-1.svg": {
    "fileName": "icon_Inventory-Tab-1.svg",
    "title": "Inventory Tab",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_Inventory-Tab-2.svg": {
    "fileName": "icon_Inventory-Tab-2.svg",
    "title": "Inventory Tab",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_Low-Stock-Warning.svg": {
    "fileName": "icon_Low-Stock-Warning.svg",
    "title": "Low Stock Warning",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#A0522D",
    "fillColor": "",
    "strokeColor": "#A0522D",
    "opacity": "1",
    "contextClasses": [
      "alert-icon",
      "alert-card",
      "page"
    ]
  },
  "icon_Members-Tab-1.svg": {
    "fileName": "icon_Members-Tab-1.svg",
    "title": "Members Tab",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_Members-Tab-2.svg": {
    "fileName": "icon_Members-Tab-2.svg",
    "title": "Members Tab",
    "sourceHtml": "page-members-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_Next-Calendar-Period.svg": {
    "fileName": "icon_Next-Calendar-Period.svg",
    "title": "Next Calendar Period",
    "sourceHtml": "page-calendar-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#5A4A3F",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-toolbar"
    ]
  },
  "icon_No-Members-Yet.svg": {
    "fileName": "icon_No-Members-Yet.svg",
    "title": "No Members Yet",
    "sourceHtml": "page-members-page.html",
    "width": 96,
    "height": 96,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D9CFC2",
    "fillColor": "",
    "strokeColor": "#D9CFC2",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "section",
      "page"
    ]
  },
  "icon_Open-Course-Calendar.svg": {
    "fileName": "icon_Open-Course-Calendar.svg",
    "title": "Open Course Calendar",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_Open-Inventory-Management.svg": {
    "fileName": "icon_Open-Inventory-Management.svg",
    "title": "Open Inventory Management",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "quick-item",
      "quick-grid"
    ]
  },
  "icon_Open-Member-Check-in-Sheet.svg": {
    "fileName": "icon_Open-Member-Check-in-Sheet.svg",
    "title": "Open Member Check-in Sheet",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "header-action",
      "header",
      "page"
    ]
  },
  "icon_Open-Points-Rule-Settings.svg": {
    "fileName": "icon_Open-Points-Rule-Settings.svg",
    "title": "Open Points Rule Settings",
    "sourceHtml": "page-points-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "header-action",
      "header",
      "page"
    ]
  },
  "icon_Points-Tab-1.svg": {
    "fileName": "icon_Points-Tab-1.svg",
    "title": "Points Tab",
    "sourceHtml": "page-calendar-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "tabbar"
    ]
  },
  "icon_Points-Tab-2.svg": {
    "fileName": "icon_Points-Tab-2.svg",
    "title": "Points Tab",
    "sourceHtml": "page-points-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C67B5C",
    "fillColor": "",
    "strokeColor": "#C67B5C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "tabbar"
    ]
  },
  "icon_Previous-Calendar-Period.svg": {
    "fileName": "icon_Previous-Calendar-Period.svg",
    "title": "Previous Calendar Period",
    "sourceHtml": "page-calendar-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#5A4A3F",
    "opacity": "1",
    "contextClasses": [
      "calendar-nav",
      "calendar-toolbar"
    ]
  },
  "icon_Restore-App-Data.svg": {
    "fileName": "icon_Restore-App-Data.svg",
    "title": "Restore App Data",
    "sourceHtml": "page-settings-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#8C7D70",
    "opacity": "1",
    "contextClasses": [
      "setting-card",
      "form-group",
      "form"
    ]
  },
  "icon_Search-Members.svg": {
    "fileName": "icon_Search-Members.svg",
    "title": "Search Members",
    "sourceHtml": "page-members-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "search-bar",
      "page"
    ]
  },
  "icon_Select-Member-Avatar.svg": {
    "fileName": "icon_Select-Member-Avatar.svg",
    "title": "Select Member Avatar",
    "sourceHtml": "page-member-form-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E9186",
    "fillColor": "",
    "strokeColor": "#9E9186",
    "opacity": "1",
    "contextClasses": [
      "image-picker",
      "form-group",
      "form"
    ]
  },
  "icon_View-Inventory-Logs.svg": {
    "fileName": "icon_View-Inventory-Logs.svg",
    "title": "View Inventory Logs",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5A4A3F",
    "fillColor": "",
    "strokeColor": "#3D2B1F",
    "opacity": "1",
    "contextClasses": [
      "header-action",
      "header",
      "page"
    ]
  }
};
