#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate high-fidelity HTML design artifacts for 手作·印记."""

import os
import re

ICON_DIR = "/Users/huaweiide/Desktop/fe/code/harmony-pilot/skills/autopilot-html-tmux-design-a2ui-pro/assets/icons/"
OUTPUT_DIR = "/Users/huaweiide/Desktop/fe/code/harmony-pilot/generated-apps/diy/test6/.arkpilot/designs/"

ICON_TITLES = {
    "home": "Navigate to Home Overview",
    "users": "Navigate to Members List",
    "calendar": "Navigate to Courses Calendar",
    "wallet": "Navigate to Points Center",
    "package": "Navigate to Inventory",
    "search": "Search Members",
    "plus": "Add New Item",
    "check": "Confirm Action",
    "pencil": "Edit Item",
    "trash": "Delete Item",
    "arrow-left": "Go Back",
    "arrow-right": "Open Detail",
    "camera": "Upload Work Image",
    "clock": "Course Time",
    "map-pin": "Course Location",
    "phone": "Member Phone",
    "calendar-days": "Open Date Picker",
    "bell": "View Reminders",
    "alert-triangle": "Warning Alert",
    "stamp": "Member Check-in",
    "settings": "Open Settings",
    "x": "Close Sheet",
    "chevron-down": "Expand Options",
    "sliders": "Filter List",
    "user": "Member Avatar Placeholder",
    "minus": "Decrease Value",
    "image": "Work Image Placeholder",
}


def get_icon(name):
    path = os.path.join(ICON_DIR, f"{name}.svg")
    if not os.path.exists(path):
        return ""
    with open(path, "r", encoding="utf-8") as f:
        svg = f.read()
    title = ICON_TITLES.get(name, name)
    # Inject contextual <title> as the first child of <svg>
    svg = re.sub(
        r"(<svg\b[^>]*>)",
        rf"\1<title>{title}</title>",
        svg,
        count=1,
        flags=re.DOTALL,
    )
    # Normalize stroke color for our palette if needed
    svg = svg.replace('stroke="currentColor"', 'stroke="#9E8E84"')
    return svg


def icon(name, color=None, size=None):
    svg = get_icon(name)
    if not svg:
        return ""
    if color:
        svg = svg.replace('stroke="#9E8E84"', f'stroke="{color}"')
    if size:
        svg = svg.replace('width="24"', f'width="{size}"').replace('height="24"', f'height="{size}"')
    return svg


