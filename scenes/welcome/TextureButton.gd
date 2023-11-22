extends TextureButton

func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2) - (self.get_rect().size.x / 2), (viewport_size.y - 150))
	
func _pressed():
	SceneSwitcher.change_scene("res://scenes/Play/Play.tscn")
