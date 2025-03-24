class_name AttackState
extends State

@export var attack : Attack
@export var idle_state : State

var move_distance := 500

var time_passed : float
var attack_duration : float = 0.3
var start_pos : Vector2
var attack_dir : Vector2

const MOVE_END := Vector2.ZERO

var player : CharacterBody2D : 
	get():
		return root as CharacterBody2D
		
func state_enter() -> void:
	time_passed = 0
	start_pos = player.position
	attack_dir = player.position.direction_to(player.get_global_mouse_position())
	attack.activate()
	if attack.movement:
		attack.movement.initialize()

func state_exit() -> void:
	pass

func state_process(delta: float) -> void:
	if attack.movement:
		var new_move := attack.movement.generate_move(delta)
		if new_move == MOVE_END: change_state.emit(idle_state)
		player.velocity = new_move * 300
		player.move_and_slide()
	else:
		change_state.emit(idle_state)

func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	pass
