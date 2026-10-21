extends Control
## 设置界面：拖动滑块时显示音量百分比。音量真正生效要等加入音频总线以后。

var return_button: Control

@onready var music_slider: HSlider = $Center/Panel/Box/MusicRow/MusicSlider


func open(return_to: Control) -> void:
	return_button = return_to
	show()
	music_slider.grab_focus()


func _on_music_slider_value_changed(value: float) -> void:
	$Center/Panel/Box/MusicRow/ValueLabel.text = "%d%%" % roundi(value * 100)


func _on_sfx_slider_value_changed(value: float) -> void:
	$Center/Panel/Box/SfxRow/ValueLabel.text = "%d%%" % roundi(value * 100)


func close() -> void:
	hide()
	return_button.grab_focus()


func _on_back_button_pressed() -> void:
	close()
