class_name StateChange
extends StateSideEffect

@export var next_state : State
@export var unbind_count : int = 1
var unbinded_change_state : Callable

func state_entered() -> void:
	if target_signal().is_connected(unbind_change_state()): return
	target_signal().connect(unbind_change_state())

func state_exited() -> void:
	target_signal().disconnect(unbind_change_state())
	
func target_signal() -> Signal:
	return Signal()
	
func change_state() -> void:
	state.change_state.emit(next_state)

func unbind_change_state() -> Callable:
	if unbind_count != 0: 
		return change_state.unbind(unbind_count)
	return change_state
