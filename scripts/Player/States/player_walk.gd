class_name PlayerWalk
extends State

@export var speed : float
var acceleration := 0.2
var friction := 0.4

var player : CharacterBody2D : 
	get():
		return root as CharacterBody2D


func state_enter() -> void:
	pass
	
func state_exit() -> void:
	player.velocity = Vector2.ZERO

func state_process(delta: float) -> void:
	var input_vector := Input.get_vector("left", "right", "up", "down")
	if input_vector.length() == 0:
		player.velocity -= player.velocity * friction
		
		if player.velocity.length() < 1:
			change_state.emit(PlayerIdle)
			
	else:
		player.velocity += input_vector*speed*acceleration
		player.velocity = player.velocity.limit_length(speed)
		
	player.move_and_slide()

func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("dash"):
		change_state.emit(PlayerDash)
	elif event.is_action_pressed("attack"):
		change_state.emit(AttackState)
