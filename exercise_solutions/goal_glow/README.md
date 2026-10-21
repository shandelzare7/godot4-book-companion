# 终点门的呼吸灯

第 4.7.4 节“进一步尝试”的参考解法。以完整配套工程 `color_switch_stages/level_art` 为基础，按上一级 README 的顺序建立练习副本。以下文件路径相对于副本根目录：

- `objects/goal.gd`
- `objects/goal.tscn`

打开练习副本的 `levels/level_1.tscn`，在场景树中选中关卡里的 Player 实例，把 Stop X 改为 1100，保存后运行当前场景。角色走到终点门附近后，可以看到终点门和光点一起逐渐变淡、恢复原来的不透明度，每 1.2 秒循环一次。
