# 设计对齐计划：小小单词卡

## 1. 视觉输入

- **语义 UI 协议**：`.arkpilot/designs/ui-tree.json`
- **最终视觉设计**：`.arkpilot/designs/DESIGN1.md`
- **HTML 设计稿**：`.arkpilot/designs/page-review.html`
- **产品规格**：`.arkpilot/autopilot/spec.md`

### 路由页面清单

| 页面 ID | HTML 文件 | 路由 | 说明 |
|---------|-----------|------|------|
| review-page | `page-review.html` | `pages/Review` | 唯一核心页面：翻卡复习 |

---

## 2. 语义 UI 绑定

### Surface / 页面

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| review-page | review-page | pages/Review | 无（单页应用） |

### 必须保留的语义 ID（ArkTS `.id(...)`）

| 语义 ID | 角色 | 对应 ArkUI 元素建议 | 事件 / 绑定 |
|---------|------|---------------------|-------------|
| `review-header-title` | assertion | `Text` 页面标题 | `/pageTitle` |
| `review-progress-text` | assertion | `Text` 进度环中心或标题旁 | `/progress/currentAndTotal` |
| `review-progress-ring` | assertion | 自定义环形进度组件 | `/progress/percent` |
| `review-flashcard` | action | 可点击的卡片容器 | `flip-card` |
| `review-flashcard-front` | assertion | 卡片正面容器 | `/currentWord/english` |
| `review-flashcard-back` | assertion | 卡片背面容器 | `/currentWord/chinese`, `/currentWord/phonetic` |
| `review-word-english` | assertion | 正面英文单词 `Text` | `/currentWord/english` |
| `review-word-phonetic` | assertion | 背面音标 `Text` | `/currentWord/phonetic` |
| `review-word-chinese` | assertion | 背面中文释义 `Text` | `/currentWord/chinese` |
| `review-unknown-button` | action | 「不认识」按钮 | `mark-unknown` |
| `review-known-button` | action | 「认识」按钮 | `mark-known` |
| `review-completion-panel` | assertion | 完成状态容器 | `/completion/isVisible` |
| `review-completion-score` | assertion | 完成页分数 `Text` | `/completion/correctAndTotal` |
| `review-restart-button` | action | 「再学一次」按钮 | `restart-review` |
| `review-empty-state` | assertion | 空状态容器 | `/empty/isVisible` |
| `review-empty-message` | assertion | 空状态主文案 `Text` | `/empty/message` |

### 事件名（必须原样保留）

- `flip-card`：点击卡片触发 3D 翻转。
- `mark-unknown`：点击「不认识」，当前单词移到队列底部。
- `mark-known`：点击「认识」，当前单词移除，正确数 +1。
- `restart-review`：点击「再学一次」，重新加载当前阶段单词队列。

### 重复项策略

- 本页面无列表型重复项。卡片内容随队列变化，但卡片本身只有一个实例，通过绑定切换内容。

### 空 / 完成状态 ID

- 空状态：`review-empty-state`（容器）、`review-empty-message`（文案）
- 完成状态：`review-completion-panel`（容器）、`review-completion-score`（分数）、`review-restart-button`（再学一次）

---

## 3. 视觉要求

### 颜色 Token

| Token | 色值 | 用途 |
|-------|------|------|
| `--bg-cream` | `#FFFBF2` | 页面主背景 |
| `--card-front-start` | `#FFFFFF` | 卡片正面渐变起点 |
| `--card-front-end` | `#F9F7F2` | 卡片正面渐变终点 |
| `--card-back-start` | `#FFF9ED` | 卡片背面渐变起点 |
| `--card-back-end` | `#F5F0E4` | 卡片背面渐变终点 |
| `--mint` | `#5EE68C` | 认识按钮、再学一次按钮 |
| `--mint-pressed` | `#3CCB72` | 认识按钮按下态 |
| `--peach` | `#FF8E9A` | 不认识按钮 |
| `--peach-pressed` | `#E86B7A` | 不认识按钮按下态 |
| `--star` | `#FFD93D` | 进度环、星星、成就 |
| `--star-dark` | `#F5C116` | 进度环渐变末端 |
| `--ink` | `#2D2A26` | 主标题、英文单词、正文 |
| `--warm-gray` | `#7A746B` | 音标、副文案 |
| `--empty-icon` | `#D6CFC2` | 空状态图标 |
| `--progress-track` | `#EDE8DD` | 进度环轨道 |

### 间距与布局

- 内容区最大宽度：390px，水平居中，padding 24px。
- Header 距顶部 24px，卡片距 header 28px，按钮组距卡片 32px。
- 所有首屏关键内容（header + 卡片）必须在 600vp 内可见。
- 按钮并排 gap 16px，高度 60px，border-radius 20px。

### 字体

- 英文单词：Nunito / Varela Round，64px，weight 800。
- 中文释义：PingFang SC，34px，weight 700。
- 音标：Nunito，20px，weight 500，颜色 `--warm-gray`。
- 按钮文字：PingFang SC，18px，weight 700。
- 完成页分数：Nunito，80px，weight 800。

### 卡片

