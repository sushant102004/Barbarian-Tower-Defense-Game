extends Node3D

@export var projectile : PackedScene

func _on_timer_timeout():
	var shot = projectile.instantiate()
	add_child(shot)
