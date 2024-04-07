extends Area2D

@export var spriteSize = int()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Debuff")

func _on_debuff_touched(body):
		if body.is_in_group("Player"):
			queue_free()
