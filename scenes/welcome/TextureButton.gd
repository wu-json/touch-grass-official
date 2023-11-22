extends TextureButton

func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2) - (self.get_rect().size.x / 2), (viewport_size.y - 150))
	
func _pressed():
	get_tree().change_scene_to_file("res://scenes/Play/Play.tscn")
