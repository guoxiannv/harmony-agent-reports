# 宠迹·PawLog 视觉设计系统（DESIGN2.md）

## Final Review Summary

DESIGN1.md 在色彩层次、阴影质感、毛玻璃效果、快捷入口识别度上已有明显提升。经过第三轮审视，进一步做以下精修，确保最终 HTML artifact 呈现出「不 AI 模板化」的高级治愈感：

1. **加入纸质/手账元素**：轻度的虚线、圆点、手绘感圆角，让界面更像一本宠物手账。
2. **强化数据可视化质感**：趋势图使用更柔和的渐变面积图 + 圆润数据点 + 隐藏坐标轴线。
3. **状态徽章系统化**：饮食/排泄/体重/用药使用一套一致但色彩区分的徽章。
4. **空状态插画化**：使用大尺寸的扁平插画风格占位，而不是纯图标。
5. **动效暗示**：在 HTML 中通过 hover/active 状态暗示按压反馈（scale、阴影收缩）。

本文件是最终设计定稿，后续 HTML artifact 必须严格遵循。

## 1. Visual Theme & Atmosphere

### 最终氛围
**「一本会呼吸的宠物手账」**

- 页面背景像手账内页的浅薄荷纸。
- 卡片像贴在手账上的便签，边缘柔和，偶尔带一点淡色描边。
- 按钮像肉垫按下的印记，Q 弹有反馈。
- 图表像手绘的曲线，但数据精确。
- 空状态像一页等待主人填写的空白手账。

### 设计关键词
- 清新、柔软、治愈、手账、肉垫、云感、果冻

## 2. Color Palette & Roles（Final）

### Primary
- `#3FC0A0` 薄荷绿 600
- `#5ED7B6` 薄荷绿 500
- `#9CEBD4` 薄荷绿 300
- `#E5FAF4` 薄荷绿 100
- `#F4FDFA` 薄荷绿 50 / 页面底

### Secondary
- `#FF9AAE` 肉垫粉 600
- `#FFB3C1` 肉垫粉 500
- `#FFF0F3` 肉垫粉 100

### Accent
- `#FFD166` 阳光黄 500
- `#FFF9E6` 阳光黄 100
- `#87CEEB` 天空蓝 500
- `#E6F5FB` 天空蓝 100
- `#B8B8E0` 薰衣草紫 500
- `#F2F1FA` 薰衣草紫 100
- `#F4D0A4` 奶油杏 500
- `#FDF5EA` 奶油杏 100

### Neutrals
- `#163832` 深森绿 900
- `#3D5A52` 深森绿 700
- `#6F8983` 深森绿 500
- `#C9D8D4` 深森绿 200
- `#E3EDEA` 深森绿 100
- `#FFFFFF` 纯白

## 3. Typography Rules（Final）

| Role | Size | Weight | Line Height | Color |
|------|------|--------|-------------|-------|
| Display Hero | 34px | 800 | 1.2 | 深森绿 900 |
| Section Heading | 22px | 700 | 1.3 | 深森绿 900 |
| Card Title | 18px | 700 | 1.35 | 深森绿 900 |
| Sub-heading | 16px | 600 | 1.4 | 深森绿 900 |
| Body | 15px | 400 | 1.6 | 深森绿 700 |
| Body Emphasis | 15px | 600 | 1.5 | 深森绿 900 |
| Caption | 13px | 400 | 1.45 | 深森绿 500 |
| Caption Bold | 13px | 600 | 1.4 | 深森绿 700 |
| Micro | 11px | 500 | 1.35 | 深森绿 500 |
| Button Large | 17px | 700 | 1 | 纯白 |
| Button | 15px | 600 | 1 | 纯白 |

中文数字使用 tabular-nums。

## 4. Component Stylings（Final）

### Primary CTA
- bg: `linear-gradient(135deg, #5ED7B6 0%, #3FC0A0 50%, #2DB08E 100%)`
- color: white
- border-radius: 28px
- padding: 15px 28px
- box-shadow: `0 8px 24px rgba(63, 192, 160, 0.38), inset 0 1px 0 rgba(255,255,255,0.35)`
- active: transform scale(0.97), box-shadow 收缩

### Secondary Button
- bg: white
- border: 1.5px solid `#E3EDEA`
- color: 深森绿 900
- border-radius: 24px
- active: bg `#F4FDFA`

### Soft Button
- bg: `#E5FAF4`
- color: 薄荷绿 600
- border-radius: 20px
- active: bg `#D4F5EC`

### Glass Card（首页汇总、空状态）
- bg: `rgba(255,255,255,0.76)`
- backdrop-filter: `blur(20px) saturate(150%)`
- border: 1px solid `rgba(255,255,255,0.65)`
- border-radius: 28px
- box-shadow: `0 8px 32px rgba(22,56,50,0.07)`

