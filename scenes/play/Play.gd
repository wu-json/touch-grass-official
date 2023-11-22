extends Node2D

var grass_mob = preload("res://scenes/Play/GrassMob.tscn")

var score = 0;

func _ready():
	$ScoreCounter.set_text(str(score))
	var start_mob = grass_mob.instantiate()
	start_mob.position = Vector2(randi_range(10,1000), randi_range(10,100))
	add_child(start_mob)

func _process(delta):
	pass
