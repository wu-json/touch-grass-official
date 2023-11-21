extends Sprite2D

func _ready():
	var viewport_size = get_viewport_rect().size
	position = Vector2((viewport_size.x / 2), (viewport_size.y - (self.get_rect().size.y / 2)))
	
func _process(delta):
	pass
