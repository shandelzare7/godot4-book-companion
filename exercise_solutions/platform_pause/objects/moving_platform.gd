extends AnimatableBody2D
## 移动平台：在起点和 travel 指定的终点之间往返。

@export var travel := Vector2(0, -54)
@export var duration := 2.0
@export var pause := 0.5


func _ready() -> void:
	var tween := create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "position", position + travel, duration)
	tween.tween_interval(pause)
	tween.tween_property(self, "position", position, duration)
	tween.tween_interval(pause)
