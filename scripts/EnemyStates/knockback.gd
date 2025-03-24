class_name Knockback
extends State

@export var move_state : Chase
var speed : int

var controller : CharacterBody2D :
	get():
		return root as CharacterBody2D
		
func state_enter() -> void:
	speed = move_state.speed
	
func state_process(_delta: float) -> void:
	var target_dir = move_state.generate_direction()
	controller.velocity = controller.velocity.move_toward(target_dir*speed, speed/10)
	controller.move_and_slide()
	if controller.velocity.dot(target_dir) > 0:
		change_state.emit(Chase)
