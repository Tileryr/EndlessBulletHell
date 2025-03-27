class_name CurveMovement
extends MovementGenerator

var direction_generator : MovementGenerator
@export var stop : bool = true
@export var duration : float
@export var velocity_curve : Curve
var time_passed : float

func initialize() -> void:
	if !direction_generator: 
		direction_generator = get_children()[0]
	
	time_passed = 0
	direction_generator.initialize()
	
func generate_move(delta: float) -> Vector2:
	time_passed += delta / duration
	if time_passed > 1.0: 
		if stop:
			return Vector2.ZERO
		else:
			return velocity_curve.sample(1.0) * direction_generator.generate_move(delta)
	
	var sample : float = velocity_curve.sample(time_passed)
	return direction_generator.generate_move(delta) * sample
