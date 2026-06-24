# PawLog 宠迹 · 视觉设计系统 v1

## 1. 视觉主题 & 氛围

PawLog 的视觉氛围是“春日午后宠物 Clinic 的候诊区”——明亮、柔和、让人放松。我们使用薄荷绿作为主导色，象征清新与健康；肉垫粉作为情感辅色，为记录和提醒增添温暖。整体界面采用圆润无棱角的造型语言，所有交互元素都像是可以轻轻按下的软垫，降低宠物健康管理的焦虑感。

为了摆脱普通 AI 生成 App 的模板感，我们在配色上做了更细腻的处理：并非简单纯色块，而是使用同色系渐变、半透明叠加、毛玻璃（frosted glass）与柔和投影制造空间层次。每个卡片都像是从背景中轻轻浮起的一块小瓷片，细腻而不浮夸。

**关键词**：薄荷绿、肉垫粉、圆润、治愈、毛玻璃、轻拟物、渐变、宠物友好。

## 2. 色彩体系

### 2.1 主色（Mint 薄荷绿系）
| 名称 | 色值 | 用途 |
|------|------|------|
| Mint 500 | `#5DD9C1` | 品牌主按钮、Tab 激活态、核心图标 |
| Mint 600 | `#3CB5A0` | 按下状态、强调文字、图表主线 |
| Mint 100 | `#E6FAF6` | 浅色衬底、选中态背景、输入框聚焦光晕 |
| Mint 50 | `#F2FDFB` | 页面淡色区块背景 |
| Gradient Mint Start | `#89E9D6` | 主按钮/英雄卡片渐变起点 |
| Gradient Mint End | `#46C4AD` | 主按钮/英雄卡片渐变终点 |

### 2.2 辅色（Paw Pink 肉垫粉系）
| 名称 | 色值 | 用途 |
|------|------|------|
| Pink 400 | `#FFB8C9` | 高亮标签、饮食/关爱图标、空状态插画 |
| Pink 500 | `#F28DA6` | 删除/柔和警告、驱虫提醒胶囊 |
| Pink 100 | `#FFF0F3` | 浅粉卡片背景、选中态、体重卡片 |
| Gradient Pink Start | `#FFD6E0` | 情感卡片渐变起点 |
| Gradient Pink End | `#FF9EB3` | 情感卡片渐变终点 |

### 2.3 中性色
| 名称 | 色值 | 用途 |
|------|------|------|
| Ink 900 | `#1F2937` | 主标题、深色正文 |
| Ink 700 | `#4B5563` | 次要文字、图标默认态 |
| Ink 500 | `#9CA3AF` | 占位符、禁用态、分割线 |
| Ink 100 | `#F3F4F6` | 页面背景、列表背景、输入框底色 |
| White | `#FFFFFF` | 卡片、按钮文字、浮层 |

### 2.4 功能色（丰富但不杂乱）
| 名称 | 色值 | 用途 |
|------|------|------|
| Sun 400 | `#FFD166` | 待办提醒、疫苗标签、排泄计数 |
| Sun 100 | `#FFF8E6` | 提醒卡片背景 |
| Sky 300 | `#A8DADC` | 用药记录标签、饮水图表 |
| Sky 100 | `#EDF7F7` | 用药相关卡片背景 |
| Lilac 300 | `#CAB8F0` | 家庭成员头像、体重图表第二色 |
| Lilac 100 | `#F3EEFC` | 成员卡片背景 |
| Coral 400 | `#FF9F8E` | 就医/病历标签、紧急提醒 |
| Coral 100 | `#FFF0ED` | 病历卡片背景 |

### 2.5 渐变规范
- **主按钮**：`linear-gradient(135deg, #89E9D6 0%, #46C4AD 100%)`
  - 阴影：`0 14px 28px rgba(70,196,173,0.30)`
- **情感/饮食卡片**：`linear-gradient(135deg, #FFD6E0 0%, #FF9EB3 100%)`
  - 阴影：`0 12px 24px rgba(242,141,166,0.22)`
- **顶部英雄区**：`linear-gradient(180deg, #E6FAF6 0%, #F3F4F6 100%)`
- **图表面积填充**：对应指标色从 35% 透明度渐变到 0%
- **毛玻璃浮层**：`linear-gradient(180deg, rgba(255,255,255,0.88) 0%, rgba(255,255,255,0.72) 100%)`

