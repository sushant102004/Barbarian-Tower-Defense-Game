extends Area3D

@export var speed := 30
@export var direction := Vector3.FORWARD

func _physics_process(delta):
	position += direction * speed * delta

func _on_timer_timeout():
	# Garbage Cleaning
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("enemy_area"):
		area.get_parent().current_health -= 25
		queue_free()
		
		