BASE_STYLES = """
:root {
  --clay-primary: #9E4F2C;
  --clay-secondary: #C98B6C;
  --clay-light: #F7F3ED;
  --clay-card: #FFFFFF;
  --clay-dark: #4A3024;
  --text-title: #3B2820;
  --text-body: #6E5D53;
  --text-muted: #9E8E84;
  --green: #7D9472;
  --pink: #D9A89B;
  --red: #B85448;
  --blue: #8BAAB8;
  --ochre: #B87D4B;
}
* { box-sizing: border-box; }
html, body {
  margin: 0; padding: 0;
  background: #E5E1DA;
  font-family: 'PingFang SC', 'Noto Sans SC', 'Hiragino Sans GB', 'Microsoft YaHei', sans-serif;
  color: var(--text-body);
}
.app-frame {
  max-width: 390px;
  margin: 0 auto;
  background: var(--clay-light);
  min-height: 100vh;
  position: relative;
  overflow-x: hidden;
  box-shadow: 0 0 40px rgba(74,48,36,0.12);
}
.page-content { padding: 22px 22px 110px; }
.handwritten {
  font-family: 'Zhi Mang Xing', 'Ma Shan Zheng', cursive;
  font-weight: 400;
}
.page-title {
  font-size: 44px;
  color: var(--text-title);
  line-height: 1.12;
  margin: 8px 0 4px;
}
.page-subtitle {
  font-size: 15px;
  color: var(--text-muted);
  margin-bottom: 28px;
}
.section-title {
  font-size: 20px;
  font-weight: 700;
  color: var(--text-title);
  margin: 28px 0 14px;
  display: flex;
  align-items: center;
  gap: 8px;
}
.card {
  background: var(--clay-card);
  border: 1px solid rgba(158,79,44,0.08);
  border-radius: 20px;
  padding: 18px;
  box-shadow: rgba(74,48,36,0.10) 0px 10px 28px -6px, rgba(74,48,36,0.06) 0px 4px 8px -2px;
  margin-bottom: 14px;
}
.card-gradient {
  background: linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%);
  color: #fff;
  border: none;
  box-shadow: rgba(158,79,44,0.34) 0px 10px 28px -8px;
}
.card-gradient .card-title,
.card-gradient .card-caption,
.card-gradient .big-number { color: #fff; }
.card-gradient-secondary {
  background: linear-gradient(135deg, #D9A89B 0%, #F0DFD8 100%);
  color: #3B2820;
  border: none;
}
.card-gradient-alert {
  background: linear-gradient(135deg, #B85448 0%, #D9A89B 100%);
  color: #fff;
  border: none;
}
.card-title {
  font-size: 17px;
  font-weight: 600;
  color: var(--text-title);
  margin: 0 0 4px;
}
.card-caption {
  font-size: 13px;
  color: var(--text-muted);
  margin: 0;
}
.big-number {
  font-size: 36px;
  font-weight: 700;
  color: var(--text-title);
  margin: 8px 0 0;
  letter-spacing: -0.5px;
}
.reminder-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
  margin-bottom: 28px;
}
.reminder-card {
  padding: 16px;
  border-radius: 18px;
}
.reminder-card .card-title { font-size: 15px; }
.reminder-card .big-number { font-size: 28px; }
.btn-primary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  background: linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%);
  color: #fff;
  border: none;
  border-radius: 16px;
  padding: 14px 28px;
  font-size: 16px;
  font-weight: 600;
  box-shadow: rgba(158,79,44,0.34) 0px 10px 28px -4px;
  cursor: pointer;
}
.btn-secondary {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  background: transparent;
  color: var(--clay-primary);
  border: 1.5px solid var(--clay-secondary);
  border-radius: 16px;
  padding: 14px 28px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
}
.btn-ghost {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  background: transparent;
  border: none;
  color: var(--clay-primary);
  font-size: 14px;
  font-weight: 500;
  padding: 0;
  cursor: pointer;
}
.input-field {
  width: 100%;
  background: var(--clay-light);
  border: 1px solid rgba(158,79,44,0.12);
  border-radius: 14px;
  padding: 15px 17px;
  font-size: 15px;
  color: var(--text-title);
  margin-bottom: 14px;
  outline: none;
}
.input-field::placeholder { color: var(--text-muted); }
.input-label {
  display: block;
  font-size: 13px;
  font-weight: 600;
  color: var(--text-title);
  margin-bottom: 6px;
}
.chip {
  display: inline-flex;
  align-items: center;
  background: #F3EBE3;
  color: var(--clay-dark);
  border-radius: 12px;
  padding: 7px 12px;
  font-size: 13px;
  font-weight: 500;
}
.chip-pink { background: #F5DDD6; color: #A64B3C; }
.chip-red { background: #F5DDD6; color: #B85448; }
.chip-green { background: #DFE8D6; color: #4F6644; }
.chip-blue { background: #E3EBEF; color: #4A6070; }
.list-item {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 0;
  border-bottom: 1px solid rgba(158,79,44,0.08);
}
.list-item:last-child { border-bottom: none; }
.avatar {
  width: 48px; height: 48px;
  border-radius: 50%;
  background: linear-gradient(135deg, #9E4F2C 0%, #C98B6C 100%);
  color: #fff;
  display: flex; align-items: center; justify-content: center;
  font-size: 18px; font-weight: 600;
  flex-shrink: 0;
}
.avatar-small { width: 36px; height: 36px; font-size: 14px; }
.empty-state {
  text-align: center;
  padding: 48px 20px;
}
.empty-state svg {
  width: 120px; height: 120px;
  stroke: var(--clay-secondary);
  margin-bottom: 16px;
}
.empty-title {
  font-size: 24px;
  color: var(--text-title);
  margin-bottom: 8px;
}
.empty-caption { font-size: 14px; color: var(--text-muted); }
.bottom-tab-bar {
  position: fixed;
  bottom: 0;
  left: 0; right: 0;
  max-width: 390px;
  margin: 0 auto;
  height: 68px;
  background: rgba(247,243,237,0.88);
  backdrop-filter: blur(22px) saturate(165%);
  -webkit-backdrop-filter: blur(22px) saturate(165%);
  border-top: 1px solid rgba(158,79,44,0.10);
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding-bottom: env(safe-area-inset-bottom, 0);
  z-index: 100;
}
.tab-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
  color: var(--text-muted);
  font-size: 11px;
  font-weight: 500;
  text-decoration: none;
  position: relative;
  padding-top: 8px;
}
.tab-item.active { color: var(--clay-primary); }
.tab-item.active::before {
  content: '';
  position: absolute;
  top: 0;
  width: 4px; height: 4px;
  border-radius: 50%;
  background: var(--clay-primary);
}
.fab {
  position: fixed;
  bottom: 102px;
  right: calc(50% - 173px);
  width: 58px; height: 58px;
  border-radius: 50%;
  background: var(--clay-primary);
  color: #fff;
  display: flex; align-items: center; justify-content: center;
  box-shadow: rgba(158,79,44,0.34) 0px 10px 28px -4px;
  border: none;
  cursor: pointer;
  z-index: 99;
}
.top-nav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 22px 0;
}
.top-nav-title {
  font-size: 18px;
  font-weight: 600;
  color: var(--text-title);
}
.icon-btn {
  width: 40px; height: 40px;
  border-radius: 12px;
  background: var(--clay-light);
  border: 1px solid rgba(158,79,44,0.10);
  display: flex; align-items: center; justify-content: center;
  color: var(--clay-primary);
  cursor: pointer;
}
.progress-track {
  width: 100%;
  height: 6px;
  border-radius: 3px;
  background: rgba(158,79,44,0.10);
  margin-top: 8px;
  overflow: hidden;
}
.progress-fill {
  height: 100%;
  border-radius: 3px;
  background: var(--clay-secondary);
}
.progress-fill.low { background: var(--red); }
.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 6px;
  text-align: center;
  font-size: 13px;
}
.calendar-cell {
  aspect-ratio: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 12px;
  background: var(--clay-light);
  position: relative;
}
.calendar-cell.active {
  background: var(--clay-primary);
  color: #fff;
}
.calendar-dot {
  width: 4px; height: 4px;
  border-radius: 50%;
  background: var(--clay-secondary);
  position: absolute;
  bottom: 6px;
}
.toggle-pill {
  display: inline-flex;
  background: var(--clay-light);
  border-radius: 14px;
  padding: 4px;
  border: 1px solid rgba(158,79,44,0.10);
}
.toggle-pill button {
  border: none;
  background: transparent;
  padding: 8px 16px;
  border-radius: 12px;
  font-size: 14px;
  color: var(--text-muted);
  font-weight: 500;
}
.toggle-pill button.active {
  background: #fff;
  color: var(--clay-primary);
  box-shadow: 0 2px 8px rgba(74,48,36,0.08);
}
.image-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
.image-slot {
  aspect-ratio: 1;
  border-radius: 14px;
  background: var(--clay-light);
  border: 1px dashed rgba(158,79,44,0.25);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--clay-secondary);
}
.image-slot.filled {
  border-style: solid;
  background-size: cover;
  background-position: center;
}
"""


