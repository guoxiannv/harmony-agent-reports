# 小词卡视觉设计系统

## 1. Visual Theme & Atmosphere

「小词卡」是一款面向儿童的单词复习 App，视觉氛围应温暖、亲和、充满鼓励感，同时保持学习场景所需的清晰与专注。整体设计语言借鉴 Apple 的克制与精致，但融入更适合儿童的圆润、柔软与趣味元素。

背景采用柔和的奶油色/米白色（`#FFF8F0`），营造温暖、不刺眼的纸质卡片感。卡片本身使用纯白色（`#FFFFFF`）搭配细腻的阴影，使其在背景中自然“漂浮”。主色调选用温和但充满活力的儿童友好色：珊瑚橙（`#FF8C61`）作为正向激励色，海蓝绿（`#3FB8AF`）作为冷静复习色。文字以深炭灰（`#2D2D2D`）为主，保证可读性。

动画是体验的核心：3D 翻转卡片应像真实纸片一样有弹性、柔和，配合微妙的缩放与阴影变化，让孩子对“翻开答案”产生期待感。

**Key Characteristics:**
- 温暖奶油色背景，白色悬浮卡片
- 双主色：珊瑚橙（正向/认识）与海蓝绿（复习/不认识）
- 圆润大圆角（卡片 28px，按钮 16px）
- 大而清晰的字体，儿童友好
- 柔和弥散阴影，模拟真实卡片堆叠感
- 3D 翻转动画是核心交互亮点
- 底部固定大按钮，方便儿童单手操作

## 2. Color Palette & Roles

### Primary
- **Cream Background** (`#FFF8F0`): 页面主背景，温暖不刺眼。
- **Pure White** (`#FFFFFF`): 卡片、面板、按钮文字背景。
- **Charcoal** (`#2D2D2D`): 主文字颜色，高可读性。

### Accent
- **Coral Orange** (`#FF8C61`): “认识”按钮、正向状态、完成奖励图标。充满活力与鼓励感。
- **Teal Green** (`#3FB8AF`): “不认识”按钮、复习提示、进度条。传递冷静与再尝试的信号。
- **Soft Yellow** (`#FFD166`): 装饰点缀、小星星、成就徽章，增加童趣但不泛滥。

### Text
- **Charcoal** (`#2D2D2D`): 主标题、单词文字。
- **Dim Grey** (`#6B6B6B`): 次要说明文字、音标、进度信息。
- **Light Grey** (`#A1A1A1`): 占位文字、禁用状态。

### Surface
- **Card White** (`#FFFFFF`): 卡片正面/背面。
- **Card Back Tint** (`#F7F9FC`): 卡片背面轻微蓝灰色调，与正面形成可感知的层次。
- **Glass White** (`rgba(255, 255, 255, 0.72)`): 顶部进度区毛玻璃背景。

### Button States
- **Known Button Default** (`#FF8C61` bg, `#FFFFFF` text)
- **Known Button Pressed** (`#E87A52` bg)
- **Unknown Button Default** (`#3FB8AF` bg, `#FFFFFF` text)
- **Unknown Button Pressed** (`#35A098` bg)
- **Restart Button Default** (`#2D2D2D` bg, `#FFFFFF` text)
- **Ghost Button** (transparent bg, `#6B6B6B` text, 1px border `#E0E0E0`)

### Shadows
- **Card Float** (`rgba(45, 45, 45, 0.08) 0px 12px 40px 0px`): 卡片悬浮阴影，柔和且面积大。
- **Button Pressed** (`inset 0 2px 4px rgba(0,0,0,0.1)`): 按钮按下时的内阴影感。

## 3. Typography Rules

### Font Family
- **Display / Word**: `"SF Pro Rounded"`, `"Nunito"`, `"PingFang SC"`, `"Microsoft YaHei"`, sans-serif — 圆润字体更适合儿童。
- **Body**: `"SF Pro Text"`, `"PingFang SC"`, `"Microsoft YaHei"`, sans-serif。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| App Title | SF Pro Rounded | 22px | 700 | 1.2 | -0.2px |
| Word (Card Front) | SF Pro Rounded | 48px | 700 | 1.1 | 0.5px |
| Phonetic (Card Back) | SF Pro Text | 24px | 400 | 1.3 | 0.2px |
| Meaning (Card Back) | SF Pro Rounded | 32px | 600 | 1.25 | 0px |
| Progress Text | SF Pro Text | 15px | 500 | 1.3 | 0px |
| Button Label | SF Pro Rounded | 18px | 700 | 1.0 | 0.2px |
| Caption | SF Pro Text | 14px | 500 | 1.4 | 0px |
| Empty State Title | SF Pro Rounded | 24px | 700 | 1.2 | 0px |

### Principles
- 单词使用大字号、粗字重，让孩子一眼聚焦。
- 中文释义同样使用较大字号，避免孩子阅读疲劳。
- 音标使用中等灰度，不抢释义视觉焦点。
- 所有正文保持充足的行高，儿童阅读更轻松。

## 4. Component Stylings

