class_name HealthComponent
extends Node

signal death
signal hurt(health: int)

@export var max_health := 3
@export var hurt_box : Hurtbox

@onready var current_health := max_health :
	set(new_health):
		current_health = new_health
		
		if current_health > 0:
			hurt.emit()
		else:
			death.emit()
	get():
		return current_health
		
func _ready() -> void:
	if hurt_box:
		hurt_box.hurt.connect(func(_s):
			current_health -= 1
		)
