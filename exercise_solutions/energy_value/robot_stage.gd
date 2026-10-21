extends Node2D

const BLOCK_SCENE: PackedScene = preload("res://energy_block.tscn")
const BLOCK_POSITIONS: Array[Vector2] = [
	Vector2(260, 200),
	Vector2(420, 440),
	Vector2(560, 240),
	Vector2(680, 460),
]

@export_range(20.0, 100.0, 5.0) var collect_distance: float = 40.0

@onready var robot: Sprite2D = $Robot
@onready var count_label: Label = $CountLabel

var collected: int = 0

func _ready() -> void:
	for point in BLOCK_POSITIONS:
		spawn_block(point)
	update_label()

func _process(_delta: float) -> void:
	for block in get_tree().get_nodes_in_group("energy"):
		if can_collect(block):
			collected += block.energy
			block.collect()
			update_label()

func spawn_block(point: Vector2) -> void:
	var block := BLOCK_SCENE.instantiate() as EnergyBlock
	block.position = point
	if point == BLOCK_POSITIONS[0]:
		block.energy = 3
	add_child(block)

func can_collect(block: Node2D) -> bool:
	return robot.global_position.distance_to(block.global_position) <= collect_distance

func update_label() -> void:
	count_label.text = "获得能量：%d" % collected

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
