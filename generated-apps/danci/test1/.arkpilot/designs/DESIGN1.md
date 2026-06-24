# 小小单词卡 - 视觉设计系统（ refined ）

## 1. Visual Theme & Atmosphere

「小小单词卡」是一场为孩子准备的轻量记忆游戏：界面像一张干净的奶油色桌面，中央放着一张有厚度、有温度的圆角卡片。整体设计强调「少即是多」——只有一个主角（卡片），两个选择（认识 / 不认识），以及温和的即时反馈。

我们不使用高饱和的荧光色，而是采用「棉花糖色板」：温暖的奶油白做底，卡片用极淡的灰白渐变塑造立体感；「认识」用薄荷绿、"不认识"用蜜桃粉，两种颜色都带一点 pastel（粉彩）质感，让孩子感到鼓励而非评判。完成页用温暖的星星黄与轻微的" confetti "点缀，制造小小的成就感。

字体选择圆润、友好的无衬线体。英文单词作为卡片核心内容，使用超大、稍带手写感的圆体字（参考 Nunito / Varela Round），中文释义则使用清晰的黑体保持可读性。

**Key Characteristics:**
- 奶油色页面背景，无顶部栏底纹，让卡片成为绝对视觉中心
- 一张大圆角卡片占据屏幕中上部，带柔和渐变、细边框与漫射阴影
- 粉彩色语义按钮：薄荷绿（认识）vs 蜜桃粉（不认识），底部并排
- 星星黄作为成就与进度强调色
- 3D 翻转卡片是核心交互记忆点，动画带轻微弹性
- 圆角、宽松字间距、充足留白，降低儿童认知负荷
- 完成页采用全屏替换视图，大分数 + 星星 + 再学一次

## 2. Color Palette & Roles

### Page Backgrounds
- **Cream** (`#FFFBF2`): 页面主背景，类似奶油纸张。
- **Soft Cream** (`#F7F3EA`): 卡片背面渐变终点、空状态背景。
- **Pure White** (`#FFFFFF`): 卡片正面主色、完成面板。

### Card Surfaces
- **Card Front Start** (`#FFFFFF`): 卡片正面顶部。
- **Card Front End** (`#F9F7F2`): 卡片正面底部微暖渐变。
- **Card Back Start** (`#FFF9ED`): 卡片背面顶部（暖奶油）。
- **Card Back End** (`#F5F0E4`): 卡片背面底部。
- **Card Border** (`rgba(47, 43, 35, 0.06)`): 极淡边框，增加实体感。

### Semantic Accents
- **Mint Green** (`#5EE68C`): 「认识」按钮主色， pastel 薄荷绿。
- **Mint Green Pressed** (`#3CCB72`): 按下 / 悬停态。
- **Peach Pink** (`#FF8E9A`): 「不认识」按钮主色，柔和蜜桃粉。
- **Peach Pink Pressed** (`#E86B7A`): 按下 / 悬停态。
- **Star Yellow** (`#FFD93D`): 进度环、星星、完成页强调色。
- **Star Yellow Dark** (`#F5C116`): 进度环填充末端。

### Text
- **Ink** (`#2D2A26`): 主标题、英文单词、按钮文字（当背景为浅色时）。
- **Warm Gray** (`#7A746B`): 音标、副文案、空状态说明。
- **White** (`#FFFFFF`): 按钮文字（彩色背景上）。

### Elevation & Shadows
- **Card Shadow** (`rgba(45, 42, 38, 0.10) 0px 16px 48px 0px`): 主卡片悬浮阴影，漫射、柔和。
- **Button Shadow** (`rgba(45, 42, 38, 0.08) 0px 6px 16px 0px`): 按钮轻阴影。
- **Mint Glow** (`rgba(94, 230, 140, 0.30) 0px 8px 20px 0px`): 认识按钮光晕。
- **Peach Glow** (`rgba(255, 142, 154, 0.30) 0px 8px 20px 0px`): 不认识按钮光晕。

### Progress & State
- **Progress Track** (`#EDE8DD`): 进度环轨道。
- **Progress Fill** (`linear-gradient(180deg, #FFD93D 0%, #F5C116 100%)`): 进度环填充渐变。
- **Empty Icon** (`#D6CFC2`): 空状态图标色。

## 3. Typography Rules

