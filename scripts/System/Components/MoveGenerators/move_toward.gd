class_name MoveTowards
extends MovementGenerator

@export var goal_move_gen : MovementGenerator
@export var start_move_gen : MovementGenerator
@export var change_speed : float

var current_move : Vector2
var goal_move : Vector2

func initialize() -> void:
	#goal_move_gen.initialize()
	start_move_gen.initialize()
	
	#goal_move = goal_move_gen.generate_move(0)
	goal_move = Vector2.ZERO
	current_move = start_move_gen.generate_move(0)
	
func generate_move(_d: float) -> Vector2:
	current_move = current_move.move_toward(goal_move, change_speed)

	if current_move == goal_move: return Vector2.ZERO
	return current_move
