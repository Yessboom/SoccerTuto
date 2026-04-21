class_name PlayerStateFactory

var states: Dictionary

func _init() -> void:
	states = {
		Player.State.BICYCLE_KICK : PlayerStateBicycleKick,
		Player.State.HEADER : PlayerStateHeader,
		Player.State.HURT : PlayerStateHurt,
		Player.State.MOVING: PlayerStateMoving,
		Player.State.PREPPING_SHOT : PlayerStatePreppingShot,
		Player.State.RECOVERING: PlayerStateRecovering,
		Player.State.SHOOTING : PlayerStateShooting,
		Player.State.TACKLING: PlayerStateTackling,
		Player.State.PASSING : PlayerStatePassing,
		Player.State.VOLLEY_KICK : PlayerStateVolleyKick,
		Player.State.CHEST_CONTROL : PlayerStateChestControl,
		Player.State.DIVING : PlayerStateDiving,
		Player.State.CELEBRATING : PlayerStateCelebrating,
		Player.State.MOURNING : PlayerStateMourning,
		Player.State.RESETING : PlayerStateReseting
	}

func get_fresh_state(state: Player.State) -> PlayerState:
	assert(states.has(state), "state doesn't exist!")
	return states.get(state).new()
