extends Sprite2D

@export_range(50.0, 600.0, 10.0) var speed: float = 200.0

var target_position: Vector2

func _ready() -> void:
	target_position = global_position

func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_position, speed * delta)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			target_position = get_global_mouse_position()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			var block: Node2D = nearest_block()
			if block != null:
				target_position = block.global_position

func nearest_block() -> Node2D:
	var nearest: Node2D = null
	var nearest_distance: float = INF
	for block in get_tree().get_nodes_in_group("energy"):
		var distance: float = global_position.distance_to(block.global_position)
		if distance < nearest_distance:
			nearest = block
			nearest_distance = distance
	return nearest
