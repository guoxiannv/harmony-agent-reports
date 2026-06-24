# 童词卡（Kids Word Cards）视觉设计规范 v2

## 1. Visual Theme & Atmosphere

童词卡以“魔法图书馆”为最终视觉主题：柔和的暮光紫与月光白交织，卡片像是一本本会发光的迷你单词书。整体风格既保留儿童产品的亲和力，又通过精致的渐变、毛玻璃与动态星光，摆脱通用模板的廉价感。关键气质：

- 温柔魔法感：低饱和紫、暖白、柔金星光营造安静而有趣的氛围。
- 卡片即主角：中央大卡片使用真实 3D 翻转，配合柔和的悬浮阴影，仿佛悬浮在桌面上。
- 高级但不冰冷：使用毛玻璃质感作为顶部与底部操作区背景，增强层次。
- 正向反馈有仪式感：完成时星光洒落、星星旋转放大，让孩子感受到成就感。

## 2. Color Palette & Roles

### Primary
- **月光白** (`#FAF8FF`)：页面主背景，带极淡紫色调。
- **暮光紫** (`#6B4EE6`)：主品牌色，用于标题、进度完成、强调图标。
- **深靛** (`#2D2A4A`)：主要文字颜色。

### Accent
- **精灵绿** (`#3DD9A0`)：“认识”按钮、正向反馈。
- **暖橙粉** (`#FF8C69`)：“不认识”按钮，温和提示复习。
- **星尘金** (`#FFD36E`)：成就徽章、星星、完成状态点缀。
- **雾紫** (`#B8B0E6`)：次要装饰、音标标签、分隔线。

### Neutral
- **浅雾** (`#F0EDF8`)：卡片底层、分隔区域。
- **银灰** (`#9B96B0`)：辅助文字、音标。
- **中灰** (`#6B6580`)：次级正文。

### Surface & Elevation
- **卡片背景**：正面 `#FFFFFF`，背面 `#FBFAFF`
- **卡片阴影**：`rgba(107, 78, 230, 0.18) 0px 20px 60px -12px, rgba(45, 42, 74, 0.08) 0px 8px 24px -6px`
- **认识按钮阴影**：`rgba(61, 217, 160, 0.45) 0px 12px 32px 0px`
- **不认识按钮阴影**：`rgba(255, 140, 105, 0.40) 0px 12px 32px 0px`
- **毛玻璃面板**：`rgba(255, 255, 255, 0.72)` 背景 + `backdrop-filter: blur(20px) saturate(180%)`

### State
- **认识按钮默认**：背景 `linear-gradient(135deg, #3DD9A0 0%, #2BC88E 100%)`，文字白色。
- **认识按钮按下**：亮度降低 8%，缩放 0.96。
- **不认识按钮默认**：背景 `linear-gradient(135deg, #FF8C69 0%, #F57A54 100%)`，文字白色。
- **不认识按钮按下**：亮度降低 8%，缩放 0.96。
- **完成状态背景**：径向渐变 `radial-gradient(ellipse at 50% 20%, #F0E9FF 0%, #FAF8FF 55%, #FAF8FF 100%)`。

## 3. Typography Rules

### Font Family
- **Display / 英文单词**：`SF Pro Display`, `Helvetica Neue`, Arial, sans-serif
- **Body / 中文释义**：`SF Pro Text`, `PingFang SC`, `Microsoft YaHei`, sans-serif

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|------|--------|-------------|----------------|-------|
| 页面标题 | SF Pro Text | 22px | 700 | 1.25 | -0.2px | `#6B4EE6` |
| 英文单词 | SF Pro Display | 54px | 800 | 1.0 | -0.6px | `#2D2A4A` |
| 音标 | SF Pro Text | 18px | 500 | 1.5 | 0.2px | `#9B96B0` |
| 中文释义 | SF Pro Text | 30px | 700 | 1.35 | 0px | `#2D2A4A` |
| 按钮文字 | SF Pro Text | 17px | 700 | 1.0 | 0px | `#FFFFFF` |
| 进度数字 | SF Pro Display | 20px | 700 | 1.0 | -0.3px | `#2D2A4A` |
| 进度标签 | SF Pro Text | 11px | 600 | 1.3 | 0.4px | `#9B96B0` |
| 完成标题 | SF Pro Display | 40px | 800 | 1.1 | -0.4px | `#6B4EE6` |
| 完成说明 | SF Pro Text | 16px | 500 | 1.55 | 0px | `#6B6580` |

## 4. Component Stylings

### FlashCard（核心翻转卡片）
- 尺寸：宽度 100%（max-width 360px），高度 460px。
- 背景：正面 `#FFFFFF`，背面 `#FBFAFF`。
- 圆角：36px。
- 阴影：双层柔和阴影（见上方 Surface）。
- 边框：1px solid `rgba(107, 78, 230, 0.10)`。
- 正面布局：
  - 顶部：毛玻璃小标签，内含星形 SVG + “点我翻面”。
  - 中部：英文单词 54px 超粗体，垂直居中。
  - 底部：淡紫色小字提示“点击卡片查看释义”。
- 背面布局：
  - 顶部：雾紫色圆角标签“释义”。
  - 中部：音标 18px。
  - 分隔：1px dashed `#B8B0E6`。
  - 下部：中文释义 30px 粗体。
