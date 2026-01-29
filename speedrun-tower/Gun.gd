extends Node2D

@onready var dio: AudioStreamPlayer2D = $AudioStreamPlayer2D

var Ammo := 2
var player 
var direction
@onready var a: AnimatedSprite2D = $AnimatedSprite2D
var previous
var Count
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent()
	Count = get_parent().get_child(-1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Count.text = "Ammo: " + str(Ammo)
	
	direction = Input.get_axis("ui_left","ui_right")
	
	if direction and player != null:
		if player.direction < 0:
			scale.x=-1
		elif player.direction > 0:
			scale.x=1
	
	if Input.is_action_pressed("ui_down"):
		rotation =(deg_to_rad(scale.x*90))
			
	else:
		rotation=0
		
	
	if Input.is_action_just_pressed("ui_accept") and Ammo > 0:
		dio.play()
		player.velocity += Vector2(-500*scale.x,0).rotated(rotation)
		a.play("shoot")
		Ammo -= 1
		await a.animation_finished
		a.play("idle")
		
	if player.is_on_floor():
		Ammo = 2
