# 宠迹·PawLog 视觉设计系统（DESIGN1.md）

## Review Summary

DESIGN.md 已正确覆盖了薄荷绿 + 肉垫粉的治愈方向，但在视觉精致度上仍有提升空间：
1. 当前阴影系统较为单一，层次感不足。
2. 卡片内部用色可以更克制地引入第三色（薰衣草紫、天空蓝、阳光黄）来区分模块，而不是让所有卡片都是白底。
3. 毛玻璃（frosted glass）效果可增强高级感和层次。
4. 首页宠物头像与快捷按钮可做得更「肉感」，强化品牌记忆。
5. 需要确保 DESIGN.md 中所有语义 ID 与事件名在 HTML 中被保留。

本文件在保留语义绑定、页面结构、目标设备约束的前提下，对颜色、阴影、渐变、组件质感进行第二轮精修。

## 1. Visual Theme & Atmosphere

### 核心氛围升级
- **Cloud & Paw**：云朵般的大圆角卡片 + 肉垫形状的按钮/头像光环。
- **Layered Freshness**：多层薄荷色阶（50/100/200/500/600）构建空间深度。
- **Soft Gel**：按钮与卡片使用柔和的半透明毛玻璃 + 渐变，像果冻一样Q弹。
- **Healing Data**：图表区域不冰冷，使用渐变填充 + 圆润数据点 + 柔和网格线。

### 品牌意象
- 薄荷绿 = 清新、健康、呼吸感
- 肉垫粉 = 温柔、关爱、宠物触感
- 阳光黄 = 正向反馈、完成、奖励
- 薰衣草紫 = 医疗、专业、安心

## 2. Color Palette & Roles

### Primary
- **薄荷绿 600** `#3FC0A0`：CTA 按钮渐变终点、选中态、图表主色。
- **薄荷绿 500** `#5ED7B6`：CTA 按钮渐变起点、主图标色。
- **薄荷绿 300** `#9CEBD4`：图表填充、装饰性高亮。
- **薄荷绿 100** `#E5FAF4`：卡片浅底、选中 chip、输入框聚焦光环。
- **薄荷绿 50** `#F4FDFA`：页面主背景。

### Secondary
- **肉垫粉 600** `#FF9AAE`： urgent 提醒、头像光环、强调标签。
- **肉垫粉 500** `#FFB3C1`：辅助按钮、情感化插画。
- **肉垫粉 100** `#FFF0F3`：提醒卡片背景、家庭共享卡片背景。

### Accent Spectrum
- **阳光黄 500** `#FFD166`：完成标记、趋势上升、星级评分。
- **阳光黄 100** `#FFF9E6`：完成态背景。
- **天空蓝 500** `#87CEEB`：体重趋势、信息提示。
- **天空蓝 100** `#E6F5FB`：体重统计卡片背景。
- **薰衣草紫 500** `#B8B8E0`：病历、医疗图标。
- **薰衣草紫 100** `#F2F1FA`：病历卡片背景。
- **奶油杏 500** `#F4D0A4`：饮食记录主题色。
- **奶油杏 100** `#FDF5EA`：饮食统计卡片背景。

### Neutrals
- **深森绿 900** `#163832`：主文本。
- **深森绿 700** `#3D5A52`：二级文本。
- **深森绿 500** `#6F8983`：三级文本、禁用态。
- **深森绿 200** `#C9D8D4`：分割线、浅边框。
- **深森绿 100** `#E3EDEA`：卡片描边。
- **米白 50** `#FAFDFC`：页面底。
- **纯白** `#FFFFFF`：卡片面。

### Semantic
- 成功 `#4CC89A`
- 警告 `#FFAA5C`
- 错误 `#FF7474`
- 信息 `#5FC7E8`

## 3. Typography Rules

同 DESIGN.md，增加一条：
- 数字（体重、日期、统计）使用 `font-variant-numeric: tabular-nums` 保持对齐。

## 4. Component Stylings（Refined）

### Primary CTA
- Background: `linear-gradient(135deg, #5ED7B6 0%, #3FC0A0 55%, #2EB08F 100%)`
- Border Radius: 28px
- Shadow: `0 8px 22px rgba(62, 192, 160, 0.38)`
- 顶部 1px 白色高光 `inset 0 1px 0 rgba(255,255,255,0.35)`
- Active: scale 0.97, 阴影收缩

### Standard Card（v2）
- Background: `#FFFFFF`
- Border: 1px solid `rgba(201, 216, 212, 0.45)`
- Border Radius: 24px
- Shadow: `0 6px 24px rgba(22, 56, 50, 0.06), 0 2px 8px rgba(22, 56, 50, 0.04)`
- Padding: 20px

### Glass Card（新增）
- Background: `rgba(255, 255, 255, 0.72)`
- Backdrop Filter: `blur(18px) saturate(160%)`
- Border: 1px solid `rgba(255, 255, 255, 0.6)`
- Border Radius: 24px
- Shadow: `0 8px 32px rgba(22, 56, 50, 0.08)`
- Use: 首页顶部汇总卡片、空状态卡片

