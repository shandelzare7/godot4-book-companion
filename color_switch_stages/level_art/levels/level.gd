extends Node2D
## 第 1 关：关卡开始时显示标题，稍后淡出。


func _ready() -> void:
	show_banner()


func show_banner() -> void:
	var label: Label = $Banner/LevelLabel
	var tween := create_tween()
	tween.tween_interval(1.0)
	tween.tween_property(label, "modulate:a", 0.0, 0.8)
	await tween.finished
	$Banner.hide()
