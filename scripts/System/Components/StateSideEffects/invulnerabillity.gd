class_name Invulnerabillity
extends StateSideEffect

@export var hurtbox : Hurtbox

func state_entered() -> void:
	hurtbox.active = false
	
func state_exited() -> void:
	hurtbox.active = true
