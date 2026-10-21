extends Node
## 全局单例（Autoload，名称为 Game）：关卡切换、设置与存档。

const SAVE_PATH := "user://save.cfg"
const LEVELS: Array[String] = [
	"res://levels/level_1.tscn",
]

var current_level := 1
var unlocked_level := 1
var best_times: Dictionary = {}
var best_coins: Dictionary = {}
var music_volume := 0.8
var sfx_volume := 0.8


func _ready() -> void:
	load_data()
	apply_volume()


func start_level(number: int) -> void:
	current_level = number
	get_tree().paused = false
	get_tree().change_scene_to_file(LEVELS[number - 1])


func restart_level() -> void:
	start_level(current_level)


func has_next_level() -> bool:
	return current_level < LEVELS.size()


func go_to_menu() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func finish_level(time: float, coins: int) -> void:
	var key := str(current_level)
	if not best_times.has(key) or time < best_times[key]:
		best_times[key] = time
	if coins > best_coins.get(key, 0):
		best_coins[key] = coins
	if has_next_level():
		unlocked_level = maxi(unlocked_level, current_level + 1)
	save_data()


func apply_volume() -> void:
	var music_bus := AudioServer.get_bus_index("Music")
	var sfx_bus := AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(music_volume))
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(sfx_volume))


func save_data() -> void:
	var config := ConfigFile.new()
	config.set_value("settings", "music_volume", music_volume)
	config.set_value("settings", "sfx_volume", sfx_volume)
	config.set_value("progress", "unlocked_level", unlocked_level)
	config.set_value("progress", "best_times", best_times)
	config.set_value("progress", "best_coins", best_coins)
	config.save(SAVE_PATH)


func load_data() -> void:
	var config := ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return
	music_volume = config.get_value("settings", "music_volume", music_volume)
	sfx_volume = config.get_value("settings", "sfx_volume", sfx_volume)
	unlocked_level = config.get_value("progress", "unlocked_level", 1)
	best_times = config.get_value("progress", "best_times", {})
	best_coins = config.get_value("progress", "best_coins", {})
