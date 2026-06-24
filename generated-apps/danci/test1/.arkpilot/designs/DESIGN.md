# 小小单词卡 - 视觉设计系统

## 1. Visual Theme & Atmosphere

「小小单词卡」是一款面向儿童的单词复习工具，整体氛围应像一本干净的硬壳绘本：温暖、明亮、有游戏感，但不喧闹。我们采用「柔和糖果色 + 圆润几何 + 轻盈卡片」的方向，让孩子在翻动卡片时感受到类似实体识字卡的触感与成就感。

界面以浅色奶油画布为底，中央放置一张大面积圆角卡片作为绝对主角。卡片使用微妙的渐变与柔和阴影营造「可以被拿起」的立体感。按钮大而圆润，使用两种对比鲜明的语义色：清新的薄荷绿代表「认识」（正向、前进），柔和的珊瑚红代表「不认识」（不惩罚、只是需要再练）。

字体上选择圆润、亲和的无衬线体（以 Nunito / PingFang SC 为参考），字母间距略微宽松，让孩子更容易辨识。大标题使用较重的字重，正文保持舒适。

**Key Characteristics:**
- 奶油白/浅灰背景，营造干净、无压力的阅读环境
- 大面积圆角卡片作为核心视觉焦点，带有柔和渐变与阴影
- 双语义色按钮：薄荷绿（认识）与珊瑚红（不认识），颜色鲜明但不过于刺眼
- 圆润字体、宽松字母间距，适合儿童阅读
- 进度环、小星星、完成庆祝等轻量游戏化元素
- 充足留白，避免信息过载；所有触控目标 ≥ 44vp

## 2. Color Palette & Roles

### Primary Backgrounds
- **Cream White** (`#FFFDF7`): 页面主背景，温暖不冷。
- **Soft Gray** (`#F6F4EF`): 次级背景、卡片底部渐变终点、空状态区域。
- **Warm White** (`#FFFFFF`): 卡片正面主色。

### Semantic Accents
- **Mint Green** (`#4ADE80`): 「认识」按钮主色，象征正确、前进、成长。
- **Mint Green Dark** (`#22C55E`): 按下态 / 悬停态。
- **Coral Red** (`#FB7185`): 「不认识」按钮主色，柔和不刺眼，表示「再练一次」。
- **Coral Red Dark** (`#E11D48`): 按下态 / 悬停态。
- **Star Yellow** (`#FACC15`): 进度、成就、星星装饰。

### Text
- **Ink Black** (`#1F2937`): 主标题、英文单词、正文。
- **Slate Gray** (`#6B7280`): 音标、副标题、辅助说明。
- **White** (`#FFFFFF`): 按钮文字、深色背景文字。

### Surface & Elevation
- **Card Gradient Start** (`#FFFFFF`): 卡片顶部。
- **Card Gradient End** (`#F9FAFB`): 卡片底部。
- **Card Shadow** (`rgba(31, 41, 55, 0.08) 0px 12px 40px 0px`): 主要卡片悬浮阴影。
- **Button Shadow** (`rgba(0, 0, 0, 0.06) 0px 4px 12px 0px`): 按钮轻量阴影。

### State Colors
- **Progress Ring Track** (`#E5E7EB`): 进度环底色。
- **Progress Ring Fill** (`#FACC15`): 进度环填充色。
- **Disabled / Empty** (`#D1D5DB`): 空状态图标、禁用态。

## 3. Typography Rules

