class_name Enemy
extends CharacterBody2D

@onready var hurtbox: Hurtbox = $Hurtbox
@onready var hitbox: Hitbox = $Hitbox
@onready var attack_timer: Timer = $AttackTimer
#
#func _on_hitbox_area_entered(area: Area2D) -> void:
	#if attack_timer.is_stopped():
		#attack_timer.start()
		#for hurtbox in await hitbox.trigger():
			#hurtbox.hurt.emit(self)
