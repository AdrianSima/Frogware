extends Node2D

export var max_move = Vector2(0, 0)


func _ready():
	var animation = get_node("PlatformMovement").get_animation('platform_move')
	animation.track_set_key_value(0, 2, Vector2(max_move.x, 0))
	animation.track_set_key_value(0, 1, Vector2(max_move.x/2.0, max_move.y))
	animation.track_set_key_value(0, 4, Vector2(0, 0))
	animation.track_set_key_value(0, 3, Vector2(max_move.x/2.0, max_move.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_PlatformMovement_animation_finished(platform_move):
#	var animation_tree =  get_node("PlatformMovement")
#	animation_tree.play_backwards()
#	animation_tree.disconnect("animation_finished", self, "")