### Font Family
- **Display / English words**: `Nunito`, fallback `Varela Round, SF Pro Rounded, PingFang SC, sans-serif`
- **Chinese / UI labels**: `PingFang SC`, fallback `Microsoft YaHei, sans-serif`

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Notes |
|------|------|------|--------|-------------|----------------|-------|
| Page Title | PingFang SC | 22px | 700 | 1.3 | 0.5px | 顶部居中或左对齐 |
| Subtitle | PingFang SC | 14px | 400 | 1.4 | 0.2px | 「今天也要加油哦」 |
| Progress Number | Nunito | 15px | 700 | 1 | 0 | 进度环内 3/10 |
| English Word | Nunito | 64px | 800 | 1.05 | -1.5px | 卡片正面绝对焦点 |
| Flip Hint | PingFang SC | 14px | 400 | 1.4 | 0.2px | 「点我翻面」 |
| Chinese Meaning | PingFang SC | 34px | 700 | 1.25 | 0.5px | 卡片背面中文 |
| Phonetic | Nunito | 20px | 500 | 1.4 | 0.5px | 音标，暖灰色 |
| Button Label | PingFang SC | 18px | 700 | 1 | 0.5px | 认识 / 不认识 |
| Completion Score | Nunito | 80px | 800 | 1 | -2px | 完成页大分数 |
| Completion Title | PingFang SC | 24px | 700 | 1.3 | 0.5px | 「太棒了！」 |
| Body | PingFang SC | 16px | 400 | 1.5 | 0.2px | 说明文字 |
| Caption | PingFang SC | 13px | 400 | 1.4 | 0.2px | 小标签 |

## 4. Component Stylings

### 3D Flashcard

- **Outer**: `width: 100%; max-width: 340px; aspect-ratio: 4 / 5; margin: 0 auto; perspective: 1200px;`
- **Inner**: `position: relative; width: 100%; height: 100%; transform-style: preserve-3d; transition: transform 0.7s cubic-bezier(0.34, 1.56, 0.64, 1);`
- **Face common**: `position: absolute; inset: 0; border-radius: 32px; backface-visibility: hidden; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 32px;`
- **Front face**:
  - background: `linear-gradient(180deg, #FFFFFF 0%, #F9F7F2 100%)`
  - border: `1px solid rgba(47, 43, 35, 0.06)`
  - box-shadow: `0px 16px 48px rgba(45, 42, 38, 0.10)`
- **Back face**:
  - background: `linear-gradient(180deg, #FFF9ED 0%, #F5F0E4 100%)`
  - border: `1px solid rgba(47, 43, 35, 0.06)`
  - transform: `rotateY(180deg)`
- **Corner decoration**: 四个圆角处放置极淡的星星/圆点（装饰性，无语义 ID）。

### Header

- 背景透明，padding: `24px 24px 8px`
- 左侧：页面标题 + 一行小字
- 右侧：进度环（56px）
- 不使用顶部导航栏或返回按钮

### Progress Ring

- Size: 56px × 56px
- Stroke: 6px，round linecap
- Track: `#EDE8DD`
- Fill: 渐变 `#FFD93D → #F5C116`
- 中心显示当前 / 总数，字号 15px，weight 700

### Action Buttons

容器：两个按钮并排，gap 16px，width 100%，max-width 340px，margin 0 auto。

**Known Button（认识）**
- flex: 1
- height: 60px
- background: `#5EE68C`
- border-radius: 20px
- color: `#FFFFFF`
- font: PingFang SC, 18px, weight 700
- box-shadow: `0px 6px 16px rgba(94, 230, 140, 0.35)`
- active: background `#3CCB72`, transform `scale(0.97)`

**Unknown Button（不认识）**
- flex: 1
- height: 60px
- background: `#FF8E9A`
- border-radius: 20px
- color: `#FFFFFF`
- font: PingFang SC, 18px, weight 700
- box-shadow: `0px 6px 16px rgba(255, 142, 154, 0.35)`
- active: background `#E86B7A`, transform `scale(0.97)`

### Completion State

- 全屏替换视图（非弹窗），背景保持 Cream `#FFFBF2`
- 顶部大星星 SVG（48px），轻微浮动动画
- 主文案：「太棒了！」PingFang SC 24px weight 700
- 分数：Nunito 80px weight 800，如「8/10」
- 副文案：「再学一次会记得更牢哦」
- 「再学一次」按钮：Mint Green，width 220px，height 56px，border-radius 20px

### Empty State

- 居中，垂直方向偏上（避免首屏空白过多）
- 大书本/星星 SVG（80px），颜色 `#D6CFC2`
- 主文案：「还没有要复习的单词哦」PingFang SC 18px weight 600，颜色 `#2D2A26`
- 副文案：「去添加一些单词再来吧」PingFang SC 14px，颜色 `#7A746B`

## 5. Layout Principles

### Spacing System
- Base: 8px
- Scale: 4, 8, 12, 16, 20, 24, 28, 32, 40, 48, 64

