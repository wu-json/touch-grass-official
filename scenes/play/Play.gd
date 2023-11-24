extends Node2D

var grass_mob = preload("res://scenes/Play/Mobs/Grass/Grass.tscn")
var hub_mob = preload("res://scenes/Play/Mobs/Hub/Hub.tscn")
var purple_mob = preload("res://scenes/Play/Mobs/Purple/Purple.tscn")
var blue_snake_mob = preload("res://scenes/Play/Mobs/BlueSnake/BlueSnake.tscn")
var controller_mob = preload("res://scenes/Play/Mobs/Controller/Controller.tscn")
var uwu_mob = preload("res://scenes/Play/Mobs/Uwu/Uwu.tscn")

@onready var score_counter = $Overlay/ScoreCounter
@onready var game_timer = $Overlay/GameTimer

const MAX_OBSTACLE_MOBS = 15

var score = 0;
var obstacle_mobs_on_screen = 0;

func on_timer_end():
	SceneSwitcher.change_scene("res://scenes/Score/Score.tscn", { "score": score })
	
func on_click_grass_mob():
	var points = 1
	score += points
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	
	if randf() <= 0.20 && (obstacle_mobs_on_screen < MAX_OBSTACLE_MOBS):
		var obstacle_spawn_functions = [
			"_spawn_hub_mob",
			"_spawn_purple_mob",
			"_spawn_blue_snake_mob",
			"_spawn_controller_mob",
			"_spawn_uwu_mob"
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
	
func on_click_controller_mob():
	var points = -3
	obstacle_mobs_on_screen -= 1
	score += points
	score_counter.set_text(str(score))
	
func on_click_uwu_mob():
	var points = -5
	obstacle_mobs_on_screen -= 1
	score += points
	score_counter.set_text(str(score))

func _spawn_grass_mob():
	var viewport_size = get_viewport_rect().size
	var mob = grass_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("grass_pressed", on_click_grass_mob)
	
func _spawn_hub_mob():
	var viewport_size = get_viewport_rect().size
	var mob = hub_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("hub_pressed", on_click_hub_mob)
	obstacle_mobs_on_screen += 1

func _spawn_purple_mob():
	var viewport_size = get_viewport_rect().size
	var mob = purple_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("purple_pressed", on_click_purple_mob)
	obstacle_mobs_on_screen += 1
	
func _spawn_blue_snake_mob():
	var viewport_size = get_viewport_rect().size
	var mob = blue_snake_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("blue_snake_pressed", on_click_blue_snake_mob)
	obstacle_mobs_on_screen += 1
	
func _spawn_controller_mob():
	var viewport_size = get_viewport_rect().size
	var mob = controller_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("controller_pressed", on_click_controller_mob)
	obstacle_mobs_on_screen += 1
	
func _spawn_uwu_mob():
	var viewport_size = get_viewport_rect().size
	var mob = uwu_mob.instantiate()
	mob.position = Vector2(randi_range(0, viewport_size.x), randi_range(0, viewport_size.y - 120))
	add_child(mob)
	mob.connect("uwu_pressed", on_click_uwu_mob)
	obstacle_mobs_on_screen += 1
	
func _ready():
	score_counter.set_text(str(score))
	_spawn_grass_mob()
	game_timer.connect("timeout", on_timer_end)
