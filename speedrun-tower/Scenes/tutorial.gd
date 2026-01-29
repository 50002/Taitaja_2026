extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameMusic.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