### Container
- Max width: 390px，水平居中
- 水平 padding: 24px
- Header + 卡片 + 按钮组必须在首屏 600vp 内可见

### Vertical Rhythm
```
status bar safe area
24px
Header (title + progress ring)
28px
Flashcard
32px
Button group
16px
Flip hint / helper text
```

### Border Radius Scale
- Small: 12px（标签、小按钮）
- Medium: 20px（大按钮）
- Large: 32px（卡片）
- Full: 50%（进度环、装饰圆点）

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Page | 无阴影，纯色 Cream | 页面背景 |
| Card Lift | `0px 16px 48px rgba(45,42,38,0.10)` | 单词卡片 |
| Button Lift | `0px 6px 16px rgba(45,42,38,0.08)` | 认识 / 不认识按钮 |
| Colored Glow | `0px 8px 20px rgba(94,230,140,0.30)` / `rgba(255,142,154,0.30)` | 按钮 active / 按下 |

## 7. Interaction & Motion

### 3D Flip
- Trigger: 点击卡片任意位置
- Duration: 700ms
- Easing: `cubic-bezier(0.34, 1.56, 0.64, 1)`（轻微过冲）
- Transform: `rotateY(180deg)`
- 翻转时卡片可轻微 scale(1.02) 增加戏剧性

### Button Press
- Duration: 120ms
- Active: scale(0.97)，背景变深

### Card Transition
- 当用户点击认识/不认识时，当前卡片向按钮方向滑出 + 淡出
- Duration: 300ms
- Easing: `cubic-bezier(0.4, 0, 0.2, 1)`
- 下一张卡片从 scale(0.95) opacity(0) → scale(1) opacity(1)

### Completion Entrance
- 完成页从 opacity(0) translateY(20px) → opacity(1) translateY(0)
- Duration: 500ms
- 星星使用缓慢上下浮动动画（`translateY(-6px)` 循环 2s）

## 8. Semantic UI Binding

| Surface | Page ID | Route | Semantic Targets |
|---------|---------|-------|------------------|
| review-page | review-page | pages/Review | review-header-title, review-progress-text, review-progress-ring, review-flashcard, review-flashcard-front, review-flashcard-back, review-word-english, review-word-phonetic, review-word-chinese, review-unknown-button, review-known-button, review-completion-panel, review-completion-score, review-restart-button, review-empty-state, review-empty-message |

### Event Preservation
- `flip-card`: `review-flashcard` 点击触发。
- `mark-unknown`: `review-unknown-button` 点击触发。
- `mark-known`: `review-known-button` 点击触发。
- `restart-review`: `review-restart-button` 点击触发。

### Binding Mapping
- `/currentWord/english` → `review-flashcard-front` 与 `review-word-english`
- `/currentWord/chinese` → `review-word-chinese`
- `/currentWord/phonetic` → `review-word-phonetic`
- `/progress/currentAndTotal` → `review-progress-text`
- `/progress/percent` → `review-progress-ring` 进度填充
- `/completion/isVisible` → `review-completion-panel` 显隐
- `/completion/correctAndTotal` → `review-completion-score`
- `/empty/isVisible` → `review-empty-state` 显隐
- `/empty/message` → `review-empty-message`

## 9. Do's and Don'ts

### Do
- 保持奶油色背景，让卡片和按钮成为唯二焦点。
- 使用 pastel 粉彩色（薄荷绿 / 蜜桃粉），避免高饱和荧光色。
- 英文单词字号足够大（64px），让孩子一眼看清。
- 按钮高度 ≥ 60px，方便儿童小手点击。
- 所有语义目标保留 `data-ui-id` 并在 ArkTS 中绑定 `.id(...)`。
- 处理真实空状态和完成状态。

### Don't
- 不要使用侧滑抽屉、底部 Tab 等多余导航。
- 不要把「不认识」设计成红色警告按钮。
- 不要在卡片正面显示中文释义或音标（保持回忆挑战）。
- 不要让卡片可翻转区域小于 44vp 触控目标。
- 不要省略 3D 翻转动画，它是核心交互记忆点。
- 不要在 HTML 示例数据之外默认注入种子数据。

## 10. Responsive Behavior

### Viewport
- Mobile: 360-420px
- Content max-width: 390px，居中

### Scaling
- 卡片宽度 100%，max-width 340px
- 英文单词在 ≤360px 时降至 56px
- 按钮宽度各占约 48%（gap 16px）

### Touch Targets
- 卡片整体 ≥ 340×425
- 按钮 60px 高，间距 16px

---
*输出：ArkPilot autopilot-html-tmux-design-a2ui-pro / Stage 2 - Visual Design (Step 2 Refinement)*
