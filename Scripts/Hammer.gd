extends Area

onready var animation = $Animation

signal nail_hit
var is_nail_hit = false
signal game_end
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_area_entered")

func _input(event):
	if (event is InputEventMouseButton) and event.is_pressed():
		animation.play("hit")
		
		


func _on_area_entered(area):
	if area.is_in_group("Nails"):
		if area.already_hit:
			emit_signal("game_end")
			return
		is_nail_hit = true
		area.already_hit = true
		emit_signal("nail_hit")

func chec_nail_hit():
	if !is_nail_hit:
		emit_signal("game_end")
	
	is_nail_hit = false
