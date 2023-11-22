extends TextureButton

func _ready():
	position = Vector2(30, 30)

func _pressed():
	get_tree().change_scene_to_file("res://scenes/Play/Play.tscn")
