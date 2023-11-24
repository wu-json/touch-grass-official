extends Node2D

var grass_mob = preload("res://scenes/Play/Mobs/Grass/Grass.tscn")
var hub_mob = preload("res://scenes/Play/Mobs/Hub/Hub.tscn")
var purple_mob = preload("res://scenes/Play/Mobs/Purple/Purple.tscn")
var blue_snake_mob = preload("res://scenes/Play/Mobs/BlueSnake/BlueSnake.tscn")

@onready var score_counter = $Overlay/ScoreCounter
@onready var game_timer = $Overlay/GameTimer

const MAX_OBSTACLE_MOBS = 3

var score = 0;
var obstacle_mobs_on_screen = 0;

func on_timer_end():
	SceneSwitcher.change_scene("res://scenes/Score/Score.tscn", { "score": score })
	
func on_click_grass_mob():
	var points = 1
	score += points
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	
	if randf() <= 0.25:
		var obstacle_spawn_functions = [
			"_spawn_hub_mob",
			"_spawn_purple_mob"
		]
		var spawn_function = obstacle_spawn_functions[randi() % obstacle_spawn_functions.size()]
		print(spawn_function)
		call(spawn_function)

func on_click_hub_mob():
	var points = -5
	obstacle_mobs_on_screen -= 1
	score += points
	score_counter.set_text(str(score))
	
func on_click_purple_mob():
	var points = -5
	obstacle_mobs_on_screen -= 1
	score += points
	score_counter.set_text(str(score))
	
func on_click_blue_snake_mob():
	var points = -10
	obstacle_mobs_on_screen -= 1
	score += points
	score_counter.set_text(str(score))

func _spawn_grass_mob():
	var viewport_size = get_viewport_rect().size
	var start_mob = grass_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)
	start_mob.connect("grass_pressed", on_click_grass_mob)
	
func _spawn_hub_mob():
	if (obstacle_mobs_on_screen >= MAX_OBSTACLE_MOBS):
		return
	var viewport_size = get_viewport_rect().size
	var start_mob = hub_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)
	start_mob.connect("hub_pressed", on_click_hub_mob)
	obstacle_mobs_on_screen += 1

func _spawn_purple_mob():
	if (obstacle_mobs_on_screen >= MAX_OBSTACLE_MOBS):
		return
	var viewport_size = get_viewport_rect().size
	var start_mob = purple_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)
	start_mob.connect("purple_pressed", on_click_purple_mob)
	obstacle_mobs_on_screen += 1
	
func _spawn_blue_snake_mob():
	if (obstacle_mobs_on_screen >= MAX_OBSTACLE_MOBS):
		return
	var viewport_size = get_viewport_rect().size
	var start_mob = blue_snake_mob.instantiate()
	start_mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(start_mob)
	start_mob.connect("blue_snake_pressed", on_click_blue_snake_mob)
	obstacle_mobs_on_screen += 1
	
func _ready():
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	game_timer.connect("timeout", on_timer_end)
