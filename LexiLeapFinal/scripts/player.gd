extends CharacterBody2D

@export var controls: Resource = null
@export var speed = 300
@export var gravity = 20
@export var jump_force = 900

var powerup = false
var stunned = false
var active = false
var timeElapsed = 0


func _ready():
	add_to_group("Player")

func _physics_process(delta):
	if !stunned:
		#each frame the player isn't on the floor, gravity increases
		if !is_on_floor():
			velocity.y += gravity
			if velocity.y > 500:
				velocity.y = 500
			
		if is_on_floor() and Input.is_action_just_pressed(controls.jump) and !(stunned):
			velocity.y = -jump_force
		
		var horizontal_direction = Input.get_axis(controls.move_left, controls.move_right)
		velocity.x = speed * horizontal_direction
		move_and_slide()
		
	if stun and timeElapsed == 60: # 60 ticks per second 
		active = false
		timeElapsed = 0
		_on_duration_timeout()
	elif powerup and timeElapsed == 120:
		active = false
		timeElapsed = 0
		_on_duration_timeout()
		
	if active:
		timeElapsed += 1
		
	if powerup:
		jump_force = 800
	if stunned:
		velocity.x = 0
		velocity.y = 0
		
func _on_duration_timeout():
	print("DONE")
	stunned = false
	powerup = false
	jump_force = 500
	
func stun():
	stunned = true
	active = true
	
func powerUp():
	powerup = true
	active = true
	
	
