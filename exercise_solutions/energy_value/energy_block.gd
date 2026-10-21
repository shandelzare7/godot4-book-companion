extends Node2D
class_name EnergyBlock

@export var energy: int = 1

func collect() -> void:
	queue_free()
