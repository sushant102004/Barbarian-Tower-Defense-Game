extends Node3D

@export var projectile : PackedScene
@onready var turret_top : MeshInstance3D = $TurretBase/TurretTop/FaceOne

var enemy_path : Node3D

func _physics_process(delta):
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout():
	var shot = projectile.instantiate()
	add_child(shot)
	shot.global_position = turret_top.global_position
	shot.direction = global_transform.basis.z