### Quick Action Button（首页四大入口）
- Size: 72px × 72px
- Border Radius: 24px
- Background: 每个入口使用不同浅色底 + 渐变图标容器
  - 饮食：奶油杏 100，图标容器 `linear-gradient(135deg, #FFD8A8, #F4C288)`
  - 排泄：薄荷绿 100，图标容器 `linear-gradient(135deg, #9CEBD4, #5ED7B6)`
  - 体重：天空蓝 100，图标容器 `linear-gradient(135deg, #B2E3F5, #87CEEB)`
  - 用药：薰衣草紫 100，图标容器 `linear-gradient(135deg, #D4D4F0, #B8B8E0)`
- Shadow: `0 6px 18px rgba(22, 56, 50, 0.08)`
- Active: scale 0.95

### Pet Avatar（首页顶部）
- Outer ring: 肉垫粉 500 或 薄荷绿 500（当前选中）
- Ring width: 3px
- Avatar size: 56px
- Border Radius: 50%
- Shadow: `0 4px 12px rgba(255, 179, 193, 0.28)`
- 未选中头像：无 ring，opacity 0.72

### Reminder Card
- Urgent: bg 肉垫粉 100, border 肉垫粉 500, shadow `0 6px 20px rgba(255, 154, 174, 0.18)`
- Normal: bg 纯白, border 深森绿 100
- Done: bg 阳光黄 100, opacity 0.82
- 左侧竖条：4px 圆角条，颜色与状态对应

### Medical Card
- bg 薰衣草紫 100
- 左侧图标容器：48px 圆角 16px，bg 薰衣草紫 500
- 图片缩略图：56px 圆角 12px

### Trend Chart Container
- bg 纯白，border radius 24px
- 图表区域高度 220px
- 折线：薄荷绿 500，fill `rgba(94, 215, 182, 0.18)`
- 柱状图：薄荷绿 300 到 薄荷绿 500 渐变
- 网格线：深森绿 100，1px dashed
- 数据点：8px 圆形，薄荷绿 600，白色描边 2px

### Filter Chip（v2）
- Default: bg 纯白, border 1px 深森绿 100
- Selected: bg 薄荷绿 100, text 薄荷绿 600, border 薄荷绿 500, shadow `0 2px 8px rgba(94,215,182,0.15)`

### Text Field（v2）
- bg `#FAFDFC`
- border 1px `#E3EDEA`
- border radius 16px
- focus: border 薄荷绿 500, shadow `0 0 0 4px rgba(94, 215, 182, 0.12)`
- 左侧可配图标（16px，深森绿 500）

## 5. Layout Principles（Refined）

- 页面顶部统一留出 52px 给状态栏 + 标题。
- 标题左侧可放宠物名，右侧放设置/添加按钮。
- 首页首屏：Header（52px）+ 宠物切换条（84px）+ 汇总玻璃卡片（~180px）+ 快捷入口（96px）+ 间距 = 约 520vp，符合 600vp 限制。
- 卡片间距：16px。
- 列表项间距：12px。

## 6. Depth & Elevation（Refined）

| Level | Treatment |
|-------|-----------|
| Page | bg 米白 50 |
| Standard Card | 双层柔和阴影 |
| Glass Card | 半透明 + blur + 白色内描边 |
| Floating Action | 薄荷绿弥散阴影 |
| Sheet | 顶部大圆角 + 深色 overlay |
| Pressed | scale 0.96-0.98 |

## 7. Do's and Don'ts（Refined）

### Do
- 在首页汇总卡片使用 Glass Card 效果。
- 让四大快捷按钮使用不同辅色，形成颜色节奏。
- 为每个状态（urgent/done/normal）设计专属卡片色彩。
- 使用图表渐变填充，避免纯线条图表。

### Don't
- 不要让白底卡片堆叠在一起没有阴影区分。
- 不要在同一列表中混合超过 3 种高饱和标签色。
- 不要给所有按钮相同颜色，失去入口识别度。

## 8. Responsive Behavior

同 DESIGN.md。强调：
- HTML 设计稿宽度 390px，body `max-width: 390px; margin: 0 auto;`。
- 底部 Tab Bar 使用 `position: fixed; bottom: 0; left: 0; right: 0; max-width: 390px; margin: 0 auto;`。
- 禁止侧边导航、禁止 PC 全宽。

## 9. Semantic UI Binding

同 DESIGN.md，完整保留所有 surface/page/route/tab ID、semantic target ID、event name、binding path。

### 重申关键语义目标
- `home-pet-switcher`, `home-current-pet-avatar`, `home-current-pet-name`
- `home-quick-diet`, `home-quick-stool`, `home-quick-weight`, `home-quick-meds`
- `home-today-summary-list`, `home-reminder-list`
- `records-filter-*`, `records-list`, `records-add-button`
- `trends-tab-*`, `trends-period-*`, `trends-chart`, `trends-stats-list`
- `care-tab-reminders`, `care-tab-medical`, `care-reminder-list`, `care-medical-list`
- `profile-manage-pets`, `profile-family`, `profile-settings`, `profile-about`
- `record-*-save`, `record-*-close`, `add-record-*`, `pet-picker-*`
- `reminder-detail-mark-done`, `reminder-detail-edit`, `reminder-detail-delete`
- `medical-editor-*`, `pet-editor-*`, `family-invite-code`, `family-invite-copy`

### 事件名完整保留
同 DESIGN.md。

### 变更请求
- 无。
