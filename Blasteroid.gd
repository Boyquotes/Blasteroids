# Blasteroid.gd

extends RigidBody2D

func _ready() -> void:
	print("Blasteroid hp: ", $AttributeManager.get_current_health())
