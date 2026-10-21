# 进一步尝试参考解法

第 3—9 章章末“进一步尝试”的参考解法。每个文件夹对应一道练习，其中只包含相对配套工程改动或新增的文件。下表的工程路径均相对于配套资料根目录。

每道题各复制一份对应的完整工程，按以下顺序使用：

1. 保存并关闭对应工程的 Godot 编辑器，把下表所列的整个工程文件夹复制为本题的练习副本。
2. 保持副本的编辑器关闭，按本题 README 列出的相对路径，将参考文件覆盖或新增到副本中。
3. 在 Godot 项目管理器中导入副本的 `project.godot`，打开副本。
4. 第 7—9 章的题目已有存档功能。首次运行前，在“项目”→“项目设置”→“常规”中搜索 `application/config/name`，按各题 README 使用不同且尚未用过的项目名称。只改项目文件夹名不会隔离存档。然后按本题 README 和书中题目设置观察条件、运行检查。

| 小节 | 练习 | 文件夹 | 完整配套工程路径 |
|---|---|---|---|
| 3.9.5 | 能量值不同的方块 | `energy_value` | `robot_stage` |
| 3.9.5 | 右键寻找最近的能量块 | `nearest_block` | `robot_stage` |
| 4.7.4 | 终点门的呼吸灯 | `goal_glow` | `color_switch_stages/level_art` |
| 5.5.5 | 二段跳 | `double_jump` | `color_switch_stages/player_control` |
| 5.5.5 | 弹簧 | `spring` | `color_switch_stages/player_control` |
| 6.4.4 | 关于面板 | `about_panel` | `color_switch_stages/game_ui` |
| 7.4.6 | 清除记录 | `reset_progress` | `color_switch_stages/sound_save` |
| 7.4.6 | 合计用时 | `total_time` | `color_switch_stages/sound_save` |
| 8.4.4 | 平台在两端停顿 | `platform_pause` | `color_switch_stages/color_blocks` |
| 8.4.4 | 派生第 3 关 | `third_level` | `color_switch_stages/color_blocks` |
| 9.3.5 | 发现主角时加速 | `enemy_chase` | `color_switch` |
| 9.3.5 | 要踩两次的敌人 | `tough_enemy` | `color_switch` |
