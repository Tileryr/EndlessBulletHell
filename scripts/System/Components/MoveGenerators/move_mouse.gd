class_name MouseMovement
extends MovementGenerator

var mouse_dir : Vector2

func initialize() -> void:
	mouse_dir = global_position.direction_to(get_global_mouse_position()) 
	
func generate_move(_delta: float) -> Vector2:
	return global_position.direction_to(get_global_mouse_position()) 
