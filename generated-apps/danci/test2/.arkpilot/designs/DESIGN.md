# 童词卡（Kids Word Cards）视觉设计规范

## 1. Visual Theme & Atmosphere

童词卡是一款面向儿童的单词复习应用，视觉风格应温暖、活泼但不过度幼稚。整体氛围采用“阳光书房”概念：柔和的奶油白背景、低饱和的彩色点缀、圆润的卡片与按钮，营造轻松专注的学习环境。设计语言借鉴现代儿童教育 App 的亲和力，同时保留足够的留白与清晰的层级，避免信息过载。

关键气质：
- 温暖友好：使用暖色调与圆角元素，降低学习压力。
- 游戏化但不喧嚣：动画与色彩克制，重点突出卡片本身。
- 清晰可触：大按钮、大卡片、充足的触摸目标，适合儿童操作。
- 正向反馈：正确操作伴随柔和的色彩变化与微动画。

## 2. Color Palette & Roles

### Primary
- **奶油白** (`#FFFDF7`)：页面主背景，温暖不刺眼。
- **深蓝灰** (`#2C3E50`)：主要文字颜色，稳重易读。
- **柔白** (`#FFFFFF`)：卡片、按钮表面。

### Accent
- **薄荷绿** (`#4ECDC4`)：正向操作、“认识”按钮、进度完成色。
- **珊瑚橙** (`#FF6B6B`)：需要重复复习的“不认识”按钮，温和不警示。
- **阳光黄** (`#FFD93D`)：强调色，用于成就徽章、星星、完成状态背景点缀。
- **薰衣草紫** (`#A78BFA`)：次要强调，用于装饰性元素与进度条背景。

### Neutral
- **浅灰** (`#F3F4F6`)：次要背景、分隔区域。
- **中灰** (`#9CA3AF`)：辅助文字、音标、占位符。
- **深灰** (`#4B5563`)：次级正文。

### Surface & Elevation
- **卡片背景**：`#FFFFFF`
- **卡片阴影**：`rgba(44, 62, 80, 0.08) 0px 12px 40px 0px`
- **按钮阴影**：`rgba(78, 205, 196, 0.35) 0px 8px 24px 0px`（仅用于主操作）
- **悬浮阴影**：`rgba(44, 62, 80, 0.12) 0px 16px 48px 0px`

### State
- **认识按钮默认**：背景 `#4ECDC4`，文字白色。
- **认识按钮按下**：背景 `#3DBEB5`，缩放 0.97。
- **不认识按钮默认**：背景 `#FF6B6B`，文字白色。
- **不认识按钮按下**：背景 `#E85A5A`，缩放 0.97。
- **完成状态背景**：渐变 `linear-gradient(135deg, #FFFDF7 0%, #FFF4D9 100%)`。

## 3. Typography Rules

### Font Family
- **Display / 英文单词**：`SF Pro Display`, `Helvetica Neue`, Arial, sans-serif
- **Body / 中文释义**：`SF Pro Text`, `PingFang SC`, `Microsoft YaHei`, sans-serif

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Color |
|------|------|------|--------|-------------|----------------|-------|
| 页面标题 | SF Pro Text | 22px | 600 | 1.3 | -0.2px | `#2C3E50` |
| 英文单词 | SF Pro Display | 48px | 700 | 1.1 | -0.5px | `#2C3E50` |
| 音标 | SF Pro Text | 18px | 400 | 1.4 | 0.2px | `#9CA3AF` |
| 中文释义 | SF Pro Text | 28px | 600 | 1.4 | 0px | `#2C3E50` |
| 按钮文字 | SF Pro Text | 17px | 600 | 1.0 | 0px | `#FFFFFF` |
| 进度数字 | SF Pro Display | 20px | 700 | 1.0 | -0.3px | `#2C3E50` |
| 进度标签 | SF Pro Text | 12px | 500 | 1.3 | 0px | `#9CA3AF` |
| 完成标题 | SF Pro Display | 36px | 700 | 1.15 | -0.3px | `#2C3E50` |
| 完成说明 | SF Pro Text | 16px | 400 | 1.5 | 0px | `#4B5563` |

## 4. Component Stylings

