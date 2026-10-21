extends CharacterBody2D
## 主角（移动版）：跑、跳、推箱子。受伤与重生在后面加入。

@export_group("移动")
@export var speed := 90.0
@export var jump_velocity := -330.0
@export var gravity := 900.0
@export var push_force := 40.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	if direction != 0:
		sprite.flip_h = direction < 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	move_and_slide()
	push_crates()
	update_animation()


func push_crates() -> void:
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var crate := collision.get_collider() as RigidBody2D
		if crate != null and absf(collision.get_normal().x) > 0.5:
			crate.apply_central_impulse(-collision.get_normal() * push_force)


func update_animation() -> void:
	if not is_on_floor():
		sprite.play("jump")
	elif velocity.x != 0:
		sprite.play("run")
	else:
		sprite.play("idle")
