# 关卡草图

第 1 章配套工程。

使用 Godot 4.7.2，Compatibility 渲染器，窗口为 800×600，项目设置中的默认清屏颜色为 `#2F3B4C`。

在项目管理器中导入 `project.godot`，按 F5 运行关卡草图。画面是用色块搭成的一张平台关卡：地面、两个平台、主角、终点、两枚金币和一行标题；画面不会动，这是本章完成状态。

场景保存在 `main.tscn` 中。根节点 LevelSketch 是 Node2D，下有 8 个直接子节点：Ground、PlatformA、PlatformB、Player、Goal、Coin1、Coin2（均为 ColorRect）和 TitleLabel（Label），都没有挂载脚本。两枚金币的 Rotation 为 45°，Pivot Offset 为 (10, 10)。需要从头练习时，请另建学习项目，保留这份工程用于核对。

可以打开 `main.tscn`，改动某个色块的 Position、Size 或 Color，再按 F6 对照正文 1.4 节；做完实验后恢复原值并保存。

第二章保留这张草图，另建树林场景；第三章不再使用它，而是新建“小机器人”舞台，直接使用项目自带的 `icon.svg`。
