extends TextureRect

func _ready():
	self.size = DisplayServer.screen_get_size(DisplayServer.window_get_current_screen())

func _process(delta):
	pass
