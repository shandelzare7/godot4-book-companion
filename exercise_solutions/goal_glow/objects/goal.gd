extends Node2D
## 终点门：循环改变不透明度。


func _ready() -> void:
	var tween := create_tween().set_loops()
	tween.tween_property(self, "modulate:a", 0.6, 0.6)
	tween.tween_property(self, "modulate:a", 1.0, 0.6)
