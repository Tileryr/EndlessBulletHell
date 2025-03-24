class_name AttackState
extends State

@export var attack : Attack
@export var move_curve : Curve
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
	#time_passed += delta / attack_duration
	#if time_passed > 1.0: change_state.emit(PlayerIdle)
	#var progress : float = move_curve.sample(time_passed)
	#var move_amount : Vector2 = progress * attack_dir * move_distance
	#player.position = start_pos + move_amount
	#player.velocity = move_curve.sample(time_passed) * attack_dir * move_distance
	if attack.movement:
		var new_move := attack.movement.generate_move(delta)
		if new_move == MOVE_END: change_state.emit(PlayerIdle)
		player.velocity = new_move * 300

		player.move_and_slide()
	else:
		change_state.emit(PlayerIdle)
func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	pass
