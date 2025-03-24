class_name PlayerIdle
extends State

@export var move_state : State
@export var input : InputState
func state_enter() -> void:
	pass
	
func state_exit() -> void:
	pass

func state_process(delta: float) -> void:
	var input_vector := Input.get_vector("left", "right", "up", "down")
	if input_vector.length() > 0:
		change_state.emit(move_state)
	
func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	var state_input : State = input.state_input(event)
	if state_input:
		change_state.emit(state_input)
