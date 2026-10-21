extends Control
## 主菜单：开始游戏、设置和退出。


func _ready() -> void:
	$Center/Box/StartButton.grab_focus()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_settings_button_pressed() -> void:
	$SettingsMenu.open($Center/Box/SettingsButton)


func _on_about_button_pressed() -> void:
	$AboutPanel.open($Center/Box/AboutButton)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
