class_name StateChange
extends StateSideEffect

@export var next_state : State
@export var unbind_count : int = 1
var unbinded_change_state : Callable

func state_entered() -> void:
	if target_signal().is_connected(change_state.unbind(unbind_count)): return
	target_signal().connect(change_state.unbind(unbind_count), CONNECT_ONE_SHOT)

func target_signal() -> Signal:
	return Signal()
	
func change_state() -> void:
	state.change_state.emit(next_state)