### Standard Card
- bg: white
- border: 1px solid `rgba(201,216,212,0.45)`
- border-radius: 24px
- box-shadow: `0 6px 22px rgba(22,56,50,0.05), 0 2px 8px rgba(22,56,50,0.04)`
- padding: 20px

### Quick Action Button（Final）
- 72px × 72px, border-radius 24px
- 饮食：bg 奶油杏 100, 图标渐变 `#FFD8A8 → #F4C288`
- 排泄：bg 薄荷绿 100, 图标渐变 `#9CEBD4 → #5ED7B6`
- 体重：bg 天空蓝 100, 图标渐变 `#B2E3F5 → #87CEEB`
- 用药：bg 薰衣草紫 100, 图标渐变 `#D4D4F0 → #B8B8E0`
- shadow: `0 6px 18px rgba(22,56,50,0.08)`
- active: scale 0.94
- 标签：13px, 600, 深森绿 900, 位于按钮下方 8px

### Pet Avatar
- 选中：外环 3px 薄荷绿 500，shadow `0 4px 14px rgba(94,215,182,0.28)`
- 未选中：无外环，opacity 0.75
- 头像 56px，圆形
- 添加按钮：56px 圆形，bg 薄荷绿 100，图标 薄荷绿 600

### Reminder Card
- 左侧 4px 状态条，圆角 2px
- Urgent: bg 肉垫粉 100, 状态条 肉垫粉 600, shadow `0 6px 18px rgba(255,154,174,0.16)`
- Normal: bg white, 状态条 薄荷绿 500
- Done: bg 阳光黄 100, 状态条 阳光黄 500, opacity 0.82
- 内边距 16px

### Medical Card
- bg 薰衣草紫 100
- 左侧 48px 图标容器，16px 圆角，bg 薰衣草紫 500
- 标题 16px bold，医院/日期 caption
- 缩略图 56px，12px 圆角

### Trend Chart
- 容器：Standard Card
- 图表高度 220px
- 面积图：fill `linear-gradient(180deg, rgba(94,215,182,0.35) 0%, rgba(94,215,182,0) 100%)`
- 折线：薄荷绿 600，3px
- 数据点：10px 圆形，bg 薄荷绿 600，border 2px white，shadow `0 2px 6px rgba(94,215,182,0.35)`
- 网格线：深森绿 100，1px dashed，透明度 0.5
- 坐标轴文字：11px，深森绿 500

### Filter Chip（Final）
- default: bg white, border 1px 深森绿 100, color 深森绿 700
- selected: bg `#E5FAF4`, color 薄荷绿 600, border 薄荷绿 500, shadow `0 2px 8px rgba(94,215,182,0.12)`
- border-radius: 20px
- padding: 8px 16px

### Text Field（Final）
- bg `#FAFDFC`
- border 1px `#E3EDEA`
- border-radius 16px
- padding 14px 16px
- focus: border 薄荷绿 500, box-shadow `0 0 0 4px rgba(94,215,182,0.12)`
- placeholder 深森绿 500
- 左侧 icon 16px

### Empty State
- 大插画占位：120px × 120px，圆角 32px，bg 薄荷绿 50
- 标题：18px bold
- 说明：15px，深森绿 700
- CTA：Primary CTA 或 Secondary Button

## 5. Layout Principles（Final）

- body: max-width 390px, margin 0 auto, bg 米白 50
- 页面水平 padding: 16px
- Header 高度 52px
- 宠物切换条高度 84px
- 卡片间距 16px
- 列表项间距 12px
- 底部 Tab Bar 高度 68px + safe area

## 6. Depth & Elevation（Final）

| Level | Treatment |
|-------|-----------|
| Page | 米白 50 |
| Standard Card | 双层柔和阴影 |
| Glass Card | 毛玻璃 + 白色内描边 |
| Quick Action | 柔和弥散阴影 |
| Floating Button | 薄荷绿弥散阴影 |
| Sheet | 顶部 28px 圆角 + 深色 overlay |
| Pressed | scale 0.94-0.97 |

## 7. Do's and Don'ts（Final）

### Do
- 使用圆角 ≥ 16px。
- 多使用渐变和半透明营造层次。
- 为不同功能入口分配不同辅色。
- 为空状态设计专属插画区域。
- 所有 SVG 图标加语义化 title。

### Don't
- 不要使用直角或过小圆角。
- 不要让同一屏幕颜色过于杂乱。
- 不要使用 emoji 作为图标。
- 不要把 Tab 导航放在顶部或侧边。
- 不要让底部 Tab Bar 在 PC 上全宽。

## 8. Responsive Behavior（Final）

同 DESIGN.md / DESIGN1.md。

## 9. Semantic UI Binding（Final）

完整保留 DESIGN.md 中列出的所有 surface/page/route/tab、semantic target ID、event name、binding path。HTML artifact 中所有对应元素必须携带 `data-ui-id`，且不得修改 ID 或事件名。

### 变更请求
- 无。本文件为最终视觉定稿。
