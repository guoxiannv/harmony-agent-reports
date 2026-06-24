# 小词卡视觉设计系统（ refined ）

## 1. Visual Theme & Atmosphere

「小词卡」面向 6-12 岁儿童，视觉需要同时满足三个目标：**可爱但不幼稚**、**专注但不枯燥**、**高级但不冰冷**。整体参考 Apple 的克制比例与精致阴影，但用更温暖的色彩、更圆润的造型、更明确的反馈，让孩子愿意主动翻开每一张卡片。

背景不是纯白，而是带有一丝暖意的奶油色 `#FFF8F0`，降低屏幕对眼睛的刺激。卡片使用纯白 `#FFFFFF`，通过一层弥散阴影让它从背景中“托起来”。主界面只保留两个高饱和动作色：珊瑚橙 `#FF8C61` 代表“认识/成功”，海蓝绿 `#3FB8AF` 代表“再复习/冷静”。这两种颜色形成温暖的对比，而不是糖果色大乱斗。

3D 翻转是核心仪式。翻转不应该像机械开关，而像真实纸张被手指翻开：先轻微放大、再旋转、最后落回原位。我们将加入 subtle 的 `translateY(-8px)` 和阴影加深，让卡片在翻转瞬间显得更有分量。

**Key Characteristics:**
- 奶油色全局背景 + 纯白悬浮卡片
- 珊瑚橙与海蓝绿双动作色，语义清晰
- 大圆角（卡片 28px，按钮 16px）+ 圆润字体
- 3D 翻转动画作为核心情感交互
- 底部双大按钮，单手可操作
- 柔和弥散阴影 + 轻微毛玻璃顶部进度条

## 2. Color Palette & Roles

### Primary
- **Cream** (`#FFF8F0`): 页面背景，温暖护眼。
- **Pure White** (`#FFFFFF`): 卡片、完成面板、按钮文字。
- **Charcoal** (`#2D2D2D`): 主文字、完成面板标题。

### Accent
- **Coral Orange** (`#FF8C61`): “认识”按钮、正确数、奖励图标。
- **Coral Dark** (`#E87A52`): 珊瑚橙按下态。
- **Teal Green** (`#3FB8AF`): “不认识”按钮、待复习数。
- **Teal Dark** (`#35A098`): 海蓝绿按下态。
- **Soft Yellow** (`#FFD166`): 小星星装饰、空状态点缀，使用面积不超过 5%。

### Text
- **Charcoal** (`#2D2D2D`): 单词、标题、主按钮文字。
- **Dim Grey** (`#6B6B6B`): 音标、进度、说明文字。
- **Light Grey** (`#A1A1A1`): 占位、禁用态。

### Surface
- **Card White** (`#FFFFFF`): 卡片正面/完成面板。
- **Card Back Tint** (`#F7F9FC`): 卡片背面浅蓝灰背景，与正面形成自然层次。
- **Glass Cream** (`rgba(255, 248, 240, 0.85)`): 顶部毛玻璃背景。

### Shadows
- **Card Float** (`0 12px 40px rgba(45, 45, 45, 0.08)`): 主卡片悬浮。
- **Card Float Hover / Flip** (`0 20px 50px rgba(45, 45, 45, 0.12)`): 翻转时阴影加深。
- **Button Glow Coral** (`0 4px 14px rgba(255, 140, 97, 0.38)`): 认识按钮外发光。
- **Button Glow Teal** (`0 4px 14px rgba(63, 184, 175, 0.32)`): 不认识按钮外发光。
- **Button Press Inset** (`inset 0 2px 6px rgba(0, 0, 0, 0.12)`): 按钮按下内阴影。

## 3. Typography Rules

### Font Family
- **Display / Word / Button**: `"SF Pro Rounded"`, `"Nunito"`, `"PingFang SC"`, `"Microsoft YaHei"`, sans-serif
- **Body / Caption**: `"SF Pro Text"`, `"PingFang SC"`, `"Microsoft YaHei"`, sans-serif

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| App Title | SF Pro Rounded | 22px | 700 | 1.2 | -0.2px |
| Word Front | SF Pro Rounded | 52px | 800 | 1.05 | 0.6px |
| Meaning Back | SF Pro Rounded | 34px | 700 | 1.25 | 0px |
| Phonetic Back | SF Pro Text | 22px | 400 | 1.35 | 0.2px |
| Progress Text | SF Pro Text | 15px | 600 | 1.3 | 0px |
| Button Label | SF Pro Rounded | 18px | 700 | 1.0 | 0.2px |
| Summary Number | SF Pro Rounded | 28px | 800 | 1.0 | 0px |
| Summary Label | SF Pro Text | 13px | 500 | 1.3 | 0px |
| Empty Title | SF Pro Rounded | 24px | 700 | 1.2 | 0px |
| Empty Body | SF Pro Text | 15px | 400 | 1.45 | 0px |
| Completion Title | SF Pro Rounded | 26px | 800 | 1.15 | 0px |

### Principles
- 单词字号最大、字重最粗，形成绝对视觉焦点。
- 中文释义仅次于单词，确保孩子不用凑近看。
- 音标使用灰度与常规字重，作为辅助信息。
- 进度与统计使用较小的 SF Pro Text，保持界面清爽。

## 4. Component Stylings