def shell(page_id, tab_id=None, back=False, title="", body="", fab=""):
    tab_attr = f'data-tab-id="{tab_id}"' if tab_id else ""
    back_html = """
    <div class="top-nav">
      <button class="icon-btn" data-ui-id="{page_id}-back-button" data-event="navigate-back">{arrow_left}</button>
      <div class="top-nav-title">{title}</div>
      <div style="width:40px"></div>
    </div>
    """.format(arrow_left=icon("arrow-left", color="#9E4F2C"), title=title, page_id=page_id) if back else ""
    tab_bar_html = render_tab_bar(tab_id) if tab_id else ""
    return f"""<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
  <title>手作·印记</title>
  <link href="https://fonts.googleapis.com/css2?family=Zhi+Mang+Xing&display=swap" rel="stylesheet">
  <style>{BASE_STYLES}</style>
</head>
<body data-page-id="{page_id}" {tab_attr}>
  <div class="app-frame">
    {back_html}
    <div class="page-content">
      {body}
    </div>
    {fab}
    {tab_bar_html}
  </div>
</body>
</html>
"""


def render_tab_bar(active_tab):
    tabs = [
        ("tab-home", "home", "首页"),
        ("tab-members", "users", "会员"),
        ("tab-courses", "calendar", "课程"),
        ("tab-points", "wallet", "积分"),
        ("tab-inventory", "package", "库存"),
    ]
    items = []
    for tid, iname, label in tabs:
        cls = "tab-item active" if tid == active_tab else "tab-item"
        c = "#9E4F2C" if tid == active_tab else "#9E8E84"
        items.append(
            f'<a href="#" class="{cls}" data-tab-id="{tid}">{icon(iname, color=c, size=24)}<span>{label}</span></a>'
        )
    return '<nav class="bottom-tab-bar" data-ui-id="home-tab-bar">' + "".join(items) + "</nav>"


# ---------- Page bodies ----------

def home_body():
    return f"""
<div class="handwritten page-title">手作·印记</div>
<div class="page-subtitle" data-ui-id="home-today-date">2026年6月20日 星期六</div>

<div data-ui-id="home-reminder-banner">
  <div class="reminder-grid">
    <div class="card card-gradient-secondary reminder-card" data-ui-id="home-sleeping-card" data-event="open-sleeping-members">
      <div class="card-title">沉睡会员</div>
      <div class="big-number" data-ui-id="home-sleeping-count">3</div>
      <div class="card-caption">需要唤醒</div>
    </div>
    <div class="card card-gradient-alert reminder-card" data-ui-id="home-low-stock-card" data-event="open-low-stock">
      <div class="card-title">低库存物料</div>
      <div class="big-number" data-ui-id="home-low-stock-count">2</div>
      <div class="card-caption">待补货</div>
    </div>
  </div>
</div>

<div class="section-title">{icon('calendar', color='#9E4F2C', size=22)} 今日课程</div>
<div class="card" data-ui-id="home-today-course-list">
  <div class="list-item">
    <div class="avatar avatar-small">陶</div>
    <div style="flex:1">
      <div class="card-title">陶艺拉坯入门</div>
      <div class="card-caption">14:00 · 余 2 席 · 陶轮教室</div>
    </div>
    <span class="chip chip-blue">预约中</span>
  </div>
  <div class="list-item">
    <div class="avatar avatar-small" style="background:linear-gradient(135deg,#B87D4B,#D9A89B)">皮</div>
    <div style="flex:1">
      <div class="card-title">植鞣皮具卡包</div>
      <div class="card-caption">19:00 · 已满员 · 皮具工作台</div>
    </div>
    <span class="chip chip-pink">已满</span>
  </div>
  <div id="home-empty-today-courses" style="display:none" class="empty-state">
    <div class="empty-caption">今日暂无课程</div>
  </div>
</div>

<div class="section-title">{icon('wallet', color='#9E4F2C', size=22)} 积分动态</div>
<div class="card" data-ui-id="home-recent-point-list">
  <div class="list-item">
    <div style="flex:1">
      <div class="card-title">签到奖励</div>
      <div class="card-caption">林小陶 · 10:23</div>
    </div>
    <div style="color:var(--green); font-weight:700">+5</div>
  </div>
  <div class="list-item">
    <div style="flex:1">
      <div class="card-title">课程消费</div>
      <div class="card-caption">王木木 · 昨日</div>
    </div>
    <div style="color:var(--clay-primary); font-weight:700">+128</div>
  </div>
</div>

<button class="fab" data-ui-id="home-checkin-button" data-event="open-checkin" aria-label="快速签到">
  {icon('stamp', color='#FFFFFF', size=26)}
</button>
"""


