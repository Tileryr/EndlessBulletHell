class_name Knockback
extends State

@export var move_state : MoveState
@export var hurtbox : Hurtbox
@export var return_speed := 20
@export var sensitivity := 400

var speed : float
var direction : Vector2
var controller : CharacterBody2D :
	get():
		return root as CharacterBody2D
		
var last_attacker : Hitbox
func _ready() -> void:
	speed = move_state.speed
	hurtbox.hurt.connect(func(_source):
		last_attacker = _source
	)

func state_enter() -> void:
	direction = last_attacker.global_position.direction_to(controller.position)
	controller.velocity = sensitivity*direction
	
	
	print(controller.velocity)
func state_process(_delta: float) -> void:
	var target_dir = move_state.move_generator.generate_move(_delta)
	controller.velocity = controller.velocity.move_toward(target_dir*speed, return_speed)
	controller.move_and_slide()
	if controller.velocity.dot(target_dir) > 0:
		change_state.emit(move_state)
