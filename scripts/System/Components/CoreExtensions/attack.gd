class_name Attack
extends Node2D

@export var cooldown_time : float
@onready var controller : CharacterBody2D = get_parent()

var hitbox : Hitbox
var movement : MovementGenerator

var timer : Timer
var timer_label : Label

@export var debug_label : bool :
	set(value):
		debug_label = value
		if debug_label:
			timer_label = Label.new()
			add_child(timer_label)

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
		#timer.start()
		
func _process(delta: float) -> void:
	if debug_label: timer_label.text = str(timer.time_left).substr(0, 3)
	
func activate() -> bool:
	if timer:
		if !timer.is_stopped(): 
			return false
			
		timer.start()
	#var attack_dir := controller.position.direction_to(controller.get_global_mouse_position())
	#hitbox.rotation = attack_dir.angle()
	
	for hurtbox in await hitbox.trigger():
		hurtbox.hurt.emit(hitbox)
		
	return true
