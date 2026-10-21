# 双色跳台：角色操控

《双色跳台》第 1 关的主角已经能跑能跳的版本，对应第 5 章结束时的状态。使用 Godot 4.7.2，Compatibility 渲染器；游戏画面 320×180 像素，窗口 1280×720。

在项目管理器中导入 `project.godot`，按 F5 运行第 1 关。A、D 或方向键左右移动，空格、W 或上方向键跳跃，Esc 或 P 暂停。碰到金币会收集，在输出面板中显示“金币：n/9”；碰到尖刺扣一颗心并被弹开，掉进坑里扣一颗心后回到起点，三颗心用完重新开始本关；可以推动木箱，踩着它跳上高台；碰到终点门时输出“过关！”，游戏暂停。

## 文件

| 位置 | 内容 |
|---|---|
| `player/player.tscn`、`player/player.gd` | 主角：CharacterBody2D，碰撞层 2（player），加入 player 分组；脚本处理跑跳、推箱子、受伤击退与无敌时间 |
| `objects/coin.*`、`objects/spikes.*`、`objects/goal.*` | Area2D：只检测碰撞层 2 上的主角，金币和终点门用自定义信号通知关卡 |
| `objects/crate.tscn` | 木箱：RigidBody2D，锁定旋转 |
| `levels/level_1.tscn`、`levels/level.gd` | 关卡：用代码连接每枚金币的信号并计数，DeathZone 处理掉坑，PauseLayer 显示暂停文字，设置相机边界 |
| `assets/tiles.tres` | 图块集：物理层 0 占碰撞层 1（world），地面和平台图块带碰撞形状 |

## 阶段场景

| 场景 | 状态 |
|---|---|
| `checkpoints/01_crate_drop.tscn` | 木箱从空中落下，停在带碰撞的地面上 |
| `checkpoints/02_player_move.tscn`、`checkpoints/02_player_move.gd` | 主角只会跑、跳和推木箱，没有受伤与重生；关卡里只有一只木箱，也没有坑的检测，掉进坑里后重新运行即可 |
| `checkpoints/03_damage_respawn.tscn` | 对应 5.4 结束：金币计数、尖刺受伤、1 秒无敌、掉坑重生和生命用完后重开；终点门仍只是装饰，尚无 Esc/P 暂停 |

打开阶段场景后使用“运行当前场景”。`03_damage_respawn.tscn` 引用 `checkpoints/03_damage_respawn/` 中的独立场景、脚本和 TileSet；只有图片与章末版本共用。该目录中的 `level.gd`、`player/player.gd` 可与制作到 5.4 的代码对照。继续制作仍使用 `levels/level_1.tscn`，阶段场景不会替换主场景。

素材来源与许可见本工程的《素材说明》。
