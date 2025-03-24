class_name HurtComponent
extends Node

@export var health_component : HealthComponent
@export var collision : CollisionShape2D
@onready var default_color := collision.debug_color

func _ready() -> void:
	health_component.hurt.connect(on_hurt)

func on_hurt() -> void:
	collision.debug_color = Color.WHITE
	get_tree().paused = true
	
	await get_tree().create_timer(0.2).timeout
	
	get_tree().paused = false
	GlobalSignals.shake.emit(8.0)
	collision.debug_color = default_color
