extends TextureButton

func _ready():
	var viewport_size = get_viewport_rect().size
	var self_size = self.get_rect().size
	position = Vector2(viewport_size.x - self_size.x + 20, viewport_size.y - self_size.y + 40)
	
func _pressed():
	SceneSwitcher.change_scene("res://scenes/Dialogue/Dialogue.tscn")

func _on_mouse_entered():
	self.scale = Vector2(1.05, 1.05)
	self.modulate = Color(1, 0.9, 1 , 1) 

func _on_mouse_exited():
	self.scale = Vector2(1.0, 1.0)
	self.modulate = Color(1, 1, 1 , 1) 
