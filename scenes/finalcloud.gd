extends StaticBody2D

func _on_debuff_touched(body):
	if body.is_in_group("Player"):
		
