class_name MovementScalar
extends MovementGenerator

@export var scale_factor := 0.95
@export var cutoff := 0.4
var current_movement : Vector2
var movement_generator : MovementGenerator

func initialize() -> void:
	if !movement_generator: 
		movement_generator = get_children()[0]
		
	movement_generator.initialize()
	current_movement = movement_generator.generate_move(0)
	
func generate_move(_delta: float) -> Vector2:
	current_movement *= scale_factor
	if current_movement.length() < cutoff:
		return Vector2.ZERO
	
	return current_movement
