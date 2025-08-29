extends CharacterBody2D

@export var speed: float = 200
@export var jump_force: float = -500
@export var gravity: float = 1200

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	
	var dir:= 0
	
	if Input.is_action_pressed("move_left"):
		dir -= 1
	if Input.is_action_pressed("move_right"):
		dir += 1
		
	velocity.x = dir * speed
	
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y = jump_force
		
	move_and_slide()
	
