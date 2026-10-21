extends Node2D

const BLOCK_SCENE: PackedScene = preload("res://energy_block.tscn")
const BLOCK_POSITIONS: Array[Vector2] = [
	Vector2(260, 200),
	Vector2(420, 440),
	Vector2(560, 240),
	Vector2(680, 460),
]

func _ready() -> void:
	for point in BLOCK_POSITIONS:
		spawn_block(point)

func spawn_block(point: Vector2) -> void:
	var block := BLOCK_SCENE.instantiate() as EnergyBlock
	block.position = point
	add_child(block)
