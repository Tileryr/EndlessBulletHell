class_name MoveState
extends State

@export var speed : float
@export var move_generator : MovementGenerator

@export_group("Optional")
@export var hurt_state : State
@export var hurtbox : Hurtbox

@export var finished_state : State
@export var input : InputState

@export_group("Acceleration")
@export var accelerate : bool = false
@export var acceleration := 1.0

var player : CharacterBody2D : 
	get():
		return root as CharacterBody2D

func state_enter() -> void:
	move_generator.initialize()
	if hurt_state and hurtbox:
		hurtbox.hurt.connect(func(_source: Hitbox):
			change_state.emit(hurt_state)
		)

func state_process(delta: float) -> void:
	var move_vector := move_generator.generate_move(delta)
	if move_vector == Vector2.ZERO and finished_state:
		change_state.emit(finished_state)
	else:
		if accelerate:
			player.velocity = player.velocity.move_toward(move_vector*speed, acceleration)
		else:
			player.velocity = move_vector*speed
		
	player.move_and_slide()

func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	if !input: return
	var state_input : State = input.state_input(event)
	if state_input:
		change_state.emit(state_input)
