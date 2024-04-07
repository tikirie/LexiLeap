extends Node2D

@onready var players:= {
	"1": {
		viewport = $HBoxContainer/ViewportContainer1/Viewport1,
		camera = $HBoxContainer/ViewportContainer1/Viewport1/Camera2D,
		player = $HBoxContainer/ViewportContainer1/Viewport1/Level/Player
	},
	"2": {
		viewport = $HBoxContainer/ViewportContainer2/Viewport2,
		camera = $HBoxContainer/ViewportContainer2/Viewport2/Camera2D,
		player = $HBoxContainer/ViewportContainer1/Viewport1/Level/Player2
	}
}

func _ready() -> void:
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	for node in players.values():
		var remote_transform := RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
