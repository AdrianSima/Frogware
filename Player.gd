extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var velocity: Vector2 = Vector2.ZERO
var gravity: Vector2 = Vector2(0, 19)

export var SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.x = (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * SPEED
	if (Input.is_action_just_pressed("jump")) and is_on_floor():
		velocity.y -= 500
	velocity = move_and_slide(velocity + gravity, Vector2.UP, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
