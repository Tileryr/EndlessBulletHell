class_name PlayerIdle
extends State

func state_enter() -> void:
	pass
	
func state_exit() -> void:
	pass

func state_process(delta: float) -> void:
	var input_vector := Input.get_vector("left", "right", "up", "down")
	if input_vector.length() > 0:
		change_state.emit(PlayerWalk)
	
func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("dash"):
		change_state.emit(PlayerDash)
	elif event.is_action_pressed("attack"):
		change_state.emit(AttackState)
