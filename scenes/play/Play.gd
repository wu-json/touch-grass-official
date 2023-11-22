extends Node2D

var score = 0;

func _ready():
	$ScoreCounter.set_text(str(score))
	pass

func _process(delta):
	pass
