class_name RotationMatchVelocity
extends Node

@export var target : Node2D
@onready var controller : CharacterBody2D = get_parent()

func _process(delta: float) -> void:
	target.rotation = controller.velocity.angle()
