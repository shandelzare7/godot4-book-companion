extends Node2D
## 主角（演示版）：按固定速度向右走，到 stop_x 停下。之后会改为用键盘操控。

@export var speed := 60.0
@export var stop_x := 300.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	if position.x < stop_x:
		position.x += speed * delta
		sprite.play("run")
	else:
		sprite.play("idle")
