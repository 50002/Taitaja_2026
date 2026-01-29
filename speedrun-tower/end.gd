extends Control

var minutes = 0
var seconds = 0
var milliseconds = 0
var cal = 0
@onready var label: Label = $ColorRect/Container/VBoxContainer/Label2

var loop = 100000
func _ready() -> void:
	GameMusic.stop()
	MenuMusic.play()
	
	Highscore.save()
	
	
	
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
		label.text = "something went wrong"
	else:
		label.text = "run: " + str(minutes) + ":" + str(seconds) + ":" + str(milliseconds)
	$ColorRect/Container/VBoxContainer/Button.grab_focus()


func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")
