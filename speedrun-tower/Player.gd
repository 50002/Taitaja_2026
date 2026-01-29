extends CharacterBody2D

@onready var c: Timer = $Timer
@onready var aud: AudioStreamPlayer2D = $AudioStreamPlayer2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite: Node2D = $sprite
var direction
@onready var an: AnimatedSprite2D = $sprite/AnimatedSprite2D
@onready var b: Label = $Label
var ms := 0
var s := 0
var m := 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		an.play("new_animation")
		if direction < 0:
			sprite.scale=(Vector2(-1, 1))
		elif direction > 0:
			sprite.scale=(Vector2(1, 1))
		
	if direction and is_on_floor():
		if aud.playing == false:
			aud.play()
		
		if velocity.x < SPEED:
			velocity.x = move_toward(velocity.x, direction * SPEED, 150)
		else:
			velocity.x = move_toward(velocity.x, direction * SPEED, 60)
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, abs(((velocity.x+SPEED*12)/SPEED)))
	if velocity.x == 0:
		an.play("default")
	move_and_slide()


func _on_timer_timeout() -> void:
	ms += 5
	Highscore.ml += 5
	ajastin()
	
func ajastin():
	if ms >= 100:
		s+= 1
		ms-=100
	if s >= 60:
		m+= 1
		s-= 60
	b.text = "Time: "+ str(m)+":"+str(s)+":"+str(ms)


func _on_area_2d_area_entered(area: Area2D) -> void:
	c.start()
