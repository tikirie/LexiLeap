extends CharacterBody2D

@export var controls: Resource = null
@export var speed = 300
@export var gravity = 30
@export var jump_force = 800

func _physics_process(delta):
	#each frame the player isn't on the floor, gravity increases
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 500:
			velocity.y = 500
			
	if is_on_floor() and Input.is_action_just_pressed(controls.jump):
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis(controls.move_left, controls.move_right)
	velocity.x = speed * horizontal_direction
	move_and_slide()
