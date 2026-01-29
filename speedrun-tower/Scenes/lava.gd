extends CharacterBody2D


const SPEED = 300.0
func _ready() -> void:
	velocity.y = -25


func _physics_process(delta: float) -> void:
	

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Game Over")
