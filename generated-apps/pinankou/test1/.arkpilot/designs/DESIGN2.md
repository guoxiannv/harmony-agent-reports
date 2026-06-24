# 平安扣 Pinankou - Visual Design Specification (Final)

## 1. Visual Theme & Atmosphere

平安扣最终视觉以"清晨湖面"为隐喻：通透、平静、可信赖。蓝绿色渐变从天际线过渡到水面，白色毛玻璃卡片像浮于湖面的光斑。整体氛围既专业又有人情味，让安全管理工作从"任务清单"变成"守护感"。

设计关键词：**清晨蓝绿、毛玻璃、微渐变、光晕选中、数据优先**。

本次最终调整：
- 背景增加**轻微噪点/纹理感**，避免过于塑料的矢量感；
- 卡片加入**柔和内阴影 + 顶部 1px 高光**，提升瓷质感；
- 首页仪表盘改为**横向滑动卡片**（3 张），在有限宽度内展示更多信息；
- 快捷入口图标背景改为**双色渐变圆形**，每个入口颜色略有变化但仍在蓝绿家族内；
- 列表空状态加入**动态感 SVG 插图**（ shield + checkmark 组合）。

## 2. Color Palette & Roles

### Brand / Primary
- **天际蓝** `#38BDF8`
- **薄荷绿** `#34D399`
- **深湖青** `#0F766E`
- **湖水青** `#14B8A6`

### Functional Accents
- 高风险 `#F87171` → `#DC2626`
- 中风险 `#FBBF24` → `#D97706`
- 低风险 `#60A5FA` → `#2563EB`
- 完成绿 `#34D399` → `#059669`
- 待处理 `#CBD5E1` → `#94A3B8`

### Neutrals
- 页面背景: `linear-gradient(180deg, #E0F2FE 0%, #D1FAE5 32%, #F0FDFA 68%, #F8FAFC 100%)`
- 卡片背景: `rgba(255,255,255,0.88)` + `backdrop-filter: blur(24px)`
- 卡片边框: `1px solid rgba(255,255,255,0.65)`
- 卡片内高光: `inset 0 1px 0 0 rgba(255,255,255,0.85)`
- 主文字 `#0F172A`
- 次级文字 `#475569`
- 三级文字 `#94A3B8`
- 分割线 `#E2E8F0`

### Surfaces & Elevation
- 卡片阴影: `0 24px 48px -14px rgba(14, 165, 233, 0.14), 0 6px 16px -6px rgba(0, 0, 0, 0.05)`
- FAB 阴影: `0 18px 44px -10px rgba(14, 165, 233, 0.5)`
- Tab 栏阴影: `0 -8px 30px rgba(15, 23, 42, 0.08)`
- 选中 Tab 光晕: `0 0 24px rgba(56, 189, 248, 0.4)`
- Header 玻璃: `rgba(255,255,255,0.82)` + `backdrop-filter: blur(20px) saturate(160%)`

## 3. Typography Rules

同 DESIGN1.md。

## 4. Component Stylings

同 DESIGN1.md，额外强调：
- 状态 chip 圆角 20px（全 pill），padding 6px 12px。
- 首页横向仪表盘卡片宽度 156px，间距 12px，可横向滑动。
- 快捷入口图标背景圆 52px，图标 26px。

## 5. Layout Principles

同 DESIGN1.md。

## 6. Depth & Elevation

同 DESIGN1.md。

## 7. Page-Specific Design Notes

### 首页（home-page）
- Header 左侧 Logo：青绿渐变圆角方块内嵌白色盾形图标 + "平安扣" 文字。
- 欢迎语下方日期胶囊：白色玻璃背景，浅灰文字。
- 今日安全仪表盘：横向滚动，3 张卡片：
  1. 待处理安全事项（数字 + 图标）
  2. 逾期事项（数字 + 警告图标，数字为红渐变）
  3. 今日巡检完成率（环形微进度 + 百分比）
- 快捷入口 2×3 网格：安全事项、风险隐患、巡检打卡、应急联系人、统计看板、更多。
- 最近动态：白色卡片，最多 3 条。

其余页面同 DESIGN1.md。

## 8. Responsive Behavior

同 DESIGN1.md。

## 9. Do's and Don'ts

同 DESIGN1.md。

## 10. Semantic UI Binding

同 DESIGN1.md。

### Change Requests / Gaps

- 无。
