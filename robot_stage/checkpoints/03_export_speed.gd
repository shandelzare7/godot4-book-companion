extends Sprite2D

@export var speed: float = 120.0

func _process(delta):
	position.x += speed * delta
	if position.x >= 700:
		position.x = 700
		print("到达右边界")
		set_process(false)
