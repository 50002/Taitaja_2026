extends Control
@onready var Pick = $Pick
@onready var Move = $Move

@onready var label = $ColorRect/Container3/Label
var minutes = 0
var seconds = 0
var milliseconds = 0
var cal = 0

var loop = 100000
func _ready() -> void:
	MenuMusic.play()
	
	cal = Highscore.ml *100
	for i in loop:
		if cal >= 100:
			seconds = seconds + 1
			cal = cal - 100
		if seconds >= 60:
			minutes = minutes + 1
			seconds = seconds - 60
		if cal < 100 and seconds < 60:
			break
	
	
	
	if Highscore.ml == 0:
		label.text = "No runs yet"
	else:
		label.text = "Best run: " + str(minutes) + ":" + str(seconds) + ":" + str(milliseconds)
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
