class_name MoveState
extends State

@export var speed : float
@export var move_generator : MovementGenerator

@export_group("Optional")
@export var hurt_state : State
@export var hurtbox : Hurtbox

@export var idle_state : State
@export var input : InputState

var acceleration := 0.2
var friction := 0.4

var player : CharacterBody2D : 
	get():
		return root as CharacterBody2D

func state_enter() -> void:
	move_generator.initialize()
	if hurt_state and hurtbox:
		hurtbox.hurt.connect(func(_source: Hitbox):
			change_state.emit(hurt_state)
		)

func state_exit() -> void:
	player.velocity = Vector2.ZERO

func state_process(delta: float) -> void:
	var move_vector := move_generator.generate_move(delta)
	if move_vector == Vector2.ZERO:
		player.velocity -= player.velocity * friction
		
		if player.velocity.length() < 1 and idle_state:
			change_state.emit(idle_state)
	else:
		player.velocity += move_vector*speed*acceleration
		player.velocity = player.velocity.limit_length(speed)
		
	player.move_and_slide()

func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	if !input: return
	var state_input : State = input.state_input(event)
	if state_input:
		change_state.emit(state_input)
