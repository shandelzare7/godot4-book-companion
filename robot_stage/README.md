# 机器人舞台

第 3 章配套工程。

用 Godot 4.7.2 打开 `project.godot`，按 F5 运行小机器人舞台。工程使用 GDScript 和 Compatibility 渲染器，窗口为 800×600，默认清屏颜色为 `#2F3B4C`；脚本统一使用 Godot 默认的制表符缩进。

## 玩法

左键点击画面：机器人走到那里。靠近到 40 像素以内就会收集，左上角显示“已收集：n”；点击右上角的“重新开始”重新载入场景。点击按钮不会指挥机器人，点击能量块或计数文字则会。

“右键寻找最近的能量块”是章末可选练习，完成版不带这项功能。参考解法在 `exercise_solutions/nearest_block` 中，需在本工程的副本上使用。

## 场景与小节

打开某个场景后按 F6，可单独运行它。按 F5 始终运行最终的 `robot_stage.tscn`。

| 文件 | 对应正文 | 说明 |
|---|---|---|
| `robot_stage.tscn`、`robot_stage.gd` | 3.6～3.8 | 舞台：RobotStage 根节点带脚本，子节点有 Robot、CountLabel、RestartButton；能量块由脚本在运行时生成，按钮的 `pressed` 信号连接到 `_on_restart_button_pressed` |
| `robot.gd` | 3.1～3.4 | 附加在 Robot（Sprite2D，使用 `icon.svg`）上：左键移动；`speed` 使用 `@export_range` |
| `energy_block.tscn`、`energy_block.gd` | 3.6～3.7 | 能量块：根节点 EnergyBlock 加入 `energy` 场景分组，脚本注册 `EnergyBlock` 类型并提供 `collect()`；Body 的 Mouse Filter 为 Ignore |
| `syntax_lab.tscn`、`syntax_lab.gd` | 3.5 | 数组、循环、共享与副本的输出实验，画面为空，请看编辑器底部的输出面板 |

`robot_stage.tscn` 中没有保存能量块，它们由 `robot_stage.gd` 的 `_ready` 依据 `BLOCK_POSITIONS` 生成；因此在编辑视口里看不到，运行时可在场景面板的“远程”中找到。不要把脚本和场景拆开放到不同工程中运行；`robot_stage.gd` 中的 `preload` 使用项目内的 `res://energy_block.tscn` 路径。

## 中间步骤

`checkpoints` 文件夹保留可单独按 F6 运行的阶段场景，方便在修改成品前核对。

| 场景 | 对应正文 | 观察结果 |
|---|---|---|
| `checkpoints/01_walk.tscn` | 3.1 | 机器人从 (100, 300) 向右走，约 5 秒到 x = 700，输出一次“到达右边界”后停止处理 |
| `checkpoints/02_lab_variables.tscn` | 3.2 | 输出“机器人电量：5”，每次重新运行都从初值开始 |
| `checkpoints/03_export_speed.tscn` | 3.2 | `speed` 出现在检查器中，脚本默认 120；在检查器中改成 240 后约 2.5 秒走到边界 |
| `checkpoints/04_lab_functions.tscn` | 3.3 | 依次输出“步行耗电：3”“奔跑耗电：6”“电量偏低” |
| `checkpoints/05_move_to.tscn` | 3.4 | 机器人从 (100, 300) 斜向走到 (400, 500) 并停住 |
| `checkpoints/06_click_move.tscn` | 3.4 | 只响应左键按下，机器人走向点击位置；起初静止 |
| `checkpoints/07_spawn_blocks.tscn` | 3.6 | 舞台在 `_ready` 中生成四个能量块，机器人可移动但不会收集 |
| `checkpoints/08_collect.tscn` | 3.7 | 左键指挥机器人收集能量块，加入计数文字，尚无重新开始按钮 |

各个 `.gd` 文件在检查阶段场景时，仍需要项目根目录中的 `energy_block.tscn` 与 `energy_block.gd`。机器人使用的是项目自带的图标，来源与许可见《素材说明.md》；测试与截图辅助程序保存在教材审校目录中，不属于这份读者工程。
