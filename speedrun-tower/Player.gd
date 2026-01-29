extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite: Node2D = $sprite
var direction


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction < 0:
			sprite.scale=(Vector2(-1, 1))
		elif direction > 0:
			sprite.scale=(Vector2(1, 1))
		
	if direction and is_on_floor():
		velocity.x = direction * SPEED
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, abs(((velocity.x+SPEED*7.5)/SPEED)))

	move_and_slide()