- 3D 翻转：800ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`，真实 preserve-3d 效果。
- 悬停/按下：卡片轻微上浮 `translateY(-4px)` 并增强阴影。

### ProgressHeader（顶部进度）
- 毛玻璃面板，固定在顶部安全区，圆角 0 0 24px 24px。
- 左侧：暮光紫星形 SVG + 页面标题“今日复习”。
- 右侧：两列统计，数字 20px 粗体，标签 11px 大写间距。
- 进度条：高度 10px，圆角 5px，背景 `#E8E4F3`，已完成部分使用暮光紫到精灵绿渐变 `linear-gradient(90deg, #6B4EE6 0%, #3DD9A0 100%)`。

### ActionBar（底部操作区）
- 毛玻璃面板，底部固定，圆角 24px 24px 0 0。
- 内部两按钮等宽：左“不认识”暖橙粉，右“认识”精灵绿。
- 按钮高度 60px，圆角 22px，带渐变背景与彩色阴影。
- 按钮内左侧有小圆点 + 文字标签。
- 两按钮间距 14px，面板内边距 20px 24px。

### CompletionOverlay（完成状态）
- 全屏覆盖，背景径向渐变。
- 中央：
  - 星尘金大星星徽章，带暮光紫柔和阴影，持续轻微上下浮动。
  - “太棒了！”标题 40px 超粗体。
  - “已认识 X / Y 个单词”说明 16px。
  - 再复习一次按钮：暮光紫渐变背景，白色文字，圆角 22px，高度 60px。
- 背景装饰：多个半透明小星星与圆点缓慢漂浮（ decorative 元素）。

## 5. Layout Principles

### Spacing System
- 基础单位：8px
- 常用尺寸：8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- 页面最大宽度：420px，居中。
- 水平内边距：24px。
- 顶部安全区：56px。

### Vertical Rhythm
- Header 高度 56px + 20px 下边距。
- 卡片顶部距 Header 约 48px，确保首屏核心内容在 600vp 内。
- 底部操作区距屏幕底部 0（固定），内部按钮距卡片至少保持 36px 可视间距（通过卡片高度与垂直居中实现）。
- 完成覆盖层：全屏居中。

### Responsive
- 手机竖屏：单列，卡片宽度自适应。
- 大屏：保持 420px max-width 居中。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Level 0 | 无阴影，月光白背景 | 页面底层 |
| Level 1 | 柔和双层阴影 | FlashCard |
| Level 2 | 彩色按钮阴影 | 主操作按钮 |
| Level 3 | 毛玻璃面板 + 阴影 | Header、底部操作区 |
| Level 4 | 全屏覆盖层 + 径向渐变 + 漂浮装饰 | 完成状态 |

## 7. Interaction & Motion

- **卡片翻转**：800ms 3D 翻转，弹性缓动，翻转时卡片轻微放大 1.02 再回正。
- **按钮按下**：scale(0.96)，150ms，亮度下降。
- **卡片切换**：
  - 认识：当前卡片向右滑出 + 旋转 8° + 淡出。
  - 不认识：当前卡片向左滑出 + 旋转 -8° + 淡出。
  - 下一张：从下方 40px 处淡入上移，350ms，带轻微回弹。
- **进度条**：宽度变化 350ms ease-out，渐变色随进度微调。
- **完成动画**：
  - 星星：scale 0→1，rotate -20°→0°，600ms 弹性。
  - 标题与说明：依次淡入上移，间隔 100ms。
  - 背景装饰：持续缓慢漂浮。

## 8. Semantic UI Binding

### Surfaces
| Surface ID | Page ID | Route | Name |
|------------|---------|-------|------|
| study | study | pages/Study | 复习页 |

### Semantic Targets
| Semantic ID | Role | Event / Binding |
|-------------|------|-----------------|
| study-progress-header | assertion | `/study/progress` |
| study-remaining-count | assertion | `/study/remainingCount` |
| study-known-count | assertion | `/study/knownCount` |
| study-flashcard | action | `toggle-flip-card` |
| study-word-front | assertion | `/study/currentWord/english` |
| study-word-back-meaning | assertion | `/study/currentWord/meaning` |
| study-word-back-phonetic | assertion | `/study/currentWord/phonetic` |
| study-known-button | action | `mark-known` |
| study-unknown-button | action | `mark-unknown` |
| study-empty-state | assertion | `/study/isEmpty` |
| study-completion-panel | assertion | `/study/isComplete` |
| study-restart-button | action | `restart-study` |

### Events
- `toggle-flip-card`
- `mark-known`
- `mark-unknown`
- `restart-study`

## 9. Do's and Don'ts

### Do
- 使用暮光紫与精灵绿的渐变组合，增强高级感。
- 使用毛玻璃面板包裹顶部与底部操作区。
- 让英文单词超大、居中、高对比。
- 使用真实 3D 翻转与方向性切换动画。
- 在完成状态中加入星光漂浮装饰，但保持克制。

### Don't
- 不要使用 emoji 或卡通插画作为图标。
- 不要让页面背景纯白或过于单调。
- 不要让“不认识”按钮看起来像错误状态。
- 不要省略 data-ui-id 语义绑定。
- 不要在首屏外隐藏卡片或按钮。