def members_body():
    return f"""
<div class="handwritten page-title">会员</div>
<div class="page-subtitle">共 <span data-ui-id="members-total-count">24</span> 位匠人</div>

<div style="display:flex; gap:10px; margin-bottom:18px">
  <div style="flex:1; position:relative">
    {icon('search', color='#9E8E84', size=20).replace('width="20"','style="position:absolute; left:14px; top:15px" width="20"')}
    <input class="input-field" style="padding-left:42px; margin-bottom:0" placeholder="搜索姓名 / 手机号" data-ui-id="members-search-input" data-event="search-members">
  </div>
  <button class="icon-btn" style="width:auto; padding:0 14px; gap:6px; font-size:13px; color:var(--text-muted)" data-ui-id="members-filter-sleeping" data-event="toggle-sleeping-filter">
    {icon('sliders', color='#9E8E84', size=18)}
    <span>沉睡</span>
  </button>
</div>

<div class="card" data-ui-id="members-list">
  <div class="list-item" data-ui-id="members-item-m001">
    <div class="avatar">林</div>
    <div style="flex:1">
      <div class="card-title">林小陶 <span class="chip" style="margin-left:6px">陶艺</span></div>
      <div class="card-caption">138****2233 · 积分 286</div>
    </div>
    <div style="text-align:right">
      <div style="font-size:12px;color:var(--text-muted)">7天前</div>
      {icon('arrow-right', color='#C98B6C', size=18)}
    </div>
  </div>
  <div class="list-item" data-ui-id="members-item-m002">
    <div class="avatar" style="background:linear-gradient(135deg,#B87D4B,#D9A89B)">王</div>
    <div style="flex:1">
      <div class="card-title">王木木 <span class="chip" style="margin-left:6px">木作</span></div>
      <div class="card-caption">139****4455 · 积分 128</div>
    </div>
    <div style="text-align:right">
      <div style="font-size:12px;color:var(--text-muted)">昨日</div>
      {icon('arrow-right', color='#C98B6C', size=18)}
    </div>
  </div>
  <div class="list-item" data-ui-id="members-item-m003">
    <div class="avatar" style="background:linear-gradient(135deg,#7D9472,#A8B89D)">陈</div>
    <div style="flex:1">
      <div class="card-title">陈布布 <span class="chip chip-pink" style="margin-left:6px">沉睡</span></div>
      <div class="card-caption">137****6677 · 积分 45</div>
    </div>
    <div style="text-align:right">
      <div style="font-size:12px;color:var(--red)">38天未到店</div>
      {icon('arrow-right', color='#C98B6C', size=18)}
    </div>
  </div>
</div>

<div class="empty-state" id="members-empty-state" style="display:none">
  <svg viewBox="0 0 24 24" fill="none" stroke="#C98B6C" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><title>Empty Members Pottery Wheel</title><circle cx="12" cy="12" r="10"/><path d="M12 8v8"/><path d="M8 12h8"/></svg>
  <div class="handwritten empty-title">还没遇到第一位匠人</div>
  <div class="empty-caption">点击右上角添加会员，留下第一枚手作印记</div>
</div>

<button class="fab" data-ui-id="members-add-button" data-event="navigate-member-edit" aria-label="添加会员">
  {icon('plus', color='#FFFFFF', size=26)}
</button>
"""


def member_detail_body():
    return f"""
<div style="margin:-22px -22px 0; padding:0 22px 22px; background:linear-gradient(180deg, rgba(201,139,108,0.18) 0%, rgba(247,243,237,0) 100%)">
  <div style="display:flex; gap:10px; overflow-x:auto; padding:22px 0 10px; scrollbar-width:none">
    <div style="min-width:140px; height:140px; border-radius:18px; background:linear-gradient(135deg,#C98B6C,#D9A89B); flex-shrink:0"></div>
    <div style="min-width:140px; height:140px; border-radius:18px; background:linear-gradient(135deg,#7D9472,#A8B89D); flex-shrink:0"></div>
    <div style="min-width:140px; height:140px; border-radius:18px; background:linear-gradient(135deg,#B87D4B,#D9A89B); flex-shrink:0"></div>
  </div>
</div>

<div class="card" style="margin-top:-10px; position:relative; z-index:2">
  <div style="display:flex; align-items:center; gap:16px; margin-bottom:14px">
    <div class="avatar" style="width:64px;height:64px;font-size:28px">林</div>
    <div>
      <div class="card-title" style="font-size:22px" data-ui-id="member-detail-name">林小陶</div>
      <div class="card-caption">138****2233</div>
    </div>
  </div>
  <div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:14px" data-ui-id="member-detail-crafts">
    <span class="chip">陶艺</span>
    <span class="chip">拉坯</span>
    <span class="chip">釉下彩</span>
  </div>
  <div style="display:grid; grid-template-columns: repeat(3,1fr); gap:10px; text-align:center">
    <div class="card" style="margin-bottom:0; padding:12px">
      <div class="big-number" style="font-size:24px" data-ui-id="member-detail-points">286</div>
      <div class="card-caption">积分</div>
    </div>
    <div class="card" style="margin-bottom:0; padding:12px">
      <div class="big-number" style="font-size:24px">12</div>
      <div class="card-caption">到店</div>
    </div>
    <div class="card" style="margin-bottom:0; padding:12px">
      <div class="big-number" style="font-size:24px">3</div>
      <div class="card-caption">作品</div>
    </div>
  </div>
</div>

<div style="display:flex; gap:10px; margin:20px 0">
  <button class="btn-primary" style="flex:1" data-ui-id="member-detail-checkin-button" data-event="member-checkin">{icon('stamp', color='#FFFFFF', size=18)} 签到</button>
  <button class="btn-secondary" style="flex:1" data-ui-id="member-detail-edit-button" data-event="navigate-member-edit">{icon('pencil', color='#9E4F2C', size=18)} 编辑</button>
</div>

<div class="section-title">已预约课程</div>
<div class="card" data-ui-id="member-detail-course-list">
  <div class="list-item" data-ui-id="member-course-c101">
    <div style="flex:1">
      <div class="card-title">陶艺拉坯入门</div>
      <div class="card-caption">6月20日 14:00 · 陶轮教室</div>
    </div>
    <span class="chip chip-blue">预约中</span>
  </div>
  <div class="list-item" data-ui-id="member-course-c102">
    <div style="flex:1">
      <div class="card-title">釉下彩绘制</div>
      <div class="card-caption">6月27日 10:00 · 彩绘室</div>
    </div>
    <span class="chip chip-blue">预约中</span>
  </div>
  <div id="member-empty-courses" style="display:none" class="empty-state" style="padding:24px">
    <div class="empty-caption">暂无预约课程</div>
  </div>
</div>

<div class="section-title">作品图墙</div>
<div class="image-grid" data-ui-id="member-detail-works-grid">
  <div class="image-slot filled" style="background:linear-gradient(135deg,#C98B6C,#D9A89B)"></div>
  <div class="image-slot filled" style="background:linear-gradient(135deg,#7D9472,#A8B89D)"></div>
  <div class="image-slot filled" style="background:linear-gradient(135deg,#B87D4B,#D9A89B)"></div>
  <div class="image-slot">{icon('camera', color='#C98B6C', size=24)}</div>
</div>

<div style="margin-top:28px; text-align:center">
  <button class="btn-ghost" style="color:var(--red)" data-ui-id="member-detail-delete-button" data-event="delete-member">{icon('trash', color='#B85448', size=18)} 删除会员</button>
</div>
"""


