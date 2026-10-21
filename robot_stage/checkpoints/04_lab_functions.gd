extends Node2D

func _ready() -> void:
	var walk_cost: int = energy_cost(3)
	var run_cost: int = energy_cost(3, 2)
	print("步行耗电：", walk_cost)
	print("奔跑耗电：", run_cost)
	print(battery_state(3))

func energy_cost(seconds: int, multiplier: int = 1) -> int:
	return seconds * multiplier

func battery_state(level: int) -> String:
	if level >= 5:
		return "电量充足"
	elif level >= 1:
		return "电量偏低"
	else:
		return "需要充电"
