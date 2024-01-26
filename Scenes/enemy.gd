extends PathFollow3D

@export var enemy_movement_speed : float = 0.1

func _process(delta: float) -> void:
	progress += delta + enemy_movement_speed
