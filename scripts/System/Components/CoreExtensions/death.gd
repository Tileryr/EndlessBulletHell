class_name DeathComponent
extends Node


@export var hurt_component : HurtComponent
@export var health_component : HealthComponent
@export var kill_target : Node
@export var particles : CPUParticles2D

func _ready() -> void:
	health_component.death.connect(on_death)

func on_death() -> void:
	if hurt_component:
		await hurt_component.on_hurt()
	
	if particles:
		particles.emitting = true
		GlobalSignals.hold_and_free.emit(particles)
		
	if kill_target:
		kill_target.queue_free()