### Flashcard
- 尺寸：宽度 100%（max-width 342px），宽高比约 1:1.05（近似正方形）。
- 正面：纯白背景，中央大字号英文单词，底部淡淡提示“点我翻看释义”。
- 背面：轻微蓝灰色调背景，顶部音标，中央中文释义，底部装饰小星。
- 圆角：28px。
- 阴影：`rgba(45,45,45,0.08) 0px 12px 40px 0px`。
- 3D 翻转：使用 `transform-style: preserve-3d`，翻转时长 400ms，cubic-bezier(0.4, 0, 0.2, 1)。
- 翻转时伴随轻微 scale(1.02) 与阴影加深，增加真实感。

### Buttons
**Primary Action (Known / 认识)**
- Background: `#FF8C61`
- Text: `#FFFFFF`
- Height: 56px
- Padding: 0 24px
- Radius: 16px
- Font: 18px, weight 700
- Shadow: `0 4px 12px rgba(255, 140, 97, 0.35)`
- Pressed: `#E87A52` background，scale(0.98)

**Secondary Action (Unknown / 不认识)**
- Background: `#3FB8AF`
- Text: `#FFFFFF`
- Height: 56px
- Padding: 0 24px
- Radius: 16px
- Font: 18px, weight 700
- Shadow: `0 4px 12px rgba(63, 184, 175, 0.30)`
- Pressed: `#35A098` background，scale(0.98)

**Restart Button**
- Background: `#2D2D2D`
- Text: `#FFFFFF`
- Height: 54px
- Radius: 16px
- Font: 17px, weight 700

### Progress Header
- 固定在顶部安全区域内。
- 背景：`rgba(255, 248, 240, 0.85)` + `backdrop-filter: blur(12px)` 毛玻璃。
- 左侧 App 名称 + 右侧进度文字。
- 进度条：细条（4px），已完成部分用珊瑚橙，未完成部分用浅灰。

### Completion Panel
- 白色圆角卡片，28px 圆角，居中。
- 顶部大奖励图标（珊瑚橙星形 SVG）。
- 标题“本轮复习完成！”24px 粗体。
- 两行统计：已认识数量（珊瑚橙高亮）、待复习数量（海蓝绿高亮）。
- 底部“再来一轮”按钮。

### Empty State
- 居中插画区域（书本/星星 SVG）。
- 标题“还没有单词哦”。
- 说明文字“点击加载当前阶段的单词，开始复习吧～”。
- 幽灵按钮“加载单词”。

## 5. Layout Principles

### Spacing System
- Base unit: 8px
- Scale: 4px, 8px, 12px, 16px, 20px, 24px, 32px, 40px, 48px, 64px

### Page Layout
- 页面最大宽度：420px，居中。
- 顶部 Header：56px 高，距顶部安全区域 12px。
- 卡片区：距 Header 24px，水平内边距 24px。
- 操作按钮区：距卡片底部 32px，两个按钮水平排列，间距 16px。
- 摘要区：距按钮区 24px，显示已认识/剩余数量。

### Responsive Constraints
- 在目标设备（1272×2756）上，Header + 卡片顶部必须在 600vp 内可见。
- 内容区垂直居中偏上，避免过长屏幕导致卡片落在视觉死角。
- 按钮位于拇指自然触及区域（屏幕下半部分）。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Page Background | Solid `#FFF8F0` | 全局背景 |
| Header Glass | `rgba(255,248,240,0.85)` + `blur(12px)` | 顶部进度条 |
| Card Float | `rgba(45,45,45,0.08) 0px 12px 40px 0px` | 翻转卡片 |
| Button Lift | `0 4px 12px rgba(accent, 0.30-0.35)` | 主操作按钮 |
| Pressed State | `inset 0 2px 4px rgba(0,0,0,0.1)` + scale(0.98) | 按钮按下 |

## 7. Semantic UI Binding

- Surface: `review-page` → route `pages/ReviewPage`
- Semantic IDs that must be preserved:
  - `review-app-title`
  - `review-progress-text`
  - `review-flip-card`
  - `review-word-front`
  - `review-phonetic-back`
  - `review-meaning-back`
  - `review-known-button`
  - `review-unknown-button`
  - `review-known-count`
  - `review-remaining-count`
  - `review-completion-panel`
  - `review-final-known-count`
  - `review-final-review-count`
  - `review-restart-button`
  - `review-empty-state`
  - `review-empty-load-button`
- Events:
  - `flip-card`
  - `mark-known`
  - `mark-unknown`
  - `restart-round`
  - `load-words`

## 8. Do's and Don'ts

### Do
- 使用圆润字体与圆角，营造儿童友好感。
- 保持按钮足够大，方便儿童点击。
- 使用柔和阴影让卡片“浮”在背景上。
- 翻转动画要流畅、有弹性。
- 用颜色清晰区分“认识”与“不认识”的语义。

### Don't
- 不要使用尖锐直角或过于商务的配色。
- 不要让按钮过小或过于靠近屏幕边缘。
- 不要使用过多的装饰元素分散学习注意力。
- 不要在卡片上使用复杂背景图案，保持专注。