def member_edit_body():
    return f"""
<div class="handwritten page-title">{icon('pencil', color='#9E4F2C', size=28)} 编辑会员</div>
<div class="page-subtitle">留下属于 Ta 的手作印记</div>

<label class="input-label">姓名 *</label>
<input class="input-field" value="林小陶" placeholder="会员姓名" data-ui-id="member-edit-name-input">

<label class="input-label">手机号 *</label>
<input class="input-field" value="138****2233" placeholder="11位手机号" data-ui-id="member-edit-phone-input">

<label class="input-label">昵称</label>
<input class="input-field" value="小陶" placeholder="昵称" data-ui-id="member-edit-nickname-input">

<label class="input-label">生日</label>
<input class="input-field" value="1995-08-15" placeholder="选择生日" data-ui-id="member-edit-birthday-picker">

<label class="input-label">擅长工艺</label>
<div data-ui-id="member-edit-crafts-picker" style="margin-bottom:14px">
  <div style="display:flex; gap:8px; flex-wrap:wrap">
    <span class="chip" style="background:var(--clay-primary); color:#fff">陶艺</span>
    <span class="chip">拉坯</span>
    <span class="chip" style="background:var(--clay-primary); color:#fff">釉下彩</span>
    <span class="chip">+ 添加</span>
  </div>
</div>

<label class="input-label">过敏 / 注意事项</label>
<input class="input-field" placeholder="如对某些材料过敏" data-ui-id="member-edit-allergy-input">

<label class="input-label">备注</label>
<textarea class="input-field" rows="3" placeholder="记录会员偏好或故事" data-ui-id="member-edit-notes-input">偏好粗陶质感，周末常来。</textarea>

<label class="input-label">作品图</label>
<div class="image-grid" data-ui-id="member-edit-works-uploader" style="margin-bottom:20px">
  <div class="image-slot filled" style="background:linear-gradient(135deg,#C98B6C,#D9A89B)"></div>
  <div class="image-slot filled" style="background:linear-gradient(135deg,#7D9472,#A8B89D)"></div>
  <div class="image-slot">{icon('camera', color='#C98B6C', size=24)}</div>
</div>

<div style="display:flex; gap:12px; margin-top:8px">
  <button class="btn-secondary" style="flex:1" data-ui-id="member-edit-cancel-button" data-event="cancel-edit">取消</button>
  <button class="btn-primary" style="flex:1" data-ui-id="member-edit-save-button" data-event="save-member">保存</button>
</div>
"""


def courses_body():
    return f"""
<div class="handwritten page-title">课程</div>
<div class="page-subtitle">6月 · 共 8 门课程</div>

<div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:18px">
  <div class="toggle-pill" data-ui-id="courses-view-toggle" data-event="toggle-calendar-list">
    <button class="active">日历</button>
    <button>列表</button>
  </div>
  <button class="btn-ghost" data-ui-id="courses-add-button" data-event="navigate-course-edit">{icon('plus', color='#9E4F2C', size=18)} 新建</button>
</div>

<div class="card" data-ui-id="courses-calendar">
  <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:14px">
    <div class="card-title">2026年6月</div>
    <div style="display:flex; gap:8px">
      {icon('chevron-down', color='#9E8E84', size=18)}
    </div>
  </div>
  <div class="calendar-grid">
    <div class="calendar-cell" style="color:var(--text-muted)">日</div>
    <div class="calendar-cell" style="color:var(--text-muted)">一</div>
    <div class="calendar-cell" style="color:var(--text-muted)">二</div>
    <div class="calendar-cell" style="color:var(--text-muted)">三</div>
    <div class="calendar-cell" style="color:var(--text-muted)">四</div>
    <div class="calendar-cell" style="color:var(--text-muted)">五</div>
    <div class="calendar-cell" style="color:var(--text-muted)">六</div>
    <div class="calendar-cell">1</div>
    <div class="calendar-cell">2</div>
    <div class="calendar-cell">3</div>
    <div class="calendar-cell">4</div>
    <div class="calendar-cell">5</div>
    <div class="calendar-cell">6</div>
    <div class="calendar-cell">7</div>
    <div class="calendar-cell">8</div>
    <div class="calendar-cell">9</div>
    <div class="calendar-cell">10</div>
    <div class="calendar-cell">11</div>
    <div class="calendar-cell">12</div>
    <div class="calendar-cell">13</div>
    <div class="calendar-cell">14</div>
    <div class="calendar-cell">15</div>
    <div class="calendar-cell">16</div>
    <div class="calendar-cell">17</div>
    <div class="calendar-cell">18</div>
    <div class="calendar-cell">19</div>
    <div class="calendar-cell active" data-event="filter-courses-by-date">20<div class="calendar-dot" style="background:#fff"></div></div>
    <div class="calendar-cell">21</div>
    <div class="calendar-cell">22<div class="calendar-dot"></div></div>
    <div class="calendar-cell">23</div>
    <div class="calendar-cell">24</div>
    <div class="calendar-cell">25</div>
    <div class="calendar-cell">26</div>
    <div class="calendar-cell">27<div class="calendar-dot"></div></div>
  </div>
</div>

<div class="section-title">今日课程</div>
<div class="card" data-ui-id="courses-list">
  <div class="list-item" data-ui-id="courses-item-c101">
    <div class="avatar avatar-small">陶</div>
    <div style="flex:1">
      <div class="card-title">陶艺拉坯入门</div>
      <div class="card-caption">14:00 · 余 2 席 · 陶轮教室</div>
    </div>
    <span class="chip chip-blue">预约中</span>
  </div>
  <div class="list-item" data-ui-id="courses-item-c102">
    <div class="avatar avatar-small" style="background:linear-gradient(135deg,#B87D4B,#D9A89B)">皮</div>
    <div style="flex:1">
      <div class="card-title">植鞣皮具卡包</div>
      <div class="card-caption">19:00 · 已满员 · 皮具工作台</div>
    </div>
    <span class="chip chip-pink">已满</span>
  </div>
  <div id="courses-empty-state" style="display:none" class="empty-state">
    <div class="empty-caption">该日期暂无课程</div>
  </div>
</div>

<button class="fab" data-ui-id="courses-add-button" data-event="navigate-course-edit" aria-label="新建课程">
  {icon('plus', color='#FFFFFF', size=26)}
</button>
"""


