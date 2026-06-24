# Design Alignment Plan: WordFlip Kids

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN2.md`
- **Intermediate Design Artifacts**: `.arkpilot/designs/DESIGN.md`, `.arkpilot/designs/DESIGN1.md`
- **HTML Design Artifact**: `.arkpilot/designs/page-review-page.html`
- **Route-worthy Pages**: `review-page` (唯一页面，路由 `pages/Review`)

## 2. Semantic UI Binding

### Surface / Page Map

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| review | review-page | pages/Review | — |

### Action / Input Targets

| Semantic ID | ArkTS `.id(...)` | Event | Notes |
|-------------|------------------|-------|-------|
| `review-flashcard` | `review-flashcard` | `toggle-flip` | 卡片整体可点击，触发 3D 翻转动画 |
| `review-known-button` | `review-known-button` | `mark-known` | 绿色渐变按钮，将当前卡片移出队列，correctCount +1 |
| `review-unknown-button` | `review-unknown-button` | `mark-unknown` | 橙色渐变按钮，将当前卡片移到队列底部 |
| `review-restart-button` | `review-restart-button` | `restart-review` | 完成弹窗内按钮，重新加载当前阶段队列 |

### Assertion / State Targets

| Semantic ID | ArkTS `.id(...)` | Binding Path | Notes |
|-------------|------------------|--------------|-------|
| `review-title` | `review-title` | `pageTitle` | 页面标题「今日复习」 |
| `review-remaining-count` | `review-remaining-count` | `remainingCount` | 本轮剩余卡片数 |
| `review-correct-count` | `review-correct-count` | `correctCount` | 本轮已答对数 |
| `review-word-front` | `review-word-front` | `currentWord.english` | 卡片正面英文单词 |
| `review-word-back-meaning` | `review-word-back-meaning` | `currentWord.meaning` | 卡片背面中文释义 |
| `review-word-back-phonetic` | `review-word-back-phonetic` | `currentWord.phonetic` | 卡片背面音标 |
| `review-empty-state` | `review-empty-state` | `isQueueEmpty` | 无单词时显示的视图 |
| `review-completion-overlay` | `review-completion-overlay` | `isComplete` | 完成复习后覆盖弹窗 |

### Repeated Item Strategy

- 本应用为单卡片堆叠视图，无列表型重复项，因此不需要 `itemIdPattern`。
- 当前单词切换时，应保留 `review-flashcard` 容器不变，仅更新内部文本并控制翻转状态。

## 3. Visual Requirements

### Page Background
- 主背景色 `#F5F0EA`（暖米色）。
- 顶部叠加径向光晕：`radial-gradient(ellipse 120% 60% at 50% 0%, rgba(255,255,255,0.85) 0%, rgba(245,240,234,0) 60%)`。

### Header
- 毛玻璃胶囊：背景 `rgba(255,255,255,0.82)`，边框 `1px solid rgba(255,255,255,0.7)`，`backdrop-filter: saturate(160%) blur(24px)`。
- 圆角 22px，内边距 18px 22px。
- 左侧标题「今日复习」旁带 8px 青绿状态点 `#0D9488`。
- 右侧两个统计小卡片：白底、14px 圆角、轻微阴影；数字 24px weight 800，标签 11px weight 700 muted 色。

### 3D Flashcard
- 尺寸：宽 `min(330px, 80vw)`，高 440px，圆角 28px。
- 正面：白底、顶部 8px 渐变线 `#0D9488 → #0EA5E9`、右上角 32px 浅蓝翻转提示贴纸。
- 背面：白底、顶部渐变线、释义区在上、音标区在下、中间 1px `#F1F5F9` 分隔线。
- 阴影：`0 24px 60px rgba(30,41,59,0.09), 0 10px 24px rgba(30,41,59,0.05)` + 内发光 `inset 0 0 0 1px rgba(255,255,255,0.85)`。
- 透视 1400px，翻转动画 550ms，`cubic-bezier(0.34, 1.56, 0.64, 1)`。
- 字体：正面英文 54px weight 800；背面释义 34px weight 700；音标 20px weight 500。

