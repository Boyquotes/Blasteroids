# AttributeManager.gd

extends Node

# SCENE PROPERTIES
var current_health: int
@export var max_health: int

# READY
func _ready() -> void:
	set_current_health(max_health)

# INSTANCE INITIALISATION (Blasteroids)
func initialise(_max_health: int = max_health):
	max_health = _max_health
	set_current_health(max_health)

# HEALTH
func set_current_health(updated_health: int):
	current_health = clampi(updated_health, 0, max_health)

func get_current_health() -> int:
	return current_health
