class_name PlayerInput
extends InputState

@export var dash_state : State
@export var attack_state : State

func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("dash"):
		return dash_state
	elif event.is_action_pressed("attack"):
		return attack_state
	return null
