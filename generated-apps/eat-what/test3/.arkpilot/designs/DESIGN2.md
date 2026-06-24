# 今天吃什么 — 视觉设计系统 v1.2（最终版）

## 1. Visual Theme & Atmosphere

最终视觉方向为「一本会转的美食手账」。整体以奶油纸为底，配合一套克制但丰富的「食物色谱」，通过渐变、柔投影、玻璃浮岛和大圆角，让界面既有食欲感又不失高级。关键界面（转盘、结果页、分享卡片）使用深色/彩色主题，形成情绪起伏；日常界面（打卡、食材）保持温暖明亮，便于长时间浏览。

### 设计关键词
食帖手账、奶油纸、食物色谱、柔和高差、玻璃浮岛、圆润饱满、杂志标题字、微动效。

## 2. Semantic UI Binding

完全沿用 DESIGN.md / DESIGN1.md 中的语义协议，无新增、无重命名、无删除：

### Surfaces
| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/HomePage | tab-home |
| pantry | pantry-page | pages/PantryPage | tab-pantry |
| check-in | check-in-page | pages/CheckInPage | tab-check-in |
| profile | profile-page | pages/ProfilePage | tab-profile |
| result | result-page | pages/ResultPage | - |
| check-in-editor | check-in-editor-page | pages/CheckInEditorPage | - |
| share-card | share-card-page | pages/ShareCardPage | - |

### 关键语义目标
- 首页：`home-spin-button`, `home-mood-filter`, `home-time-filter`, `home-wheel-result`, `home-result-detail-button`
- 食材页：`pantry-input`, `pantry-add-button`, `pantry-item-list`, `pantry-recommend-button`, `pantry-result-list`
- 打卡页：`check-in-add-button`, `check-in-list`, `check-in-share-button`, `check-in-delete-button`
- 我的页：`profile-streak-count`, `profile-total-check-ins`
- 结果页：`result-dish-name`, `result-check-in-button`, `result-share-button`, `result-back-button`
- 编辑页：`editor-date-picker`, `editor-meal-picker`, `editor-dish-input`, `editor-mood-picker`, `editor-save-button`
- 分享页：`share-card-preview`, `share-save-button`, `share-system-button`

### 事件名
全部保留：`spin-wheel`, `mood-filter-change`, `time-filter-change`, `go-to-pantry`, `add-pantry-item`, `remove-pantry-item`, `recommend-by-pantry`, `pantry-mood-filter-change`, `open-dish-detail`, `open-check-in-editor`, `save-check-in`, `delete-check-in`, `open-share-card`, `save-share-card`, `system-share-card`, `check-in-from-result`, `share-from-result`, `back-from-result`, `back-from-editor`, `back-from-share`, `open-settings`。

## 3. Color Palette & Roles

### Page Backgrounds
- **Cream** `#FFF8F0`：主页面背景。
- **Cream Dark** `#F3ECE1`：次级背景、输入框、分组标题、日期胶囊。
- **Espresso** `#2E2B28`：深色主题页（结果页、部分分享卡片）。

### Food Spectrum（食物色谱，每种只用于对应语义）
| 名称 | 色值 | 用途 |
|------|------|------|
| Tomato | `#E85D4E` | 主 CTA、转盘指针、心情「放纵」 |
| Avocado | `#7CAE7A` | 健康标签、食材页强调、心情「健康」 |
| Yolk | `#F2B134` | 时间标签、心情「快手」、强调 |
| Caramel | `#C47D4C` | 文本强调、难度标签 |
| Taro | `#A68CC6` | 心情「治愈」、装饰 |
| Mint | `#7DD3C0` | 心情「清爽」、装饰 |
| Berry | `#D67A94` | 心情「解馋」、装饰 |

### Semantic Surfaces
- **Primary Button**: `linear-gradient(180deg, #E85D4E 0%, #D64F42 100%)` + 顶部 1px 高光 `rgba(255,255,255,0.18)` + 阴影 `rgba(232,93,78,0.28) 0 10px 24px`。
- **Secondary Button**: 白底 + 1.5px `#E8DDD1` 边框 + `#2E2B28` 文字。
- **Mood Tag Active**: 浅 10% 食物色背景 + 对应深色文字。
- **Time Chip Active**: Espresso 底 + 白字。
- **Card**: 白底 + 圆角 24px + 阴影 `rgba(46,43,40,0.08) 0 10px 32px`。
- **Glass**: `rgba(255,248,240,0.92)` + `backdrop-filter: blur(24px)`。

