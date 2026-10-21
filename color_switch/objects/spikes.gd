extends Area2D
## 尖刺：主角碰到就受伤。


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(global_position)
