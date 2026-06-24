# 宠迹 · PawLog — 视觉设计系统

> 以“薄荷绿 + 肉垫粉”为基调，圆润治愈、轻盈有序。适合在 1272×2756 手机屏幕上长时间使用，信息密度适中，重要操作一眼可触。

## 1. 视觉主题与氛围

### 整体感觉

像阳光照进早晨的客厅：干净、柔和、有生命感。薄荷绿带来清爽与信任，肉垫粉增添温暖与亲昵。圆角、柔和阴影、轻量渐变和毛玻璃质感共同构成“治愈但不幼稚”的界面气质。

### 设计关键词

- 圆润（Rounded）：大圆角卡片、胶囊按钮、圆形头像与图标容器
- 治愈（Healing）：低饱和配色、柔和渐变、充足的留白、舒缓的动画预期
- 清晰（Clear）：信息分层明确，关键数据突出，空状态友好引导
- 可触（Tactile）：底部 Tab + 中央悬浮按钮，单手操作友好

## 2. 色彩系统

### 主色

| Token | 色值 | 用途 |
|-------|------|------|
| `--paw-mint-50` | `#F0FDF9` | 页面背景、轻量卡片背景 |
| `--paw-mint-100` | `#CCFBEF` | 选中态背景、标签背景 |
| `--paw-mint-300` | `#5EEAD4` | 辅助装饰、图标描边、轻量强调 |
| `--paw-mint-500` | `#14B8A6` | 主按钮、主要行动色、进度、开关 |
| `--paw-mint-700` | `#0F766E` | 主按钮按下态、深色文字 |

### 辅色（肉垫粉）

| Token | 色值 | 用途 |
|-------|------|------|
| `--paw-paw-50` | `#FFF1F2` | 粉色卡片背景、提醒标签背景 |
| `--paw-paw-100` | `#FFE4E6` | 悬浮按钮光晕、选中芯片背景 |
| `--paw-paw-300` | `#FDA4AF` | 装饰圆点、强调图标 |
| `--paw-paw-500` | `#FB7185` | 情感化强调、特殊提醒、头像边框 |
| `--paw-paw-700` | `#BE123C` | 错误/逾期状态文字 |

### 中性色

| Token | 色值 | 用途 |
|-------|------|------|
| `--paw-white` | `#FFFFFF` | 卡片、按钮文字 |
| `--paw-gray-50` | `#F8FAFC` | 次级背景 |
| `--paw-gray-100` | `#F1F5F9` | 输入框背景、分隔 |
| `--paw-gray-300` | `#CBD5E1` | 占位符、禁用态 |
| `--paw-gray-500` | `#64748B` | 次级文字、图标 |
| `--paw-gray-700` | `#334155` | 正文文字 |
| `--paw-gray-900` | `#0F172A` | 标题文字 |

### 功能色

| Token | 色值 | 用途 |
|-------|------|------|
| `--paw-success` | `#10B981` | 正常/已完成状态 |
| `--paw-warning` | `#F59E0B` | 即将到期 |
| `--paw-danger` | `#EF4444` | 逾期/删除 |
| `--paw-info` | `#3B82F6` | 提示/链接 |

### 渐变

- 主卡片渐变：`linear-gradient(135deg, #FFFFFF 0%, #F0FDF9 100%)`
- 强调卡片渐变：`linear-gradient(135deg, #FFF1F2 0%, #F0FDF9 100%)`
- 悬浮按钮渐变：`linear-gradient(135deg, #14B8A6 0%, #FB7185 100%)`
- 图表区域渐变：`linear-gradient(180deg, rgba(20,184,166,0.20) 0%, rgba(20,184,166,0) 100%)`

## 3. 字体与排版

### 字体栈

- 中文优先：`"PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif`
- 数字与英文：`"SF Pro Display", "SF Pro Text", "Helvetica Neue", Arial, sans-serif`

### 层级

| 角色 | 字号 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| 页面大标题 | 28px | 700 | 1.2 | 首页“早安”标题 |
| 卡片标题 | 20px | 700 | 1.3 | 卡片内标题 |
| 区块标题 | 18px | 600 | 1.35 | 各模块标题 |
| 正文 | 16px | 400 | 1.5 | 常规文本 |
| 辅助文字 | 14px | 400 | 1.45 | 描述、时间 |
| 小标签 | 12px | 500 | 1.3 | 标签、状态 |
| 数据大字 | 32px | 700 | 1.1 | 体重、数量 |

## 4. 组件样式

### 按钮

