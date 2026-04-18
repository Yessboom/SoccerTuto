class_name BallStateShot
extends BallState

const SHOT_HEIGHT := 5
const SHOT_SPRITE_SCALE := 0.8
const DURATION_SHOT := 1000 
var time_since_shot = Time.get_ticks_msec()

func _enter_tree() -> void:
	set_ball_animation_from_velocity()
	time_since_shot = Time.get_ticks_msec()
	sprite.scale.y = SHOT_SPRITE_SCALE
	ball.height = SHOT_HEIGHT

		
func _process(delta: float) -> void:
	if Time.get_ticks_msec() - DURATION_SHOT > time_since_shot:
		transition_state(Ball.State.FREEFORM)
	else:
		move_and_bounce(delta)


func _exit_tree() -> void:
	sprite.scale.y = 1.0
