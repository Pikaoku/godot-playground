extends TextureButton

func _on_PlayButton_pressed() -> void:
	print('we in here')
	get_tree().change_scene("res://src/Levels/SciFiTesting.tscn")
	pass # Replace with function body.