### FlashCard（核心翻转卡片）
- 尺寸：宽度 100%（max-width 360px），高度 420px。
- 背景：正面 `#FFFFFF`，背面 `#FFFFFF`。
- 圆角：28px。
- 阴影：卡片阴影 `rgba(44, 62, 80, 0.08) 0px 12px 40px 0px`。
- 正面布局：垂直居中，英文单词 48px 粗体。
- 背面布局：垂直居中，音标在上方，中文释义在下方，中间有细虚线分隔。
- 3D 翻转：通过 CSS transform-style: preserve-3d 与 rotateY(180deg)，过渡 600ms，缓动 `cubic-bezier(0.34, 1.56, 0.64, 1)`（轻微弹性）。
- 点击热区：整张卡片。
- 装饰：卡片左上角有一个小圆点标签，正面显示“点我翻面”，背面显示“释义”。

### ProgressHeader（顶部进度）
- 固定在页面顶部安全区内，背景奶油白。
- 左侧：页面标题“今日复习” + 一个太阳 SVG 图标。
- 右侧：两列统计，分别为“剩余”与“已认识”，数字 20px 粗体，标签 12px。
- 下方进度条：高度 8px，圆角 4px，背景 `#E5E7EB`，已完成部分使用渐变色 `linear-gradient(90deg, #4ECDC4 0%, #A78BFA 100%)`。

### ActionBar（底部按钮组）
- 位于卡片下方 32px 处，水平排列，两个按钮等宽。
- “不认识”按钮在左，“认识”按钮在右。
- 按钮高度 56px，圆角 18px，阴影根据颜色区分。
- 间距：两按钮之间 16px。

### CompletionOverlay（完成状态）
- 居中覆盖全屏，背景使用完成状态渐变。
- 中央：大星星徽章（阳光黄）+ “太棒了！”标题 + “已认识 X / Y 个单词”说明。
- 下方：再复习一次按钮，薄荷绿背景，白色文字，圆角 18px，高度 56px。

## 5. Layout Principles

### Spacing System
- 基础单位：8px
- 常用尺寸：8, 12, 16, 20, 24, 32, 40, 48, 64

### Container
- 页面最大宽度：420px，居中。
- 水平内边距：24px。
- 顶部安全区：56px（状态栏 + 标题）。

### Vertical Rhythm
- 顶部 Header：56px 高 + 24px 下边距。
- 卡片区域：占据页面视觉中心，顶部距 Header 约 32px。
- 操作按钮：距卡片 32px。
- 完成覆盖层：全屏居中。

### Responsive
- 手机竖屏：单列布局，卡片宽度适应容器。
- 大屏：仍居中显示，max-width 420px 保持不变。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Level 0 | 无阴影，奶油白背景 | 页面底层 |
| Level 1 | 柔和阴影 0px 12px 40px 0.08 | FlashCard |
| Level 2 | 彩色按钮阴影 0px 8px 24px 0.35 | 主操作按钮 |
| Level 3 | 全屏覆盖层 + 渐变背景 | 完成状态 |

## 7. Interaction & Motion

- **卡片翻转**：点击后 600ms 3D 翻转，使用 cubic-bezier 缓动带来轻微回弹。
- **按钮按下**：scale(0.97)，背景色加深，150ms。
- **卡片切换**：当用户点击“认识”或“不认识”后，当前卡片向对应方向滑出并淡出，下一张卡片从下方滑入，300ms。
- **进度条**：宽度变化 300ms ease-out。
- **完成动画**：星星徽章 scale 从 0 到 1 并轻微旋转，600ms 弹性缓动。

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

### Notes
- 无语义 ID 变更请求；HTML 实现需严格保持上述 ID。
- 进度条为 decorative 元素，不绑定单独语义 ID。
- 卡片装饰性小标签不绑定语义 ID。

## 9. Do's and Don'ts

### Do
- 使用圆润大卡片与按钮，适合儿童点击。
- 使用柔和阴影提升卡片层级。
- 保持页面背景温暖奶油白，减少视觉疲劳。
- 确保“认识”与“不认识”按钮颜色语义清晰但不过度警示。
- 在卡片翻转动画中加入轻微弹性，增强趣味性。

### Don't
- 不要使用高饱和荧光色或过多装饰图案。
- 不要让按钮过小或过于靠近屏幕边缘。
- 不要使用复杂的转场动画分散注意力。
- 不要让“不认识”按钮呈现错误/失败感（避免红色警示）。
- 不要在首屏外隐藏核心操作。
