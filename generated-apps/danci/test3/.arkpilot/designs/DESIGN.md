# WordFlip Kids 视觉设计系统

## 1. Visual Theme & Atmosphere

WordFlip Kids 的视觉气质是「轻盈、友好、专注」。我们不追求 Apple 官网那种冷峻的产品感，而是为 6-12 岁儿童创造一个低压力、有游戏感的数字学习卡片盒。

整体基调：
- 背景使用柔和、不刺眼的米白色 / 浅奶油色，营造纸质卡片和桌面台灯的温暖氛围。
- 卡片本身为干净的白色，带有柔和的弥散阴影，像一叠放在桌面上的实体单词卡。
- 主要强调色使用一组活泼但不吵闹的蓝绿渐变（Seafoam → Sky），象征成长与清新。
- 「认识」按钮使用积极的渐变绿；「不认识」按钮使用柔和的暖橙，避免红色带来的挫败感。
- 圆角 generous（卡片 24px、按钮 18px），减少锋利感，符合儿童应用的安全感。
- 字体使用现代无衬线，标题干净有力，正文宽松易读。

## 2. Color Palette & Roles

### Backgrounds
- **Page Background** `#FAF8F5`：主页面底色，温暖米白，类似护眼纸张。
- **Card Background** `#FFFFFF`：单词卡片正面与背面底色。
- **Glass Surface** `rgba(255, 255, 255, 0.72)`：顶部进度栏半透明白色玻璃。
- **Overlay Backdrop** `rgba(29, 29, 31, 0.45)`：完成弹窗遮罩。

### Primary Accent
- **Accent Gradient** `linear-gradient(135deg, #34D399 0%, #38BDF8 100%)`：顶部标题装饰、完成状态图标、进度条填充、主要高亮。
- **Accent Start** `#34D399` (Seafoam Green)
- **Accent End** `#38BDF8` (Sky Blue)

### Semantic Actions
- **Known Gradient** `linear-gradient(135deg, #34D399 0%, #10B981 100%)`：「认识」按钮，积极确认。
- **Unknown Gradient** `linear-gradient(135deg, #FBBF24 0%, #F59E0B 100%)`：「不认识」按钮，温暖提示再复习。
- **Known Hover/Active** `#059669`
- **Unknown Hover/Active** `#D97706`

### Text
- **Heading** `#1D1D1F`：页面标题、单词正面英文。
- **Body** `#4B5563`：音标、说明文字。
- **Meaning** `#1F2937`：中文释义，比正文稍重。
- **Muted** `#9CA3AF`：占位符、次要统计标签。
- **On Gradient** `#FFFFFF`：按钮文字、覆盖在渐变上的文字。

### Surfaces & States
- **Card Shadow** `0 20px 50px rgba(0, 0, 0, 0.10), 0 8px 20px rgba(0, 0, 0, 0.06)`：让卡片悬浮于背景之上。
- **Card Shadow Hover/Active** `0 30px 70px rgba(0, 0, 0, 0.12), 0 12px 30px rgba(0, 0, 0, 0.08)`：翻转或按压时轻微加深。
- **Empty State Illustration Background** `#E0F2FE`：空状态图标背后的柔和色块。
- **Completion Confetti Background** `#ECFDF5`：完成弹窗内的成功氛围色。

## 3. Typography Rules

### Font Family
- **Primary**: `Nunito`, `PingFang SC`, `HarmonyOS Sans SC`, `sans-serif` — 圆润友好，适合儿童阅读。
- **Phonetic**: `Inter`, `Helvetica Neue`, `Arial`, `sans-serif` — 音标需要清晰的几何感。

### Hierarchy

