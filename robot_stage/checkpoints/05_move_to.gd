extends Sprite2D

@export var speed: float = 200.0
var target_position: Vector2 = Vector2(400, 500)

func _process(delta: float) -> void:
	position = position.move_toward(target_position, speed * delta)
