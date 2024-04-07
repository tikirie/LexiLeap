extends StaticBody2D

var platform = preload("res://scenes/Platform_test.tscn")
var width
# Called when the node enters the scene tree for the first time.
func _ready():
	width = get_viewport().get_visible_rect().size.x
	randomize()
	var y = 0
	while y > -3000:
		var new_platform = platform.instantiate()
		print(-width/2)
		print(width/2)
		new_platform.set_position(Vector2(randf_range(-100,150),y))
		
		add_child(new_platform)
		y -= randf_range(70,80)
	pass