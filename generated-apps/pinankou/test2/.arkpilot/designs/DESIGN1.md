# 平安扣 Pinankou 视觉设计系统（修订版）

## 1. Visual Theme & Atmosphere

平安扣是一款面向现场安全管理人员的移动工具，视觉上以“深海青 + 湖水绿”的蓝绿色渐变为主调，象征稳定、可靠与生命力。我们不使用单一扁平色块，而是通过多层微妙的渐变、玻璃质感、柔和阴影和有机圆角，让界面既有专业安全感，又具备现代消费级 App 的精致度。

界面气质关键词：**清澈、可靠、轻盈、有层次**。避免传统安全类应用常见的沉闷、单调或模板化。

**Key Characteristics:**
- 主色为蓝绿渐变，从深青 `#0F766E` 过渡到薄荷 `#2DD4BF`，用于按钮、顶部氛围、选中态
- 页面背景使用带轻微冷暖变化的渐变 `#F0F9FF → #F0FDFA`，比普通灰蓝更有呼吸感
- 白色卡片带 1px 极浅青灰边框 `#E2E8F0`，圆角 20px，阴影柔和
- 深色“安全仪表板”卡片使用深青渐变 `#0F766E → #134E4A`，内嵌浅青微光边框
- 底部 Tab 栏采用毛玻璃 + 顶部 1px 微光边框
- 状态色采用语义化但不刺眼：青绿成功、琥珀警告、玫瑰危险、天蓝信息
- 图标使用双色线性图标：默认 Slate 500，激活态使用品牌青绿渐变
- 首页首屏控制在 580vp 以内，关键数据和快捷入口优先露出

## 2. Color Palette & Roles

### Primary Gradient
- **品牌渐变** `linear-gradient(135deg, #0F766E 0%, #14B8A6 50%, #2DD4BF 100%)`
- **主按钮背景** `#0D9488`（Teal 600）
- **主按钮 Hover** `#0F766E`
- **主按钮 Active** `#115E59`
- **品牌浅青** `#CCFBF1`（Teal 100，标签/背景）
- **品牌淡青** `#F0FDFA`（页面背景提亮）

### Secondary Accents
- **天蓝** `#0EA5E9`：信息提示、次要图表
- **靛蓝** `#6366F1`：高亮标签、排名前三标识
- **薄荷** `#2DD4BF`：完成态、成功图标

### Status Colors
- **成功** `#10B981` / `#ECFDF5`
- **警告** `#F59E0B` / `#FFFBEB`
- **危险** `#F43F5E` / `#FFF1F2`
- **信息** `#3B82F6` / `#EFF6FF`
- **中性** `#94A3B8` / `#F1F5F9`

### Surfaces
- **页面背景** `linear-gradient(180deg, #F0F9FF 0%, #F0FDFA 60%, #F0F4F8 100%)`
- **卡片背景** `#FFFFFF`
- **卡片边框** `1px solid #E2E8F0`
- **深色仪表板卡片** `linear-gradient(135deg, #0F766E 0%, #134E4A 100%)`
- **深色卡片内边框** `1px solid rgba(45, 212, 191, 0.25)`
- **玻璃面板** `rgba(255, 255, 255, 0.80)` + `backdrop-filter: blur(24px) saturate(160%)`

### Text
- **主标题** `#0F172A`
- **正文** `#334155`
- **次要文字** `#64748B`
- **占位/禁用** `#94A3B8`
- **反白主文字** `#FFFFFF`
- **反白次要文字** `rgba(255, 255, 255, 0.72)`

## 3. Typography Rules

与 DESIGN.md 保持一致，补充：
- 数据大数字使用 34px weight 700，带轻微负字距 -0.5px
- 首页问候语使用 16px weight 500 次要色
- 徽章文字 11px weight 600

## 4. Component Stylings（增强版）

### Buttons

**Primary CTA**
- 背景：`linear-gradient(135deg, #14B8A6 0%, #0D9488 100%)`
- 文字：#FFFFFF
- 圆角：14px
- 内边距：12px 22px
- 阴影：`0 4px 12px rgba(13, 148, 136, 0.30)`
- Active：阴影加深，背景变暗

**Secondary**
- 背景：#FFFFFF
- 边框：`1.5px solid #0D9488`
- 文字：#0D9488
- 圆角：14px

**Ghost / Text**
- 背景：transparent
- 文字：#0D9488
- 圆角：10px
- Hover：背景 `#F0FDFA`

**FAB**
- 背景：品牌渐变
- 阴影：`0 6px 20px rgba(13, 148, 136, 0.40)`
- 尺寸：56px
- 图标：白色 24px

