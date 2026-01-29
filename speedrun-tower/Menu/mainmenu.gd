extends Control
@onready var Pick = $Pick
@onready var Move = $Move

@onready var label = $ColorRect/Container3/Label
var highscore = 0.0

func _ready() -> void:
	highscore = Highscore.value
	MenuMusic.play()
	if highscore == 0:
		label.text = "No runs yet"
	else:
		label.text = "Best run: "+ str(highscore)
	$ColorRect/Container/VBoxContainer/Button.grab_focus()


func _on_button_pressed() -> void:
	Pick.play()
	MenuMusic.stop()
	$Timer.start()


func _on_button_2_pressed() -> void:
	Pick.play()
	$Timer2.start()




func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Loading.tscn")


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Quit.tscn")


func _on_button_focus_exited() -> void:
	Move.play()


func _on_button_3_focus_exited() -> void:
	Move.play()


func _on_button_2_focus_exited() -> void:
	Move.play()