### Font Family
- **Display / English words**: `Nunito`, fallback `SF Pro Display, PingFang SC, Helvetica Neue, sans-serif`
- **Chinese / Body**: `PingFang SC`, fallback `Microsoft YaHei, sans-serif`

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing | Notes |
|------|------|------|--------|-------------|----------------|-------|
| Page Title | PingFang SC | 22px (1.375rem) | 700 | 1.3 | 0.5px | 顶部标题 |
| Progress Number | Nunito | 16px (1rem) | 700 | 1.2 | 0 | 进度文本如 3/10 |
| English Word | Nunito | 56px (3.5rem) | 800 | 1.05 | -1px | 卡片正面英文单词，视觉焦点 |
| Flip Hint | PingFang SC | 14px (0.875rem) | 400 | 1.4 | 0.2px | 「点击翻面」提示 |
| Chinese Meaning | PingFang SC | 32px (2rem) | 700 | 1.3 | 0.5px | 卡片背面中文释义 |
| Phonetic | Nunito | 18px (1.125rem) | 500 | 1.4 | 0.5px | 音标，灰色 |
| Button Label | PingFang SC | 18px (1.125rem) | 700 | 1 | 0.5px | 认识 / 不认识 |
| Completion Score | Nunito | 72px (4.5rem) | 800 | 1 | -2px | 完成页大分数 |
| Body | PingFang SC | 16px (1rem) | 400 | 1.5 | 0.2px | 说明文字 |
| Caption | PingFang SC | 13px (0.8125rem) | 400 | 1.4 | 0.2px | 小标签 |

## 4. Component Stylings

### 3D Flashcard

