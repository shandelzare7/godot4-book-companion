extends Node2D

func _ready() -> void:
	var gains: Array[int] = [1, 2, 3]
	gains.append(4)
	print("第一项：", gains[0])
	print("项数：", gains.size())
	var total: int = 0
	for gain in gains:
		total += gain
	print("总能量：", total)

	for index in range(gains.size()):
		print("%d: %d" % [index, gains[index]])

	var shared: Array[int] = gains
	shared[0] = 9
	print("共享后第一项：", gains[0])
	var copied: Array[int] = gains.duplicate()
	copied[0] = 7
	print("原数组第一项：", gains[0])
	print("副本第一项：", copied[0])
