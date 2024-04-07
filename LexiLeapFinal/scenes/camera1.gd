extends Camera2D

# Target node the camera is following
@export var TargetNode : Node2D = null

func _process(_delta) -> void:
	set_position(TargetNode.get_position())
	
