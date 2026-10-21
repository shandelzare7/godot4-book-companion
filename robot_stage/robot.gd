extends Sprite2D

@export_range(50.0, 600.0, 10.0) var speed: float = 200.0

var target_position: Vector2

func _ready() -> void:
	target_position = global_position

func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_position, speed * delta)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			target_position = get_global_mouse_position()
