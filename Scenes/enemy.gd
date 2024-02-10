extends PathFollow3D

@export var enemy_movement_speed : float = 0
@export var max_health := 50.0

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player = $AnimationPlayer


var current_health : float:
	set (health):
		current_health = health
		animation_player.play("TakeDamage")
		# Destroying Enemy Scene
		if current_health < 1:
			queue_free()
			
func _ready():
	current_health = max_health
		
func _process(delta: float) -> void:
	progress += delta + enemy_movement_speed / 2.5
	if progress_ratio == 1:
		base.take_damage()
		set_process(false)