### Flashcard
- 宽度：100%，max-width 342px。
- 高度：约 384px（宽高比约 0.89，接近方形但略竖）。
- 正面：纯白背景，中央 52px 英文单词，底部 14px 浅灰提示“点我翻看释义”。
- 背面：`#F7F9FC` 背景，顶部 22px 音标，中央 34px 中文释义，底部装饰小星 SVG。
- 圆角：28px。
- 3D 翻转：
  - `transform-style: preserve-3d`
  - 时长 400ms
  - 缓动 `cubic-bezier(0.34, 1.56, 0.64, 1)`（轻微弹性，像真实纸张）
  - 翻转同时 `translateY(-8px)` + 阴影加深
- 卡片正面与背面均使用 `backface-visibility: hidden`。

### Buttons
**Known Button / 认识**
- Background: `#FF8C61`
- Text: `#FFFFFF`
- Height: 58px
- Padding: 0 28px
- Radius: 16px
- Font: 18px weight 700
- Shadow: `0 4px 14px rgba(255, 140, 97, 0.38)`
- Pressed: `#E87A52` + `scale(0.97)` + inset shadow
- 左侧带白色对勾 SVG

**Unknown Button / 不认识**
- Background: `#3FB8AF`
- Text: `#FFFFFF`
- Height: 58px
- Padding: 0 28px
- Radius: 16px
- Font: 18px weight 700
- Shadow: `0 4px 14px rgba(63, 184, 175, 0.32)`
- Pressed: `#35A098` + `scale(0.97)` + inset shadow
- 左侧带白色循环/返回 SVG

**Restart Button / 再来一轮**
- Background: `#2D2D2D`
- Text: `#FFFFFF`
- Height: 56px
- Radius: 16px
- Font: 17px weight 700
- 居中，max-width 240px

**Ghost Load Button**
- Background: transparent
- Border: 1.5px solid `#E0E0E0`
- Text: `#6B6B6B`
- Radius: 14px
- Height: 48px

### Progress Header
- 顶部安全区域下方 12px。
- 高度：56px。
- 背景：`rgba(255, 248, 240, 0.88)` + `backdrop-filter: saturate(160%) blur(14px)`。
- 左侧 App 名称 22px 粗体；右侧进度文字 15px。
- 下方细进度条：高 4px，已完成段 `#FF8C61`，未完成段 `#EBE4DC`，圆角 2px。

### Summary Bar
- 两个统计块水平排列，间距 16px。
- 每个块：白色圆角卡片，16px radius，垂直内边距 16px。
- 上方数字 28px 粗体；下方标签 13px 灰色。
- 已知数字用珊瑚橙，剩余/待复习数字用海蓝绿。

### Completion Panel
- 白色卡片，28px radius，max-width 342px，居中。
- 顶部大星星 SVG（珊瑚橙，56px）。
- 标题“本轮复习完成！”26px 粗体。
- 统计行：已认识（珊瑚橙大数字 + 小标签）、待复习（海蓝绿大数字 + 小标签）。
- 底部“再来一轮”按钮。

### Empty State
- 中央插画：书本 + 星星 SVG，颜色为 Soft Yellow + Dim Grey。
- 标题“还没有单词哦”24px 粗体。
- 说明 15px 灰色。
- “加载当前阶段单词”幽灵按钮。

## 5. Layout Principles

### Spacing System
- Base: 8px
- Scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64

### Page Layout
- 全局 `max-width: 420px`，水平居中。
- Header 距顶 12px（含安全区域）。
- 卡片区距 Header 28px。
- 操作按钮区距卡片底部 36px，两按钮 flex 横向，gap 16px。
- Summary Bar 距按钮区 28px。
- 完成面板在卡片位置居中展示。

### Responsive / Target Device
- 在 1272×2756 设备上，确保 Header + 卡片顶部在 600vp 以内可见。
- 卡片在视觉重心偏上位置，按钮落在拇指舒适区。
- 页面长滚动充足，但核心内容不依赖滚动。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Page | Solid `#FFF8F0` | 全局背景 |
| Header Glass | `rgba(255,248,240,0.88)` + `blur(14px)` + `saturate(160%)` | 顶部进度 |
| Card Default | `0 12px 40px rgba(45,45,45,0.08)` | 主卡片 |
| Card Flipping | `0 20px 50px rgba(45,45,45,0.12)` + `translateY(-8px)` | 翻转中 |
| Button Default | `0 4px 14px rgba(accent, 0.32-0.38)` | 主按钮 |
| Button Pressed | `inset 0 2px 6px rgba(0,0,0,0.12)` + `scale(0.97)` | 按钮按下 |
| Summary Card | `0 6px 20px rgba(45,45,45,0.06)` | 统计块 |

## 7. Semantic UI Binding

- Surface: `review-page` → route `pages/ReviewPage`
- Semantic IDs preserved:
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
- 保持大按钮、大卡片、大字号，儿童操作友好。
- 翻转动画要有弹性，不能生硬。
- 用颜色区分两个主要动作，降低认知负担。
- 顶部进度条时刻可见，让孩子有掌控感。
- 完成后给出积极反馈（星星、大标题）。

### Don't
- 不要引入第三种高饱和主色，避免界面变成“彩虹糖”。
- 不要缩小按钮或卡片，儿童点击精度有限。
- 不要使用复杂背景纹理，干扰学习。
- 不要让“不认识”按钮看起来像错误/警告（不使用红色）。
- 不要添加未在 spec 中的功能入口（如设置、个人中心）。
