extends Node2D

# a level

func _on_VictoryArea_body_entered(body: Node) -> void:
	print('we in here')
	print(body.name)
	print(body.get_groups())
	if body.name == 'player':
		get_tree().change_scene("res://src/Screens/MainMenu.tscn")
		pass
	pass # Replace with function body.
