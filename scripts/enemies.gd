extends Node

const roller := preload("uid://bh4u5xkkqxpwv") 
const chaser := preload("uid://domnibx5mmyl8")

const enemy_scenes : Array[PackedScene] = [
	roller,
	chaser
]

@onready var spawn_timer: Timer = $SpawnTimer

func _ready() -> void:
	spawn_timer.timeout.connect(func():
		var random_scene : PackedScene = enemy_scenes.pick_random()
		var new_enemy : CharacterBody2D = random_scene.instantiate()
		new_enemy.position = random_screen_point()
		add_child(new_enemy)
	)
	
	spawn_timer.timeout.emit()
	
func random_screen_point() -> Vector2:
	var rect_size = get_viewport().get_visible_rect().size
	return Vector2(randf()*rect_size.x, randf()*rect_size.y)
	
