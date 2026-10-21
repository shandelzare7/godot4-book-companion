extends CanvasLayer
## 结果面板：过关或失败后显示，提供重玩和返回主菜单。

@onready var title_label: Label = $Center/Panel/Box/TitleLabel
@onready var info_label: Label = $Center/Panel/Box/InfoLabel


func show_clear(seconds: float, coins: int, total: int) -> void:
	title_label.text = "过关！"
	info_label.text = "用时 %.1f 秒　金币 %d/%d" % [seconds, coins, total]
	$Center/Panel/Box/RetryButton.grab_focus()


func show_fail() -> void:
	title_label.text = "失败"
	info_label.text = "生命已用完。"
	$Center/Panel/Box/RetryButton.grab_focus()


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
