class_name Attack
extends Node2D

@export var cooldown_time : float
@onready var controller : CharacterBody2D = get_parent()

var hitbox : Hitbox
var movement : MovementGenerator
var timer : Timer

func _ready() -> void:
	for child in get_children():
		if child is Hitbox: 
			hitbox = child
		if child is MovementGenerator:
			movement = child
		
	assert(hitbox, 'Attack must have hitbox')
	
	if(cooldown_time > 0):
		timer = Timer.new()
		timer.one_shot = true
		timer.wait_time = cooldown_time
		add_child(timer)
		timer.start()

func activate() -> bool:
	var attack_dir := controller.position.direction_to(controller.get_global_mouse_position())
	hitbox.rotation = attack_dir.angle()
	
	for hurtbox in await hitbox.trigger():
		hurtbox.hurt.emit(hitbox)
	
	if timer:
		return timer.is_stopped()
	else:
		return true