**主按钮（薄荷绿）**
- 背景：`#14B8A6`
- 文字：`#FFFFFF`
- 高度：48px
- 圆角：24px（胶囊）
- 字体：16px / weight 600
- 阴影：`0 8px 20px rgba(20,184,166,0.25)`
- 按下：背景 `#0F766E`，scale 0.98

**次按钮（白色描边）**
- 背景：`#FFFFFF`
- 边框：1px solid `#E2E8F0`
- 文字：`#334155`
- 高度：44px
- 圆角：22px

**危险按钮**
- 背景：`#FFF1F2`
- 文字：`#BE123C`
- 高度：44px
- 圆角：22px

**悬浮按钮（中央 Tab）**
- 尺寸：56px 圆形
- 背景渐变：`linear-gradient(135deg, #14B8A6 0%, #FB7185 100%)`
- 图标：白色，加粗描边
- 阴影：`0 8px 24px rgba(20,184,166,0.35)`
- 按下：scale 0.92

### 卡片

- 背景：`#FFFFFF`
- 圆角：20px
- 内边距：16px
- 阴影：`0 4px 20px rgba(15,23,42,0.06)`
- 强调卡片：渐变背景 + 1px `rgba(20,184,166,0.08)` 边框

### 输入框

- 背景：`#F8FAFC`
- 圆角：12px
- 高度：48px
- 内边距：0 16px
- 边框：1px solid transparent，focus 时 `#14B8A6`
- 占位符：`#94A3B8`

### 选择器/开关

- 开关开启：`#14B8A6`
- 开关关闭：`#CBD5E1`
- 选择器胶囊：未选中 `#F1F5F9` / 选中 `#14B8A6` 背景 + 白色文字

### 头像

- 宠物头像：56px 圆形，2px `#FB7185` 边框
- 用户头像：40px 圆形
- 空头像：以首字母 + 渐变背景展示

### Tab Bar

- 背景：白色 + `backdrop-filter: blur(20px)` + 上边框 0.5px `rgba(0,0,0,0.05)`
- 高度：64px + 安全区
- 图标：24px，未选中 `#94A3B8`，选中 `#14B8A6`
- 中央悬浮按钮向上凸起 12px
- 宽度与 body 一致，max-width 390px 居中

### 空状态

- 中央插画：130px 圆形浅色背景 + 动物爪印/脚印 SVG
- 标题：18px / weight 600 / `#334155`
- 描述：14px / `#64748B`
- 操作按钮：主按钮样式

## 5. 布局原则

### 容器

- 内容区 max-width：390px（min 360px，max 420px）
- 水平内边距：20px
- 页面顶部与状态栏间距：24px
- 模块间距：20px

### 间距系统

- 基础单位：4px
- 常用阶梯：4, 8, 12, 16, 20, 24, 32, 40, 48

### 首屏约束

- Header + 宠物切换器 + 今日待办卡片必须位于顶部 600vp 内
- 下方内容可滚动

### 响应策略

- 非折叠/非平板普通手机，固定 390px 内容宽度居中
- 底部 Tab 禁止侧边放置
- 图片与图表宽度 100%，高度自适应

## 6. 深度与质感

- 卡片：`0 4px 20px rgba(15,23,42,0.06)`
- 悬浮按钮：`0 8px 24px rgba(20,184,166,0.35)`
- 主按钮：`0 8px 20px rgba(20,184,166,0.25)`
- Tab Bar：`0 -4px 20px rgba(15,23,42,0.04)`
- 毛玻璃：Tab Bar、顶部导航使用 `backdrop-filter: blur(20px)`

## 7. 页面视觉概述

### 首页（今日）

- 顶部：薄荷绿渐变 Header，左侧“早安，铲屎官”大标题 + 日期，右侧用户头像
- 宠物切换器：横向滚动头像 chips，当前选中带粉色边框与阴影
- 今日待办卡片：白底圆角卡片，列出今日提醒，逾期红色、即将到期橙色、正常绿色
- 一键记录快捷区：2×2 圆角大按钮（饮食/排泄/体重/用药），带图标与文字
- 最近记录：时间线条目，显示类型图标、宠物、内容、时间
- 底部 Tab + 中央悬浮添加按钮

### 记录页

- 顶部筛选栏：宠物选择器、类型选择器（全部/饮食/排泄/体重/用药）、时间范围
- 记录列表：时间线样式，左侧彩色圆点/图标，右侧内容卡片
- 空状态：爪印插画 + “还没有记录”

### 趋势页

