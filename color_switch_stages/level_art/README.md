# 双色跳台：关卡画面

《双色跳台》第 1 关的画面已经做好、角色还不能操控的版本，对应第 4 章结束时的状态。使用 Godot 4.7.2，Compatibility 渲染器；游戏画面 320×180 像素，窗口 1280×720。

在项目管理器中导入 `project.godot`，按 F5 运行第 1 关：关卡开头显示“第 1 关”并淡出，主角播放奔跑动画走到 x = 300 处停下，相机平滑跟随，远景比地面移动得慢；金币转动并上下浮动，终点门冒出光点。

## 文件

| 位置 | 内容 |
|---|---|
| `levels/level_1.tscn`、`levels/level.gd` | 第 1 关：Background（Parallax2D 远景）、Ground（TileMapLayer 地形）、Objects（金币、木箱、尖刺、终点门）、Player、Banner（CanvasLayer 上的标题）；脚本用 Tween 让标题淡出 |
| `player/player.tscn`、`player/player.gd` | 主角：AnimatedSprite2D（idle、run、jump 三个动画）和 Camera2D；脚本让主角按固定速度向右走，到 `stop_x` 停下 |
| `objects/` | 金币（帧动画加 AnimationPlayer 浮动）、尖刺、木箱、终点门（CPUParticles2D 光点）；此时都只有图像，没有碰撞 |
| `assets/` | Kenney Pixel Platformer 的三张图片（已改名）与许可原文；`tiles.tres` 为图块集 |

## 阶段场景

`checkpoints` 文件夹保留可单独按 F6 运行的阶段场景。

| 场景 | 状态 |
|---|---|
| `checkpoints/01_ground.tscn` | 只有铺好的地形；运行时只显示关卡左上角，地面露出最上面一行 |
| `checkpoints/02_player_walk.tscn` | 加入主角，走到 x = 300 停下；主角的相机在这个场景中关闭，画面不跟随 |
| `checkpoints/03_camera_background.tscn` | 相机平滑跟随，远景按 0.4 的比例移动；还没有关卡物体和标题 |

阶段场景使用工程中的 `player.tscn` 和 `tiles.tres`，不要单独拷到别的工程中运行。素材来源与许可见本工程的《素材说明》。
