extends Node2D

var grass_mob = preload("res://scenes/Play/GrassMob.tscn")

var score = 0;

func _spawn_random_mob():
	var viewport_size = get_viewport_rect().size
	var start_mob = grass_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)

func _ready():
	$ScoreCounter.set_text(str(score))
	_spawn_random_mob()

func _process(delta):
	pass