def course_detail_body():
    return f"""
<div class="card card-gradient" style="margin-top:8px">
  <div style="display:flex; justify-content:space-between; align-items:flex-start">
    <div>
      <div class="card-title" style="font-size:22px" data-ui-id="course-detail-title">陶艺拉坯入门</div>
      <div class="card-caption" style="color:rgba(255,255,255,0.85); margin-top:6px" data-ui-id="course-detail-datetime">6月20日 周六 14:00 · 90分钟</div>
    </div>
    <span class="chip chip-green" style="background:rgba(255,255,255,0.25); color:#fff">预约中</span>
  </div>
  <div style="display:flex; gap:16px; margin-top:18px">
    <div style="display:flex; align-items:center; gap:6px; font-size:13px; color:rgba(255,255,255,0.9)">
      {icon('map-pin', color='#FFFFFF', size=16)} 陶轮教室
    </div>
    <div style="display:flex; align-items:center; gap:6px; font-size:13px; color:rgba(255,255,255,0.9)">
      {icon('users', color='#FFFFFF', size=16)} <span data-ui-id="course-detail-capacity">6/8</span>
    </div>
  </div>
</div>

<div class="section-title">消耗物料</div>
<div class="card" data-ui-id="course-detail-material-list">
  <div class="list-item" data-ui-id="course-material-i201">
    <div style="flex:1">
      <div class="card-title">陶泥（高白泥）</div>
      <div class="card-caption">每次课消耗 0.5 kg</div>
    </div>
    <div style="text-align:right; font-size:13px; color:var(--text-muted)">库存 12 kg</div>
  </div>
  <div class="list-item" data-ui-id="course-material-i202">
    <div style="flex:1">
      <div class="card-title">拉坯海绵</div>
      <div class="card-caption">每次课消耗 1 块</div>
    </div>
    <div style="text-align:right; font-size:13px; color:var(--red)">库存 3 块</div>
  </div>
</div>

<div class="section-title">预约名单</div>
<div class="card" data-ui-id="course-detail-booking-list">
  <div class="list-item" data-ui-id="course-booking-b001">
    <div class="avatar avatar-small">林</div>
    <div style="flex:1">
      <div class="card-title">林小陶</div>
      <div class="card-caption">6月18日 预约 · 备注：无</div>
    </div>
    <span class="chip chip-green">已签到</span>
  </div>
  <div class="list-item" data-ui-id="course-booking-b002">
    <div class="avatar avatar-small" style="background:linear-gradient(135deg,#B87D4B,#D9A89B)">王</div>
    <div style="flex:1">
      <div class="card-title">王木木</div>
      <div class="card-caption">6月19日 预约</div>
    </div>
    <span class="chip chip-blue">未签到</span>
  </div>
  <div id="course-empty-bookings" style="display:none" class="empty-state" style="padding:24px">
    <div class="empty-caption">暂无预约</div>
  </div>
</div>

<div style="display:flex; gap:12px; margin-top:28px">
  <button class="btn-secondary" style="flex:1" data-ui-id="course-detail-edit-button" data-event="navigate-course-edit">{icon('pencil', color='#9E4F2C', size=18)} 编辑</button>
  <button class="btn-primary" style="flex:1" data-ui-id="course-detail-book-button" data-event="navigate-course-booking">{icon('plus', color='#FFFFFF', size=18)} 预约</button>
</div>
"""


def course_booking_body():
    return f"""
<div class="handwritten page-title">预约课程</div>
<div class="page-subtitle">陶艺拉坯入门 · 6月20日 14:00</div>

<div class="card">
  <label class="input-label">选择会员</label>
  <div class="input-field" style="display:flex; align-items:center; justify-content:space-between; cursor:pointer" data-ui-id="course-booking-member-picker" data-event="select-booking-member">
    <div style="display:flex; align-items:center; gap:10px">
      <div class="avatar avatar-small">林</div>
      <span style="color:var(--text-title)">林小陶</span>
    </div>
    {icon('chevron-down', color='#9E8E84', size=18)}
  </div>

  <label class="input-label">备注</label>
  <textarea class="input-field" rows="2" placeholder="如携带儿童、特殊需求" data-ui-id="course-booking-remark-input"></textarea>

  <label class="input-label" style="display:flex; align-items:center; gap:8px; cursor:pointer">
    <input type="checkbox" checked data-ui-id="course-booking-use-points-toggle">
    <span>使用积分抵扣（可用 286 分）</span>
  </label>
</div>

<div class="card" style="background:var(--clay-light); border-style:dashed">
  <div class="card-title">预约须知</div>
  <div class="card-caption">预约成功将自动扣减课程关联物料库存；取消预约将回滚库存与积分。</div>
</div>

<div style="display:flex; gap:12px; margin-top:28px">
  <button class="btn-secondary" style="flex:1" data-ui-id="course-booking-cancel-button" data-event="cancel-booking-form">取消</button>
  <button class="btn-primary" style="flex:1" data-ui-id="course-booking-submit-button" data-event="submit-course-booking">确认预约</button>
</div>
"""


