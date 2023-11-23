extends TextureButton

func _ready():
	var viewport_size = get_viewport_rect().size
	var self_size = self.get_rect().size
	position = Vector2(viewport_size.x - self_size.x + 20, viewport_size.y - self_size.y + 40)
	
func _pressed():
	SceneSwitcher.change_scene("res://scenes/Play/Play.tscn")
