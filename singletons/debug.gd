extends Node

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	elif Input.is_key_pressed(KEY_F5):
		get_tree().reload_current_scene()
