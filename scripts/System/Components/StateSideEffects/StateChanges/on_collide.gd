class_name OnCollide
extends StateChange

@export var ray_cast : RayCast2D

var colliding : bool :
	set(value):
		if value and !colliding:
			collided.emit()
		colliding = value
		
signal collided

func target_signal() -> Signal:
	return collided

func _process(delta: float) -> void:
	colliding = ray_cast.is_colliding()
