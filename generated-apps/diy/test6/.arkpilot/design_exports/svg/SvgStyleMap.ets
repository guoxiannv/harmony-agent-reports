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
  "icon_Add-New-Item-1.svg": {
    "fileName": "icon_Add-New-Item-1.svg",
    "title": "Add New Item",
    "sourceHtml": "page-course-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "page-content"
    ]
  },
  "icon_Add-New-Item-2.svg": {
    "fileName": "icon_Add-New-Item-2.svg",
    "title": "Add New Item",
    "sourceHtml": "page-courses-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "btn-ghost",
      "page-content"
    ]
  },
  "icon_Add-New-Item-3.svg": {
    "fileName": "icon_Add-New-Item-3.svg",
    "title": "Add New Item",
    "sourceHtml": "page-courses-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Course-Location.svg": {
    "fileName": "icon_Course-Location.svg",
    "title": "Course Location",
    "sourceHtml": "page-course-detail-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "rgba(255,255,255,0.9)",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "card",
      "card-gradient"
    ]
  },
  "icon_Decrease-Value.svg": {
    "fileName": "icon_Decrease-Value.svg",
    "title": "Decrease Value",
    "sourceHtml": "page-points-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#B85448",
    "opacity": "1",
    "contextClasses": [
      "list-item",
      "card"
    ]
  },
  "icon_Delete-Item.svg": {
    "fileName": "icon_Delete-Item.svg",
    "title": "Delete Item",
    "sourceHtml": "page-member-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#B85448",
    "fillColor": "",
    "strokeColor": "#B85448",
    "opacity": "1",
    "contextClasses": [
      "btn-ghost",
      "page-content"
    ]
  },
  "icon_Edit-Item-1.svg": {
    "fileName": "icon_Edit-Item-1.svg",
    "title": "Edit Item",
    "sourceHtml": "page-course-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "page-content"
    ]
  },
  "icon_Edit-Item-2.svg": {
    "fileName": "icon_Edit-Item-2.svg",
    "title": "Edit Item",
    "sourceHtml": "page-inventory-edit-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B2820",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "handwritten",
      "page-title",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Empty-Members-Pottery-Wheel.svg": {
    "fileName": "icon_Empty-Members-Pottery-Wheel.svg",
    "title": "Empty Members Pottery Wheel",
    "sourceHtml": "page-members-page.html",
    "width": 120,
    "height": 120,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#C98B6C",
    "opacity": "1",
    "contextClasses": [
      "empty-state",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Expand-Options.svg": {
    "fileName": "icon_Expand-Options.svg",
    "title": "Expand Options",
    "sourceHtml": "page-course-booking-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "input-field",
      "card",
      "page-content"
    ]
  },
  "icon_Filter-List-1.svg": {
    "fileName": "icon_Filter-List-1.svg",
    "title": "Filter List",
    "sourceHtml": "page-inventory-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "btn-secondary",
      "page-content"
    ]
  },
  "icon_Filter-List-2.svg": {
    "fileName": "icon_Filter-List-2.svg",
    "title": "Filter List",
    "sourceHtml": "page-inventory-transaction-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B2820",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "handwritten",
      "page-title",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Filter-List-3.svg": {
    "fileName": "icon_Filter-List-3.svg",
    "title": "Filter List",
    "sourceHtml": "page-members-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "page-content"
    ]
  },
  "icon_Go-Back.svg": {
    "fileName": "icon_Go-Back.svg",
    "title": "Go Back",
    "sourceHtml": "page-course-booking-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "icon-btn",
      "top-nav",
      "app-frame"
    ]
  },
  "icon_Member-Check-in-1.svg": {
    "fileName": "icon_Member-Check-in-1.svg",
    "title": "Member Check-in",
    "sourceHtml": "page-home-page.html",
    "width": 26,
    "height": 26,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Member-Check-in-2.svg": {
    "fileName": "icon_Member-Check-in-2.svg",
    "title": "Member Check-in",
    "sourceHtml": "page-member-detail-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "page-content"
    ]
  },
  "icon_Member-Check-in-3.svg": {
    "fileName": "icon_Member-Check-in-3.svg",
    "title": "Member Check-in",
    "sourceHtml": "page-points-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "btn-primary",
      "card",
      "card-gradient"
    ]
  },
  "icon_Member-Check-in-4.svg": {
    "fileName": "icon_Member-Check-in-4.svg",
    "title": "Member Check-in",
    "sourceHtml": "page-points-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#4F6644",
    "opacity": "1",
    "contextClasses": [
      "list-item",
      "card"
    ]
  },
  "icon_Navigate-to-Courses-Calendar-1.svg": {
    "fileName": "icon_Navigate-to-Courses-Calendar-1.svg",
    "title": "Navigate to Courses Calendar",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Courses-Calendar-2.svg": {
    "fileName": "icon_Navigate-to-Courses-Calendar-2.svg",
    "title": "Navigate to Courses Calendar",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B2820",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Courses-Calendar-3.svg": {
    "fileName": "icon_Navigate-to-Courses-Calendar-3.svg",
    "title": "Navigate to Courses Calendar",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Home-Overview-1.svg": {
    "fileName": "icon_Navigate-to-Home-Overview-1.svg",
    "title": "Navigate to Home Overview",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Home-Overview-2.svg": {
    "fileName": "icon_Navigate-to-Home-Overview-2.svg",
    "title": "Navigate to Home Overview",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Inventory-1.svg": {
    "fileName": "icon_Navigate-to-Inventory-1.svg",
    "title": "Navigate to Inventory",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Inventory-2.svg": {
    "fileName": "icon_Navigate-to-Inventory-2.svg",
    "title": "Navigate to Inventory",
    "sourceHtml": "page-inventory-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Members-List-1.svg": {
    "fileName": "icon_Navigate-to-Members-List-1.svg",
    "title": "Navigate to Members List",
    "sourceHtml": "page-course-detail-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "rgba(255,255,255,0.9)",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "card",
      "card-gradient"
    ]
  },
  "icon_Navigate-to-Members-List-2.svg": {
    "fileName": "icon_Navigate-to-Members-List-2.svg",
    "title": "Navigate to Members List",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Members-List-3.svg": {
    "fileName": "icon_Navigate-to-Members-List-3.svg",
    "title": "Navigate to Members List",
    "sourceHtml": "page-members-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Points-Center-1.svg": {
    "fileName": "icon_Navigate-to-Points-Center-1.svg",
    "title": "Navigate to Points Center",
    "sourceHtml": "page-courses-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E8E84",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Points-Center-2.svg": {
    "fileName": "icon_Navigate-to-Points-Center-2.svg",
    "title": "Navigate to Points Center",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B2820",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "section-title",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Points-Center-3.svg": {
    "fileName": "icon_Navigate-to-Points-Center-3.svg",
    "title": "Navigate to Points Center",
    "sourceHtml": "page-point-record-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3B2820",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "handwritten",
      "page-title",
      "page-content",
      "app-frame"
    ]
  },
  "icon_Navigate-to-Points-Center-4.svg": {
    "fileName": "icon_Navigate-to-Points-Center-4.svg",
    "title": "Navigate to Points Center",
    "sourceHtml": "page-points-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "list-item",
      "card"
    ]
  },
  "icon_Navigate-to-Points-Center-5.svg": {
    "fileName": "icon_Navigate-to-Points-Center-5.svg",
    "title": "Navigate to Points Center",
    "sourceHtml": "page-points-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#9E4F2C",
    "fillColor": "",
    "strokeColor": "#9E4F2C",
    "opacity": "1",
    "contextClasses": [
      "tab-item",
      "active",
      "bottom-tab-bar",
      "app-frame"
    ]
  },
  "icon_Open-Detail.svg": {
    "fileName": "icon_Open-Detail.svg",
    "title": "Open Detail",
    "sourceHtml": "page-members-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#C98B6C",
    "opacity": "1",
    "contextClasses": [
      "list-item",
      "card"
    ]
  },
  "icon_Search-Members.svg": {
    "fileName": "icon_Search-Members.svg",
    "title": "Search Members",
    "sourceHtml": "page-members-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#6E5D53",
    "fillColor": "",
    "strokeColor": "#9E8E84",
    "opacity": "1",
    "contextClasses": [
      "page-content"
    ]
  },
  "icon_Upload-Work-Image.svg": {
    "fileName": "icon_Upload-Work-Image.svg",
    "title": "Upload Work Image",
    "sourceHtml": "page-member-detail-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C98B6C",
    "fillColor": "",
    "strokeColor": "#C98B6C",
    "opacity": "1",
    "contextClasses": [
      "image-slot",
      "image-grid",
      "page-content"
    ]
  },
  "icon_Warning-Alert.svg": {
    "fileName": "icon_Warning-Alert.svg",
    "title": "Warning Alert",
    "sourceHtml": "page-inventory-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#fff",
    "fillColor": "",
    "strokeColor": "#FFFFFF",
    "opacity": "1",
    "contextClasses": [
      "card",
      "card-gradient-alert",
      "page-content"
    ]
  }
};
