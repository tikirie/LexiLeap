extends Area2D

@export var spriteSize = int()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Powerup")
	
func _on_powerup_touched(body):
	if body.is_in_group("Player"):
		body.powerUp()
		queue_free()
