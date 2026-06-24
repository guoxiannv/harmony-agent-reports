# 小词卡 - Design Alignment Plan

## 1. Visual Inputs

- **Semantic UI Protocol**: `.arkpilot/designs/ui-tree.json`
- **Final Design Artifact**: `.arkpilot/designs/DESIGN1.md`
- **HTML Artifact**: `.arkpilot/designs/page-review-page.html`
- **Route-worthy Page List**:
  - `review-page` → `pages/ReviewPage` → `.arkpilot/designs/page-review-page.html`

## 2. Semantic UI Binding

### Surface / Page
| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| review | review-page | pages/ReviewPage | — |

### Action / Input Targets
| Semantic ID | Event | Visual Control |
|-------------|-------|----------------|
| `review-flip-card` | `flip-card` | 中央可点击 3D 翻转卡片 |
| `review-known-button` | `mark-known` | 左侧珊瑚橙大按钮，带白色对勾 SVG |
| `review-unknown-button` | `mark-unknown` | 右侧海蓝绿大按钮，带白色循环 SVG |
| `review-restart-button` | `restart-round` | 完成面板内黑色“再来一轮”按钮 |
| `review-empty-load-button` | `load-words` | 空状态幽灵按钮“加载单词” |

### Assertion / State Targets
| Semantic ID | Binding | Visual Representation |
|-------------|---------|------------------------|
| `review-app-title` | `/app/title` | 顶部左侧“小词卡”标题 |
| `review-progress-text` | `/review/progress` | 顶部右侧“剩余 X / Y”文案 |
| `review-word-front` | `/review/currentWord/word` | 卡片正面英文单词 |
| `review-phonetic-back` | `/review/currentWord/phonetic` | 卡片背面音标 |
| `review-meaning-back` | `/review/currentWord/meaning` | 卡片背面中文释义 |
| `review-known-count` | `/review/knownCount` | 底部统计“已认识”数字 |
| `review-remaining-count` | `/review/remainingCount` | 底部统计“剩余”数字 |
| `review-completion-panel` | `/review/isComplete` | 完成面板显示条件 |
| `review-final-known-count` | `/review/finalKnownCount` | 完成面板“已认识”数字 |
| `review-final-review-count` | `/review/finalReviewCount` | 完成面板“待复习”数字 |
| `review-empty-state` | `/review/empty` | 空状态显示条件 |
| `review-card-stack` | `/review/cards` | 卡片容器，可承载 itemIdPattern `review-card-{index}` |

## 3. Visual Requirements

### Color Tokens
- Page background: `#FFF8F0`
- Card / panel white: `#FFFFFF`
- Charcoal text: `#2D2D2D`
- Dim grey text: `#6B6B6B`
- Light grey: `#A1A1A1`
- Coral (known / success): `#FF8C61`; pressed `#E87A52`
- Teal (unknown / review): `#3FB8AF`; pressed `#35A098`
- Soft yellow (decoration): `#FFD166`
- Card back tint: `#F7F9FC`
- Progress track: `#EBE4DC`

### Shadows
- Card default: `0 12px 40px rgba(45,45,45,0.08)`
- Card flipping: `0 20px 50px rgba(45,45,45,0.12)`
- Known button: `0 4px 14px rgba(255,140,97,0.38)`
- Unknown button: `0 4px 14px rgba(63,184,175,0.32)`
- Summary card: `0 6px 20px rgba(45,45,45,0.06)`

### Typography
- App title: 22px / 700
- Word front: 52px / 800
- Meaning back: 34px / 700
- Phonetic back: 22px / 400
- Button label: 18px / 700
- Summary number: 28px / 800
- Summary label: 13px / 500
- Empty title: 24px / 700
- Completion title: 26px / 800

### Spacing
- Page horizontal padding: 24px
- Max content width: 420px
- Card max-width: 342px; aspect ratio ~ 342 / 384
- Card to action bar gap: 36px
- Action buttons gap: 16px
- Action bar to summary gap: 28px
- Button height: 58px; border-radius 16px
- Card border-radius: 28px
- Summary card border-radius: 16px

### 3D Flip Animation
- `transform-style: preserve-3d`
- Duration: 400ms
- Easing: `cubic-bezier(0.34, 1.56, 0.64, 1)`
- Flipped transform: `rotateY(180deg) translateY(-8px)`
- Front/back both `backface-visibility: hidden`
- Shadow deepens during flip

### Header
- Sticky top with glass effect: `rgba(255,248,240,0.88)` + `saturate(160%) blur(14px)`
- Height 56px; progress bar 4px below

## 4. Per-Page Polish Notes

### Review Page
- 单页面应用，所有状态在 `review-page` 内条件渲染。
- 默认状态：显示 Header、卡片、双按钮、统计摘要。
- 翻转状态：点击卡片触发 3D 翻转；背面显示音标与释义。
- 完成状态：隐藏卡片与按钮，显示完成面板 + 再来一轮按钮。
- 空状态：隐藏卡片与按钮，显示空状态插画 + 加载单词按钮。
- 按钮按下需有 `scale(0.97)` + inset shadow 反馈。
- 进度条随剩余数量变化，使用珊瑚橙填充。

## 5. HTML-to-ArkUI Visual Mapping

| HTML Element / Class | Suggested ArkUI Equivalent |
|----------------------|---------------------------|
| `.app-root` | `Column` 容器，设置 `width('100%')`、`maxWidth(420)`、`alignItems(HorizontalAlign.Center)` |
| `.header` | `Row` + 背景色/模糊；`progress-bar` 可用 `Row` 内嵌 `Row` + `borderRadius` |
| `.card-scene` | `Stack` 或 `Column` 配合 `rotateY` 动画；使用 `animation` 驱动翻转 |
| `.flip-card` | `Stack` 包含两个 `Column`（front/back），通过 `rotateY` + `backfaceVisibility` 实现 |
| `.card-front` / `.card-back` | `Column` + `justifyContent(FlexAlign.Center)` + `alignItems(HorizontalAlign.Center)` |
| `.btn-known` / `.btn-unknown` | `Button` 组件，设置背景、阴影、圆角、点击态 |
| `.summary-bar` | `Row` + 两个 `Column` 卡片 |
| `.completion-panel` | 条件渲染的 `Column` 卡片 |
| `.empty-state` | 条件渲染的 `Column` + SVG 图标 |

## 6. Non-Negotiable Constraints

1. **不得修改语义 ID**：`review-app-title`、`review-flip-card`、`review-known-button` 等所有 `data-ui-id` 必须原样映射到 ArkTS `.id(...)`。
2. **不得修改事件名**：`flip-card`、`mark-known`、`mark-unknown`、`restart-round`、`load-words` 必须保留。
3. **不得修改路由/页面 ID**：`pages/ReviewPage` / `review-page` 保持不变。
4. **目标设备约束**：内容区最大宽度 420vp，禁止全宽铺满；Header + 卡片顶部需在 600vp 内可见。
5. **3D 翻转动画时长 400ms**，使用弹性缓动，翻转时卡片轻微上浮并加深阴影。
6. **“不认识”按钮不得使用红色/警告色**，应使用海蓝绿表达“再复习”的平和语义。
7. **SVG 图标必须包含语义化 title**：所有 inline SVG 需保留可访问标题，对应业务动作。
8. **HTML 是最终视觉参考**：ArkTS 实现需复现颜色、圆角、阴影、间距、字体层级与动画质感。
9. **不要添加 spec 之外的功能入口**：如设置页、个人中心、发音按钮等不在本阶段范围内。
10. **首运行空状态必须真实**：默认无单词时展示空状态，不预置默认种子数据。
