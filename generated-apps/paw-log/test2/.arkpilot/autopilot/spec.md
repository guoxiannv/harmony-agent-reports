# 宠迹·PawLog 产品规格书

## Idea Classification

**CONCRETE** — 用户已明确 App 名称、核心功能集合、目标用户（多宠家庭/合租照护者）与视觉方向（薄荷绿 + 肉垫粉、圆润治愈风）。本规格在功能边界、页面结构、导航模型、数据策略与验收标准层面已可直接进入设计阶段，无需追加澄清问题。

## Value Proposition

宠迹·PawLog 是一款面向多宠家庭的**日常健康与照护记录工具**。它把「今天谁吃了多少、有没有拉、体重变了吗、药吃了没」这些零碎的照护动作，变成只需 3 秒即可完成的轻量记录；并通过趋势图表、疫苗驱虫提醒、就医病历归档与家庭成员共享，让宠物的长期健康状态一目了然。

## Product Category & Primary User Scenario

- **产品类别**：生活健康类工具 App（宠物健康管理 / 家庭共享记录）。
- **目标设备**：普通手机（详见 Target Device）。
- **主要用户场景**：
  1. 早晨喂食后，主人一键记录某只宠物的饮食量与食物类型。
  2. 遛弯或铲屎后，记录排泄情况与异常气味/形态。
  3. 每周固定时间称重，观察体重曲线，及时发现异常波动。
  4. 驱虫/疫苗到期前 3 天收到提醒，并标记「已完成」。
  5. 就医后拍照上传病历、处方与化验单，按时间轴归档。
  6. 家庭成员之间同步记录，避免重复喂食或漏药。

## Core Jobs-to-be-Done

1. **多宠档案管理**：为每只宠物建立独立档案（名称、头像、品种、生日、性别、绝育状态、当前体重、过敏/慢性病备注）。
2. **一键日常记录**：通过大按钮/快捷入口，快速记录饮食、排泄、体重、用药四类事件，每种记录仅需最少字段。
3. **健康趋势可视化**：以周/月维度展示体重、饮食、排泄趋势图表，帮助识别异常。
4. **预防护理提醒**：为疫苗、驱虫、体检、洗澡等护理项设置到期提醒，支持提前提醒与完成标记。
5. **就医病历归档**：按宠物维度保存就诊时间、医院、诊断、处方、图片附件，形成时间轴。
6. **家庭成员共享**：通过邀请码/链接让家庭成员加入某只宠物的照护圈，共同查看与追加记录。

## Page Structure

| Surface ID | Page ID | Route | Tab ID | 说明 |
|------------|---------|-------|--------|------|
| home | home-page | pages/Home | tab-home | 首页：宠物切换、今日概览、快捷记录入口、近期提醒 |
| records | records-page | pages/Records | tab-records | 记录：按时间轴查看全部记录，支持筛选 |
| trends | trends-page | pages/Trends | tab-trends | 趋势：体重/饮食/排泄图表与统计 |
| care | care-page | pages/Care | tab-care | 照护：疫苗/驱虫/体检提醒与就医病历入口 |
| profile | profile-page | pages/Profile | tab-profile | 我的：家庭成员、设置、关于 |
| pet-picker | pet-picker-sheet | (BottomSheet) | - | 宠物选择器，用于首页顶部切换 |
| add-record | add-record-sheet | (BottomSheet) | - | 记录类型选择：饮食/排泄/体重/用药 |
| record-diet | record-diet-sheet | (BottomSheet) | - | 饮食记录表单 |
| record-stool | record-stool-sheet | (BottomSheet) | - | 排泄记录表单 |
| record-weight | record-weight-sheet | (BottomSheet) | - | 体重记录表单 |
| record-meds | record-meds-sheet | (BottomSheet) | - | 用药记录表单 |
| reminder-detail | reminder-detail-page | pages/ReminderDetail | - | 提醒详情与完成/编辑 |
| medical-case | medical-case-page | pages/MedicalCase | - | 就医病历详情 |
| medical-case-editor | medical-case-editor-page | pages/MedicalCaseEditor | - | 新增/编辑病历 |
| family-invite | family-invite-sheet | (BottomSheet) | - | 家庭成员邀请 |
| pet-editor | pet-editor-page | pages/PetEditor | - | 新增/编辑宠物档案 |

## Navigation Model

- **主导航**：底部固定 Tab Bar，共 5 个 Tab：首页 / 记录 / 趋势 / 照护 / 我的。
- **次级导航**：
  - 首页顶部宠物头像横向切换，当前选中宠物高亮。
  - 记录页顶部筛选 Tab：全部 / 饮食 / 排泄 / 体重 / 用药。
  - 趋势页顶部图表维度 Tab：体重 / 饮食 / 排泄。
  - 照护页顶部 Tab：提醒 / 病历。
- **页面跳转**：
  - 从首页点击「+」或快捷按钮 → 弹出 add-record-sheet。
  - 从 add-record-sheet 选择类型 → 进入对应 record-*-sheet。
  - 从首页/照护页提醒卡片 → reminder-detail-page。
  - 从照护页病历卡片 → medical-case-page；新增/编辑 → medical-case-editor-page。
  - 从我的页「家庭成员」→ family-invite-sheet。
  - 从首页空状态或我的页「管理宠物」→ pet-editor-page。
