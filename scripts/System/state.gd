class_name State
extends Node

var root : Node
signal change_state(new_state: Variant)

func state_enter() -> void:
	pass
	
func state_exit() -> void:
	pass

func state_process(delta: float) -> void:
	pass

func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	pass