### Cards
- 背景：#FFFFFF
- 圆角：20px
- 内边距：18px
- 边框：`1px solid #E2E8F0`
- 阴影：`0 6px 20px rgba(15, 23, 42, 0.05)`
- Hover：translateY(-2px) + 阴影加深

### Dashboard Metric Card（深色）
- 背景：深青渐变
- 内边距：18px
- 圆角：20px
- 顶部微光边框
- 数字：白色 30px weight 700
- 标签：rgba(255,255,255,0.72) 13px
- 进度条/环：薄荷色 #2DD4BF

### Badges
- 圆角：999px
- 内边距：5px 12px
- 字号：11px weight 600

### Inputs
- 背景：#F8FAFC
- 边框：`1px solid #E2E8F0`
- 圆角：12px
- Focus：边框 #14B8A6，外发光 `0 0 0 3px rgba(20, 184, 166, 0.15)`

### Tab Bar
- 背景：玻璃面板 rgba(255,255,255,0.85)
- 顶部边框：`0.5px solid rgba(226, 232, 240, 0.9)`
- 选中图标：品牌渐变填充
- 未选中：#94A3B8

## 5. Layout Principles

- 内容最大宽度：420px 居中
- 页面水平内边距：16px
- 卡片间距：14px
- 区块间距：24px
- 首页顶部氛围渐变从状态栏下方开始，高度约 180px

## 6. Depth & Elevation

| Level | Shadow / Treatment |
|-------|-------------------|
| Card | `0 6px 20px rgba(15,23,42,0.05)` |
| Hover Card | `0 10px 28px rgba(15,23,42,0.08)` |
| FAB | `0 6px 20px rgba(13,148,136,0.40)` |
| Bottom Sheet | `0 -8px 30px rgba(15,23,42,0.10)` |
| Glass Bar | `backdrop-filter: blur(24px) saturate(160%)` |

## 7. Page-Specific Design Notes

### 工作台（home-page）
- 顶部深青渐变横幅：问候语 + 通知铃铛
- 横幅下方叠加 3 个横向数据卡片（待整改 / 今日巡检 / 完成率），与横幅有 -12px 重叠，形成层次感
- 快捷入口：4 个渐变图标按钮（新建隐患、开始巡检、一键呼救、更多）
- 今日待办列表：白色卡片，带优先级侧边条

### 隐患管理（hazard-page）
- 顶部搜索栏 + 横向滚动状态筛选 pill
- 卡片左侧 4px 状态色竖条
- 右下角 FAB 新建

### 隐患详情（hazard-detail-page）
- 顶部照片区域 + 深色渐变遮罩
- 标题区大字号 + 状态徽章
- 信息卡片网格（2 列）
- 整改时间线 + 底部双按钮（催办 / 验收）

### 隐患编辑（hazard-edit-page）
- 表单分组卡片：基本信息 / 风险信息 / 指派信息
- 底部固定保存按钮（主按钮）

### 巡检打卡（patrol-page）
- 路线选择卡片突出当前路线
- 点位列表：已完成带青绿勾，未完成带空心圆
- 底部操作区：打卡 + 上报异常 + 完成巡检

### 应急联系人（contacts-page）
- 分组标签横向滚动
- 联系人卡片：头像 + 角色徽章 + 电话 + 渐变呼叫按钮

### 统计看板（stats-page）
- 顶部时间筛选 pill
- 3 个深色指标卡片横向滑动
- 趋势图使用青绿 + 天蓝双色渐变面积图
- 排名列表带数字奖牌色

### 我的（profile-page）
- 顶部用户信息卡片带青绿渐变头像环
- 入口列表带图标和右箭头

## 8. Semantic UI Binding

与 DESIGN.md 完全一致，无变更请求。

## 9. Do's and Don'ts

### Do
- 优先使用渐变而非单一色块表达品牌感
- 深色卡片用于需要重点突出的数据
- 阴影、圆角、渐变三者协调使用，避免过度
- 保持图标激活态使用品牌渐变

### Don't
- 避免所有卡片都是纯白平铺
- 避免状态色过于刺眼，使用对应的浅底色
- 避免在 PC 上全宽展示，严格限制 max-width
- 避免 emoji / Unicode 图标

## 10. Responsive Behavior

- 基准宽度 390px，最大宽度 420px 居中
- 移动端 1 列布局
- TabBar 与内容区同宽居中

## 11. Iconography

使用本地 Lucide SVG 线性图标，每个 SVG 注入语义化 `<title>`。主要图标映射与 DESIGN.md 相同，激活态建议通过 CSS `stroke` 或渐变填充实现。

