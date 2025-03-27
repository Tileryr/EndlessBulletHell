class_name ReturnFirstMove
extends MovementGenerator

var value : Vector2
var movement_generator : MovementGenerator

func initialize() -> void:
	if !movement_generator: 
		movement_generator = get_children()[0]
	movement_generator.initialize()
	value = movement_generator.generate_move(0) 
	
func generate_move(_d: float) -> Vector2:
	return value
