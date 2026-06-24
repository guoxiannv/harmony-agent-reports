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
  "icon_About-App.svg": {
    "fileName": "icon_About-App.svg",
    "title": "About App",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "setting-icon",
      "setting-label",
      "setting-row"
    ]
  },
  "icon_Add-Deworm-Record.svg": {
    "fileName": "icon_Add-Deworm-Record.svg",
    "title": "Add Deworm Record",
    "sourceHtml": "page-health-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "module-add",
      "module-header",
      "module-card"
    ]
  },
  "icon_Add-Medical-Record.svg": {
    "fileName": "icon_Add-Medical-Record.svg",
    "title": "Add Medical Record",
    "sourceHtml": "page-health-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "module-add",
      "module-header",
      "module-card"
    ]
  },
  "icon_Add-New-Record.svg": {
    "fileName": "icon_Add-New-Record.svg",
    "title": "Add New Record",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "header-action",
      "header",
      "phone-frame"
    ]
  },
  "icon_Add-Pet-Profile.svg": {
    "fileName": "icon_Add-Pet-Profile.svg",
    "title": "Add Pet Profile",
    "sourceHtml": "page-profile-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "card-add",
      "card-header",
      "card"
    ]
  },
  "icon_Add-Vaccine-Record.svg": {
    "fileName": "icon_Add-Vaccine-Record.svg",
    "title": "Add Vaccine Record",
    "sourceHtml": "page-health-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "module-add",
      "module-header",
      "module-card"
    ]
  },
  "icon_Attach-Medical-Photos.svg": {
    "fileName": "icon_Attach-Medical-Photos.svg",
    "title": "Attach Medical Photos",
    "sourceHtml": "page-medical-record-editor-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#7ED7C2",
    "fillColor": "",
    "strokeColor": "#7ED7C2",
    "opacity": "1",
    "contextClasses": [
      "attachment-box",
      "form-group",
      "content"
    ]
  },
  "icon_Back-to-Previous-Page.svg": {
    "fileName": "icon_Back-to-Previous-Page.svg",
    "title": "Back to Previous Page",
    "sourceHtml": "page-medical-record-detail-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "back-btn",
      "header",
      "phone-frame"
    ]
  },
  "icon_Current-Pet-Avatar-Placeholder.svg": {
    "fileName": "icon_Current-Pet-Avatar-Placeholder.svg",
    "title": "Current Pet Avatar Placeholder",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#3A3630",
    "fillColor": "#3A3630",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-switcher",
      "header"
    ]
  },
  "icon_Current-User-Avatar.svg": {
    "fileName": "icon_Current-User-Avatar.svg",
    "title": "Current User Avatar",
    "sourceHtml": "page-profile-page.html",
    "width": 34,
    "height": 34,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "user-avatar",
      "profile-header",
      "content"
    ]
  },
  "icon_Deworm-Reminder-Icon.svg": {
    "fileName": "icon_Deworm-Reminder-Icon.svg",
    "title": "Deworm Reminder Icon",
    "sourceHtml": "page-reminder-list-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "warning",
      "reminder-card",
      "reminder-list"
    ]
  },
  "icon_Edit-Pet-Profile.svg": {
    "fileName": "icon_Edit-Pet-Profile.svg",
    "title": "Edit Pet Profile",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "pet-row",
      "pet-list",
      "card"
    ]
  },
  "icon_Family-Member-Avatar.svg": {
    "fileName": "icon_Family-Member-Avatar.svg",
    "title": "Family Member Avatar",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F48FB1",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "member-avatar",
      "member-row",
      "member-list"
    ]
  },
  "icon_Filter-by-Category.svg": {
    "fileName": "icon_Filter-by-Category.svg",
    "title": "Filter by Category",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A3630",
    "fillColor": "",
    "strokeColor": "#3A3630",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "filters",
      "content"
    ]
  },
  "icon_Filter-by-Pet.svg": {
    "fileName": "icon_Filter-by-Pet.svg",
    "title": "Filter by Pet",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "white",
    "fillColor": "white",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "active",
      "filters",
      "content"
    ]
  },
  "icon_Filter-by-Time-Range.svg": {
    "fileName": "icon_Filter-by-Time-Range.svg",
    "title": "Filter by Time Range",
    "sourceHtml": "page-records-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A3630",
    "fillColor": "",
    "strokeColor": "#3A3630",
    "opacity": "1",
    "contextClasses": [
      "filter-chip",
      "filters",
      "content"
    ]
  },
  "icon_Food-Category.svg": {
    "fileName": "icon_Food-Category.svg",
    "title": "Food Category",
    "sourceHtml": "page-record-editor-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "category-tab",
      "active",
      "category-tabs",
      "content"
    ]
  },
  "icon_Food-Record-Icon.svg": {
    "fileName": "icon_Food-Record-Icon.svg",
    "title": "Food Record Icon",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "record-card",
      "recent-records"
    ]
  },
  "icon_Food-Record.svg": {
    "fileName": "icon_Food-Record.svg",
    "title": "Food Record",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A3630",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "record-card",
      "records"
    ]
  },
  "icon_Go-to-Reminder-List.svg": {
    "fileName": "icon_Go-to-Reminder-List.svg",
    "title": "Go to Reminder List",
    "sourceHtml": "page-home-page.html",
    "width": 20,
    "height": 20,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F48FB1",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "reminder-banner",
      "content",
      "phone-frame"
    ]
  },
  "icon_Health-Tab-1.svg": {
    "fileName": "icon_Health-Tab-1.svg",
    "title": "Health Tab",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Health-Tab-2.svg": {
    "fileName": "icon_Health-Tab-2.svg",
    "title": "Health Tab",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Home-Tab-1.svg": {
    "fileName": "icon_Home-Tab-1.svg",
    "title": "Home Tab",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#C4BEB4",
    "fillColor": "#C4BEB4",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Home-Tab-2.svg": {
    "fileName": "icon_Home-Tab-2.svg",
    "title": "Home Tab",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#4CB5A0",
    "fillColor": "#4CB5A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Invite-Family-Member-Illustration.svg": {
    "fileName": "icon_Invite-Family-Member-Illustration.svg",
    "title": "Invite Family Member Illustration",
    "sourceHtml": "page-member-invite-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "invite-icon",
      "invite-card",
      "content"
    ]
  },
  "icon_Invite-Family-Member.svg": {
    "fileName": "icon_Invite-Family-Member.svg",
    "title": "Invite Family Member",
    "sourceHtml": "page-profile-page.html",
    "width": 14,
    "height": 14,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "card-add",
      "card-header",
      "card"
    ]
  },
  "icon_Medical-Attachment-Thumbnail.svg": {
    "fileName": "icon_Medical-Attachment-Thumbnail.svg",
    "title": "Medical Attachment Thumbnail",
    "sourceHtml": "page-medical-record-detail-page.html",
    "width": 28,
    "height": 28,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "attachment-thumb",
      "attachment-list",
      "detail-section"
    ]
  },
  "icon_Medicine-Category.svg": {
    "fileName": "icon_Medicine-Category.svg",
    "title": "Medicine Category",
    "sourceHtml": "page-record-editor-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5750",
    "fillColor": "",
    "strokeColor": "#5C5750",
    "opacity": "1",
    "contextClasses": [
      "category-tab",
      "category-tabs",
      "content"
    ]
  },
  "icon_No-Medical-Records-Placeholder.svg": {
    "fileName": "icon_No-Medical-Records-Placeholder.svg",
    "title": "No Medical Records Placeholder",
    "sourceHtml": "page-health-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "module-card",
      "content"
    ]
  },
  "icon_No-Pets-Placeholder.svg": {
    "fileName": "icon_No-Pets-Placeholder.svg",
    "title": "No Pets Placeholder",
    "sourceHtml": "page-profile-page.html",
    "width": 48,
    "height": 48,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "card",
      "content"
    ]
  },
  "icon_No-Recent-Records-Placeholder.svg": {
    "fileName": "icon_No-Recent-Records-Placeholder.svg",
    "title": "No Recent Records Placeholder",
    "sourceHtml": "page-home-page.html",
    "width": 64,
    "height": 64,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "content",
      "phone-frame"
    ]
  },
  "icon_No-Records-Placeholder.svg": {
    "fileName": "icon_No-Records-Placeholder.svg",
    "title": "No Records Placeholder",
    "sourceHtml": "page-records-page.html",
    "width": 72,
    "height": 72,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "content",
      "phone-frame"
    ]
  },
  "icon_No-Reminders-Placeholder.svg": {
    "fileName": "icon_No-Reminders-Placeholder.svg",
    "title": "No Reminders Placeholder",
    "sourceHtml": "page-reminder-list-page.html",
    "width": 72,
    "height": 72,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "content",
      "phone-frame"
    ]
  },
  "icon_No-Trend-Data-Placeholder.svg": {
    "fileName": "icon_No-Trend-Data-Placeholder.svg",
    "title": "No Trend Data Placeholder",
    "sourceHtml": "page-trends-page.html",
    "width": 72,
    "height": 72,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "0.5",
    "contextClasses": [
      "empty-state",
      "content",
      "phone-frame"
    ]
  },
  "icon_Open-About-Page.svg": {
    "fileName": "icon_Open-About-Page.svg",
    "title": "Open About Page",
    "sourceHtml": "page-profile-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "setting-row",
      "card",
      "content"
    ]
  },
  "icon_Open-Pet-Switcher.svg": {
    "fileName": "icon_Open-Pet-Switcher.svg",
    "title": "Open Pet Switcher",
    "sourceHtml": "page-home-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "pet-switcher",
      "header",
      "phone-frame"
    ]
  },
  "icon_Open-Record-Options.svg": {
    "fileName": "icon_Open-Record-Options.svg",
    "title": "Open Record Options",
    "sourceHtml": "page-records-page.html",
    "width": 18,
    "height": 18,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#C4BEB4",
    "fillColor": "#C4BEB4",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "record-menu",
      "record-card",
      "records"
    ]
  },
  "icon_Pet-Avatar-Placeholder-1.svg": {
    "fileName": "icon_Pet-Avatar-Placeholder-1.svg",
    "title": "Pet Avatar Placeholder",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#4CB5A0",
    "fillColor": "#4CB5A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar-sm",
      "pet-row",
      "pet-list"
    ]
  },
  "icon_Pet-Avatar-Placeholder-2.svg": {
    "fileName": "icon_Pet-Avatar-Placeholder-2.svg",
    "title": "Pet Avatar Placeholder",
    "sourceHtml": "page-profile-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#4CB5A0",
    "fillColor": "#4CB5A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar-sm",
      "pet-row",
      "pet-list"
    ]
  },
  "icon_Profile-Tab-1.svg": {
    "fileName": "icon_Profile-Tab-1.svg",
    "title": "Profile Tab",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Profile-Tab-2.svg": {
    "fileName": "icon_Profile-Tab-2.svg",
    "title": "Profile Tab",
    "sourceHtml": "page-profile-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Quick-Add-Food-Record.svg": {
    "fileName": "icon_Quick-Add-Food-Record.svg",
    "title": "Quick Add Food Record",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "mint",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_Quick-Add-Medicine-Record.svg": {
    "fileName": "icon_Quick-Add-Medicine-Record.svg",
    "title": "Quick Add Medicine Record",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5AA7C9",
    "fillColor": "",
    "strokeColor": "#5AA7C9",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "blue",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_Quick-Add-Record.svg": {
    "fileName": "icon_Quick-Add-Record.svg",
    "title": "Quick Add Record",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "fab",
      "phone-frame"
    ]
  },
  "icon_Quick-Add-Toilet-Record.svg": {
    "fileName": "icon_Quick-Add-Toilet-Record.svg",
    "title": "Quick Add Toilet Record",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#F48FB1",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "pink",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_Quick-Add-Weight-Record.svg": {
    "fileName": "icon_Quick-Add-Weight-Record.svg",
    "title": "Quick Add Weight Record",
    "sourceHtml": "page-home-page.html",
    "width": 32,
    "height": 32,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#D4A843",
    "fillColor": "",
    "strokeColor": "#D4A843",
    "opacity": "1",
    "contextClasses": [
      "quick-icon",
      "yellow",
      "quick-btn",
      "quick-actions"
    ]
  },
  "icon_Records-Tab-1.svg": {
    "fileName": "icon_Records-Tab-1.svg",
    "title": "Records Tab",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Records-Tab-2.svg": {
    "fileName": "icon_Records-Tab-2.svg",
    "title": "Records Tab",
    "sourceHtml": "page-records-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Selected-Pet-Indicator.svg": {
    "fileName": "icon_Selected-Pet-Indicator.svg",
    "title": "Selected Pet Indicator",
    "sourceHtml": "page-health-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#3A3630",
    "fillColor": "#3A3630",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "pet-avatar",
      "pet-switcher",
      "header"
    ]
  },
  "icon_Toilet-Category.svg": {
    "fileName": "icon_Toilet-Category.svg",
    "title": "Toilet Category",
    "sourceHtml": "page-record-editor-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5750",
    "fillColor": "",
    "strokeColor": "#5C5750",
    "opacity": "1",
    "contextClasses": [
      "category-tab",
      "category-tabs",
      "content"
    ]
  },
  "icon_Toilet-Record-Icon.svg": {
    "fileName": "icon_Toilet-Record-Icon.svg",
    "title": "Toilet Record Icon",
    "sourceHtml": "page-home-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "record-card",
      "recent-records"
    ]
  },
  "icon_Toilet-Record.svg": {
    "fileName": "icon_Toilet-Record.svg",
    "title": "Toilet Record",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A3630",
    "fillColor": "",
    "strokeColor": "#F48FB1",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "record-card",
      "records"
    ]
  },
  "icon_Trends-Tab-1.svg": {
    "fileName": "icon_Trends-Tab-1.svg",
    "title": "Trends Tab",
    "sourceHtml": "page-health-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#C4BEB4",
    "fillColor": "",
    "strokeColor": "#C4BEB4",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Trends-Tab-2.svg": {
    "fileName": "icon_Trends-Tab-2.svg",
    "title": "Trends Tab",
    "sourceHtml": "page-trends-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "tab",
      "active",
      "tabbar",
      "phone-frame"
    ]
  },
  "icon_Upcoming-Vaccination-Reminder.svg": {
    "fileName": "icon_Upcoming-Vaccination-Reminder.svg",
    "title": "Upcoming Vaccination Reminder",
    "sourceHtml": "page-home-page.html",
    "width": 24,
    "height": 24,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-left",
      "reminder-banner"
    ]
  },
  "icon_Upload-Pet-Avatar.svg": {
    "fileName": "icon_Upload-Pet-Avatar.svg",
    "title": "Upload Pet Avatar",
    "sourceHtml": "page-pet-editor-page.html",
    "width": 44,
    "height": 44,
    "viewBox": "0 0 24 24",
    "paintMode": "fill",
    "defaultColor": "#4CB5A0",
    "fillColor": "#4CB5A0",
    "strokeColor": "",
    "opacity": "1",
    "contextClasses": [
      "avatar-picker",
      "content",
      "phone-frame"
    ]
  },
  "icon_Vaccination-Due-Reminder.svg": {
    "fileName": "icon_Vaccination-Due-Reminder.svg",
    "title": "Vaccination Due Reminder",
    "sourceHtml": "page-health-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-card",
      "reminder-list"
    ]
  },
  "icon_Vaccination-Reminder-Icon.svg": {
    "fileName": "icon_Vaccination-Reminder-Icon.svg",
    "title": "Vaccination Reminder Icon",
    "sourceHtml": "page-reminder-list-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "white",
    "fillColor": "",
    "strokeColor": "white",
    "opacity": "1",
    "contextClasses": [
      "reminder-icon",
      "reminder-card",
      "reminder-list"
    ]
  },
  "icon_View-All-Reminders.svg": {
    "fileName": "icon_View-All-Reminders.svg",
    "title": "View All Reminders",
    "sourceHtml": "page-home-page.html",
    "width": 0,
    "height": 0,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "header-action",
      "header",
      "phone-frame"
    ]
  },
  "icon_Weight-Category.svg": {
    "fileName": "icon_Weight-Category.svg",
    "title": "Weight Category",
    "sourceHtml": "page-record-editor-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#5C5750",
    "fillColor": "",
    "strokeColor": "#5C5750",
    "opacity": "1",
    "contextClasses": [
      "category-tab",
      "category-tabs",
      "content"
    ]
  },
  "icon_Weight-Record.svg": {
    "fileName": "icon_Weight-Record.svg",
    "title": "Weight Record",
    "sourceHtml": "page-records-page.html",
    "width": 22,
    "height": 22,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#3A3630",
    "fillColor": "",
    "strokeColor": "#D4A843",
    "opacity": "1",
    "contextClasses": [
      "record-icon",
      "record-card",
      "records"
    ]
  },
  "icon_Weight-Trend-Chart.svg": {
    "fileName": "icon_Weight-Trend-Chart.svg",
    "title": "Weight Trend Chart",
    "sourceHtml": "page-trends-page.html",
    "width": 100,
    "height": 100,
    "viewBox": "0 0 320 200",
    "paintMode": "fill+stroke",
    "defaultColor": "#3A3630",
    "fillColor": "url(#areaFill)",
    "strokeColor": "#F2F0EB",
    "opacity": "1",
    "contextClasses": [
      "chart-area",
      "chart-card",
      "content"
    ]
  },
  "icon_Weight-Unit-Setting.svg": {
    "fileName": "icon_Weight-Unit-Setting.svg",
    "title": "Weight Unit Setting",
    "sourceHtml": "page-profile-page.html",
    "width": 16,
    "height": 16,
    "viewBox": "0 0 24 24",
    "paintMode": "stroke",
    "defaultColor": "#4CB5A0",
    "fillColor": "",
    "strokeColor": "#4CB5A0",
    "opacity": "1",
    "contextClasses": [
      "setting-icon",
      "setting-label",
      "setting-row"
    ]
  }
};
