class_name Hurtbox
extends Area2D

@export var active : bool = true
var last_attacker : Hitbox
signal hurt(source: Hitbox)

func _ready() -> void:
	hurt.connect(func(source: Hitbox):
		last_attacker = source
		print("last attacker" + str(last_attacker))
	)