def points_body():
    return f"""
<div class="handwritten page-title">积分</div>
<div class="page-subtitle">会员积分中心</div>

<div class="card card-gradient" style="text-align:center; padding:28px 18px">
  <div class="card-caption" style="color:rgba(255,255,255,0.85)">总积分余额</div>
  <div class="big-number" style="font-size:48px; margin:12px 0" data-ui-id="points-total-balance">1,258</div>
  <div style="display:flex; gap:12px; justify-content:center; margin-top:18px">
    <button class="btn-primary" style="background:#fff; color:var(--clay-primary); box-shadow:none" data-ui-id="points-checkin-button" data-event="daily-checkin">{icon('stamp', color='#9E4F2C', size=18)} 签到 +5</button>
    <button class="btn-primary" style="background:rgba(255,255,255,0.25); color:#fff; box-shadow:none" data-ui-id="points-add-record-button" data-event="navigate-point-record">{icon('plus', color='#FFFFFF', size=18)} 补录</button>
  </div>
</div>

<div style="display:flex; justify-content:space-between; align-items:center; margin:28px 0 14px">
  <div class="section-title" style="margin:0">积分流水</div>
  <div class="toggle-pill" data-ui-id="points-filter-type" data-event="filter-point-type">
    <button class="active">全部</button>
    <button>获得</button>
    <button>使用</button>
  </div>
</div>

<div class="card" data-ui-id="points-transaction-list">
  <div class="list-item" data-ui-id="points-transaction-p001">
    <div style="width:36px;height:36px;border-radius:50%;background:#DFE8D6;display:flex;align-items:center;justify-content:center">
      {icon('stamp', color='#4F6644', size=18)}
    </div>
    <div style="flex:1">
      <div class="card-title">每日签到</div>
      <div class="card-caption">林小陶 · 今日 10:23</div>
    </div>
    <div style="color:var(--green); font-weight:700">+5</div>
  </div>
  <div class="list-item" data-ui-id="points-transaction-p002">
    <div style="width:36px;height:36px;border-radius:50%;background:#F3EBE3;display:flex;align-items:center;justify-content:center">
      {icon('wallet', color='#9E4F2C', size=18)}
    </div>
    <div style="flex:1">
      <div class="card-title">课程消费</div>
      <div class="card-caption">王木木 · 昨日</div>
    </div>
    <div style="color:var(--clay-primary); font-weight:700">+128</div>
  </div>
  <div class="list-item" data-ui-id="points-transaction-p003">
    <div style="width:36px;height:36px;border-radius:50%;background:#F5DDD6;display:flex;align-items:center;justify-content:center">
      {icon('minus', color='#B85448', size=18)}
    </div>
    <div style="flex:1">
      <div class="card-title">积分兑换</div>
      <div class="card-caption">林小陶 · 6月15日</div>
    </div>
    <div style="color:var(--red); font-weight:700">-50</div>
  </div>
  <div id="points-empty-state" style="display:none" class="empty-state">
    <div class="empty-caption">暂无积分记录</div>
  </div>
</div>
"""


def point_record_body():
    return f"""
<div class="handwritten page-title">{icon('wallet', color='#9E4F2C', size=28)} 积分补录</div>
<div class="page-subtitle">手动调整会员积分</div>

<div class="card">
  <label class="input-label">选择会员</label>
  <div class="input-field" style="display:flex; align-items:center; justify-content:space-between; cursor:pointer" data-ui-id="point-record-member-picker" data-event="select-point-member">
    <div style="display:flex; align-items:center; gap:10px">
      <div class="avatar avatar-small">林</div>
      <span style="color:var(--text-title)">林小陶（当前 286 分）</span>
    </div>
    {icon('chevron-down', color='#9E8E84', size=18)}
  </div>

  <label class="input-label">类型</label>
  <div class="toggle-pill" data-ui-id="point-record-type-picker" data-event="select-point-type" style="margin-bottom:14px">
    <button class="active">奖励</button>
    <button>扣减</button>
    <button>调整</button>
  </div>

  <label class="input-label">积分数值</label>
  <input class="input-field" type="number" value="20" placeholder="请输入积分" data-ui-id="point-record-amount-input">

  <label class="input-label">原因</label>
  <input class="input-field" value="作品入选展示奖励" placeholder="如签到、消费、奖励等" data-ui-id="point-record-reason-input">
</div>

<div style="display:flex; gap:12px; margin-top:28px">
  <button class="btn-secondary" style="flex:1" data-ui-id="point-record-cancel-button" data-event="cancel-point-record">取消</button>
  <button class="btn-primary" style="flex:1" data-ui-id="point-record-save-button" data-event="save-point-record">保存</button>
</div>
"""


def inventory_body():
    return f"""
<div class="handwritten page-title">库存</div>
<div class="page-subtitle">物料与工具管理</div>

<div class="card card-gradient-alert" style="margin-bottom:20px">
  <div style="display:flex; align-items:center; gap:10px; margin-bottom:6px">
    {icon('alert-triangle', color='#FFFFFF', size=20)}
    <div class="card-title" style="color:#fff">低库存预警</div>
  </div>
  <div class="card-caption" style="color:rgba(255,255,255,0.9)">当前有 <span data-ui-id="inventory-low-stock-count" style="font-weight:700">2</span> 项物料低于安全库存，请及时补货</div>
</div>

<div style="display:flex; gap:10px; margin-bottom:18px">
  <button class="btn-primary" style="flex:1" data-ui-id="inventory-add-button" data-event="navigate-inventory-edit">{icon('plus', color='#FFFFFF', size=18)} 新增物料</button>
  <button class="btn-secondary" style="flex:1" data-ui-id="inventory-transaction-button" data-event="navigate-inventory-transaction">{icon('sliders', color='#9E4F2C', size=18)} 出入库</button>
</div>

<div class="section-title">物料清单</div>
<div class="card" data-ui-id="inventory-list">
  <div class="list-item" data-ui-id="inventory-item-i201">
    <div style="flex:1">
      <div class="card-title">陶泥（高白泥）</div>
      <div class="card-caption">规格：袋装 · 单位：kg</div>
      <div class="progress-track"><div class="progress-fill" style="width:60%"></div></div>
    </div>
    <div style="text-align:right; min-width:60px">
      <div style="font-size:17px; font-weight:700; color:var(--text-title)">12</div>
      <div style="font-size:11px; color:var(--text-muted)">安全 5</div>
    </div>
  </div>
  <div class="list-item" data-ui-id="inventory-item-i202">
    <div style="flex:1">
      <div class="card-title">拉坯海绵</div>
      <div class="card-caption">规格：标准 · 单位：块</div>
      <div class="progress-track"><div class="progress-fill low" style="width:15%"></div></div>
    </div>
    <div style="text-align:right; min-width:60px">
      <div style="font-size:17px; font-weight:700; color:var(--red)">3</div>
      <div style="font-size:11px; color:var(--text-muted)">安全 5</div>
    </div>
  </div>
  <div class="list-item" data-ui-id="inventory-item-i203">
    <div style="flex:1">
      <div class="card-title">木蜡油</div>
      <div class="card-caption">规格：500ml · 单位：瓶</div>
      <div class="progress-track"><div class="progress-fill" style="width:80%"></div></div>
    </div>
    <div style="text-align:right; min-width:60px">
      <div style="font-size:17px; font-weight:700; color:var(--text-title)">8</div>
      <div style="font-size:11px; color:var(--text-muted)">安全 2</div>
    </div>
  </div>
  <div id="inventory-empty-state" style="display:none" class="empty-state">
    <div class="empty-caption">暂无物料，请先新增</div>
  </div>
</div>
"""


