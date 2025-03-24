class_name ParticleHolder
extends Node

func _ready() -> void:
	GlobalSignals.hold_and_free.connect(hold_and_free)

func hold_and_free(particle_node: CPUParticles2D):
	particle_node.finished.connect(particle_node.queue_free)
	particle_node.reparent(self, true)
