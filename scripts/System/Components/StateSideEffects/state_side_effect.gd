class_name StateSideEffect
extends Node

@onready var state : State = get_parent()

func _ready() -> void:
	state.state_entered.connect(state_entered)
	
	state.state_exited.connect(state_exited)

func state_entered() -> void:
	pass
	
func state_exited() -> void:
	pass
