extends Control
## 主菜单：开始游戏、设置和退出，下方显示最好成绩。

@onready var record_label: Label = $Center/Box/RecordLabel


func _ready() -> void:
	record_label.text = record_text()
	$Center/Box/StartButton.grab_focus()


func record_text() -> String:
	var lines: Array[String] = []
	for number in Game.LEVELS.size():
		var key := str(number + 1)
		if Game.best_times.has(key):
			var best: float = Game.best_times[key]
			var coins: int = Game.best_coins.get(key, 0)
			lines.append("第 %s 关  最好 %.1f 秒  金币 %d" % [key, best, coins])
		else:
			lines.append("第 %s 关  未完成" % key)
	return "\n".join(lines)


func _on_start_button_pressed() -> void:
	Game.start_level(1)


func _on_settings_button_pressed() -> void:
	$SettingsMenu.open($Center/Box/SettingsButton)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
