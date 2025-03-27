class_name MovementScalar
extends ReturnFirstMove

@export var scale_factor := 0.95
@export var cutoff := 0.4
	
func generate_move(_delta: float) -> Vector2:
	value *= scale_factor
	if value.length() < cutoff:
		return Vector2.ZERO
	
	return value
