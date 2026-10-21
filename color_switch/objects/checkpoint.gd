extends Area2D
## 检查点：主角经过后，之后从这里重生。

var activated := false


func _on_body_entered(body: Node2D) -> void:
	if activated:
		return
	activated = true
	body.spawn_position = global_position
	$AnimatedSprite2D.modulate = Color.WHITE
	$AnimatedSprite2D.play("wave")
