extends Node2D

var energy: int = 3

func _ready() -> void:
	energy += 2
	var report: String = "机器人电量：" + str(energy)
	print(report)
