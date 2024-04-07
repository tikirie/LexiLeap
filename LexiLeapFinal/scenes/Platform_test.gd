extends Node2D

func _on_debuff_touched(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://scenes/end_screen.tscn")