def inventory_edit_body():
    return f"""
<div class="handwritten page-title">{icon('pencil', color='#9E4F2C', size=28)} 编辑物料</div>
<div class="page-subtitle">维护物料基础信息</div>

<label class="input-label">物料名称 *</label>
<input class="input-field" value="陶泥（高白泥）" placeholder="如陶泥、木蜡油" data-ui-id="inventory-edit-name-input">

<label class="input-label">规格</label>
<input class="input-field" value="袋装" placeholder="如袋装、500ml" data-ui-id="inventory-edit-spec-input">

<label class="input-label">单位</label>
<input class="input-field" value="kg" placeholder="如 kg、块、瓶" data-ui-id="inventory-edit-unit-input">

<div style="display:grid; grid-template-columns:1fr 1fr; gap:12px">
  <div>
    <label class="input-label">当前库存</label>
    <input class="input-field" type="number" value="12" data-ui-id="inventory-edit-stock-input">
  </div>
  <div>
    <label class="input-label">安全库存</label>
    <input class="input-field" type="number" value="5" data-ui-id="inventory-edit-safe-stock-input">
  </div>
</div>

<label class="input-label">备注</label>
<textarea class="input-field" rows="2" placeholder="供应商、存放位置等" data-ui-id="inventory-edit-notes-input">存放于储物架 A2</textarea>

<div style="display:flex; gap:12px; margin-top:28px">
  <button class="btn-secondary" style="flex:1" data-ui-id="inventory-edit-cancel-button" data-event="cancel-inventory-edit">取消</button>
  <button class="btn-primary" style="flex:1" data-ui-id="inventory-edit-save-button" data-event="save-inventory">保存</button>
</div>
"""


def inventory_transaction_body():
    return f"""
<div class="handwritten page-title">{icon('sliders', color='#9E4F2C', size=28)} 库存记录</div>
<div class="page-subtitle">出入库与盘点调整</div>

<div class="card">
  <label class="input-label">选择物料</label>
  <div class="input-field" style="display:flex; align-items:center; justify-content:space-between; cursor:pointer" data-ui-id="inventory-transaction-material-picker" data-event="select-transaction-material">
    <span style="color:var(--text-title)">陶泥（高白泥）</span>
    {icon('chevron-down', color='#9E8E84', size=18)}
  </div>

  <label class="input-label">操作类型</label>
  <div class="toggle-pill" data-ui-id="inventory-transaction-type-picker" data-event="select-transaction-type" style="margin-bottom:14px">
    <button class="active">入库</button>
    <button>出库</button>
    <button>盘点</button>
  </div>

  <label class="input-label">数量</label>
  <input class="input-field" type="number" value="10" placeholder="正数入库，负数出库" data-ui-id="inventory-transaction-quantity-input">

  <label class="input-label">原因</label>
  <input class="input-field" value="供应商补货" placeholder="如采购、课程消耗、盘点盈亏" data-ui-id="inventory-transaction-reason-input">
</div>

<div style="display:flex; gap:12px; margin-top:28px">
  <button class="btn-secondary" style="flex:1" data-ui-id="inventory-transaction-cancel-button" data-event="cancel-inventory-transaction">取消</button>
  <button class="btn-primary" style="flex:1" data-ui-id="inventory-transaction-save-button" data-event="save-inventory-transaction">保存</button>
</div>
"""


PAGES = [
    ("home-page", "tab-home", False, "", home_body),
    ("members-page", "tab-members", False, "", members_body),
    ("member-detail-page", None, True, "会员详情", member_detail_body),
    ("member-edit-page", None, True, "编辑会员", member_edit_body),
    ("courses-page", "tab-courses", False, "", courses_body),
    ("course-detail-page", None, True, "课程详情", course_detail_body),
    ("course-booking-page", None, True, "预约课程", course_booking_body),
    ("points-page", "tab-points", False, "", points_body),
    ("point-record-page", None, True, "积分补录", point_record_body),
    ("inventory-page", "tab-inventory", False, "", inventory_body),
    ("inventory-edit-page", None, True, "编辑物料", inventory_edit_body),
    ("inventory-transaction-page", None, True, "库存记录", inventory_transaction_body),
]


if __name__ == "__main__":
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    for page_id, tab_id, back, title, body_fn in PAGES:
        body = body_fn()
        html = shell(page_id, tab_id=tab_id, back=back, title=title, body=body)
        out_path = os.path.join(OUTPUT_DIR, f"page-{page_id}.html")
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(html)
        print(f"Generated {out_path}")
