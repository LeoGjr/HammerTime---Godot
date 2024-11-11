extends Node


onready var score_text = $Score

var score = 0
func _ready():
	score_text.text = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hammer_nail_hit():
	score += 1
	score_text.text = str(score)


func _on_Hammer_game_end():
	$"/root/LevelManager".load_end_game(score)
