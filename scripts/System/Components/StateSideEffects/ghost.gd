class_name Ghost
extends StateSideEffect

@export var collider : CollisionShape2D

func state_entered() -> void:
	collider.disabled = true
	
func state_exited() -> void:
	collider.disabled = false
