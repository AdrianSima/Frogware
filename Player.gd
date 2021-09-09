extends KinematicBody2D

onready var graphic = $Pivot
onready var body = $Pivot/Body
onready var tongue_pos = $Pivot/Body/TongueStart

var velocity: Vector2 = Vector2.ZERO
var gravity: Vector2 = Vector2(0, 19)

var tongue_out = false
var tongue_i
var target
var tongue_velocity = Vector2()

export var tongue_range = 200
export var SPEED = 300

func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
#	velocity.x = (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * SPEED
	if (Input.is_action_just_pressed("jump")) and is_on_floor():
		print("Jump")
		velocity.y = -750
	velocity = move_and_slide(velocity + gravity, Vector2.UP, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_local_mouse_position()
	if mouse.x > 0:
		graphic.scale.x = 1
	elif mouse.x < 0:
		graphic.scale.x = -1
	body.look_at(get_global_mouse_position())
