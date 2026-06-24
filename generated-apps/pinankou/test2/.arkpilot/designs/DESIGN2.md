# 平安扣 Pinankou 视觉设计系统（最终版）

## 1. Visual Theme & Atmosphere

平安扣的视觉核心是“安全感的高级感”。我们将蓝绿色系从单一品牌色扩展为一个有层次的调色板：深青作为信任锚点、湖绿作为活力 accents、薄荷作为完成与希望的点睛之笔。界面通过**渐变氛围、玻璃质感、柔和阴影、有机圆角**四位一体，营造出现场安全管理人员愿意长期使用的专业工具。

**设计关键词**：清澈、稳重、有层次、不过度装饰。

**Key Characteristics:**
- 主品牌渐变：`linear-gradient(135deg, #0F766E, #14B8A6, #2DD4BF)`
- 页面背景使用冷→暖的极浅渐变，营造沉浸但不冰冷的氛围
- 卡片统一 20px 大圆角 + 1px 青灰边框 + 柔和阴影
- 深色“安全仪表板”卡片用于重点数据，增强视觉节奏
- 底部 Tab 栏毛玻璃 + 顶部微光边框
- 状态色使用浅底色 + 饱和文字，避免大面积刺眼色块
- 图标线性为主，激活态使用品牌渐变
- 首屏关键内容（Header + 核心卡片）控制在 560vp 内

## 2. Color Palette & Roles

### Primary
- **品牌渐变** `linear-gradient(135deg, #0F766E 0%, #14B8A6 50%, #2DD4BF 100%)`
- **品牌主色** `#0D9488`
- **品牌深** `#0F766E`
- **品牌浅** `#14B8A6`
- **品牌亮** `#2DD4BF`
- **品牌淡底** `#F0FDFA`
- **品牌浅底** `#CCFBF1`

### Secondary
- **天蓝** `#0EA5E9`
- **靛蓝** `#6366F1`
- **湖蓝** `#38BDF8`

### Status
- **成功** `#10B981` / `#ECFDF5`
- **警告** `#F59E0B` / `#FFFBEB`
- **危险** `#F43F5E` / `#FFF1F2`
- **信息** `#3B82F6` / `#EFF6FF`
- **中性** `#94A3B8` / `#F1F5F9`

### Surfaces
- **页面背景** `linear-gradient(180deg, #F0F9FF 0%, #F0FDFA 50%, #F0F4F8 100%)`
- **卡片背景** `#FFFFFF`
- **卡片边框** `#E2E8F0`
- **深色卡片** `linear-gradient(135deg, #0F766E 0%, #134E4A 100%)`
- **深色卡片内发光边框** `1px solid rgba(45, 212, 191, 0.28)`
- **玻璃** `rgba(255, 255, 255, 0.82)` + `backdrop-filter: blur(24px) saturate(170%)`

### Text
- `#0F172A` 标题
- `#334155` 正文
- `#64748B` 次要
- `#94A3B8` 禁用/占位
- `#FFFFFF` 反白主文字
- `rgba(255, 255, 255, 0.74)` 反白次要

## 3. Typography Rules

与 DESIGN1.md 保持一致。

## 4. Component Stylings

### Buttons
- **Primary**: 品牌渐变背景，#FFFFFF 文字，14px 圆角，12px 22px 内边距，阴影 `0 4px 12px rgba(13,148,136,0.28)`
- **Secondary**: #FFFFFF 背景，1.5px #0D9488 边框，#0D9488 文字
- **Ghost**: transparent，#0D9488 文字，hover 背景 `#F0FDFA`
- **Danger**: #F43F5E 背景，#FFFFFF 文字
- **FAB**: 品牌渐变，圆形 56px，阴影 `0 6px 20px rgba(13,148,136,0.40)`

### Cards
- 圆角 20px，内边距 18px，背景 #FFFFFF，边框 1px #E2E8F0
- 阴影 `0 6px 20px rgba(15, 23, 42, 0.05)`
- Hover：`translateY(-2px)` + 阴影加深

### Dashboard Cards（深色）
- 深青渐变背景，内发光边框
- 数字 #FFFFFF 30px weight 700
- 标签 rgba(255,255,255,0.74) 13px
- 进度环/条使用 #2DD4BF

### Badges
- Pill 形状，内边距 5px 12px，11px weight 600

### Inputs
- 背景 #F8FAFC，边框 1px #E2E8F0，圆角 12px
- Focus：边框 #14B8A6，外发光 `0 0 0 3px rgba(20,184,166,0.14)`

### Tab Bar
- 玻璃背景，顶部 0.5px 边框
- 未选中 #94A3B8，选中品牌渐变填充图标 + #0D9488 文字

## 5. Layout Principles

- max-width 420px 居中
- 页面 padding 16px
- 卡片间距 14px
- 区块间距 24px

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| Card | `0 6px 20px rgba(15,23,42,0.05)` |
| Hover | `0 10px 28px rgba(15,23,42,0.08)` |
| FAB | `0 6px 20px rgba(13,148,136,0.40)` |
| Sheet | `0 -8px 30px rgba(15,23,42,0.10)` |
| Glass | blur 24px saturate 170% |

## 7. Page-Specific Design Notes

与 DESIGN1.md 一致，强调：
- 工作台顶部深青横幅 + 横向数据卡片重叠布局
- 隐患卡片左侧状态色竖条
- 统计看板深色指标卡片 + 双色趋势面积图
- 联系人渐变呼叫按钮

## 8. Semantic UI Binding

与 DESIGN.md / DESIGN1.md 完全一致。无变更。

## 9. Do's and Don'ts

### Do
- 使用品牌渐变表达主按钮和顶部氛围
- 深色卡片与浅色卡片交替使用，形成视觉节奏
- 状态徽章使用浅底色，避免大面积高饱和色
- 严格限制内容宽度 420px 以内

### Don't
- 不要全宽铺满
- 不要 emoji / Unicode 图标
- 不要让阴影/渐变同时过度使用
- 不要在首屏堆叠过多信息，超出 560vp

## 10. Responsive Behavior

- 设计稿基准 390px
- 大于 420px 时居中，不放大
- TabBar 与 body 同宽居中

## 11. Iconography

使用本地 Lucide SVG，每个 SVG 首子元素为语义化 `<title>`。

