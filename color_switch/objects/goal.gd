extends Area2D
## 终点门：主角碰到就过关。

signal reached


func _on_body_entered(_body: Node2D) -> void:
	set_deferred("monitoring", false)
	reached.emit()
