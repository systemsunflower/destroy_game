extends Node

@onready var timer: Timer = $"../Timer"

var sto : int
var is_start : bool = false


func _process(delta: float) -> void:
	$"../Label5".text = "IFG:" + str(delta)
	if is_start :
		$"../Label2".text = "time:" + str(timer.time_left) + "s"
	if Input.is_action_just_pressed("many_keys") and is_start :
		sto += 1
		$"../Label3".text = 'score:' + str(sto)

func _on_button_button_down() -> void:
	$"../Button".release_focus()
	if $"../Button".text == 'prwss again to confirm' :
		$"../Button".disabled = true
		$"../Button".position = Vector2(503,351)
		timer.start()
		is_start = true
		sto = 0
		$"../Button".text = 'start over'
		$"../Label4".text = ""
	else :
		$"../Button".position = Vector2(randi_range(0,1002), randi_range(0,600))
		$"../Button".text = 'prwss again to confirm'

func _on_button_2_button_down() -> void:
	get_tree().quit()
func _on_timer_timeout() -> void:
	$"../Label2".text = "Time's up!"
	$"../Button".release_focus()
	is_start = false
	$"../Button".disabled = false
	$"../Label4".text = "Your clicking speed is " + str(2*sto) + " per second"
