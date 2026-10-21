extends CanvasLayer
## 暂停菜单：按暂停键打开或关闭。


func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle()


func toggle() -> void:
	if $SettingsMenu.visible:
		$SettingsMenu.close()
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused
	if visible:
		$Center/Panel/Box/ResumeButton.grab_focus()


func _on_resume_button_pressed() -> void:
	toggle()


func _on_restart_button_pressed() -> void:
	Game.restart_level()


func _on_settings_button_pressed() -> void:
	$SettingsMenu.open($Center/Panel/Box/SettingsButton)


func _on_menu_button_pressed() -> void:
	Game.go_to_menu()
