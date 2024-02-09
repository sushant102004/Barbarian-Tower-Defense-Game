extends Node3D

@export var projectile : PackedScene
@export var turret_range : int = 10

var enemy_path : Node3D
var target : PathFollow3D

@onready var turret_top : MeshInstance3D = $TurretBase/TurretTop/FaceOne


func _physics_process(delta):
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)
	

func _on_timer_timeout():
	if target:
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = turret_top.global_position
		shot.direction = global_transform.basis.z


func find_best_target() -> PathFollow3D:
	var best_target = null
	var max_progress = 0
	
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			var distance : int = global_position.distance_to(enemy.global_position)
			if enemy.progress > max_progress and distance < 10:
				best_target = enemy
				max_progress = enemy.progress
				
	return best_target
