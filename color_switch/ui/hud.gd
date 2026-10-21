extends CanvasLayer
## 状态栏：生命、金币、用时和当前颜色。

const RED := Color(1.0, 0.35, 0.35)
const BLUE := Color(0.35, 0.55, 1.0)

@export var heart_full: Texture2D
@export var heart_empty: Texture2D

@onready var hearts: Array[Node] = $Margin/Bar/Hearts.get_children()
@onready var coin_label: Label = $Margin/Bar/CoinLabel
@onready var time_label: Label = $Margin/Bar/TimeLabel
@onready var color_icon: TextureRect = $Margin/Bar/ColorIcon
@onready var color_label: Label = $Margin/Bar/ColorLabel


func set_health(health: int) -> void:
	for i in hearts.size():
		hearts[i].texture = heart_full if i < health else heart_empty


func set_coins(coins: int, total: int) -> void:
	var shown := [str(coins).pad_zeros(2), str(total).pad_zeros(2)]
	coin_label.text = "%s/%s" % shown


func set_time(seconds: float) -> void:
	time_label.text = "%.1f 秒" % seconds


func set_color(is_red: bool) -> void:
	color_icon.modulate = RED if is_red else BLUE
	color_label.text = "红" if is_red else "蓝"
