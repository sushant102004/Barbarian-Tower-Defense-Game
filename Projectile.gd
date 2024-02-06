extends Area3D

@export var speed := 30
@export var direction := Vector3.FORWARD

func _physics_process(delta):
	position += direction * speed * delta


func _on_timer_timeout():
	# Garbage Cleaning
	queue_free()
