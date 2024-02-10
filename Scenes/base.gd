extends Node3D

@export var max_health : int = 5
@onready var label: Label3D = $label

var current_health : float: 
	set(health):
		current_health = health
		if current_health == 0:
			get_tree().reload_current_scene()

func _ready() -> void:
	current_health = max_health
	label.text = str(current_health) + "/" + str(max_health)

func take_damage() -> void:
	current_health -= 1
	label.text = str(current_health) + "/" + str(max_health)

func _process(delta: float) -> void:
	pass
