extends CharacterBody2D
## 主角：跑、跳、推箱子、切换颜色、受伤与重生。

signal health_changed(health: int)
signal died

enum State { IDLE, RUN, JUMP, HURT }

@export_group("移动")
@export var speed := 90.0
@export var jump_velocity := -330.0
@export var gravity := 900.0
@export var push_force := 40.0
@export_group("生命")
@export var max_health := 3

var state := State.IDLE
var spawn_position := Vector2.ZERO
var health := 3:
	set(value):
		health = value
		health_changed.emit(health)

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var switch_probe: ShapeCast2D = $SwitchProbe
@onready var invincible_timer: Timer = $InvincibleTimer


func _ready() -> void:
	health = max_health
	spawn_position = global_position
	Game.color_changed.connect(_on_color_changed)
	_on_color_changed(Game.is_red)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if state != State.HURT:
		var direction := Input.get_axis("move_left", "move_right")
		velocity.x = direction * speed
		if direction != 0:
			sprite.flip_h = direction < 0
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_velocity
			$JumpSound.play()
	move_and_slide()
	push_crates()
	update_state()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_color"):
		try_switch_color()


func push_crates() -> void:
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var crate := collision.get_collider() as RigidBody2D
		if crate != null and absf(collision.get_normal().x) > 0.5:
			crate.apply_central_impulse(-collision.get_normal() * push_force)


func update_state() -> void:
	if state == State.HURT:
		# 被击退后，落地才恢复移动和跳跃
		if is_on_floor() and velocity.y >= 0:
			state = State.IDLE
	elif not is_on_floor():
		state = State.JUMP
	elif velocity.x != 0:
		state = State.RUN
	else:
		state = State.IDLE
	match state:
		State.IDLE:
			sprite.play("idle")
		State.RUN:
			sprite.play("run")
		State.JUMP, State.HURT:
			sprite.play("jump")


func try_switch_color() -> void:
	# 将要变成实心的那种砖块如果正和身体重叠，就取消切换，否则角色会卡在砖块里
	switch_probe.collision_mask = 8 if Game.is_red else 4
	switch_probe.force_shapecast_update()
	if switch_probe.is_colliding():
		$DeniedSound.play()
		blink(0.4)
		return
	Game.switch_color()
	$SwitchSound.play()


func _on_color_changed(is_red: bool) -> void:
	set_collision_mask_value(3, is_red)
	set_collision_mask_value(4, not is_red)


func take_damage(from_position: Vector2) -> void:
	if not invincible_timer.is_stopped() or health <= 0:
		return
	health -= 1
	$HurtSound.play()
	if health <= 0:
		died.emit()
		return
	state = State.HURT
	var side := signf(global_position.x - from_position.x)
	# 120 控制横向击退速度，-180 使主角向上弹起。
	velocity = Vector2(side * 120.0, -180.0)
	invincible_timer.start()
	blink(invincible_timer.wait_time)


func bounce() -> void:
	# 踩中敌人后的弹起速度取普通起跳速度的 70%。
	velocity.y = jump_velocity * 0.7


func respawn() -> void:
	global_position = spawn_position
	velocity = Vector2.ZERO
	state = State.IDLE


func blink(duration: float) -> void:
	var tween := create_tween()
	tween.set_loops(int(duration / 0.2))
	tween.tween_property(sprite, "modulate:a", 0.3, 0.1)
	tween.tween_property(sprite, "modulate:a", 1.0, 0.1)