- 顶部宠物切换 + 指标胶囊（体重/饮食/排泄/用药）
- 周期切换：周 / 月
- 主图表区：折线图或柱状图，带渐变填充
- 洞察卡片：一句话总结 + 关键数据

### 我的页

- 顶部用户信息卡片（渐变背景）
- 功能入口列表：宠物档案、提醒管理、病历归档、家庭成员、设置
- 入口左侧圆形图标，右侧箭头

### 宠物档案列表

- 网格/列表展示宠物卡片：头像、名字、品种、年龄、最近体重
- 右下角悬浮添加按钮

### 宠物详情页

- 顶部大头像 + 名字 + 基础信息标签
- 体重/年龄/绝育状态摘要卡片
- 提醒与病历快捷入口
- 最近记录时间线

### 提醒管理页

- 状态筛选：全部/即将到期/已逾期/已完成
- 提醒条目：宠物头像、标题、到期日、状态标签、开关
- 悬浮添加按钮

### 病历归档页

- 宠物筛选
- 病历卡片：医院、日期、诊断摘要、图片缩略图网格
- 悬浮添加按钮

### 家庭成员页

- 家庭组名称卡片
- 成员列表：头像、昵称、角色标签
- 邀请按钮

### Sheet 弹窗

- 底部抽屉，圆角 24px 顶部
- 顶部 drag handle
- 表单字段垂直排列
- 底部固定保存按钮 + 删除按钮（编辑时）

## 8. 图标与意象

- 主图标意象：爪印、宠物碗、药丸、体重秤、日历、医院、家庭、趋势图
- 所有图标使用 SVG，带业务语义 title
- 不使用 emoji 或象形 Unicode

## 9. Semantic UI Binding

### 页面/表面与路由

| pageId | route | tabId | 名称 |
|--------|-------|-------|------|
| home-page | pages/Home | tab-home | 今日 |
| records-page | pages/Records | tab-records | 记录 |
| charts-page | pages/Charts | tab-charts | 趋势 |
| profile-page | pages/Profile | tab-profile | 我的 |
| pets-page | pages/Pets | — | 宠物档案 |
| pet-detail-page | pages/PetDetail | — | 宠物详情 |
| reminders-page | pages/Reminders | — | 提醒管理 |
| medical-page | pages/Medical | — | 病历归档 |
| family-page | pages/Family | — | 家庭成员 |
| record-editor-sheet | sheet/RecordEditor | — | 记录编辑 |
| pet-editor-sheet | sheet/PetEditor | — | 宠物编辑 |
| reminder-editor-sheet | sheet/ReminderEditor | — | 提醒编辑 |
| medical-editor-sheet | sheet/MedicalEditor | — | 病历编辑 |
| family-invite-sheet | sheet/FamilyInvite | — | 邀请成员 |

### 关键语义目标与事件

- 首页：`home-pet-switcher`（`select-pet`）、`home-quick-record-*`（`open-record-editor` 带 type）、`home-fab-add`（`open-record-editor`）
- 记录页：`records-filter-*`、`records-list`、`records-add-button`
- 趋势页：`charts-metric-tabs`、`charts-period-week/month`、`charts-canvas`
- 我的页：`profile-pets-row`、`profile-reminders-row`、`profile-medical-row`、`profile-family-row`
- 宠物列表：`pets-list`、`pets-add-button`
- 宠物详情：`pet-detail-edit`、`pet-detail-reminder-list`、`pet-detail-medical-list`
- 提醒页：`reminders-list`、`reminders-item-{id}-toggle`、`reminders-add-button`
- 病历页：`medical-list`、`medical-card-{id}-images`、`medical-add-button`
- 家庭页：`family-member-list`、`family-invite-button`
- Sheet：`record-editor-save/delete`、`pet-editor-save/delete`、`reminder-editor-save/delete`、`medical-editor-save/delete`、`family-invite-copy/share`

### 发现缺口

- 无新缺口；所有语义目标均可在视觉层级中找到对应容器。

## 10. Do's and Don'ts

### Do
- 使用圆润大圆角与柔和阴影营造治愈感
- 保持薄荷绿为主、肉垫粉为情感强调
- 关键数据使用大字号 + 重色突出
- 空状态必须带插画与明确操作
- 所有图标使用 SVG 并加 title

### Don't
- 不要使用锐利直角或厚重边框
- 不要使用超过三种主色
- 不要把 Tab 放到侧边
- 不要在首屏 600vp 外隐藏关键入口
- 不要使用 emoji 作为 UI 图标