### 2.6 毛玻璃（Glassmorphism）
用于：底部 TabBar、顶部 Header、弹窗 Header、Sheet 顶部。
- 背景：`rgba(255,255,255,0.78)`
- `backdrop-filter: blur(22px) saturate(160%)`
- 边框：`1px solid rgba(255,255,255,0.62)`
- 投影：`0 4px 12px rgba(31,41,55,0.04)`

## 3. 字体系统

### 3.1 字体家族
- 中文：`"PingFang SC", "Microsoft YaHei", sans-serif`
- 英文/数字：`"SF Pro Display", "SF Pro Text", -apple-system, BlinkMacSystemFont, sans-serif`
- 等宽数字（图表/体重）：`"SF Mono", "SF Pro Display", monospace`

### 3.2 字号层级

| 角色 | 大小 | 字重 | 行高 | 字间距 | 用途 |
|------|------|------|------|--------|------|
| Hero Greeting | 30px | 700 | 1.16 | -0.6px | 首页“早安，豆豆” |
| Section Title | 22px | 700 | 1.22 | -0.4px | 页面主标题、卡片组标题 |
| Card Title | 18px | 700 | 1.26 | -0.2px | 卡片内标题 |
| Body | 15px | 400 | 1.5 | 0 | 列表项正文、说明 |
| Body Strong | 15px | 600 | 1.5 | 0 | 用户名、宠物名、数值 |
| Caption | 13px | 400 | 1.42 | 0 | 时间、地点、辅助信息 |
| Tiny | 11px | 600 | 1.32 | 0.3px | 胶囊标签、徽章、Tab 文字 |
| Big Number | 40px | 700 | 1.08 | -1.2px | 体重、待办数量、记录数 |
| Chart Label | 12px | 500 | 1.3 | 0 | 图表坐标轴 |

## 4. 组件样式

### 4.1 主按钮（Primary Button）
- 背景：薄荷渐变
- 文字：白色，15px，weight 700
- 高度：54px
- 圆角：27px（全药丸）
- 内边距：0 28px
- 阴影：`0 14px 28px rgba(70,196,173,0.30)`
- 按下：scale 0.97，亮度降低 6%，阴影收缩

### 4.2 次级按钮（Secondary Button）
- 背景：`#E6FAF6`
- 文字：`#3CB5A0`，15px，weight 600
- 高度：46px
- 圆角：23px
- 按下：背景 `#CEF2EC`

### 4.3 幽灵按钮（Ghost Button）
- 背景：透明
- 边框：`1.5px solid #E5E7EB`
- 文字：`#4B5563`，14px，weight 600
- 圆角：20px
- 按下：背景 `#F9FAFB`

### 4.4 图标按钮（Icon Button）
- 尺寸：44px × 44px
- 背景：白色
- 圆角：14px
- 图标颜色：`#4B5563`
- 阴影：`0 4px 12px rgba(31,41,55,0.06)`
- 按下：背景 `#F3F4F6`

### 4.5 卡片（Card）
- 背景：白色
- 圆角：22px
- 内边距：18-20px
- 阴影：`0 10px 28px rgba(31,41,55,0.07)`
- 按下：阴影加深至 `0 14px 36px rgba(31,41,55,0.11)`
- 推荐添加 1px 顶部高光边框：`1px solid rgba(255,255,255,0.7)`

### 4.6 输入框（Input）
- 背景：`#F3F4F6`
- 圆角：16px
- 高度：50px
- 内边距：0 18px
- 占位符：`#9CA3AF`
- 聚焦：边框 `2px solid #5DD9C1`，背景变白，外部光晕 `0 0 0 4px #E6FAF6`

### 4.7 头像
- 宠物头像：60px 圆形，白色 3px 边框，阴影 `0 6px 16px rgba(31,41,55,0.1)`
- 用户头像：44px 圆形
- 成员头像：44px 圆形，备用背景按角色：管理员薄荷、成员薰衣草、待激活灰

### 4.8 徽章/标签（Chip）
| 类型 | 背景 | 文字 |
|------|------|------|
| 饮食 | `#E6FAF6` | `#3CB5A0` |
| 排泄 | `#FFF8E6` | `#D4A015` |
| 体重 | `#F3EEFC` | `#8B6ACB` |
| 用药 | `#EDF7F7` | `#4A9B9E` |
| 疫苗 | `#FFF8E6` | `#C98A0A` |
| 驱虫 | `#FFF0F3` | `#D96680` |
| 就医 | `#FFF0ED` | `#D96C5A` |

