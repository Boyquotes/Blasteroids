# Player.gd

extends CharacterBody2D

# SCENE PROPERTIES
# Movement
@export var rotation_rate: int = 3
@export var movement_speed: int = 300
@export var acceleration_rate: float = 10.0
@export var friction_strength: float = 2.0
@export var friction_multiplier: float = 2.0 # Applied when braking

# TICK
func _physics_process(delta: float) -> void:
	handle_input(delta)
	move_and_slide()
	apply_friction()

# INPUT
func handle_input(delta: float):
	# Rotation
	if Input.is_action_pressed("rotate_left"):
		rotate(-1 * rotation_rate * delta)
	if Input.is_action_pressed("rotate_right"):
		rotate(rotation_rate * delta)

	var direction_facing: Vector2 = Vector2.UP.rotated(rotation)

	# Thrusters
	if Input.is_action_pressed("engage_thrusters"):
		apply_acceleration(direction_facing)
		
	# Brakes
	if Input.is_action_pressed("pump_brakes"):
		apply_friction(friction_strength * 2)
		
	# Blasting (TODO: Create bullet scene)
	if Input.is_action_just_pressed("let_loose"):
		let_loose()
		
# MOVEMENT
func apply_acceleration(direction_facing: Vector2):
	velocity = velocity.move_toward(direction_facing * movement_speed, acceleration_rate)
	
func apply_friction(_in_friction_strength: float = friction_strength):
	velocity = velocity.move_toward(Vector2.ZERO, _in_friction_strength)
	
# SHOOTING (Instantiate Bullet.tscn, initialise it then add to scene tree)
func let_loose():
	return
