class_name ReverseMovement
extends MovementGenerator

@export var movement_generator : MovementGenerator
var value : Vector2

func initialize() -> void:
	value = movement_generator.generate_move(0) * -1
	
func generate_move(_d: float) -> Vector2:
	return value
