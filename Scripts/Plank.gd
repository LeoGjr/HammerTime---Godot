extends Area

const NAIL_PATH = "res://Scenes/Nail.tscn"
const MIN_SPAWN_INTERVAL = 5
const MAX_SPAWN_INTERVAL = 7.5

export var is_first = false
export var speed = 5

var last_spawn_position
var nails_and_bombs = []
# Called when the node enters the scene tree for the first time.
func _ready():
	if !is_first:
		spawn_nails_and_bombs()



func _process(delta):
	translation.x += speed * delta
	if translation.x >= 75:
		translation.x = -25 + speed * delta
		spawn_nails_and_bombs()

func spawn_nails_and_bombs():
	for item in nails_and_bombs:
		item.queue_free()
	nails_and_bombs = []
	randomize()
	last_spawn_position = 0
	while last_spawn_position > -50:
		var new_item
		var new_item_translation
		var x_translation = rand_range(MIN_SPAWN_INTERVAL, MAX_SPAWN_INTERVAL)
		last_spawn_position -= x_translation
		if last_spawn_position < -50:
			last_spawn_position = -50
		
		new_item = load(NAIL_PATH).instance()
		new_item_translation = Vector3(last_spawn_position, 0.5, 1)
		add_child(new_item)
		new_item_translation = new_item_translation
		nails_and_bombs.append(new_item)
	
