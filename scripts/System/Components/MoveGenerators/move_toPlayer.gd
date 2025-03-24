class_name ToPlayerMovement
extends MovementGenerator

var player : CharacterBody2D

func initialize() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
func generate_move(delta: float) -> Vector2:
	return global_position.direction_to(player.position)