- **返回行为**：非 Tab 页面统一使用左上角返回箭头回到发起页；sheet 使用下滑或点击遮罩关闭。

## Data Source Strategy

- **本地优先**：所有宠物档案、记录、提醒、病历默认持久化在本地应用沙箱（Preferences / 关系型数据库 / 本地文件），保证离线可用与隐私。
- **无初始种子数据**：首次打开时展示真实的空状态（empty state），引导用户创建第一只宠物档案；任何 HTML 视觉稿中的示例数据仅作视觉参考，不作为产品功能需求。
- **家庭成员共享**：版本 1.0 仅支持本地邀请码展示与成员列表模拟；真正的云端同步作为非目标，不在当前版本实现。
- **图片附件**：病历中的化验单/处方图片使用本地相册选择后保存到应用沙箱；不提供默认图片资源。

## Component Structure

- **Shell 组件**：
  - `Index`：应用根页面，管理 surface 路由与底部 Tab 状态。
  - `BottomTabBar`：底部 Tab 栏，5 个入口。
- **页面组件**：
  - `HomePage` / `RecordsPage` / `TrendsPage` / `CarePage` / `ProfilePage`：5 个 Tab 页。
  - `ReminderDetailPage` / `MedicalCasePage` / `MedicalCaseEditorPage` / `PetEditorPage`：4 个非 Tab 全屏页。
- **Sheet 组件**：
  - `PetPickerSheet` / `AddRecordSheet` / `RecordDietSheet` / `RecordStoolSheet` / `RecordWeightSheet` / `RecordMedsSheet` / `FamilyInviteSheet`：7 个底部弹层。
- **可复用 UI 组件**：
  - `PetAvatar`：宠物头像，支持本地图片与占位图。
  - `QuickActionButton`：首页大圆快捷按钮。
  - `RecordListItem`：记录时间轴条目。
  - `TrendChart`：趋势折线图/柱状图容器。
  - `ReminderCard`：提醒卡片。
  - `MedicalCaseCard`：病历卡片。
  - `StatPill`：统计小药丸标签。
  - `EmptyState`：空状态占位。

## Acceptance Criteria

1. 用户首次进入 App 时，若不存在宠物档案，首页显示「添加第一只宠物」空状态；点击后进入 pet-editor-page 创建宠物。
2. 用户可在首页顶部左右滑动/点击切换当前宠物；切换后所有记录、趋势、提醒、病历均按该宠物过滤。
3. 首页提供「饮食 / 排泄 / 体重 / 用药」四个一键记录入口，每个入口点击后 3 步内完成保存。
4. 记录页以时间倒序展示选中宠物的全部记录，支持按类型筛选与长按删除。
5. 趋势页至少展示最近 30 天的体重曲线与本周饮食/排泄柱状图；无数据时显示空状态。
6. 照护页提醒列表展示疫苗/驱虫/体检/洗澡的下次到期时间；到期前 3 天显示「即将到期」标签，可标记完成。
7. 病历页支持新增、编辑、删除病历；每条病历包含医院、诊断、时间、备注与最多 6 张图片附件。
8. 我的页展示当前家庭成员列表与邀请码；点击邀请可弹出 family-invite-sheet。
9. 所有交互目标均携带稳定的 `data-ui-id`，与 ui-tree.json 中的语义 ID 保持一致。
10. App 构建通过 `hvigor` / DevEco MCP `build_project`，在目标分辨率手机上 UI 无错位，Tab 栏固定底部。

## Non-Goals

- 不提供云端账号注册/登录与真实跨设备同步。
- 不接入外部硬件（智能喂食器、智能猫砂盆、体重秤）。
- 不实现基于 AI 的疾病诊断或用药建议。
- 不提供宠物社交、社区、商城、附近医院地图。
- 不支持多语言；版本 1.0 仅简体中文。
- 不支持平板或折叠屏适配。

## Open Questions

- 是否需要在提醒中使用本地推送通知？（建议版本 1.0 使用应用内提醒角标，本地通知作为后续增强。）
- 病历图片附件是否需要在查看页支持放大？（建议实现，可在 medical-case-page 中增加图片预览。）
- 家庭成员共享是否需要在 UI 中展示「主账号/协作者」权限区分？（建议版本 1.0 仅展示成员列表，权限均等为后续增强。）

## Target Device

- 屏幕分辨率：1272vp × 2756vp（宽 × 高）
- 设备类型：普通手机（非折叠机、非平板）
- 像素密度倍率：3x（即 HTML 设计稿 390px = 设备上 1170vp 物理像素，但 ArkTS 使用 vp 单位时 1px≈1vp）
- 布局策略：内容区 max-width 约束在 390-420vp 内居中，禁止全宽铺满。**注意：Tab 导航栏等必须在底部，且若使用 `position: fixed` 必须限制宽度与 body 一致（如 `width: 100%; max-width: 390px; margin: 0 auto; left: 0; right: 0;`），严禁在 PC 浏览器上全宽拉伸。严禁生成在侧边（如右边/左边）。**
- 特殊注意：2756px 高度意味着屏幕很长，滚动区域充足，但需确保首屏关键内容（Header + 核心卡片）在顶部 600vp 内可见。
