class_name OnHurt
extends StateChange

@export var hurtbox : Hurtbox

func target_signal() -> Signal:
	return hurtbox.hurt
