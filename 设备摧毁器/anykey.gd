extends Node

@onready var timer: Timer = $"../Timer"

var sto : int
var is_start : bool = false


func _process(delta: float) -> void:
	$"../Label5".text = "帧间隔：" + str(delta)
	if is_start :
		$"../Label2".text = "时间：" + str(timer.time_left) + "秒"
	if Input.is_action_just_pressed("many_keys") and is_start :
		sto += 1
		$"../Label3".text = '分数：' + str(sto)

func _on_button_button_down() -> void:
	$"../Button".release_focus()
	if $"../Button".text == '再按一次确认' :
		$"../Button".disabled = true
		$"../Button".position = Vector2(503,351)
		timer.start()
		is_start = true
		sto = 0
		$"../Button".text = '重新开始'
		$"../Label4".text = ""
	else :
		$"../Button".position = Vector2(randi_range(0,1002), randi_range(0,600))
		$"../Button".text = '再按一次确认'

func _on_button_2_button_down() -> void:
	get_tree().quit()
func _on_timer_timeout() -> void:
	$"../Label2".text = "时间到！"
	$"../Button".release_focus()
	is_start = false
	$"../Button".disabled = false
	$"../Label4".text = "您的手速为：" + str(2*sto) + "次/分"
