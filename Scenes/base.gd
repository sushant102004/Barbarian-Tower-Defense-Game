extends Node3D

@export var max_health : int = 5
@onready var label: Label3D = $label

func _ready() -> void:
	label.text = str(max_health)

func take_damage() -> void:
	max_health = max_health - 1
	label.text = str(max_health)

func _process(delta: float) -> void:
	pass