### Text
- **Primary** `#2E2B28`
- **Secondary** `#6D6761`
- **Tertiary** `#A9A29B`
- **On Dark** `#FFF8F0`

## 4. Typography

字体栈：`HarmonyOS Sans SC`, `PingFang SC`, `Microsoft YaHei`, sans-serif。

| 角色 | 尺寸 | 字重 | 行高 | 字间距 |
|------|------|------|------|--------|
| Display | 40px | 800 | 1.1 | -0.5px |
| H1 | 26px | 700 | 1.25 | -0.3px |
| H2 | 20px | 600 | 1.3 | -0.2px |
| Body | 16px | 400 | 1.55 | 0 |
| Body Bold | 16px | 600 | 1.55 | 0 |
| Caption | 14px | 400 | 1.45 | 0 |
| Micro | 12px | 500 | 1.35 | 0.2px |

## 5. Components（最终细节）

### Primary Button
- 高度 54px，圆角 18px。
- 渐变背景，白字，16px/600。
- 阴影：`rgba(232, 93, 78, 0.28) 0 10px 24px`。
- Active：scale(0.98)，亮度降低 5%。

### Secondary Button
- 高度 50px，圆角 18px。
- 白底 + 1.5px `#E8DDD1` 边框。
- 文字 `#2E2B28` 16px/500。
- Active：背景 `#F3ECE1`。

### Mood Tag
- 圆角 14px，高度 38px，内边距 0 18px。
- Inactive：白底 + 1px `#E8DDD1` 边框 + `#6D6761` 字。
- Active：浅底（10% 食物色）+ 对应深色字 + 无边框。
- 切换动画：背景色 200ms，scale 点击反馈 0.97。

### Time Chip
- 胶囊形，高度 38px，内边距 0 20px。
- Inactive：白底 + 1px `#E8DDD1`。
- Active：Espresso 底 + 白字 + 微弱内阴影 `inset 0 1px 2px rgba(0,0,0,0.2)`。

### Input
- 背景 `#F3ECE1`，圆角 16px，高度 54px。
- 占位符 `#A9A29B`。
- 聚焦：2px `#E85D4E` 边框 + 4px 光晕 `rgba(232,93,78,0.08)`。

### Card
- 白底，圆角 24px，padding 22px。
- 阴影：`rgba(46,43,40,0.08) 0 10px 32px`。
- 可 hover（桌面预览）时轻微上浮 translateY(-2px)。

### Wheel
- 外径 320px，内径（中心白圆）80px。
- 分 8 个扇形，颜色循环：Tomato、Avocado、Yolk、Caramel、Taro、Mint、Berry、Cream Dark。
- 每个扇形内写菜品名（Micro 白字）。
- 指针：Tomato 倒三角，距顶部 -12px，投影。
- 中心按钮：白底 + Tomato 边框 + 文字「开始」。

### Bottom Tab Bar
- 浮岛玻璃：背景 `rgba(255,248,240,0.94)` + `backdrop-filter: blur(24px)`。
- 顶部圆角 28px，底部安全区。
- 阴影：`rgba(46,43,40,0.08) 0 -6px 24px`。
- 图标 24px，未选中 `#A9A29B`，选中 `#E85D4E`。
- 标签 Micro 500。

### FAB（打卡页）
- 56px 圆形，Tomato 渐变背景。
- 阴影：`rgba(232,93,78,0.3) 0 8px 20px`。
- 加号图标白色。

## 6. Layout

- 基础单位 4px。
- 页面水平内边距 22px。
- 内容最大宽度 390px，居中。
- 卡片间距 18px。
- 首屏 600vp 内：标题（约 100vp）+ 筛选（约 80vp）+ 转盘区（约 360vp）+ 按钮（约 80vp）= 620vp，需控制在 600vp 内，因此标题与筛选需紧凑。

## 7. Elevation

