extends Area2D
## 弹簧：主角碰到就被高高弹起。

@export var launch_velocity := -450.0


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.velocity.y = launch_velocity