- 圆角：10px
- 内边距：5px 11px
- 字号：11px，weight 600

### 4.9 图表卡片（Chart Card）
- 背景：白色
- 圆角：22px
- 迷你图高度：110px
- 折线宽度：3px，端点圆角
- 面积填充：指标色从 35% 到 0% 的垂直渐变
- 数据点：6px 圆形，白色 2px 边框

### 4.10 底部 TabBar
- 背景：毛玻璃白色
- 高度：72px（含底部安全区）
- 图标：24px
- 激活色：`#5DD9C1`
- 未激活色：`#9CA3AF`
- 文字：11px，weight 600
- 中央悬浮“+”按钮：56px，薄荷渐变，白色加号，阴影 `0 12px 32px rgba(70,196,173,0.35)`，向上凸出 16px

### 4.11 时间轴记录项
- 左侧：时间胶囊（12px，背景 `#F3F4F6`，圆角 8px）
- 中间：渐变色彩节点（14px 圆形，按类型着色，白色边框）
- 右侧：内容卡片（白色，圆角 18px，阴影）
- 节点之间用 2px 浅色竖线连接

### 4.12 弹窗 / Sheet
- Sheet：圆角 28px 顶部，白色背景，头部带拖动指示条
- Dialog：圆角 24px，白色背景，内边距 24px
- 背景遮罩：`rgba(31,41,55,0.45)`，带模糊

## 5. 布局原则

### 5.1 容器
- 内容最大宽度：**390px**，居中
- 页面水平内边距：20px
- 卡片间距：16px
- 大区块间距：28px
- 列表项间距：12px

### 5.2 首屏约束
- 首页：Header（80px）+ 问候卡片（120px）+ 快捷记录入口（140px）+ 今日提醒预览（约 100px）必须在 600vp 内可见。
- 其余内容通过滚动展开。

### 5.3 圆角体系
| 级别 | 数值 | 用途 |
|------|------|------|
| xs | 10px | 标签、徽章 |
| sm | 14px | 图标按钮、输入框 |
| md | 18px | 列表项、小卡片 |
| lg | 22px | 主卡片、Sheet |
| pill | 999px | 主按钮、时间胶囊 |
| full | 50% | 头像、FAB |

### 5.4 阴影体系
| 级别 | 数值 | 用途 |
|------|------|------|
| card | `0 10px 28px rgba(31,41,55,0.07)` | 普通卡片 |
| elevated | `0 14px 36px rgba(31,41,55,0.12)` | 按下/悬浮卡片 |
| fab | `0 12px 32px rgba(70,196,173,0.35)` | 中央悬浮按钮 |
| button | `0 14px 28px rgba(70,196,173,0.30)` | 主按钮 |
| avatar | `0 6px 16px rgba(31,41,55,0.1)` | 宠物头像 |

## 6. 动效与交互

- 页面进入：向上位移 10px + opacity 0→1，250ms，cubic-bezier(0.25, 0.46, 0.45, 0.94)
- 按钮按下：scale 0.97，100ms，ease-out
- 卡片按下：阴影由 card 变 elevated，120ms
- 列表项进入：stagger 40ms，opacity 0→1 + translateY 12px→0
- 图表加载：路径 stroke-dashoffset 动画 700ms，面积 opacity 0→1 500ms
- Tab 切换：图标 scale 弹跳 0.9→1.05→1，180ms
- Sheet 弹出：从底部 translateY 100%→0，300ms，带遮罩淡入

## 7. 图标与插图

- 线性图标，描边 2px，圆角端点，视觉重量一致。
- 优先使用本地 SVG；若无合适资源，可内联简洁 SVG。
- 所有内联 SVG 首元素必须是 `<title>`，描述该图标在当前 UI 中的业务语义，例如“添加新的饮食记录”。
- 不使用 emoji 作为图标。
- 空状态插画：柔和的宠物剪影 + 肉垫粉/薄荷渐变圆形背景，配一行温和文案。

## 8. Semantic UI Binding

### 8.1 Surfaces / Pages