- **Container**: width 100%, max-width 340px, aspect-ratio 4:5 (推荐高度 425px), margin 0 auto。
- **Perspective**: 1000px 给外层，实现真实 3D 翻转。
- **Inner**: `transform-style: preserve-3d; transition: transform 0.7s cubic-bezier(0.34, 1.56, 0.64, 1);`
- **Front / Back**: `backface-visibility: hidden; position: absolute; inset: 0; border-radius: 28px;`
- **Front Background**: linear-gradient(180deg, #FFFFFF 0%, #F9FAFB 100%);
- **Back Background**: linear-gradient(180deg, #FFFDF7 0%, #F6F4EF 100%);
- **Border**: 1px solid rgba(0,0,0,0.04);
- **Shadow**: `0px 12px 40px rgba(31, 41, 55, 0.08)`;
- **Decoration**: 卡片四角有柔和的圆角星星/圆点装饰（仅视觉，无需语义 ID）。

### Primary Action Buttons

**Known Button**
- Background: `#4ADE80`
- Text: `#FFFFFF`, 18px, weight 700
- Padding: 16px 0
- Border-radius: 20px
- Shadow: `0px 4px 12px rgba(74, 222, 128, 0.35)`
- Active: background `#22C55E`, scale(0.98)

**Unknown Button**
- Background: `#FB7185`
- Text: `#FFFFFF`, 18px, weight 700
- Padding: 16px 0
- Border-radius: 20px
- Shadow: `0px 4px 12px rgba(251, 113, 133, 0.35)`
- Active: background `#E11D48`, scale(0.98)

### Progress Ring

- Size: 56px × 56px
- Stroke width: 6px
- Track: `#E5E7EB`
- Fill: `#FACC15`
- Round linecap
- 中心显示当前 / 总数文本

### Header

- Background: transparent（滚动后可加轻微模糊底）
- Padding: 24px 20px 12px
- 标题左对齐，进度环居右
- 标题下方可有一行小字「今天也要加油哦」

### Completion State

- Centered overlay / replacement view
- 大星星图标 + 分数「8 / 10」
- 文案「太棒了！再学一次会记得更牢」
- 「再学一次」按钮使用 Mint Green 主色

### Empty State

- Centered illustration（书本/星星简笔画 SVG）
- 文案「还没有要复习的单词哦」
- 副文案「去添加一些单词再来吧」

## 5. Layout Principles

### Spacing System
- Base unit: 8px
- Scale: 4px, 8px, 12px, 16px, 20px, 24px, 32px, 40px, 56px

### Container
- Max content width: 390px（移动端），居中
- 水平 padding: 20px
- Header + 卡片 + 按钮组 全部在首屏 600vp 内可见

### Vertical Rhythm
```
Header:    24px top
Title:     8px below header
Card:      28px below title
Buttons:   32px below card
Hint:      16px below buttons
```

### Border Radius Scale
- Small: 12px（小标签、输入框）
- Medium: 20px（按钮）
- Large: 28px（卡片）
- Full: 50%（进度环、头像）

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | 无阴影，纯色背景 | 页面底层、空状态背景 |
| Subtle Lift | `0px 12px 40px rgba(31,41,55,0.08)` | 单词卡片 |
| Floating Button | `0px 4px 12px rgba(0,0,0,0.06)` | 认识/不认识按钮 |
| Glow | `0px 4px 12px rgba(74,222,128,0.35)` | 认识按钮按下光晕 |

## 7. Interaction & Motion

### 3D Flip
- Trigger: 点击卡片任意区域
- Duration: 700ms
- Easing: `cubic-bezier(0.34, 1.56, 0.64, 1)`（轻微过冲，增加弹性）
- Transform: `rotateY(180deg)`
- 翻转中按钮可禁用或保持可用（建议保持可用，便于熟练后快速操作）

### Button Press
- Duration: 120ms
- Active transform: `scale(0.98)`
- Active background 变深

### Card Change
- 当点击认识/不认识后，当前卡片向对应方向滑出并淡出，下一张卡片从中心缩放进入。
- Duration: 350ms
- Easing: `cubic-bezier(0.4, 0, 0.2, 1)`

### Completion Celebration
- 星星/彩带微动画（可选 CSS 动画）
- 分数数字从 0 计数到目标值（可选）

## 8. Semantic UI Binding

| Surface | Page ID | Route | Semantic Targets |
|---------|---------|-------|------------------|
| review-page | review-page | pages/Review | review-header-title, review-progress-text, review-progress-ring, review-flashcard, review-flashcard-front, review-flashcard-back, review-word-english, review-word-phonetic, review-word-chinese, review-unknown-button, review-known-button, review-completion-panel, review-completion-score, review-restart-button, review-empty-state, review-empty-message |

### Event Preservation
- `flip-card`: 绑定到 `review-flashcard` 点击事件。
- `mark-unknown`: 绑定到 `review-unknown-button` 点击事件。
- `mark-known`: 绑定到 `review-known-button` 点击事件。
- `restart-review`: 绑定到 `review-restart-button` 点击事件。

### Binding Notes
- `/currentWord/english` 同时绑定到 `review-flashcard-front` 与 `review-word-english`。
- `/currentWord/chinese` 与 `/currentWord/phonetic` 绑定到 `review-flashcard-back` 内的 `review-word-chinese` 与 `review-word-phonetic`。
- `/completion/isVisible` 控制 `review-completion-panel` 的显隐。
- `/empty/isVisible` 控制 `review-empty-state` 的显隐。

## 9. Do's and Don'ts

### Do
- 使用圆润字体、宽松字间距，适合儿童阅读。
- 保持按钮超大、圆角、高对比，方便小手点击。
- 使用柔和阴影与渐变让卡片有「拿在手里」的感觉。
- 在进度环和完成页使用星星黄作为正向反馈。
- 确保所有语义 ID 在 HTML 中以 `data-ui-id` 形式存在，并在 ArkTS 中以 `.id(...)` 形式保留。

### Don't
- 不要使用尖锐的直角或尖锐配色，避免给孩子压力感。
- 不要把「不认识」按钮设计成红色警告感；应使用柔和珊瑚色。
- 不要堆砌装饰性元素，保持页面只有一个视觉焦点（卡片）。
- 不要把按钮做得太小或靠得太近，防止误触。
- 不要省略空状态与完成状态，真实空状态必须处理。

## 10. Responsive Behavior

### Target Viewport
- Mobile: 360-420px 宽度
- Content max-width: 390px，居中

### Scaling
- 卡片宽度随容器 100%，最大 340px
- 英文单词字号在 360px 以下可降至 48px
- 按钮宽度始终为容器宽减去 40px padding，即各占约 47%

### Touch Targets
- 卡片整体可点击，最小 340×425 区域
- 按钮高度 ≥ 56px，水平间距 ≥ 16px

---
*输出：ArkPilot autopilot-html-tmux-design-a2ui-pro / Stage 2 - Visual Design (Step 1)*
