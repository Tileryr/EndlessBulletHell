class_name Chase
extends State

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var attack_timer := Timer.new()

@export var hurtbox : Hurtbox
@export var hitbox : Hitbox

var speed := 150
var knockback_power := 400

var controller : CharacterBody2D :
	get():
		return root as CharacterBody2D
		
func _ready() -> void:
	attack_timer.wait_time = 1.0
	attack_timer.one_shot = true
	add_child(attack_timer)
	hitbox.area_entered.connect(hitbox_entered)
	
func state_enter() -> void:
	hurtbox.hurt.connect(func(_source: Hitbox):
		change_state.emit(Knockback)
		var out_dir : Vector2 = player.position.direction_to(controller.position)
		controller.velocity = knockback_power*out_dir
		, 
	CONNECT_ONE_SHOT)
	
func state_process(delta: float) -> void:
	controller.velocity = generate_direction()
	controller.velocity *= speed
	controller.move_and_slide()
	
func state_physics_process(delta: float) -> void:
	pass

func state_input(event: InputEvent) -> void:
	pass

func generate_direction() -> Vector2:
	return controller.position.direction_to(player.position)

func hitbox_entered(_a) -> void:
	if attack_timer.is_stopped():
		attack_timer.start()
		for hurtbox in await hitbox.trigger():
			hurtbox.hurt.emit(self)
