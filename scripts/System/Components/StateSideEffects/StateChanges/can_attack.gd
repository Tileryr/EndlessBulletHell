class_name CanAttack
extends StateChange

@export var hitbox : Hitbox

func target_signal() -> Signal:
	return hitbox.area_entered