| Surface ID | Page ID | Route | Tab ID |
|------------|---------|-------|--------|
| home | home-page | pages/HomePage | tab-home |
| records | records-page | pages/RecordsPage | tab-records |
| health | health-page | pages/HealthPage | tab-health |
| family | family-page | pages/FamilyPage | tab-family |
| profile | profile-page | pages/ProfilePage | tab-profile |
| pet-editor | pet-editor-page | pages/PetEditorPage | — |
| record-editor | record-editor-page | pages/RecordEditorPage | — |
| record-detail | record-detail-page | pages/RecordDetailPage | — |
| chart-detail | chart-detail-page | pages/ChartDetailPage | — |
| reminder-editor | reminder-editor-page | pages/ReminderEditorPage | — |
| medical-record-editor | medical-record-editor-page | pages/MedicalRecordEditorPage | — |
| medical-record-detail | medical-record-detail-page | pages/MedicalRecordDetailPage | — |
| member-invite | member-invite-page | pages/MemberInvitePage | — |
| pet-picker | pet-picker-sheet | — | — |
| record-type-picker | record-type-sheet | — | — |
| confirm-delete | confirm-delete-dialog | — | — |

### 8.2 Important Semantic Targets

| ID | Role | Event / Binding | Visual Mapping |
|----|------|-----------------|----------------|
| home-pet-switcher | action | open-pet-picker | 顶部宠物头像卡片，点击展开底部 Sheet |
| home-current-pet-name | assertion | /pets/selected/name | 头像旁宠物昵称，使用 Body Strong |
| home-quick-log-button | action | open-record-type-sheet | 首页中央 72px 薄荷渐变圆形主按钮 |
| home-reminder-list | list | /reminders/today | 横向可滚动提醒胶囊列表 |
| home-recent-record-list | list | /records/recent | 最近 5 条记录时间轴 |
| records-add-button | action | open-record-editor | 记录页 Header 右侧白色图标按钮 |
| records-search-input | input | search-records | 顶部圆角搜索输入框 |
| records-timeline-list | list | /records/filtered | 按日期分组的时间轴列表 |
| health-pet-switcher | action | open-pet-picker | 健康页顶部宠物切换条 |
| health-weight-chart-card | action | open-chart-detail | 体重趋势迷你图卡片 |
| health-add-reminder-button | action | open-reminder-editor | 提醒区块右上角“+”图标按钮 |
| health-add-medical-record-button | action | open-medical-record-editor | 病历区块右上角“+”图标按钮 |
| family-invite-button | action | open-member-invite | 家庭成员区块顶部薄荷渐变邀请按钮 |
| family-member-list | list | /family/members | 成员头像+信息卡片列表 |
| profile-manage-pets-button | action | go-to-pet-list | 我的页面“管理宠物档案”列表行 |
| pet-editor-save-button | action | save-pet | 表单底部全宽主按钮 |
| record-editor-save-button | action | save-record | 表单底部全宽主按钮 |
| reminder-editor-save-button | action | save-reminder | 表单底部全宽主按钮 |
| medical-editor-save-button | action | save-medical-record | 表单底部全宽主按钮 |
| confirm-delete-confirm-button | action | confirm-delete | 弹窗主按钮，使用 Pink 500 背景 |

### 8.3 Event Names Preserved

`open-pet-picker`, `open-record-type-sheet`, `open-record-editor`, `open-reminder-editor`, `open-medical-record-editor`, `open-member-invite`, `save-pet`, `delete-pet`, `save-record`, `delete-record`, `save-reminder`, `delete-reminder`, `save-medical-record`, `delete-medical-record`, `set-chart-period`, `copy-invite-code`, `share-invite-code`, `close-sheet`, `confirm-delete`, `cancel-delete`, `go-back`

### 8.4 Change Requests / Gaps

- 无变更请求。ui-tree.json 语义目标已覆盖全部关键交互与断言点，DESIGN1 仅做视觉细化，不修改语义 ID 与事件名。

## 9. Do's and Don'ts

### Do
- 使用 22px 大圆角卡片与全药丸按钮，保持圆润治愈感。
- 在卡片、按钮、顶部背景中使用渐变，避免单调纯色。
- 使用毛玻璃处理 Header、TabBar、Sheet 顶部。
- 为每个语义图标注入业务语义 `<title>`。
- 按类型使用彩色胶囊标签，让列表信息一眼可辨。
- 保持内容区 max-width 390px 居中，底部导航固定。

### Don't
- 使用直角或过小圆角（<10px）。
- 大面积使用单一纯色块。
- 使用 emoji 或 Unicode 图标替代 SVG。
- 全宽拉伸布局或将 TabBar 放在侧边。
- 阴影过重或层数过多，保持柔和。
