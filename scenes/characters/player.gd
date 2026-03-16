class_name Player 
extends CharacterBody2D

enum ControlScheme {CPU, P1, P2}

@export var control_scheme: ControlScheme
@export var speed : float

@onready var animation_player : AnimationPlayer = %AnimationPlayer
@onready var player_sprit: Sprite2D = %PlayerSprite

var heading:= Vector2.RIGHT

func _process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		pass #Process Ai movement here
	else:
		handle_human_movment()
	set_movement_animation()
	set_heading()
	flip_sprite()
	


	move_and_slide()

func handle_human_movment():
	var direction := KeyUtils.get_input_vector(control_scheme)
	velocity = direction*speed


func set_movement_animation() -> void:
	if velocity.length() >0:
		animation_player.play("run")
		
	else:
		animation_player.play("idle")
	
func set_heading() -> void:
	if velocity.x >0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT
		
		
func flip_sprite():
	if heading == Vector2.RIGHT:
		player_sprit.flip_h = false
	elif heading == Vector2.LEFT:
		player_sprit.flip_h = true
