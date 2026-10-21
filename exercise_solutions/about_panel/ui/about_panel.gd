extends Control
## 关于面板：显示游戏和素材的说明。


var return_button: Control


func open(return_to: Control) -> void:
	return_button = return_to
	show()
	$Center/Panel/Box/BackButton.grab_focus()


func _on_back_button_pressed() -> void:
	hide()
	return_button.grab_focus()
