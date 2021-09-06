extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var velocity: Vector2 = Vector2.ZERO
var gravity: Vector2 = Vector2(0, 19)
var tongue = preload("res://Player/Tongue.tscn")
var tongue_out = false
var tongue_i
var target
var tongue_velocity = Vector2()

export var tongue_range = 200
export var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.x = (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * SPEED
	if (Input.is_action_just_pressed("jump")) and is_on_floor():
		$AnimatedSprite.frame = 1 #switch immediately to frame 1 of jump for no delay
		velocity.y -= 750
		$AnimatedSprite.play("Jump")
	velocity = move_and_slide(velocity + gravity, Vector2.UP, true)
	if (velocity.y == 0):
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	if Input.is_action_pressed("push") and not tongue_out:
		tongue_i = tongue.instance()
		add_child(tongue_i)
		target = get_global_mouse_position()
		tongue_i.position = $TongueStart.position + Vector2(5,5) #
		#print(tongue_i, tongue_i.position)
		tongue_i.target = target
		tongue_i.tongue_start_pos = $TongueStart.position
		tongue_out = true
	if Input.is_action_pressed("pull") and tongue_out:
		target = $TongueStart.global_position
		tongue_i.target = target
		
#		tongue_velocity = tongue_i.position.direction_to(target) * 50
#		if tongue_i.position.distance_to(target) > 5:
#			tongue_velocity = move_and_collide(tongue_velocity)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