| 层级 | 值 |
|------|-----|
| Card | `rgba(46,43,40,0.08) 0 10px 32px` |
| Primary Button | `rgba(232,93,78,0.28) 0 10px 24px` |
| FAB | `rgba(232,93,78,0.3) 0 8px 20px` |
| Tab Bar | `rgba(46,43,40,0.08) 0 -6px 24px` |
| Wheel Pointer | `rgba(46,43,40,0.15) 0 4px 12px` |

## 8. Page-by-Page Final Visual Notes

### home-page（决策首页）
- Header：左「今天吃什么」H1 + 右日期胶囊（Cream Dark，圆角 12px）。
- 筛选区：心情标签横向滚动（Micro 标签，可换行或滚动）；时间胶囊横向滚动。
- 转盘区：320px 圆形居中，周围留 20px 呼吸空间。
- 结果区：转盘正下方，Display 菜名 + 心情小标签 +「查看详情」文字按钮。
- 操作区：「开始转盘」主按钮 + 「冰箱食材推荐」次按钮。

### pantry-page（冰箱食材）
- 标题 H1 + 副标题 Caption。
- 输入卡：白底卡片，内部输入框 + 圆形添加按钮。
- 食材标签云：每个标签带食物色小圆点 + 删除 X。
- 推荐按钮：全宽主按钮，上方若已推荐则显示结果数。
- 结果列表：菜品卡片，左侧 64px 食物色块（首字或图标），右侧菜名、食材、标签、Caption 推荐语。

### check-in-page（饮食打卡）
- 顶部统计卡：连续打卡天数（Display 数字）+ 总次数（Caption）。
- 列表按日期分组，日期标题 Cream Dark 底圆角 12px，轻微吸顶。
- 记录项：左侧 4px 彩色竖条（按餐别：早餐=Yolk、午餐=Tomato、晚餐=Avocado、夜宵=Caramel），右侧餐别 + 菜名 + 心情标签 + 删除按钮。
- 右下角 FAB 打开补录。

### profile-page（我的）
- 头部：头像占位（72px 圆形，Cream Dark）+ 昵称 H2 + 连续打卡徽章。
- 统计网格：2×2 小卡，白底圆角 20px。
- 设置列表：标准列表项，右侧箭头。

### result-page（结果详情）
- 深色 Hero：Espresso 渐变背景，高度 55% 屏幕，菜名 Display 居中，下方标签胶囊。
- 下滑/中部：白底卡片上拉覆盖，包含食材清单、推荐语、时间/难度。
- 底部固定双按钮区：番茄红「打卡」+ 白底「分享卡片」。

### check-in-editor-page（打卡编辑）
- 顶部：返回按钮 + 标题「记录这一餐」。
- 表单：日期选择器（卡片）、餐别横向选择器（胶囊）、菜品输入、心情标签选择、备注多行输入（高度 100px）。
- 底部：保存按钮固定在键盘上方或底部。

### share-card-page（分享卡片）
- 卡片预览：宽度 330px，圆角 28px，背景根据心情色渐变（如「放纵」= Tomato 渐变，「健康」= Avocado 渐变，「治愈」= Taro 渐变，默认 Espresso 渐变）。
- 卡片内容：
  - 顶部日期徽标（白底胶囊）
  - 中央菜名 Display
  - 心情标签
  - 推荐语 Caption
  - 底部装饰：细线 + 小 Logo 文案「今天吃什么」
- 底部双按钮：保存图片、系统分享。

## 9. Do's and Don'ts

### Do
- 使用奶油纸底色 + 食物色谱点缀。
- 主按钮使用渐变 + 投影。
- 转盘使用多种食物色分区。
- 卡片使用大圆角（20-24px）和柔和阴影。
- 底部 Tab 使用浮岛玻璃拟态。
- 为每个心情标签分配独立浅色背景。
- 结果页和分享卡片使用深色/彩色主题制造情绪高潮。

### Don't
- 不要使用单一蓝/灰科技风。
- 不要让组件无圆角、无阴影（简陋）。
- 不要使用 emoji 或 pictographic Unicode 作为图标。
- 不要让 Tab 在侧边或全宽铺满。
- 不要首屏内容超过 600vp 可见高度。
- 不要在食物色谱外引入突兀的荧光色。
