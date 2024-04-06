extends Node2D

@onready var players:= {
	"1": {
		viewport = $HBoxContainer/ViewportContainer/SubViewport,
		camera = $HBoxContainer/ViewportContainer/SubViewport/Camera2D,
		player = $HBoxContainer/ViewportContainer/SubViewport/Level/Player,
	},
	"2": {
		viewport = $HBoxContainer/ViewportContainer2,
		camera = $HBoxContainer/ViewportContainer2/SubViewport/Camera2D,
		player = $HBoxContainer/ViewportContainer/SubViewport/Level/Player,
	}
}
