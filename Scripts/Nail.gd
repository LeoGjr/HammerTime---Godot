extends Area


onready var animation = $Animation
onready var audio = $Audio
var already_hit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass # Replace with function body.

func _on_area_entered(area):
	if area.name == "Hammer" and !already_hit:
		audio.play()
		animation.play("hit")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
