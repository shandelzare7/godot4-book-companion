extends Area2D
## 金币：主角碰到后发出 collected 信号，播放闪光后消失。

signal collected


func _on_body_entered(_body: Node2D) -> void:
	collected.emit()
	set_deferred("monitoring", false)
	$AnimatedSprite2D.hide()
	$Sparkle.emitting = true
	$CoinSound.play()
	await $Sparkle.finished
	queue_free()