| Role | Font | Size | Weight | Line Height | Letter Spacing |
|------|------|------|--------|-------------|----------------|
| Page Title | Nunito | 28px | 800 | 1.2 | -0.5px |
| Progress Number | Nunito | 22px | 800 | 1.0 | -0.5px |
| Progress Label | Nunito | 12px | 600 | 1.3 | 0.2px |
| Flashcard Word (front) | Nunito | 48px | 800 | 1.1 | -1px |
| Flashcard Meaning (back) | PingFang SC / Nunito | 32px | 700 | 1.3 | 0px |
| Flashcard Phonetic | Inter | 20px | 500 | 1.4 | 0.5px |
| Button Text | Nunito | 17px | 700 | 1.0 | 0.2px |
| Empty Title | Nunito | 22px | 700 | 1.3 | -0.3px |
| Empty Body | Nunito | 15px | 500 | 1.5 | 0px |
| Completion Title | Nunito | 28px | 800 | 1.2 | -0.5px |
| Completion Number | Nunito | 56px | 800 | 1.0 | -1px |

## 4. Component Stylings

### 3D Flashcard
- 尺寸：宽度 `min(320px, 78vw)`，高度 `420px`。
- 圆角：`24px`。
- 背景：正面 `#FFFFFF`，背面 `#FFFFFF`。
- 正面装饰：顶部一条 6px 高渐变条 `linear-gradient(90deg, #34D399, #38BDF8)`。
- 背面装饰：顶部同渐变条，下方划分释义区与音标区。
- 阴影：`0 20px 50px rgba(0,0,0,0.10), 0 8px 20px rgba(0,0,0,0.06)`。
- 透视：容器 `perspective: 1200px`。
- 翻转：`transform: rotateY(180deg)`，动画 `cubic-bezier(0.34, 1.56, 0.64, 1)`，时长 500ms。背面默认 `backface-visibility: hidden; transform: rotateY(180deg)`。
- 点击区域：整张卡片均可点击触发翻转。

### Buttons

**Known Button (认识)**
- 背景：`linear-gradient(135deg, #34D399 0%, #10B981 100%)`。
- 文字：白色，17px，weight 700。
- 圆角：18px。
- 高度：56px。
- 阴影：`0 8px 20px rgba(52, 211, 153, 0.35)`。
- 按下：scale(0.97)，阴影变浅。

**Unknown Button (不认识)**
- 背景：`linear-gradient(135deg, #FBBF24 0%, #F59E0B 100%)`。
- 文字：白色，17px，weight 700。
- 圆角：18px。
- 高度：56px。
- 阴影：`0 8px 20px rgba(251, 191, 36, 0.35)`。
- 按下：scale(0.97)。

### Progress Header
- 固定于内容区顶部（非全宽），宽度跟随 `max-width: 390px` 内容容器。
- 背景：`rgba(255,255,255,0.72)` + `backdrop-filter: blur(16px)` + `border: 1px solid rgba(255,255,255,0.6)`。
- 圆角：20px。
- 内边距：16px 20px。
- 内部：左侧页面标题；右侧两个统计块（剩余 / 答对），块内上方为数字，下方为标签。

### Completion Overlay
- 全屏遮罩：`rgba(29,29,31,0.45)`。
- 弹窗：白色背景，圆角 28px，宽度 `min(320px, 80vw)`，内边距 32px。
- 顶部：一个 80px 直径的渐变圆徽章，内有对勾 SVG。
- 标题：「太棒了！」
- 统计：大号数字显示本轮答对数 + 标签「答对单词」。
- 按钮：「再学一次」使用主渐变背景，白色文字。

### Empty State
- 居中。
- 图标：一个 120px 直径的柔和蓝圆，内有打开的书本 SVG。
- 标题：「还没有可复习的单词哦」
- 说明：「先去学习新单词，再来这里复习吧～」

## 5. Layout Principles

### Spacing System
- 基础单位 4px。
- 常用尺寸：4, 8, 12, 16, 20, 24, 32, 40, 48, 64。
- 卡片到按钮距离：24px。
- 按钮组内部间距：16px。

### Container
- 内容最大宽度：390px，居中。
- 页面水平内边距：20px。
- 首屏关键内容（Header + 卡片顶部）保证在 600vp 内可见。

### Vertical Rhythm
- Header 距顶部安全区 20px。
- Header 与卡片之间 28px。
- 卡片与按钮组之间 28px。
- 按钮组距底部安全区 ≥24px。

