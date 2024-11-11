extends Node


onready var score = $Score

var score_amount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	score.bbcode_text = "[center]" + str(score_amount) + "[/center]"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$"/root/LevelManager".change_scene("Game")
