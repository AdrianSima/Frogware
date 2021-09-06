extends KinematicBody2D

var target
var tongue_velocity
var retracting = false
var tongue_start_pos = Vector2()

export var tongue_range = 700
export var tongue_speed = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print(self.position, "target: ", target)
	
	if (target):
		tongue_velocity = global_position.direction_to(target) * tongue_speed * delta
		if global_position.distance_to(target) > 5 and tongue_start_pos.distance_to(global_position) < tongue_range:
			tongue_velocity = move_and_collide(tongue_velocity)
		else:
			target = null
