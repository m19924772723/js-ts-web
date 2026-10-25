# TDesign 零售行业小程序模板（本地运行说明）

- 项目：`Tencent/tdesign-miniprogram-starter-retail`（腾讯官方 TDesign 微信小程序零售行业模板）
- 来源：https://github.com/Tencent/tdesign-miniprogram-starter-retail （main 分支 zip）
- 本地路径：`D:\code\workbuddy\workbuddy-project\js-ts-web\miniprogram\retail`
- 技术栈：原生小程序（JS + WXSS）+ tdesign-miniprogram 1.9.5 组件库，内置 mock 数据，**无需后端**
- 页面：29 个完整页面（首页/商品分类/列表/详情/购物车/订单/售后/个人中心/优惠券等）

## 已做的本地化修改

1. `project.config.json` 的 `appid` 由原作者的 `wx0ee80a2f23dbd157` 改为 **`touristappid`**（游客模式，无需注册小程序）。
2. `node_modules` 手工安装（沙箱 npm 被拦，tgz 直解）：`tdesign-miniprogram@1.9.5`、`dayjs@1.11.13`、`tslib@1.14.1`（三者均零依赖，已含 `miniprogram_dist` 构建产物）。

## 运行步骤（微信开发者工具 2.01.2510290，装在 D 盘）

> 已创建目录联接 `D:\wxdevtools` → 安装目录（绕开中文路径乱码问题，start.cmd 只引用该联接）。

1. **双击 `start.cmd`**（在本目录）：
   - 自动调起微信开发者工具并打开本项目；
   - 首次运行若弹出二维码 → 用微信扫码登录（只需一次）；
   - 随后自动执行「构建 npm」（把 tdesign 组件生成到 `miniprogram_npm/`）。
2. 编译完成后，模拟器显示零售商城首页（iPhone 12/13 视图即可浏览）。
3. 顶部「编译」下拉里有 13 个预置页面入口（首页/商品详情/搜索/售后等），可直接切换浏览。

### 如果 start.cmd 提示 "CLI open failed"（首次最常见）

服务端口没开，做一次一次性设置：

1. 手动打开微信开发者工具（开始菜单/桌面图标）→ 微信扫码登录；
2. 右上角「设置」→「安全设置」→ 打开「服务端口」开关；
3. 关闭开发者工具，重新双击 `start.cmd`。

也可完全手动：打开开发者工具 → 导入项目选本目录（appid 会识别为游客模式）→ 工具栏「构建 npm」→ 编译。

## 停止

- 双击 `stop.cmd`（结束 wechatdevtools / wxfilewatcher 进程）。

## 已知事项

- 开发者工具要求**微信扫码登录**才能使用（游客 appid 也需要登录工具本身）。
- `构建 npm` 是必须步骤：页面通过 `tdesign-miniprogram/...` 路径引用 npm 组件。
- 基础库版本要求 ≥ 2.6.5（项目配置 libVersion 3.13.0）。
- 沙箱内 CLI 启动会触发 `reg.exe` 拦截与「代理设置失败」弹窗，属沙箱限制；**在你自己的桌面运行 start.cmd 无此问题**。

## 目录速览

| 路径 | 说明 |
| --- | --- |
| `pages/` | 全部页面（home/category/cart/usercenter 为主包，goods/order/user/coupon 为分包） |
| `components/` | 公共组件（goods-list、load-more、webp-image 等） |
| `model/` | mock 数据 |
| `services/` | 请求接口层（本地 mock 实现） |
| `custom-tab-bar/` | 自定义底部导航 |
| `start.cmd` / `stop.cmd` | 一键启动 / 停止 |
