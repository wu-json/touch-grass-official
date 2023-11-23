extends TextureButton

func _pressed():
	SceneSwitcher.change_scene("res://scenes/Play/Play.tscn")


func _on_mouse_entered():
	self.scale = Vector2(1.02, 1.05)
	self.modulate = Color(1, 0.9, 1 , 1) 

func _on_mouse_exited():
	self.scale = Vector2(1.0, 1.0)
	self.modulate = Color(1, 1, 1 , 1) 
