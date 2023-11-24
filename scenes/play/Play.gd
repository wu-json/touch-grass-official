extends Node2D

var grass_mob = preload("res://scenes/Play/Mobs/Grass/Grass.tscn")

@onready var score_counter = $Overlay/ScoreCounter
@onready var game_timer = $Overlay/GameTimer

var score = 0;

func on_click_grass_mob():
	var points = 1
	score += points
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	
func on_timer_end():
	SceneSwitcher.change_scene("res://scenes/Score/Score.tscn", { "score": score })

func _spawn_grass_mob():
	var viewport_size = get_viewport_rect().size
	var start_mob = grass_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)
	start_mob.connect("grass_pressed", on_click_grass_mob)
	
func _ready():
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	game_timer.connect("timeout", on_timer_end)
