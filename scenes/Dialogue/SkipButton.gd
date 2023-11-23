extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _pressed():
	SceneSwitcher.change_scene("res://scenes/Dialogue/Dialogue.tscn")

func _on_mouse_entered():
	self.scale = Vector2(1.05, 1.05)
	self.modulate = Color(1, 1, 1.2 , 1) 

func _on_mouse_exited():
	self.scale = Vector2(1.0, 1.0)
	self.modulate = Color(1, 1, 1 , 1) 
