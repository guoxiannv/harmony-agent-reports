# WordFlip Kids 视觉设计系统（评审优化版）

## 1. Visual Theme & Atmosphere

WordFlip Kids 采用「口袋里的彩色学习卡片盒」这一概念。整体视觉围绕「纸质卡片 + 彩色标记 + 柔和光影」展开，营造专注但不沉闷的儿童学习氛围。

- **背景**：多层微妙色温变化的奶油/浅米色，避免纯白页面的冰冷感。
- **卡片**：纯白圆角卡片，带有手写贴纸感的彩色顶部标签条，正面像一张干净的索引卡，背面像一张写好注释的学习卡。
- **色彩**：采用和谐的蓝绿主色 + 暖橙辅助色 + 淡紫点缀，避免单一渐变显得单调。
- **质感**：卡片使用柔和的弥散阴影 + 轻微内发光边缘；按钮使用彩色渐变 + 同色系弥散阴影，提升高级感。
- **氛围关键词**：温暖、轻快、专注、可掌控。

## 2. Color Palette & Roles

### Backgrounds
- **Page Base** `#F7F3EE`：主背景，带一点暖黄调的纸张色。
- **Page Gradient Overlay** `radial-gradient(circle at 50% 0%, rgba(255,255,255,0.8) 0%, rgba(247,243,238,0) 60%)`：顶部自然高光。
- **Card Surface** `#FFFFFF`：卡片正面与背面。
- **Card Inner Edge** `inset 0 0 0 1px rgba(255,255,255,0.8)`：卡片边缘提亮。
- **Glass Header** `rgba(255,255,255,0.78)` + `backdrop-filter: blur(20px)`：顶部玻璃质感。
- **Modal Backdrop** `rgba(45, 42, 38, 0.48)`：完成弹窗遮罩。

### Primary Accent（和谐多彩，不简单单调）
- **Teal** `#14B8A6`：主品牌色，用于标题装饰、进度条。
- **Sky** `#38BDF8`：辅助蓝，与 Teal 形成清新对比。
- **Lavender** `#A78BFA`：小面积点缀，用于空状态图标背景、完成徽章高光。
- **Gradient Primary** `linear-gradient(135deg, #14B8A6 0%, #38BDF8 60%, #A78BFA 100%)`：用于完成徽章、顶部装饰线、强调按钮。

### Semantic Actions
- **Known Gradient** `linear-gradient(135deg, #34D399 0%, #14B8A6 100%)`：认识按钮，从薄荷绿到青绿。
- **Unknown Gradient** `linear-gradient(135deg, #FDBA74 0%, #FB923C 100%)`：不认识按钮，从蜜桃橙到暖橙。
- **Known Active** `#0D9488`
- **Unknown Active** `#EA580C`

### Text
- **Heading** `#1E293B`：深 slate 蓝灰，比纯黑更柔和。
- **Meaning** `#0F172A`：中文释义，最重的颜色。
- **Body** `#475569`：说明文字、音标。
- **Muted** `#94A3B8`：统计标签、占位。
- **On Gradient** `#FFFFFF`：覆盖渐变上的文字。

### Decorative Tones
- **Sticker Teal** `#CCFBF1`：卡片顶部标签条底色。
- **Sticker Orange** `#FFEDD5`：不认识按钮按下后提示条底色。
- **Completion Mint** `#D1FAE5`：完成弹窗背景氛围色。

## 3. Typography Rules

### Font Family
- **Primary**: `Nunito`, `PingFang SC`, `HarmonyOS Sans SC`, `sans-serif`。
- **Phonetic**: `Inter`, `SF Mono`, `monospace` fallback。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| Page Title | Nunito | 30px | 800 | 1.15 | -0.6px |
| Progress Number | Nunito | 24px | 800 | 1.0 | -0.5px |
| Progress Label | Nunito | 11px | 700 | 1.3 | 0.4px |
| Flashcard Word | Nunito | 52px | 800 | 1.08 | -1.2px |
| Flashcard Meaning | PingFang SC / Nunito | 34px | 700 | 1.35 | 0px |
| Flashcard Phonetic | Inter | 20px | 500 | 1.45 | 0.6px |
| Button Text | Nunito | 17px | 800 | 1.0 | 0.3px |
| Empty Title | Nunito | 22px | 800 | 1.3 | -0.3px |
| Empty Body | Nunito | 15px | 600 | 1.55 | 0px |
| Completion Title | Nunito | 30px | 800 | 1.15 | -0.6px |
| Completion Number | Nunito | 60px | 800 | 1.0 | -1.2px |

## 4. Component Stylings

### 3D Flashcard（增强质感）
- 尺寸：宽 `min(330px, 80vw)`，高 `440px`。
- 圆角：`28px`。
- 正面：
  - 背景 `#FFFFFF`。
  - 顶部 8px 高装饰条：`linear-gradient(90deg, #14B8A6, #38BDF8)`。
  - 右上角一个 32px 圆形小贴纸，颜色 `#E0F2FE`，内有旋转箭头 SVG，暗示可翻转。
- 背面：
  - 背景 `#FFFFFF`。
  - 顶部同装饰条。
  - 背面上半区为释义区，下半区为音标区，中间以 1px `#F1F5F9` 分隔线区分。
