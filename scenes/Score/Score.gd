extends Node2D

func _ready():
	var score_param = SceneSwitcher.get_param("score")
	var score: int = score_param if score_param != null else 69420
	$ScoreLabel.set_text(str(score))
