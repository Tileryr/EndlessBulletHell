class_name PlayerDash
extends State

var direction : Vector2
var dash_speed := 600
@export var hurt_box : Hurtbox
@export var collision : CollisionShape2D

var player : CharacterBody2D : 
	get():
		return root as CharacterBody2D

func state_enter() -> void:
	hurt_box.active = false
	collision.disabled = true
	direction = player.position.direction_to(player.get_global_mouse_position())
	player.velocity = direction*dash_speed
	
func state_exit() -> void:
	hurt_box.active = true
	collision.disabled = false

func state_physics_process(delta: float) -> void:
	player.velocity *= 0.95
	player.move_and_slide()
	if player.velocity.length() < 200:
		change_state.emit(PlayerIdle)

func state_input(event: InputEvent) -> void:
	pass
