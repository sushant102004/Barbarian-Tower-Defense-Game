extends Path3D

@export var enemy_scene : PackedScene

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
