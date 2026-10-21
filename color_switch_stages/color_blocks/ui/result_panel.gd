extends CanvasLayer
## 结果面板：过关或失败后显示，提供下一关、重玩和返回主菜单。

@onready var title_label: Label = $Center/Panel/Box/TitleLabel
@onready var info_label: Label = $Center/Panel/Box/InfoLabel
@onready var next_button: Button = $Center/Panel/Box/NextButton


func show_clear(seconds: float, coins: int, total: int, has_next: bool) -> void:
	title_label.text = "过关！"
	info_label.text = "用时 %.1f 秒　金币 %d/%d" % [seconds, coins, total]
	next_button.visible = has_next
	$ClearSound.play()
	if has_next:
		next_button.grab_focus()
	else:
		$Center/Panel/Box/RetryButton.grab_focus()


func show_fail() -> void:
	title_label.text = "失败"
	info_label.text = "生命已用完。"
	next_button.hide()
	$FailSound.play()
	$Center/Panel/Box/RetryButton.grab_focus()


func _on_next_button_pressed() -> void:
	Game.start_level(Game.current_level + 1)


func _on_retry_button_pressed() -> void:
	Game.restart_level()


func _on_menu_button_pressed() -> void:
	Game.go_to_menu()
