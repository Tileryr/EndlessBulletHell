class_name InputMover
extends MovementGenerator

func generate_move(_d: float) -> Vector2:
	return Input.get_vector("left", "right", "up", "down")
