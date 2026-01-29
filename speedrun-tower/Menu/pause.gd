extends CanvasLayer
@onready var Pick = $Pick
@onready var Move = $Move
func _ready() -> void:	
	$ColorRect/Container/VBoxContainer/Button.grab_focus()
	
func _on_button_pressed() -> void:
	Pick.play()
	$Timer.start()


func _on_button_2_pressed() -> void:
	Pick.play()
	$Timer2.start()


func _on_button_2_focus_exited() -> void:
	Move.play()


func _on_button_focus_exited() -> void:
	Move.play()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	$".".hide()


func _on_timer_2_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Menu/Mainmenu.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