- 阴影：
  - 常态：`0 24px 60px rgba(30, 41, 59, 0.09), 0 10px 24px rgba(30, 41, 59, 0.05)`。
  - 翻转/按压：`0 32px 80px rgba(30, 41, 59, 0.12), 0 14px 32px rgba(30, 41, 59, 0.07)`。
- 内发光：`box-shadow` 叠加 `inset 0 0 0 1px rgba(255,255,255,0.9)`。
- 透视：`perspective: 1400px`。
- 翻转动画：`rotateY(180deg)`，550ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`。

### Buttons（带弥散阴影）

**Known Button**
- 背景：`linear-gradient(135deg, #34D399 0%, #14B8A6 100%)`。
- 文字：白色，17px，weight 800，letter-spacing 0.3px。
- 圆角：20px，高度 60px。
- 阴影：`0 10px 28px rgba(20, 184, 166, 0.35)`。
- 按下：scale(0.96)，阴影收缩到 `0 6px 16px rgba(20, 184, 166, 0.28)`。

**Unknown Button**
- 背景：`linear-gradient(135deg, #FDBA74 0%, #FB923C 100%)`。
- 文字：白色，17px，weight 800。
- 圆角：20px，高度 60px。
- 阴影：`0 10px 28px rgba(251, 146, 60, 0.35)`。
- 按下：scale(0.96)。

### Progress Header（毛玻璃）
- 宽度跟随 390px 内容区，水平居中。
- 背景：`rgba(255,255,255,0.78)` + `backdrop-filter: saturate(150%) blur(20px)`。
- 边框：`1px solid rgba(255,255,255,0.7)`。
- 圆角：22px。
- 内边距：18px 22px。
- 左侧标题旁加一个 8px 圆点，颜色 `#14B8A6`，表示学习中。
- 右侧两个统计卡片，各自白底、圆角 14px、轻微阴影，数字在上、标签在下。

### Completion Overlay（多彩庆祝）
- 遮罩：`rgba(45, 42, 38, 0.48)` + `backdrop-filter: blur(4px)`。
- 弹窗：白底，圆角 32px，宽度 `min(330px, 82vw)`。
- 顶部徽章：80px 直径，Gradient Primary，内嵌白色对勾 SVG。
- 徽章背后：一个淡淡的彩色光晕 `0 16px 40px rgba(167, 139, 250, 0.35)`。
- 标题「太棒了！」下方显示「答对单词」统计，大号数字 + 标签。
- 底部「再学一次」按钮使用 Gradient Primary。

### Empty State
- 图标背景：120px 直径淡紫圆 `#EDE9FE`，内有一个打开的书本 SVG，书本封面用 `#A78BFA`。
- 标题下方一行小字，颜色 muted。

## 5. Layout Principles

### Spacing
- 基础 4px；常用 8, 12, 16, 20, 24, 28, 32, 40, 48, 64。
- Header 到卡片：32px。
- 卡片到按钮组：32px。
- 按钮间距：16px。

### Container
- 内容 max-width 390px，居中。
- 水平 padding 20px。
- 首屏 Header + 卡片顶部在 600vp 内可见。

## 6. Depth & Elevation

| Level | Treatment |
|-------|-----------|
| Page | 暖米色 + 顶部径向高光 |
| Header | 毛玻璃 + 内阴影 |
| Card | 弥散双阴影 + 内发光边缘 |
| Buttons | 彩色弥散阴影 |
| Overlay | 半透明遮罩 + 大圆角白卡 + 光晕 |

## 7. Motion & Interaction

- **3D 翻转**：550ms，ease-out-back，轻微过冲。
- **按钮按下**：scale 0.96，150ms。
- **卡片切换**：当前卡片向右侧滑出 + 淡出，下一张从右侧滑入 + 淡入，320ms。
- **进度数字**：计数变化时 scale 弹跳 1.0 → 1.18 → 1.0，220ms。
- **完成弹窗**：遮罩 fade 200ms；弹窗 scale 0.88 → 1 + opacity，380ms，ease-out-back。

## 8. Semantic UI Binding

与 `ui-tree.json` 一致，无变更：

- `review-title` → 页面标题
- `review-remaining-count` / `review-correct-count` → 进度统计
- `review-flashcard` → 3D 卡片，事件 `toggle-flip`
- `review-word-front` / `review-word-back-meaning` / `review-word-back-phonetic` → 正反面内容
- `review-known-button` → 事件 `mark-known`
- `review-unknown-button` → 事件 `mark-unknown`
- `review-empty-state` → 空状态
- `review-completion-overlay` / `review-restart-button` → 完成覆盖层，事件 `restart-review`

## 9. Do's and Don'ts

### Do
- 使用温暖的米白背景和多彩渐变点缀。
- 卡片要有真实厚度感：弥散阴影 + 内发光。
- 按钮使用渐变 + 同色系阴影，显得高级。
- 不认识按钮用暖橙色，避免挫败红。
- 利用小贴纸、圆点、光晕等儿童友好但不幼稚的细节。

### Don't
- 不要全宽拉伸；保持 390px 内容区居中。
- 不要使用侧栏或底部 Tab。
- 不要使用单一平面色块填充按钮，显得简陋。
- 不要让卡片没有阴影或圆角过小。
- 不要过早展示答案（背面默认不可见）。