- 最大宽度 340px，aspect-ratio 4:5（建议高度 425px），border-radius 32px。
- 正面：linear-gradient(180deg, #FFFFFF, #F9F7F2)。
- 背面：linear-gradient(180deg, #FFF9ED, #F5F0E4)。
- 阴影：`0px 16px 48px rgba(45, 42, 38, 0.10)`。
- 边框：`1px solid rgba(47, 43, 35, 0.06)`。
- 四个圆角淡黄色装饰圆点（装饰性，无需语义 ID）。

### 3D 翻转

- 外层 `perspective: 1200px`。
- 内层 `transform-style: preserve-3d`，transition 700ms，easing `cubic-bezier(0.34, 1.56, 0.64, 1)`。
- 正面 `backface-visibility: hidden`。
- 背面 `transform: rotateY(180deg)` + `backface-visibility: hidden`。
- 点击 `review-flashcard` 切换 `rotateY(180deg)`。

### 进度环

- 56px × 56px，stroke 6px，round linecap。
- 轨道 `#EDE8DD`，填充使用 `#FFD93D → #F5C116` 渐变。
- 中心显示 `current/total`（如 3/10）。

### 按钮状态

- 默认：带彩色光晕阴影。
- 按下：scale 0.97，背景变深。
- 触控区域：整个按钮高度 60px，水平 flex:1，满足 ≥44vp。

### 完成页

- 全屏替换视图（非弹窗）。
- 星星图标 64px，颜色 `--star`，上下浮动动画。
- 分数 `correct/total`，Nunito 80px。
- 「再学一次」按钮 220×56，Mint Green。

### 空状态

- 居中偏上。
- 书本 SVG 图标 80px，颜色 `--empty-icon`。
- 主文案「还没有要复习的单词哦」，副文案「去添加一些单词再来吧」。

---

## 4. HTML → ArkUI 映射说明

| HTML 区域 | ArkUI 实现建议 | 备注 |
|-----------|----------------|------|
| `.app-root` | `Column` 容器，宽度 100%，max-width 390vp，居中 | 限制内容宽度 |
| `.header` | `Row` + `Column` + 自定义进度环组件 | 标题左，进度环右 |
| `.flashcard-scene` | `Stack` 或 `Column` 嵌套，设置 `rotate` / `animation` | 需要 ArkUI 动画实现 3D 翻转 |
| `.flashcard` | 容器绑定 `flip-card` 点击事件，内部两个 `Stack` 分别作为正背面 | 背面初始 `rotateY(180deg)` |
| `.card-face-front/back` | `Stack` 或 `Column`，渐变背景，圆角 32vp | 保留 `review-flashcard-front/back` ID |
| `.word-english` | `Text` 组件 | ID: `review-word-english` |
| `.word-chinese` | `Text` 组件 | ID: `review-word-chinese` |
| `.word-phonetic` | `Text` 组件 | ID: `review-word-phontic` |
| `.action-bar` | `Row` 两个 `Button` | gap 16vp |
| `.known-btn` | `Button`，背景 `#5EE68C`，点击事件 `mark-known` | ID: `review-known-button` |
| `.unknown-btn` | `Button`，背景 `#FF8E9A`，点击事件 `mark-unknown` | ID: `review-unknown-button` |
| `.empty-state` | 条件渲染 `Column` | ID: `review-empty-state` |
| `.completion-panel` | 条件渲染 `Column` | ID: `review-completion-panel` |
| `.restart-btn` | `Button`，事件 `restart-review` | ID: `review-restart-button` |

### ArkUI 3D 翻转实现提示

- ArkUI 中没有原生 `preserve-3d`，可用 `rotateY` + 两个面分别控制显隐实现近似效果。
- 方案 A：正面 `rotateY(0)`，背面 `rotateY(180)`，翻转时同时旋转容器并切换透明度。
- 方案 B：使用 `animation` 控制 `rotateY` 0 → 180，背面初始 `rotateY(180)` 并在动画过半时切换 `visibility`。
- 推荐结合 `Animator` 或 `animateTo` 实现，确保动画时长 700ms，easing 接近 `cubic-bezier(0.34, 1.56, 0.64, 1)`。

---

## 5. 不可协商约束

1. **不得修改语义 ID、页面 ID、路由、事件名**。所有 `data-ui-id` 必须在 ArkTS 中以 `.id(...)` 原样保留。
2. **HTML 设计稿是最终视觉参考**。颜色、圆角、阴影、间距、字体尺寸优先按 HTML/DESIGN1.md 实现。
3. **ui-tree.json 是语义协议，不是布局树**。实现时可以根据 ArkUI 最佳实践重新组织容器，只要语义目标稳定。
4. **单页面应用**：不要添加底部 Tab、抽屉导航或多页面路由。
5. **真实空状态**：数据源为空时显示 `review-empty-state`，不能把 HTML 示例数据作为默认种子数据。
6. **不添加规格外功能**：不实现登录、发音、历史记录、错题本、艾宾浩斯算法、自定义录入等。
7. **触控目标**：卡片与按钮触控区域不得小于 44vp × 44vp。
8. **设备适配**：内容区 max-width 390-420vp 居中，禁止 PC 浏览器全宽拉伸。

---

## 6. 实现检查清单

- [ ] `review-page` 作为入口页面，路由 `pages/Review`。
- [ ] 启动时从数据源加载当前阶段单词队列。
- [ ] 卡片正面只显示英文，背面显示中文释义 + 音标。
- [ ] 点击卡片触发 3D 翻转动画。
- [ ] 「认识」按钮移除当前单词并正确数 +1。
- [ ] 「不认识」按钮将当前单词移到队列底部。
- [ ] 队列为空时显示完成页，展示正确数/总数与「再学一次」。
- [ ] 数据源为空时显示空状态。
- [ ] 所有语义 ID 绑定正确，事件名不变。
- [ ] 构建通过，无 ArkTS 语法错误。

---
*输出：ArkPilot autopilot-html-tmux-design-a2ui-pro / Stage 4 - Design Alignment Plan*
