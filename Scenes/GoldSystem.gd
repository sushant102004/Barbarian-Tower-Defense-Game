extends MarginContainer

@export var starting_gold : int = 0
@onready var gold_placeholder = $GoldPlaceholder

var gold: int:
	set(curr_gold):
		gold = max(curr_gold, 0)
		gold_placeholder.text = "Gold: " + str(gold)
		

func _ready():
	gold = starting_gold
