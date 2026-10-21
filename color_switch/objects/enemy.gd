extends CharacterBody2D
## 巡逻敌人：沿地面来回走，走到边缘或撞墙就掉头；被踩到就消失。

@export var speed := 30.0
@export var gravity := 900.0

var direction := -1.0

@onready var edge_check: RayCast2D = $EdgeCheck


func _ready() -> void:
	Game.color_changed.connect(_on_color_changed)
	_on_color_changed(Game.is_red)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	elif is_on_wall() or not edge_check.is_colliding():
		direction = -direction
	velocity.x = direction * speed
	edge_check.position.x = direction * 8.0
	$AnimatedSprite2D.flip_h = direction > 0
	move_and_slide()


func _on_color_changed(is_red: bool) -> void:
	set_collision_mask_value(3, is_red)
	set_collision_mask_value(4, not is_red)
	edge_check.set_collision_mask_value(3, is_red)
	edge_check.set_collision_mask_value(4, not is_red)


func _on_hitbox_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	if body.velocity.y > 0 and body.global_position.y < global_position.y - 4:
		body.bounce()
		stomped()
	else:
		body.take_damage(global_position)


func stomped() -> void:
	$StompSound.play()
	set_physics_process(false)
	$Hitbox.set_deferred("monitoring", false)
	$CollisionShape2D.set_deferred("disabled", true)
	var tween := create_tween()
	tween.tween_property($AnimatedSprite2D, "scale:y", 0.2, 0.15)
	tween.tween_property($AnimatedSprite2D, "modulate:a", 0.0, 0.2)
	await tween.finished
	queue_free()
