class_name RotateToVelocity
extends Node

@onready var target : Node2D = get_parent()
@export var controller : CharacterBody2D

func _process(delta: float) -> void:
	target.rotation = controller.velocity.angle()
