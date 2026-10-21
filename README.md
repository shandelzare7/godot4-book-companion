# 《Godot 4 游戏开发入门教程》配套资料

这是《Godot 4 游戏开发入门教程》第 1—9 章的配套资料，包括各章完成版、阶段工程、“进一步尝试”的参考解法，以及游戏用到的全部图片、声音和字体。

## 下载

**不需要使用 Git。** 在本页右侧的 **Releases（发布）** 中下载 `godot4-book-companion.zip`，解压到一个固定的文件夹即可。

学习全书只需要下载两样东西：

1. Godot 4.7.2 标准版编辑器，从 Godot 官网下载，方法见书中第 1 章。
2. 本配套资料包。

## 内容

| 文件夹 | 内容 | 对应章节 |
|---|---|---|
| `level_sketch` | 色块搭成的关卡草图 | 第 1 章完成版 |
| `forest` | 小树林与材质实验 | 第 2 章完成版 |
| `robot_stage` | 点击指挥的小机器人，含各节阶段场景 | 第 3 章完成版 |
| `color_switch_stages/level_art` | 《双色跳台》：关卡画面 | 第 4 章完成版 |
| `color_switch_stages/player_control` | 《双色跳台》：角色操控 | 第 5 章完成版 |
| `color_switch_stages/game_ui` | 《双色跳台》：游戏界面 | 第 6 章完成版 |
| `color_switch_stages/sound_save` | 《双色跳台》：声音与存档 | 第 7 章完成版 |
| `color_switch_stages/color_blocks` | 《双色跳台》：红蓝砖块与第 2 关 | 第 8 章完成版 |
| `color_switch` | 《双色跳台》完成版 | 第 9 章完成版 |
| `exercise_solutions` | 第 3—9 章“进一步尝试”的参考解法 | 第 3—9 章 |

书中制作《双色跳台》时用到的图片、字体和声音，分别在对应工程的 `assets` 文件夹中，按书中的说明复制到自己的项目即可。

## 使用方法

用 Godot 4.7.2 标准版打开项目管理器，单击“导入”，选择某个文件夹中的 `project.godot`。每个工程文件夹中的 `README.md` 说明它的玩法、文件和阶段场景。

对照或修改完成版之前，建议先把工程文件夹复制一份，在副本中操作。参考解法的用法见 `exercise_solutions/README.md`。

## 素材与许可

| 素材 | 作者与来源 | 许可 |
|---|---|---|
| 图片：Pixel Platformer、Pixel Platformer Blocks | Kenney（kenney.nl） | CC0 1.0 |
| 音效：Interface Sounds、Impact Sounds、Music Jingles | Kenney（kenney.nl） | CC0 1.0 |
| 背景音乐：4 Chiptunes (Adventure) | Juhani Junkala（OpenGameArt） | CC0 1.0 |
| 中文像素字体：缝合像素字体（Fusion Pixel Font） | TakWolf（github.com/TakWolf/fusion-pixel-font） | SIL OFL 1.1 |
| Godot 图标（项目默认的 `icon.svg`） | Andrea Calabró（Godot Engine） | CC BY 4.0 |

每个工程中的 `素材说明.md` 逐个列出所用素材的原文件名、来源和许可，许可原文与素材放在一起。修改或分发作品时，请保留所用素材要求的署名和许可文件。
