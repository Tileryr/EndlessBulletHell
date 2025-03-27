class_name RotateToMouse
extends Node2D

@export var target : Node2D

func _process(delta: float) -> void:
	target.rotation = target.global_position.angle_to_point(get_global_mouse_position())
