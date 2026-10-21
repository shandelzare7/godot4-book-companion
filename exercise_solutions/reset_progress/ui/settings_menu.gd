extends Control
## 设置界面：调节音乐和音效音量，关闭时保存。

var return_button: Control

@onready var music_slider: HSlider = $Center/Panel/Box/MusicRow/MusicSlider
@onready var sfx_slider: HSlider = $Center/Panel/Box/SfxRow/SfxSlider


func open(return_to: Control) -> void:
	return_button = return_to
	music_slider.value = Game.music_volume
	sfx_slider.value = Game.sfx_volume
	show()
	music_slider.grab_focus()


func _on_music_slider_value_changed(value: float) -> void:
	$Center/Panel/Box/MusicRow/ValueLabel.text = "%d%%" % roundi(value * 100)
	Game.music_volume = value
	Game.apply_volume()


func _on_sfx_slider_value_changed(value: float) -> void:
	$Center/Panel/Box/SfxRow/ValueLabel.text = "%d%%" % roundi(value * 100)
	Game.sfx_volume = value
	Game.apply_volume()


func _on_reset_button_pressed() -> void:
	Game.reset_progress()


func close() -> void:
	Game.save_data()
	hide()
	return_button.grab_focus()


func _on_back_button_pressed() -> void:
	close()
