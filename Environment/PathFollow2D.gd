extends PathFollow2D

var fly
var random_h = 0
var random_v = 0
var caught = false

func _ready():
	fly = get_child(0)

func _process(delta):
	if not caught:
		set_offset(get_offset() + 75 * fly.speed * delta)
	random_h = rand_range(-1 * fly.difficulty, fly.difficulty)
	random_v = rand_range(-1 * fly.difficulty, fly.difficulty)
	set_h_offset(random_h)
	set_v_offset(random_v)
