extends TextureButton

func _ready():
	position = Vector2(30, 30)

func _pressed():
	SceneSwitcher.change_scene("res://scenes/Play/Play.tscn")
