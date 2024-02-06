extends Node3D

@export var turret : PackedScene

func build_turret(position : Vector3):	
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = position