## 6. Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Page | `#FAF8F5` 纯色背景 | 整个页面 |
| Header Glass | 半透明 + 模糊 | 进度栏悬浮感 |
| Card | 双层柔和阴影 | 核心视觉焦点 |
| Buttons | 彩色弥散阴影 | 行动召唤 |
| Overlay | 半透明遮罩 + 高圆角白卡 | 完成状态 |

## 7. Motion & Interaction

- **卡片 3D 翻转**：`rotateY(180deg)`，500ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`（轻微过冲，增加弹性趣味）。
- **按钮按下**：scale 0.97，150ms ease-out。
- **卡片切换**：当认识/不认识后，当前卡片以 translateX + opacity 滑出，下一张从右侧滑入，300ms。
- **进度数字变化**：计数变化时轻微 scale 弹跳（1.0 → 1.15 → 1.0），200ms。
- **完成弹窗出现**：遮罩 fade-in 200ms，弹窗 scale(0.9) → scale(1.0) + opacity，350ms，ease-out-back。

## 8. Semantic UI Binding

### Surfaces / Pages
| Surface ID | Page ID | Route | Tab ID | Notes |
|------------|---------|-------|--------|-------|
| review | review-page | pages/Review | — | 唯一主页面 |

### Action Targets
| Semantic ID | Visual Control | Event |
|-------------|----------------|-------|
| `review-flashcard` | 3D 翻转卡片 | `toggle-flip` |
| `review-known-button` | 绿色「认识」按钮 | `mark-known` |
| `review-unknown-button` | 橙色「不认识」按钮 | `mark-unknown` |
| `review-restart-button` | 完成弹窗内「再学一次」按钮 | `restart-review` |

### Assertion / State Targets
| Semantic ID | Binding / Visual |
|-------------|------------------|
| `review-title` | 页面标题「今日复习」 |
| `review-remaining-count` | 剩余卡片数 |
| `review-correct-count` | 已答对数 |
| `review-word-front` | 卡片正面英文单词 |
| `review-word-back-meaning` | 卡片背面中文释义 |
| `review-word-back-phonetic` | 卡片背面音标 |
| `review-empty-state` | 空状态视图 |
| `review-completion-overlay` | 完成覆盖层 |

### Binding Paths
| Path | Type | 说明 |
|------|------|------|
| `pageTitle` | string | 页面标题 |
| `remainingCount` | number | 剩余卡片数 |
| `correctCount` | number | 已答对数 |
| `currentWord.english` | string | 英文单词 |
| `currentWord.meaning` | string | 中文释义 |
| `currentWord.phonetic` | string | 音标 |
| `isQueueEmpty` | boolean | 是否无单词 |
| `isComplete` | boolean | 是否完成 |

### Gaps / Change Requests
- 无。所有语义目标均已在视觉设计中找到对应视觉控件。

## 9. Responsive Notes

- 内容区最大宽度 390px，PC 浏览器上居中显示，两侧留空白。
- 卡片宽度使用 `min(320px, 78vw)`，保证在 360px 小屏手机上仍有合适边距。
- 按钮组保持横向双按钮布局；若宽度低于 340px，按钮文字可略微缩小至 15px。
- 顶部进度栏宽度与 body 内容区一致，使用 `max-width: 390px; margin: 0 auto; left: 0; right: 0;` 约束。

## 10. Do's and Don'ts

### Do
- 使用温暖米白背景，避免纯白刺眼。
- 使用渐变强调色，让儿童界面活泼但不花哨。
- 给卡片 generous 圆角和柔和阴影。
- 让「不认识」按钮用暖橙色而非红色，降低挫败感。
- 保证 3D 翻转动画流畅、有弹性。

### Don't
- 不要使用全宽拉伸布局。
- 不要使用侧栏导航或底部 Tab（本应用为单页流程）。
- 不要让按钮/文字过于细小，影响儿童点击。
- 不要引入额外的装饰性动画分散注意力。
- 不要在完成前展示正确答案干扰自我评估。
