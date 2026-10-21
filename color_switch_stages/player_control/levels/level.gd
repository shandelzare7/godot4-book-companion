extends Node2D
## 第 1 关：收集金币、坠落重生、过关与暂停。

var coins := 0
var total_coins := 0

@onready var player: CharacterBody2D = $Player


func _ready() -> void:
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.collected.connect(_on_coin_collected)
		total_coins += 1
	$Objects/Goal.reached.connect(_on_goal_reached)
	player.died.connect(_on_player_died)
	setup_camera()
	show_banner()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		$PauseLayer.visible = get_tree().paused


func setup_camera() -> void:
	var used: Rect2i = $Ground.get_used_rect()
	var tile: Vector2i = $Ground.tile_set.tile_size
	var camera: Camera2D = player.get_node("Camera2D")
	camera.limit_left = used.position.x * tile.x
	camera.limit_right = used.end.x * tile.x
	camera.limit_top = 0
	camera.limit_bottom = used.end.y * tile.y


func show_banner() -> void:
	var label: Label = $Banner/LevelLabel
	var tween := create_tween()
	tween.tween_interval(1.0)
	tween.tween_property(label, "modulate:a", 0.0, 0.8)
	await tween.finished
	$Banner.hide()


func _on_coin_collected() -> void:
	coins += 1
	print("金币：%d/%d" % [coins, total_coins])


func _on_death_zone_body_entered(_body: Node2D) -> void:
	# 掉坑一定扣一颗心，即使刚受过伤还在无敌时间里
	player.invincible_timer.stop()
	player.take_damage(player.global_position)
	if player.health <= 0:
		return
	# 稍等片刻再回到重生点，让玩家看清主角掉下去了
	player.hide()
	player.set_physics_process(false)
	await get_tree().create_timer(0.5, false).timeout
	player.respawn()
	player.show()
	player.set_physics_process(true)


func _on_goal_reached() -> void:
	print("过关！金币 %d/%d" % [coins, total_coins])
	get_tree().paused = true


func _on_player_died() -> void:
	get_tree().reload_current_scene.call_deferred()
