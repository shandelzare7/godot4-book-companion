extends Node2D
## 第 1 关（5.4）：收集金币、受伤与坠落重生。

var coins := 0
var total_coins := 0

@onready var player: CharacterBody2D = $Player


func _ready() -> void:
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.collected.connect(_on_coin_collected)
		total_coins += 1
	player.died.connect(_on_player_died)
	show_banner()


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


func _on_player_died() -> void:
	get_tree().reload_current_scene.call_deferred()
