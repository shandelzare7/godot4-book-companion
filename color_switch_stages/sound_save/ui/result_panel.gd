extends CanvasLayer
## 结果面板：过关或失败后显示，提供重玩和返回主菜单。

@onready var title_label: Label = $Center/Panel/Box/TitleLabel
@onready var info_label: Label = $Center/Panel/Box/InfoLabel


func show_clear(seconds: float, coins: int, total: int) -> void:
	title_label.text = "过关！"
	info_label.text = "用时 %.1f 秒　金币 %d/%d" % [seconds, coins, total]
	$ClearSound.play()
	$Center/Panel/Box/RetryButton.grab_focus()


func show_fail() -> void:
	title_label.text = "失败"
	info_label.text = "生命已用完。"
	$FailSound.play()
	$Center/Panel/Box/RetryButton.grab_focus()


func _on_retry_button_pressed() -> void:
	Game.restart_level()


func _on_menu_button_pressed() -> void:
	Game.go_to_menu()