### Action Buttons
- 横向双按钮，高度 60px，圆角 20px，间距 16px。
- 认识：`linear-gradient(135deg, #22C55E, #0D9488)`，阴影 `0 10px 28px rgba(13,148,136,0.35)`。
- 不认识：`linear-gradient(135deg, #FB923C, #F97316)`，阴影 `0 10px 28px rgba(249,115,22,0.35)`。
- 按钮文字白色，17px，weight 800，左侧带对应 SVG 图标。
- 按下 scale 0.96，150ms。

### Empty State
- 120px 淡紫圆 `#EDE9FE` 图标背景，打开的书本 SVG。
- 标题 22px weight 800，正文 15px weight 600 muted。

### Completion Overlay
- 遮罩：`rgba(40,36,32,0.50)` + `backdrop-filter: blur(5px)`。
- 弹窗：白底，32px 圆角，宽度 `min(330px, 82vw)`，居中。
- 顶部 80px 三色渐变徽章 + 紫色光晕，内嵌对勾 SVG。
- 标题「太棒了！」30px weight 800。
- 答对数字 60px weight 800，使用渐变文字效果。
- 「再学一次」按钮使用 Gradient Primary，带紫色弥散阴影。

## 4. HTML-to-ArkUI Mapping Notes

| HTML 区域 | ArkUI 实现建议 |
|-----------|----------------|
| `.app-root`（max-width 390px 居中） | `Column` 包裹，设置 `width('100%')` + `maxWidth(390)` + `alignSelf(ItemAlign.Center)` |
| `.header-glass` | `Stack` 或 `Row` + `backgroundColor('rgba(...)')` + `backdropBlur(24)` |
| `.flashcard` + `.card-face` | 使用 `Stack` + `rotateY` + `animation` + `backfaceVisibility`；或 ArkUI 的 `rotate` + `opacity` 方案 |
| `.card-top-line` | 顶部 `Row` 设置渐变背景 |
| `.action-bar` | `Row` 包裹两个 `Button`，`layoutWeight(1)` 均分 |
| `.empty-state` | 条件渲染 `if (isQueueEmpty)` |
| `.completion-overlay` | 条件渲染 `if (isComplete)`，使用 `Stack` 全屏遮罩 + 居中弹窗 |
| 卡片切换动效 | 在「认识 / 不认识」后，可短暂用 `translateX` + `opacity` 切换当前卡片内容 |

## 5. Non-Negotiable Constraints

1. **禁止修改语义 ID**：`review-flashcard`、`review-known-button`、`review-unknown-button`、`review-restart-button` 等 ID 以及事件名 `toggle-flip`、`mark-known`、`mark-unknown`、`restart-review` 必须原样保留。
2. **禁止修改页面/路由**：页面 ID `review-page`，路由 `pages/Review`。
3. **禁止默认填充演示数据**：HTML 中的示例单词仅用于视觉展示，实现阶段首次运行应为空或从真实单词库加载。
4. **目标设备约束**：
   - 内容区 max-width 390px 居中，禁止全宽铺满。
   - 无底部 Tab、无侧栏导航。
   - 首屏 Header + 卡片顶部必须在 600vp 内可见。
5. **必须实现的行为**：
   - 点击卡片触发 3D 翻转，展示背面释义与音标。
   - 点击「认识」：当前单词移出队列，correctCount +1，队列为空则显示完成弹窗。
   - 点击「不认识」：当前单词移至队列底部。
   - 完成弹窗点击「再学一次」重新加载当前阶段队列。
6. **SVG 语义标准**：HTML 中所有内联 `<svg>` 均包含业务语义 `<title>`；ArkTS 实现阶段若使用 SVG 组件，也请保留语义化的 `fill`/`accessibilityText`。

## 6. Open Questions / Change Requests

- 无。设计阶段未发现语义 ID 冲突或缺失。
- 实现阶段可自行决定本地单词库持久化方案（Preferences、AppStorage、或本地 JSON），但不应改变复习队列调度逻辑。
